/******************************************************************************/
/* Includes                                                                   */
/******************************************************************************/
/* 
 * For array_uint_t, array_double_t, array_index_t, ARRAY_SIGNATURE, 
 * ARRAY_ELEMENT, ROWS, COLS, ARRAY_ARGUMENTS, MIN, MAX, CREATE_REAL_UINT_ARRAY, 
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
                          array_uint_t * const ARRAY_SIGNATURE(indexes),  const array_uint_t index, 
                          array_double_t * const ARRAY_SIGNATURE(values), const array_double_t value,
                          array_double_t * const ARRAY_SIGNATURE(scores)) {
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
            ARRAY_ELEMENT(scores, 1, vector) = (array_double_t) average_over_row(ARRAY_ARGUMENTS(values), vector);
        } else if (found > k) {
            ARRAY_ELEMENT(scores, 1, vector) = (array_double_t) (ARRAY_ELEMENT(scores, 1, vector) * (array_double_t) k - removed_value + value) / (array_double_t) k;
    
            if (ARRAY_ELEMENT(scores, 1, vector) <= 0) {
                /* avoid round off error */
                const array_double_t average = average_over_row(ARRAY_ARGUMENTS(values), vector);
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
void top_n_outlier_pruning_block(const double * const ARRAY_SIGNATURE(data),
                                 const unsigned int k, const unsigned int N, const unsigned int block_size, 
                                 unsigned int * ARRAY_SIGNATURE(outliers), 
                                 double * ARRAY_SIGNATURE(outlier_scores)) {
    /* Error checking. */
    if (ROWS(outliers) != 1 || COLS(outliers) != N)
        mexErrMsgTxt("Input 'outliers' must be a 1xN array.");
    if (ROWS(outlier_scores) != 1 || COLS(outlier_scores) != N)
        mexErrMsgTxt("Input 'outlier_scores' must be a 1xN array.");
    
    double cutoff = 0;
    size_t outliers_size = 0; /* the number of initialised elements in the outliers array */
    index_t block_begin; /* the index of the first vector in the block currently being processed */
    size_t actual_block_size; /* actual_block_size may be smaller than block_size if "ROWS(data) % block_size != 0" */
    
    for (block_begin = 1; block_begin <= ROWS(data); block_begin += actual_block_size) { /* while there are still blocks to process */
        const index_t block_end = MIN(block_begin+block_size-1, ROWS(data)); /* the index of the last vector in the block */
        actual_block_size = block_end-block_begin+1; /* the number of vectors in the current block */
    
        /* 
         * Process actual_block_size vectors, beginning at vector "begin" and 
         * ending at vector "end" inclusive. In this iteration, we find the top
         * "N" outliers based on distances from vectors in the current block to
         * their k-nearest neighbours.
         */
        
        /* 
         * Arrays to store the "k" nearest neighbours for each vector in the 
         * block.
         */
        CREATE_REAL_UINT_ARRAY  (neighbours,      actual_block_size, k); 
        CREATE_REAL_DOUBLE_ARRAY(neighbours_dist, actual_block_size, k);
        
        /* An array used to mark a vector as being removed from the block. */
        CREATE_REAL_BOOLEAN_ARRAY(removed, 1, actual_block_size);
        
        /* 
         * The "score" function can be any monotonically decreasing function of 
         * the nearest neighbor distances. We use the average distance to the 
         * "k" neighbours.
         */
        CREATE_REAL_DOUBLE_ARRAY(score, 1, actual_block_size);
        
        /*
         * How many nearest neighbours we have found, for each vector in the 
         * block.
         */
        CREATE_REAL_UINT_ARRAY(found, 1, actual_block_size);

        index_t vector1;
        for (vector1 = 1; vector1 <= ROWS(data); vector1++) {            
            index_t vector2;
            for (vector2 = block_begin; vector2 <= block_end; vector2++) {
                const index_t block_index = vector2-block_begin+1;

                if (vector1 != vector2 && ARRAY_ELEMENT(removed, 1, block_index) != true) {
                    /* 
                     * Calculate the square of the distance between the two 
                     * vectors (indexed by "vector1" and "vector2")
                     */
                    const double dist_squared = distance_squared(ARRAY_ARGUMENTS(data), vector1, vector2);
                    
                    removed_distance = sorted_insert(block_index, ARRAY_ARGUMENTS(found), ARRAY_ARGUMENTS(neighbours), vector1, ARRAY_ARGUMENTS(neighbours_dist), dist_squared);

                    if (removed_distance >= 0) {
                        ARRAY_ELEMENT(score, 1, block_index) = (ARRAY_ELEMENT(score, 1, block_index)*k - maxd + d)/k;
                    }

                    if (ARRAY_ELEMENT(found, 1, block_index) >= k && ARRAY_ELEMENT(score, 1, block_index) < cutoff) {
                        ARRAY_ELEMENT(removed, 1, block_index) = true;
                        ARRAY_ELEMENT(score, 1, block_index)   = 0.0;
                    }
                }
            }
        }
        
        /*
         * Compare the new scores with the outliers stored in output arrays "O" 
         * and "OF". Sort this array and keep the top "N" outliers.
         */
        best_outliers(outliers, outlier_scores, outliers_size, block(1:actual_block_size), score);
        
        /*
         * Set "cutoff" to the score of the weakest outlier. There is no need to
         * store an outlier in future iterations if its score is better than the
         * cutoff.
         */
        cutoff = ARRAY_ELEMENT(outlier_scores, 1, N);
        
        FREE_ARRAY(neighbours);
        FREE_ARRAY(neighbours_dist);
        FREE_ARRAY(removed);
        FREE_ARRAY(score);
        FREE_ARRAY(found);
    }
}
