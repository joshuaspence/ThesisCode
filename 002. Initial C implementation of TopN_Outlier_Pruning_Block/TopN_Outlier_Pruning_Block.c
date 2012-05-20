#include "mex.h"
#include "math.h" /* for sqrt, pow */
#include "limits.h" /* for DBL_MIN */

/* Input and output arguments */
#define X_IN            prhs[0]
#define K_IN            prhs[1]
#define N_IN            prhs[2]
#define BLOCKSIZE_IN    prhs[3]
#define O_OUT           plhs[0]
#define OF_OUT          plhs[1]

/* Utility macros */
#define IS_REAL_2D_DOUBLE(P) \
    (!mxIsComplex(P) && mxGetNumberOfDimensions(P) == 2 && mxIsDouble(P))
#define IS_REAL_2D_FULL_DOUBLE(P) \
    (IS_REAL_2D_DOUBLE(P) && !mxIsSparse(P))
#define IS_REAL_SCALAR(P) \
    (IS_REAL_2D_FULL_DOUBLE(P) && mxGetNumberOfElements(P) == 1)
#define IS_REAL_2D_INTEGER(P) \
    (!mxIsComplex(P) && mxGetNumberOfDimensions(P) == 2 && !mxIsDouble(P))
#define IS_REAL_2D_FULL_INTEGER(P) \
    (IS_REAL_2D_INTEGER(P) && !mxIsSparse(P))
#define IS_REAL_INTEGER(P) \
    (IS_REAL_2D_FULL_INTEGER(P) && mxGetNumberOfElements(P) == 1)
#define MIN(X,Y) ((X) < (Y) ? (X) : (Y))
#define MAX(X,Y) ((X) > (Y) ? (X) : (Y))

/* Code-saving macros */
#define CREATE_REAL_DOUBLE_ARRAY(arrayname, rows, cols) \
	const mwSize arrayname##_rows = rows; \
	const mwSize arrayname##_cols = cols; \
	mxArray * arrayname##_matlab = mxCreateDoubleMatrix(arrayname##_rows, arrayname##_cols, mxREAL); \
	double * arrayname = mxGetData(arrayname##_matlab)
#define RETRIEVE_REAL_DOUBLE_ARRAY(arrayname, location) \
	const mwSize ROWS(arrayname) = mxGetM(location); \
    const mwSize COLS(arrayname) = mxGetN(location); \
    mxArray * arrayname##_matlab = location; \
    double * arrayname = mxGetData(arrayname##_matlab)
#define FREE_ARRAY(arrayname) \
	mxDestroyArray(arrayname##_matlab)
#define ARRAY_ELEMENT(array, row, column) \
	array[((row) - 1) + ROWS(array) * ((column) - 1)]

#define ROWS(array) \
	array##_rows
#define COLS(array) \
	array##_cols
#define MATLAB_ARRAY(array)	\
	array##_matlab
#define ARRAY_SIZE_PARAMS(array) \
	const unsigned int ROWS(array), const unsigned int COLS(array)
#define ARRAY_PROPERTIES(array) \
	array, array##_rows, array##_cols

/*
 * Utility function to set the values of an array to an incremental range. The 
 * range will start at "val", and each element of the array will be "incr" 
 * larger than the previous element.
 *
 * Parameters:
 *     - array: The array to be set to an incremental range.
 *     - array_rows: The number of rows of the array.
 *     - array_cols: The number of columns of the array.
 *     - val: The value for the first element of the array.
 *     - incr: The increment for each cell in the array.
 */
static void array_range(double * array, ARRAY_SIZE_PARAMS(array), int val, const int incr) {
    unsigned int row;
    unsigned int col;
    for (row = 1; row <= ROWS(array); row++) {
        for (col = 1; col <= COLS(array); col++) {
            ARRAY_ELEMENT(array, row, col) = (double) val;
            val += incr;
        }
    }
}

/*
 * Calculate the mean of all values within a single row of an array.
 *
 * Parameters:
 *     - array: The array of which to calculate the mean over a row.
 *     - array_rows: The number of rows of the array.
 *     - array_cols: The number of columns of the array.
 *     - row: The row number of the row to be averaged. Note that the row index 
 *            follows the MATLAB convention of beginning at 1.
 *
 * Return:
 *    The mean of all values within the single row of the array.
 */
static double mean_over_row(double * array, ARRAY_SIZE_PARAMS(array), const unsigned int row) {
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
 *     - array: The array of which to calculate the mean over a row.
 *     - array_rows: The number of rows of the array.
 *     - array_cols: The number of columns of the array.
 *     - row: The row number of the row to be averaged. Note that the row index 
 *            follows the MATLAB convention of beginning at 1.
 *     - max_value: A pointer to the return value storing the maximum value.
 *     - max_index: A pointer to the return value storing the index of the  
 *                  element containing the maximum value.
 */
static void max_over_row(double * array, ARRAY_SIZE_PARAMS(array), const unsigned int row, double * max_value, unsigned int * max_index) {
    unsigned int col;
	*max_value = DBL_MIN;
	*max_index = -1;

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
 *     - array: The array of which to calculate the mean over a row.
 *     - array_rows: The number of rows of the array.
 *     - array_cols: The number of columns of the array.
 *     - vector1: The row index of one of the vectors. Note that the row index 
 *                follows the MATLAB convention of beginning at 1.
 *     - vector2: The row index of the other vector. Note that the row index 
 *                follows the MATLAB convention of beginning at 1.
 *
 * Return:
 *    The sum of the distance between values of the rows.
 */
static double distance(double * array, ARRAY_SIZE_PARAMS(array), const unsigned int vector1, const unsigned int vector2) {
    double sum_of_squares = 0;
    
    unsigned int col;
    for (col = 1; col <= COLS(array); col++)
        sum_of_squares += pow(ARRAY_ELEMENT(array, vector1, col) - ARRAY_ELEMENT(array, vector2, col), 2);
        
    return sqrt(sum_of_squares);
}

/*
 * ???
 *
 * Parameters:
 *     - X: An X_rows-by-X_cols array of doubles.
 *     - X_rows: Number of rows of X
 *     - X_cols: Number of columns of X
 *     - k: number of k-nearest neighbours for outlier detection
 *     - N: return the top N outliers
 *     - block_size:
 *     - O: A 1xN array of unsigned integers. This is an output of the function.
 *     - OF: A 1xN array of doubles. This is an output of the function.
 */
static void top_n_outlier_pruning_block(double * X, ARRAY_SIZE_PARAMS(X), const unsigned int k, const unsigned int N, const unsigned int block_size, double * O, ARRAY_SIZE_PARAMS(O), double * OF, ARRAY_SIZE_PARAMS(OF)) {
	if (ROWS(O) != 1 || COLS(O) != N)
    	mexErrMsgTxt("Input O must be a 1xN array.");
    if (ROWS(OF) != 1 || COLS(OF) != N)
    	mexErrMsgTxt("Input OF must be a 1xN array.");

	unsigned int count = 0;
	double c = 0;
    while (ROWS(X) - count > 0) {
        CREATE_REAL_DOUBLE_ARRAY(B, 1, block_size);
        array_range(ARRAY_PROPERTIES(B), count + 1, 1);
        count += block_size;
        const unsigned int sizeB = (count <= ROWS(X)) ? block_size : ROWS(X) - (count - block_size);
        
		/* Arrays to store the k nearest neighbours for each node. */
        CREATE_REAL_DOUBLE_ARRAY(neighbours,      sizeB, k); 
        CREATE_REAL_DOUBLE_ARRAY(neighbours_dist, sizeB, k);
        
        CREATE_REAL_DOUBLE_ARRAY(score,           1,     sizeB);

        unsigned int l = 1;	/* how many nearest neighbours we have found */
        unsigned int vector1;
        unsigned int vector2;
        unsigned int col;
        for (vector1 = 1; vector1 <= ROWS(X); vector1++) {
            for (vector2 = 1; vector2 <= sizeB; vector2++) {
            	const unsigned int B_vector2 = (unsigned int) ARRAY_ELEMENT(B, 1, vector2);

                if (vector1 != B_vector2 && B_vector2 != 0) { 
                	/* calculate the distance between the two vectors (vector1 and vector2) */
                    const double dist = pow(distance(ARRAY_PROPERTIES(X), vector1, B_vector2), 2);

					if (l > 1 && l <= (k + 1) && ARRAY_ELEMENT(neighbours, vector2, l - 1) == 0)
                        l--;
                    else if (l < k && ARRAY_ELEMENT(neighbours, vector2, l) != 0)
                        l++;

                    if (l <= k) {
                    	/* if we haven't yet found k neighbours, then store the distance as a k-nearest neighbour */
                        ARRAY_ELEMENT(neighbours,      vector2, l) = vector1;
                        ARRAY_ELEMENT(neighbours_dist, vector2, l) = dist;
                        
                        /* calculate the score */
                        if (l == k)
                            ARRAY_ELEMENT(score, 1, vector2) = mean_over_row(ARRAY_PROPERTIES(neighbours_dist), vector2);
                    } else { /* we have found the maximum (k) number of nearest neighbours */
                        /* retrieve the furthest nearest neighbour from the neighbours array */
                        double max_dist;
                        unsigned int max_index;
                        max_over_row(ARRAY_PROPERTIES(neighbours_dist), vector2, &max_dist, &max_index);

                        /* replace the furthest neighbour if the new distance is less than the furthest distance */
                        if (dist < max_dist) {
                            ARRAY_ELEMENT(neighbours,      vector2, max_index) = vector1;
                            ARRAY_ELEMENT(neighbours_dist, vector2, max_index) = dist;

                            /* update the score */
                            ARRAY_ELEMENT(score, 1, vector2) = (ARRAY_ELEMENT(score, 1, vector2) * (double) k - max_dist + dist) / (double) k;
                            if (ARRAY_ELEMENT(score, 1, vector2) <= 0) {
                                /* avoid round off error */
                                const double average = mean_over_row(ARRAY_PROPERTIES(neighbours_dist), vector2);
                                ARRAY_ELEMENT(score, 1, vector2) = MAX(average, 0);
                            }
                        }
                    }

                    if (l >= k && ARRAY_ELEMENT(score, 1, vector2) < c) {
                        ARRAY_ELEMENT(B,     1, vector2) = 0;
                        ARRAY_ELEMENT(score, 1, vector2) = 0;
                    }
                }
            }

            l++;
        }

        CREATE_REAL_DOUBLE_ARRAY(BO, 1, sizeB + 1);
        for (col = 1; col <= sizeB; col++)
            ARRAY_ELEMENT(BO, 1, col) = ARRAY_ELEMENT(B, 1, col);

        CREATE_REAL_DOUBLE_ARRAY(BOF, 1, COLS(score) + COLS(OF));
        for (col = 1; col <= COLS(score); col++)
            ARRAY_ELEMENT(BOF, 1, col) = ARRAY_ELEMENT(score, 1, col);
        for (col = 1; col <= COLS(OF); col++)
            ARRAY_ELEMENT(BOF, 1, col + COLS(score)) = ARRAY_ELEMENT(OF, 1, col);
        
        /* Call the MATLAB sort function. */
        mxArray * sort_outputs[2];
        mxArray * sort_inputs[] = { MATLAB_ARRAY(BOF), mxCreateString("descend") };
        mexCallMATLAB(2, sort_outputs, 2, sort_inputs, "sort");

		RETRIEVE_REAL_DOUBLE_ARRAY(newBOF, sort_outputs[0]);
		RETRIEVE_REAL_DOUBLE_ARRAY(index, sort_outputs[1]);

        CREATE_REAL_DOUBLE_ARRAY(newBO, ROWS(BO), COLS(BO));
        for (col = 1; col <= COLS(newBO); col++)
            ARRAY_ELEMENT(newBO, 1, col) = ARRAY_ELEMENT(BO, 1, (unsigned int) ARRAY_ELEMENT(index, 1, col));

        for (col = 1; col <= COLS(O); col++)
            ARRAY_ELEMENT(O, 1, col) = ARRAY_ELEMENT(newBO, 1, col);

        for (col = 1; col <= COLS(OF); col++)
            ARRAY_ELEMENT(OF, 1, col) = ARRAY_ELEMENT(newBOF, 1, col);

        /* c = weakest outlier */
        c = ARRAY_ELEMENT(OF, 1, N);
        
        FREE_ARRAY(B);
        FREE_ARRAY(neighbours);
        FREE_ARRAY(neighbours_dist);
        FREE_ARRAY(score);
        FREE_ARRAY(BO);
        FREE_ARRAY(BOF);
        FREE_ARRAY(newBO);
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
 *     [O, OF] = top_n_outlier_pruning_block(X, k, N, block_size);
 *
 * NOTES
 *     - X is a real full 2D double array.
 *     - k is an integer-valued scalar.
 *     - N is an integer-valued scalar.
 *     - block_size is an integer-valued scalar.
 */
void mexFunction(int nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[]) {
    /* check for proper number of arguments */
    if (nrhs != 4)
        mexErrMsgTxt("Four inputs required.");
    if (nlhs != 2)
        mexErrMsgTxt("Two outputs required.");

    /* make sure the first input argument is a real 2D full (non-sparse) double array */
    if (!IS_REAL_2D_FULL_DOUBLE(X_IN))
        mexErrMsgTxt("Input X must be a real full 2D double array.");
    double * X           = mxGetData(X_IN);
    const mwSize ROWS(X) = mxGetM(X_IN);
    const mwSize COLS(X) = mxGetN(X_IN);

    /* make sure the second input argument is an integer */
    if(!IS_REAL_SCALAR(K_IN))
        mexErrMsgTxt("Input k must be a scalar.");
    const unsigned int k = (unsigned int) mxGetScalar(K_IN);

    /* make sure the third input argument is an integer */
    if(!IS_REAL_SCALAR(N_IN))
        mexErrMsgTxt("Input N must be a scalar.");
    const unsigned int N = (unsigned int) mxGetScalar(N_IN);

    /* make sure the fourth input argument is an integer */
    if(!IS_REAL_SCALAR(BLOCKSIZE_IN))
        mexErrMsgTxt("Input block_size must be a scalar.");
    const unsigned int block_size = (unsigned int) mxGetScalar(BLOCKSIZE_IN);

    /* create the output matrixes */
    CREATE_REAL_DOUBLE_ARRAY(O, 1, N);
    CREATE_REAL_DOUBLE_ARRAY(OF, 1, N);
    O_OUT  = MATLAB_ARRAY(O);
    OF_OUT = MATLAB_ARRAY(OF);

    /* call the function */
    top_n_outlier_pruning_block(ARRAY_PROPERTIES(X), k, N, block_size, ARRAY_PROPERTIES(O), ARRAY_PROPERTIES(OF));
}
