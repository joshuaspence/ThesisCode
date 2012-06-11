#include "Macros.h"
#include "mex.h"
#include "math.h" /* for sqrt, pow */
#include "limits.h" /* for DBL_MIN */

/* Input and output arguments */
#define DATA_IN         prhs[0]
#define K_IN            prhs[1]
#define N_IN            prhs[2]
#define BLOCKSIZE_IN    prhs[3]
#define O_OUT           plhs[0]
#define OF_OUT          plhs[1]

/*
 * Calculate the average of all values within a single row of an array.
 *
 * Parameters:
 *     - array: The array of which to calculate the average over a row.
 *     - array_rows: The number of rows in the array.
 *     - array_cols: The number of columns in the array.
 *     - row: The row number of the row to be averaged. Note that the row index 
 *            follows the MATLAB convention of beginning at 1.
 *
 * Return:
 *    The average of all values within the single row of the array.
 */
static double average_over_row(const ARRAY_DOUBLE_T * const array, ARRAY_SIZE_PARAMS(array), const unsigned int row) {
    unsigned int count = 0;
    double sum = 0;
    
    unsigned int col;
    for (col = 1; col <= COLS(array); col++) {
        sum += ARRAY_ELEMENT(array, row, col);
        count++;
    }

    return sum / count;
}

/*
 * Calculate the maximum value of all values within a single row of an array.
 *
 * Parameters:
 *     - array: The array of which to calculate the max over a row.
 *     - array_rows: The number of rows in the array.
 *     - array_cols: The number of columns in the array.
 *     - row: The row number of the row over which to calculate the maximum 
 *            value. Note that the row index follows the MATLAB convention of 
 *            beginning at 1.
 *     - max_value: A pointer to the return value storing the maximum value.
 *     - max_index: A pointer to the return value storing the index of the  
 *                  column containing the maximum value.
 */
static void max_over_row(const ARRAY_DOUBLE_T * const array, ARRAY_SIZE_PARAMS(array), const unsigned int row, double * const max_value, int * const max_index) {
	/* Initialise return values to be some "nonsense" values. */
	*max_value = DBL_MIN;
	*max_index = -1;

	unsigned int col;
    for (col = 1; col <= COLS(array); col++) {
        const double val = ARRAY_ELEMENT(array, row, col);
        if (val > *max_value) {
            *max_value = val;
            *max_index = col;
        }
    }
}

/*
 * Calculate the Euclidean distance between two vectors.
 *
 * Parameters:
 *     - vectors: The array containg the vectors between which to calculate the 
 *                distance.
 *     - vectors_rows: The number of vectors contained within the array.
 *     - vectors_cols: The size of each vector within the array.
 *     - vector1: The row index of one of the vectors. Note that the row index 
 *                follows the MATLAB convention of beginning at 1.
 *     - vector2: The row index of the other vector. Note that the row index 
 *                follows the MATLAB convention of beginning at 1.
 *
 * Return:
 *    The sum of the distance between values of the rows.
 */
static double distance(const ARRAY_DOUBLE_T * const vectors, ARRAY_SIZE_PARAMS(vectors), const unsigned int vector1, const unsigned int vector2) {
    double sum_of_squares = 0;
    
    unsigned int col;
    for (col = 1; col <= COLS(vectors); col++)
        sum_of_squares += pow(ARRAY_ELEMENT(vectors, vector1, col) - ARRAY_ELEMENT(vectors, vector2, col), 2);
        
    return sqrt(sum_of_squares);
}


/*
 * ???
 *
 * Parameters:
 *     - data: A matrix consisting of data_rows vector of size data_cols.
 *     - data_rows: Number of vectors contained in the data matrix.
 *     - data_cols: Size of each vector contained in the data matrix.
 *     - k: number of k-nearest neighbours for outlier detection
 *     - N: return the top N outliers
 *     - block_size:
 *     - O: A 1xN array of unsigned integers. This is an output of the function.
 *     - O_rows:
 *     - O_cols:
 *     - OF: A 1xN array of doubles. This is an output of the function.
 *     - OF_rows:
 *     - OF_cols:
 */
static void top_n_outlier_pruning_block(const ARRAY_DOUBLE_T * const data, ARRAY_SIZE_PARAMS(data), const unsigned int k, const unsigned int N, const unsigned int block_size, ARRAY_UINT_T * O, ARRAY_SIZE_PARAMS(O), ARRAY_DOUBLE_T * OF, ARRAY_SIZE_PARAMS(OF)) {
	if (ROWS(O) != 1 || COLS(O) != N)
    	mexErrMsgTxt("Input O must be a 1xN array.");
    if (ROWS(OF) != 1 || COLS(OF) != N)
    	mexErrMsgTxt("Input OF must be a 1xN array.");

	double cutoff = 0;
	unsigned int begin; /* the index of the first vector in the block currently being processed */
	unsigned int actual_block_size; /* actual_block_size may be smaller than block_size if "ROWS(data) % block_size != 0" */
	
    for (begin = 1; begin <= ROWS(data); begin += actual_block_size) { /* while there are still blocks to process */
    	const unsigned int end = MIN(begin+block_size-1, ROWS(data)); /* the index of the last vector in the block */
    	actual_block_size = end-begin+1; /* the number of vectors in the current block */
    
    	/* 
    	 * Process actual_block_size vector, beginning at vector "begin" and 
    	 * ending at vector "end" inclusive. In this iteration, we find the top
    	 * "N" outliers based on distances from vectors in the current block.
    	 */
        
        /* Arrays to store the "k" nearest neighbours for each node. */
        /* TODO: maybe these should be sorted. */
        CREATE_REAL_UINT_ARRAY  (neighbours,      actual_block_size, k); 
        CREATE_REAL_DOUBLE_ARRAY(neighbours_dist, actual_block_size, k);
        
        /* 
         * The "score" function can be any monotonically decreasing function of 
         * the nearest neighbor distances. We use the average distance to the 
         * "k" neighbours.
         */
        CREATE_REAL_DOUBLE_ARRAY(score, 1, actual_block_size);

        unsigned int found = 1; /* how many nearest neighbours we have found */
        unsigned int vector1;
        for (vector1 = begin; vector1 <= ROWS(data); vector1++) {
        	/*
        	 * Within this loop, we would benefit from having all vectors with 
        	 * the current block in the cache.
        	 */
            
            unsigned int vector2;
            for (vector2 = begin; vector2 <= end; vector2++) {
            	const unsigned int vector2_index = vector2 - begin + 1; /* index into the "neighbours", "neighbours_dist" and "score" arrays */

                if (vector1 != vector2) {
                	/* 
                	 * Calculate the square of the distance between the two 
                	 * vectors (indexed by "vector1" and "vector2")
                	 */
                    const double dist = pow(distance(ARRAY_PROPERTIES(data), vector1, vector2), 2);

					if (found > 1 && found <= k+1 && ARRAY_ELEMENT(neighbours, vector2_index, found-1) == 0)
                        found--;
                    else if (found < k && ARRAY_ELEMENT(neighbours, vector2_index, found) != 0)
                        found++;

                    if (found <= k) {
                    	/* 
                    	 * If we haven't yet found k neighbours, then store the 
                    	 * distance as a k-nearest neighbour.
                    	 */
                        ARRAY_ELEMENT(neighbours,      vector2_index, found) = (ARRAY_UINT_T) vector1;
                        ARRAY_ELEMENT(neighbours_dist, vector2_index, found) = (ARRAY_DOUBLE_T) dist;
                        
                        /* 
                         * Calculate the score as the average distance to the k 
                         * nearest neighbours.
                         */
                        if (found == k)
                            ARRAY_ELEMENT(score, 1, vector2_index) = average_over_row(ARRAY_PROPERTIES(neighbours_dist), vector2_index);
                    } else { /* we have found the maximum (k) number of nearest neighbours */
                        /* 
                         * Retrieve the furthest nearest neighbour from the 
                         * neighbours array.
                         */
                        double max_dist;
                        int max_index;
                        max_over_row(ARRAY_PROPERTIES(neighbours_dist), vector2_index, &max_dist, &max_index);

                        /* 
                         * Replace the furthest neighbour if the new distance is
                         * less than the furthest distance.
                         */
                        if (dist < max_dist) {
                            ARRAY_ELEMENT(neighbours,      vector2_index, max_index) = (ARRAY_UINT_T) vector1;
                            ARRAY_ELEMENT(neighbours_dist, vector2_index, max_index) = (ARRAY_DOUBLE_T) dist;

                            /* Update the score */
                            ARRAY_ELEMENT(score, 1, vector2_index) = (ARRAY_ELEMENT(score, 1, vector2_index) * (double) k - max_dist + dist) / (double) k;
                            if (ARRAY_ELEMENT(score, 1, vector2_index) <= 0) {
                                /* avoid round off error */
                                const double average = average_over_row(ARRAY_PROPERTIES(neighbours_dist), vector2_index);
                                ARRAY_ELEMENT(score, 1, vector2_index) = MAX(average, 0);
                            }
                        }
                    }

                    if (found >= k && ARRAY_ELEMENT(score, 1, vector2_index) < cutoff)
                        ARRAY_ELEMENT(score, 1, vector2_index) = 0;
                }
            }
            
            found++;
        }
        
        /*
		 * Compare the new scores with the outliers stored in output arrays "O" 
		 * and "OF". Sort this array and keep the top "N" outliers.
		 */

        CREATE_REAL_UINT_ARRAY(newO, 1, actual_block_size+1);
        unsigned int col;
        for (col = 1; col <= actual_block_size; col++)
            ARRAY_ELEMENT(newO, 1, col) = begin - 1 + col;
		 
        CREATE_REAL_DOUBLE_ARRAY(newOF, 1, COLS(score) + COLS(OF));
        for (col = 1; col <= COLS(score); col++)
            ARRAY_ELEMENT(newOF, 1, col) = ARRAY_ELEMENT(score, 1, col);
        for (col = 1; col <= COLS(OF); col++)
            ARRAY_ELEMENT(newOF, 1, col + COLS(score)) = ARRAY_ELEMENT(OF, 1, col);
        
        /* Call the MATLAB sort function. */
        mxArray * sort_outputs[2];
        mxArray * sort_inputs[] = { MATLAB_ARRAY(newOF), mxCreateString("descend") };
        mexCallMATLAB(2, sort_outputs, 2, sort_inputs, "sort");

		RETRIEVE_REAL_DOUBLE_ARRAY(newOF_sorted, sort_outputs[0]);
		RETRIEVE_REAL_UINT_ARRAY(index, sort_outputs[1]);

        CREATE_REAL_UINT_ARRAY(newO_sorted, ROWS(newO), COLS(newO));
        for (col = 1; col <= COLS(newO_sorted); col++)
            ARRAY_ELEMENT(newO_sorted, 1, col) = ARRAY_ELEMENT(newO, 1, (unsigned int) ARRAY_ELEMENT(index, 1, col));

		/*
		 * Copy the top "N" outliers (from the global top "N" outliers as well 
		 * as the top "N" outliers discovered in this block) to the output 
		 * arrays "O" and "OF".
		 */
        for (col = 1; col <= COLS(O); col++)
            ARRAY_ELEMENT(O, 1, col) = ARRAY_ELEMENT(newO_sorted, 1, col);
        for (col = 1; col <= COLS(OF); col++)
            ARRAY_ELEMENT(OF, 1, col) = ARRAY_ELEMENT(newOF_sorted, 1, col);

        /*
         * Set "cutoff" to the score of the weakest outlier. There is no need to
         * store an outlier in future iterations if its score is better than the
         * cutoff.
         */
        cutoff = ARRAY_ELEMENT(OF, 1, N);
        
        FREE_ARRAY(neighbours);
        FREE_ARRAY(neighbours_dist);
        FREE_ARRAY(score);
        FREE_ARRAY(newO);
        FREE_ARRAY(newOF);
        FREE_ARRAY(newO_sorted);
        FREE_ARRAY(newOF_sorted);
    }
}
 
/*
 * Gateway function
 *
 * This is the entry point MATLAB uses to access the DLL.
 *
 * Parameters:
 *     - nlhs: The number of lhs (output) arguments.
 *     - plhs: Pointer to an array which will hold the output data, each element
 *             is type mxArray.
 *     - nrhs: The number of rhs (input) arguments.
 *     - prhs: Pointer to an array which holds the input data, each element is
 *             type const mxArray.
 *
 * Calling syntax:
 *     [O, OF] = top_n_outlier_pruning_block(data, k, N, block_size);
 *
 * NOTES
 *     - data is a real full 2D double array.
 *     - k is an integer-valued scalar.
 *     - N is an integer-valued scalar.
 *     - block_size is an integer-valued scalar.
 */
void mexFunction(int nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[]) {
    /* Check for proper number of arguments. */
    if (nrhs != 4)
        mexErrMsgTxt("Four inputs required.");
    if (nlhs != 2)
        mexErrMsgTxt("Two outputs required.");

    /*
     * Make sure the first input argument is a real 2D full (non-sparse) double 
     * array.
     */
    if (!IS_REAL_2D_FULL_DOUBLE(DATA_IN))
        mexErrMsgTxt("Input data must be a real full 2D double array.");
	RETRIEVE_REAL_DOUBLE_ARRAY(data, DATA_IN);

    /* Make sure the second input argument is an integer. */
    if(!IS_REAL_SCALAR(K_IN))
        mexErrMsgTxt("Input k must be a scalar.");
    const unsigned int k = (unsigned int) mxGetScalar(K_IN);

    /* Make sure the third input argument is an integer. */
    if(!IS_REAL_SCALAR(N_IN))
        mexErrMsgTxt("Input N must be a scalar.");
    const unsigned int N = (unsigned int) mxGetScalar(N_IN);

    /* Make sure the fourth input argument is an integer. */
    if(!IS_REAL_SCALAR(BLOCKSIZE_IN))
        mexErrMsgTxt("Input block_size must be a scalar.");
    const unsigned int block_size = (unsigned int) mxGetScalar(BLOCKSIZE_IN);

    /* Create the output matrixes. */
    CREATE_REAL_UINT_ARRAY(O, 1, N);
    CREATE_REAL_DOUBLE_ARRAY(OF, 1, N);
    O_OUT  = MATLAB_ARRAY(O);
    OF_OUT = MATLAB_ARRAY(OF);

    /* Call the function. */
    top_n_outlier_pruning_block(ARRAY_PROPERTIES(data), k, N, block_size, ARRAY_PROPERTIES(O), ARRAY_PROPERTIES(OF));
}
