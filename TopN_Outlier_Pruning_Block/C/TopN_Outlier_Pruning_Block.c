/******************************************************************************/
/* Includes                                                                   */
/******************************************************************************/
/* 
 * For array_uint_t, array_double_t, array_index_t, ARRAY_PARAMS, ARRAY_ELEMENT,
 * ROWS, COLS, ARRAY_ARG, MIN, MAX, CREATE_REAL_UINT_ARRAY, 
 * CREATE_REAL_DOUBLE_ARRAY, MATLAB_ARRAY, RETRIEVE_REAL_UINT_ARRAY, 
 * RETRIEVE_REAL_DOUBLE_ARRAY, FREE_ARRAY, IS_REAL_2D_FULL_DOUBLE, 
 * IS_REAL_SCALAR
 */
#include "macros.h"

/* For equals_zero, average_over_row, distance */
#include "utility.h"

/* For mexErrMsgTxt, mxCreateString, mxArray, mexCallMATLAB, mxGetScalar */
#include "mex.h"

/* For pow */
#include <math.h>

/******************************************************************************/

/* Input and output arguments. */
#define DATA_IN             prhs[0]
#define K_IN                prhs[1]
#define N_IN                prhs[2]
#define BLOCKSIZE_IN        prhs[3]
#define OUTLIERS_OUT        plhs[0]
#define OUTLIERSCORES_OUT   plhs[1]

/* 
 * TODO
 *
 * Insert "index" into "index_array" and "value" into "value_array", whilst 
 * maintaining the sorted property of "value_array". Updates the "score" array
 * as necessary.
 *
 * Parameters:
 *     - vector:
 *     - k:
 *     - index_array: The index array.
 *     - index_array_rows: The number of vectors contained within index_array.
 *     - index_array_cols: The size of each vector within index_array.
 *     - index: The value to be inserted into index_array.
 *     - value_array: The value array.
 *     - value_array_rows: The number of vectors contained within value_array.
 *     - value_array_cols: The size of each vector within value_array.
 *     - value: The value to be inserted into value_array.
 *     - score_array:
 *     - score_array_rows:
 *     - score_array_cols:
 */
static void sorted_insert(const array_index_t vector, 
                          const unsigned int found, const unsigned int k, 
                          array_uint_t * const ARRAY_PARAMS(indexes),  const array_uint_t index, 
                          array_double_t * const ARRAY_PARAMS(values), const array_double_t value,
                          array_double_t * const ARRAY_PARAMS(scores)) {
    if (found > k && value > ARRAY_ELEMENT(values, 1, COLS(values)))
        /* No need to insert. */
        return;
    
    /* 
     * Because the array is sorted (in ascending order), the value to be removed
     * will always be at the end of the array.
     */
    const array_double_t removed_value = ARRAY_ELEMENT(values, vector, COLS(values));
    
    array_index_t insert_index = 0; /* the index where the new [index,value]-pair should be inserted */
    array_index_t col;
    for (col = COLS(values); col >= begin_index; col--) {
        if (equals_zero(ARRAY_ELEMENT(values, vector, col)) || value < ARRAY_ELEMENT(values, vector, col)) {
            /* Shuffle elements to make room for the new [index,value]-pair. */
            if (col > begin_index) {
                ARRAY_ELEMENT(indexes, vector, col) = ARRAY_ELEMENT(indexes, vector, col - 1);
                ARRAY_ELEMENT(values,  vector, col) = ARRAY_ELEMENT(values,  vector, col - 1);
            }
            insert_index = col;
        }
    }
    
    if (insert_index >= begin_index) {
        /* Insert the new values. */
        ARRAY_ELEMENT(indexes, vector, insert_index) = index;
        ARRAY_ELEMENT(values,  vector, insert_index) = value;
        
        /* Recalculate the score. */
        if (found == k) {
#if 1
            for (col = begin_index; col <= COLS(values); col++) {
                mexPrintf("%d => %lf    ", (int) ARRAY_ELEMENT(indexes, vector, col), ARRAY_ELEMENT(values, vector, col));
            }
            mexPrintf("\n");
#endif
            ARRAY_ELEMENT(scores, 1, vector) = (array_double_t) average_over_row(ARRAY_ARG(values), vector);
        } else if (found > k) {
            //mexPrintf("d<maxd\n");
            ARRAY_ELEMENT(scores, 1, vector) = (array_double_t) (ARRAY_ELEMENT(scores, 1, vector) * (array_double_t) k - removed_value + value) / (array_double_t) k;
    
            if (ARRAY_ELEMENT(scores, 1, vector) <= 0) {
                /* avoid round off error */
                const array_double_t average = average_over_row(ARRAY_ARG(values), vector);
                ARRAY_ELEMENT(scores, 1, vector) = MAX(average, 0.0);
            }
        }
    }
}

/*
 * Examine a data set and find the top 'N' outliers. Performs operations on the 
 * 'data' array in 'blocks' of size 'block_size'.
 *
 * Parameters:
 *     - data: A matrix consisting of 'data_rows' vectors, each of 
 *           dimensionality 'data_cols'.
 *     - data_rows: Number of vectors contained in the 'data' matrix.
 *     - data_cols: Size of each vector contained in the 'data' matrix.
 *     - k: The number of k-nearest neighbours for outlier detection.
 *     - N: The top 'N' outliers will be returned by this function.
 *     - block_size: The input 'data' matrix will be processed in blocks of
 *           size 'block_size'.
 *     - outliers: A 1xN array used to store the top 'N' outliers identified by
 *           this function. Each entry in this array will be an index (to the 
 *           'data' matrix) of the outlying vector.
 *     - outliers_rows: Number of rows contained in the 'outliers' array.
 *     - outliers_cols: Number of columns contained in the 'outliers' array.
 *     - outlier_scores: A 1xN array used to score the score associated with 
 *           each of the outliers stored in the 'outliers' array.
 *     - outlier_scores_rows: Number of rows contained in the 'outlier_scores'
 *           array.
 *     - outlier_scores_cols: Number of columns contained in the 
 *           'outlier_scores' array.
 */
static void top_n_outlier_pruning_block(const array_double_t * const ARRAY_PARAMS(data), 
                                        const unsigned int k, const unsigned int N, const unsigned int block_size, 
                                        array_uint_t * ARRAY_PARAMS(outliers), 
                                        array_double_t * ARRAY_PARAMS(outlier_scores)) {
    if (ROWS(outliers) != 1 || COLS(outliers) != N)
        mexErrMsgTxt("Input 'outliers' must be a 1xN array.");
    if (ROWS(outlier_scores) != 1 || COLS(outlier_scores) != N)
        mexErrMsgTxt("Input 'outlier_scores' must be a 1xN array.");

    array_double_t cutoff = 0;
    array_index_t begin; /* the index of the first vector in the block currently being processed */
    unsigned int actual_block_size; /* actual_block_size may be smaller than block_size if "ROWS(data) % block_size != 0" */
    
    for (begin = begin_index; begin <= ROWS(data); begin += actual_block_size) { /* while there are still blocks to process */
        const unsigned int end = MIN(begin+block_size-1, ROWS(data)); /* the index of the last vector in the block */
        actual_block_size = end-begin+1; /* the number of vectors in the current block */
    
        /* 
         * Process actual_block_size vector, beginning at vector "begin" and 
         * ending at vector "end" inclusive. In this iteration, we find the top
         * "N" outliers based on distances from vectors in the current block.
         */
        
        /* Arrays to store the "k" nearest neighbours for each node. */
        CREATE_REAL_UINT_ARRAY  (neighbours,      actual_block_size, k); 
        CREATE_REAL_DOUBLE_ARRAY(neighbours_dist, actual_block_size, k);
        boolean removed[actual_block_size];
        
        /* 
         * The "score" function can be any monotonically decreasing function of 
         * the nearest neighbor distances. We use the average distance to the 
         * "k" neighbours.
         */
        CREATE_REAL_DOUBLE_ARRAY(score, 1, actual_block_size);

        unsigned int found = 1; /* how many nearest neighbours we have found */
        array_index_t vector1;
        for (vector1 = begin; vector1 <= ROWS(data); vector1++) {
            /*
             * Within this loop, we would benefit from having all vectors with 
             * the current block in the cache.
             */
            
            array_index_t vector2;
            for (vector2 = begin; vector2 <= end; vector2++) {
                const array_index_t vector2_index = vector2-begin+1; /* index into the "neighbours", "neighbours_dist" and "score" arrays */

                if (vector1 != vector2 && removed[vector2_index] != true) {
                    /* 
                     * Calculate the square of the distance between the two 
                     * vectors (indexed by "vector1" and "vector2")
                     */
                    const array_double_t dist         = distance(ARRAY_ARG(data), vector1, vector2);
                    const array_double_t dist_squared = dist * dist;
                    //mexPrintf("dist=%e\n", dist_squared);
                    
                    if (found > 1 && found <= k+1 && equals_zero(ARRAY_ELEMENT(neighbours, vector2_index, found-1)))
                        found--;
                    else if (found < k && !equals_zero(ARRAY_ELEMENT(neighbours, vector2_index, found)))
                        found++;

#if 0
                    if (found <= k) {
                        /*  
                         * If we haven't yet found k neighbours, then store the 
                         * distance as a k-nearest neighbour.
                         */
                        ARRAY_ELEMENT(neighbours,      vector2_index, found) = (array_uint_t) vector1;
                        ARRAY_ELEMENT(neighbours_dist, vector2_index, found) = (array_double_t) dist;
                        
                        /* 
                         * Calculate the score as the average distance to the k 
                         * nearest neighbours.
                         */
                        if (found == k)
                            ARRAY_ELEMENT(score, 1, vector2_index) = (array_double_t) average_over_row(ARRAY_ARG(neighbours_dist), vector2_index);
                    } else { /* we have found the maximum (k) number of nearest neighbours */
                        sorted_insert(vector2_index, k, ARRAY_ARG(neighbours), vector1, ARRAY_ARG(neighbours_dist), dist, ARRAY_ARG(score));
                    }
#endif
                    sorted_insert(vector2_index, found, k, ARRAY_ARG(neighbours), vector1, ARRAY_ARG(neighbours_dist), dist_squared, ARRAY_ARG(score));

                    if (found >= k && ARRAY_ELEMENT(score, 1, vector2_index) < cutoff) {
                        removed[vector2_index] = true;
                        ARRAY_ELEMENT(score, 1, vector2_index)   = (array_double_t) 0.0;
                        mexPrintf("should skip\n");
                    }
                    mexPrintf("i=%d, j=%d, B(j)=%d, found=%d, score=%e\n", vector1, vector2_index, vector2, found, ARRAY_ELEMENT(score, 1, vector2_index));
                } else if (removed[vector2_index] == true) {
                    mexPrintf("skipped\n");
                }
            }
            found++;
        }
        
        /*
         * Compare the new scores with the outliers stored in output arrays "O" 
         * and "OF". Sort this array and keep the top "N" outliers.
         */

        CREATE_REAL_UINT_ARRAY(new_outliers, ROWS(outliers), actual_block_size + COLS(outliers));
        array_index_t col;
        for (col = 1; col <= actual_block_size; col++)
            ARRAY_ELEMENT(new_outliers, 1, col) = (array_uint_t) begin - 1 + col;
        for (col = 1; col <= COLS(outliers); col++)
            ARRAY_ELEMENT(new_outliers, 1, col + actual_block_size) = ARRAY_ELEMENT(outliers, 1, col);
         
        CREATE_REAL_DOUBLE_ARRAY(new_outlier_scores, 1, COLS(score) + COLS(outlier_scores));
        for (col = 1; col <= COLS(score); col++)
            ARRAY_ELEMENT(new_outlier_scores, 1, col) = ARRAY_ELEMENT(score, 1, col);
        for (col = 1; col <= COLS(outlier_scores); col++)
            ARRAY_ELEMENT(new_outlier_scores, 1, col + COLS(score)) = ARRAY_ELEMENT(outlier_scores, 1, col);
        
        /* Call the MATLAB sort function. */
        mxArray * sort_outputs[2];
        mxArray * sort_inputs[] = { MATLAB_ARRAY(new_outlier_scores), mxCreateString("descend") };
        mexCallMATLAB(2, sort_outputs, 2, sort_inputs, "sort");

        RETRIEVE_REAL_DOUBLE_ARRAY(new_outlier_scores_sorted, sort_outputs[0]);
        RETRIEVE_REAL_UINT_ARRAY(index, sort_outputs[1]);

        CREATE_REAL_UINT_ARRAY(new_outliers_sorted, ROWS(new_outliers), COLS(new_outliers));
        for (col = 1; col <= COLS(new_outliers_sorted); col++)
            ARRAY_ELEMENT(new_outliers_sorted, 1, col) = ARRAY_ELEMENT(new_outliers, 1, (array_index_t) ARRAY_ELEMENT(index, 1, col));

        /*
         * Copy the top "N" outliers (from the global top "N" outliers as well 
         * as the top "N" outliers discovered in this block) to the output 
         * arrays "O" and "OF".
         */
        for (col = 1; col <= COLS(outliers); col++)
            ARRAY_ELEMENT(outliers, 1, col) = ARRAY_ELEMENT(new_outliers_sorted, 1, col);
        for (col = 1; col <= COLS(outlier_scores); col++)
            ARRAY_ELEMENT(outlier_scores, 1, col) = ARRAY_ELEMENT(new_outlier_scores_sorted, 1, col);

        /*
         * Set "cutoff" to the score of the weakest outlier. There is no need to
         * store an outlier in future iterations if its score is better than the
         * cutoff.
         */
        cutoff = ARRAY_ELEMENT(outlier_scores, 1, N);
        
        FREE_ARRAY(neighbours);
        FREE_ARRAY(neighbours_dist);
        FREE_ARRAY(score);
        FREE_ARRAY(new_outliers);
        FREE_ARRAY(new_outlier_scores);
        FREE_ARRAY(new_outliers_sorted);
        FREE_ARRAY(new_outlier_scores_sorted);
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
 *           is type mxArray.
 *     - nrhs: The number of rhs (input) arguments.
 *     - prhs: Pointer to an array which holds the input data, each element is
 *           type const mxArray.
 *
 * Calling syntax:
 *     [Outliers, OutlierScores] = top_n_outlier_pruning_block(data, k, N, block_size);
 *
 * Notes:
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
        mexErrMsgTxt("Input 'data' must be a real full 2D double array.");
    RETRIEVE_REAL_DOUBLE_ARRAY(data, DATA_IN);

    /* Make sure the second input argument is an integer. */
    if (!IS_REAL_SCALAR(K_IN))
        mexErrMsgTxt("Input 'k' must be a scalar.");
    const unsigned int k = (unsigned int) mxGetScalar(K_IN);

    /* Make sure the third input argument is an integer. */
    if (!IS_REAL_SCALAR(N_IN))
        mexErrMsgTxt("Input 'N' must be a scalar.");
    const unsigned int N = (unsigned int) mxGetScalar(N_IN);

    /* Make sure the fourth input argument is an integer. */
    if (!IS_REAL_SCALAR(BLOCKSIZE_IN))
        mexErrMsgTxt("Input 'block_size' must be a scalar.");
    const unsigned int block_size = (unsigned int) mxGetScalar(BLOCKSIZE_IN);

    /* Create the output matrixes. */
    CREATE_REAL_UINT_ARRAY  (outliers,       1, N);
    CREATE_REAL_DOUBLE_ARRAY(outlier_scores, 1, N);
    OUTLIERS_OUT            = MATLAB_ARRAY(outliers);
    OUTLIERSCORES_OUT       = MATLAB_ARRAY(outlier_scores);

    /* Call the function. */
    top_n_outlier_pruning_block(ARRAY_ARG(data), k, N, block_size, ARRAY_ARG(outliers), ARRAY_ARG(outlier_scores));
}
