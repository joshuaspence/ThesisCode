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

#include <assert.h> /* for assert */

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
static void sorted_insert(const index_t block_index, 
                          unsigned int * const ARRAY_SIGNATURE(index_array), 
                          double * const ARRAY_SIGNATURE(value_array), 
                          unsigned int * const ARRAY_SIGNATURE(found),
                          const unsigned int new_index, const double new_value) {
    /* Error checking. */
    assert(ROWS(index_array) == ROWS(value_array) && COLS(index_array) == COLS(value_array));
    
    index_t index = 0; /* the index at which the new pair will be inserted */   
    double removed_value = -1; /* the value that was removed from the value_array */
    const size_t curr_size = ARRAY_ELEMENT(found, 1, block_index);
    
    /*
     * Shuffle array elements from front to back. Elements greater than the new 
     * value will be right-shifted by one index in the array.
     *
     * Note that uninitialised values in the array will appear on the left. That
     * is, if the array is incomplete (has a size n < N) then the data in the 
     * array is stored in the rightmost n indexes.
     */
    
    if (curr_size < COLS(value_array)) {
        /* Special handling required if the array is incomplete. */
        
        index_t i;
        for (i = COLS(value_array) - curr_size; i <= COLS(value_array); i++) {
            if (new_value > ARRAY_ELEMENT(value_array, block_index, i) || (i == COLS(value_array) - curr_size) {
                /* Shuffle values down the array. */
                if (i != 1) {
                    ARRAY_ELEMENT(index_array, block_index, i-1) = ARRAY_ELEMENT(index_array, block_index, i);
                    ARRAY_ELEMENT(value_array, block_index, i-1) = ARRAY_ELEMENT(value_array, block_index, i);
                }
                index = i;
                removed_value = 0;
            } else {
                /* We have found the insertion point. */
                break;
            }
        }
    } else {
        index_t i;
        for (i = COLS(value_array); i >= 1; i--) {
            if (new_value < ARRAY_ELEMENT(value_array, block_index, i)) {
                if (i == COLS(value_array)) {
                    /*
                     * The removed value is the value of the last element in the
                     * array.
                     */
                    removed_value = ARRAY_ELEMENT(value_array, block_index, i);
                }
            
                /* Shuffle values down the array. */
                if (i != 1) {
                    ARRAY_ELEMENT(index_array, block_index, i) = ARRAY_ELEMENT(index_array, block_index, i-1);
                    ARRAY_ELEMENT(value_array, block_index, i) = ARRAY_ELEMENT(value_array, block_index, i-1);
                }
                index = i;
            } else {
                /* We have found the insertion point. */
                break;
        }
    }
    
    /*
     * Insert the new pair and increment the current_size of the array (if 
     * necessary).
     */
    if (index != 0) {
        ARRAY_ELEMENT(index_array, block_index, index) = new_index;
        ARRAY_ELEMENT(value_array, block_index, index) = new_value;
        
        if (curr_size < COLS(value_array)) {
            ARRAY_ELEMENT(found, 1, block_index) = curr_size + 1;
        }
    }
}

/*
 * Take the top N outliers based on the current outliers (identified by the 
 * (outliers-outlier_scores) pairs) and the new outliers from the current block 
 * (identified by the (block-scores) pairs).
 *
 * Note that the (outliers, outlier_scores) arrays should already be sorted. The
 *(block-scores) arrays need not be sorted.
 *
 * This function uses merge sort.
 */
static size_t best_outliers(outliers, outlier_scores, outliers_size, current_block, scores)
    /* Error checking. */
    assert(ROWS(outliers) == ROWS(outlier_scores) && COLS(outliers) == COLS(outlier_scores));

    /* Sort the (current_block, scores) arrays. */
    sort(ARRAY_ARGUMENTS(current_block), ARRAY_ARGUMENTS(scores));
    
    /* Create two temporary arrays. */
    CREATE_REAL_UINT_ARRAY  (temp_index, ROWS(outliers),       COLS(outliers));
    CREATE_REAL_DOUBLE_ARRAY(temp_value, ROWS(outlier_scores), COLS(outlier_scores));
    
    /* Merge the two arrays. */
    const size_t outliers_size merge(ARRAY_ARGUMENTS(outliers), ARRAY_ARGUMENTS(outlier_scores), outliers_size, 
                                     ARRAY_ARGUMENTS(current_block), ARRAY_ARGUMENTS(scores), COLS(current_block),
                                     ARRAY_ARGUMENTS(temp_index), ARRAY_ARGUMENTS(temp_value));
    
    /* Copy values from temporary arrays to real arrays. */
    index_t row, col;
    for (row = 1; row <= ROWS(outliers); row++) {
        for (col = 1; col <= COLS(outliers); col++) {
            ARRAY_ELEMENT(outliers,        row, col) = ARRAY_ELEMENT(temp_index, row, col);
            ARRAY_ELEMENT(outliers_scores, row, col) = ARRAY_ELEMENT(temp_value, row, col);
        }
    }
    
    /* Delete temporary arrays. */
    FREE_ARRAY(temp_index);
    FREE_ARRAY(temp_value);
    
    return outliers_size;
}

/*
 * TODO
 */
static void sort_descending(unsigned int * const ARRAY_SIGNATURE(index_array),
                            double * const ARRAY_SIGNATURE(value_array)) {
    
}

/*
 * Merge two sorted arrays in descending order. Takes two pairs of 1xN arrays 
 * and returns a pair of 1xN arrays.
 *
 * TODO
 */
static size_t merge(unsigned int * const ARRAY_SIGNATURE(index_array1), double * const ARRAY_SIGNATURE(value_array1), const size_t array1_size, 
                   unsigned int * const ARRAY_SIGNATURE(index_array2), double * const ARRAY_SIGNATURE(value_array2), const size_t array2_size, 
                   unsigned int * const ARRAY_SIGNATURE(index_array), double * const ARRAY_SIGNATURE(value_array)) {
    /* Error checking. */
    assert(ROWS(index_array1) = ROWS(value_array1) && COLS(index_array1) == COLS(value_array1));
    assert(ROWS(index_array2) == ROWS(value_array2) && COLS(index_array2) == COLS(value_array2));
    assert(ROWS(index_array) == ROWS(value_array) && COLS(index_array) == COLS(value_array));
    assert(ROWS(index_array1) == 1);
    assert(ROWS(index_array2) == 1);
    assert(ROWS(index_array) == 1);
    
    size_t array_size  = 0;
    
    index_t iter  = 1; /* iterator through output array */
    index_t iter1 = 1; /* iterator through array1 */
    index_t iter2 = 1; /* iterator through array2 */
    while (iter <= COLS(value_array) && (iter1 <= array1_size || iter2 <= array2_size)) {
        if (iter1 > array1_size && iter2 <= array2_size) {
            /* There are no remaining elements remaining in array1. */
            ARRAY_ELEMENT(index_array, 1, iter) = ARRAY_ELEMENT(index_array2, 1, iter2);
            ARRAY_ELEMENT(value_array, 1, iter) = ARRAY_ELEMENT(value_array2, 1, iter2);
            iter1++;
            iter2++;
        } else if (iter1 <= array1_size && iter2 > array2_size) {
            /* There are no remaining elements remaining in array2. */
            ARRAY_ELEMENT(index_array, 1, iter) = ARRAY_ELEMENT(index_array1, 1, iter1);
            ARRAY_ELEMENT(value_array, 1, iter) = ARRAY_ELEMENT(value_array1, 1, iter1);
            iter1++;
            iter2++;
        } else if (iter1 > array1_size && iter2 > array2_size) {
            /* 
             * There are no remaining elements remaining in either array1 or 
             * array2.
             */
            iter1++;
            iter2++;
        } else if (value_array1(iter1) >= value_array2(iter2)) {
            ARRAY_ELEMENT(index_array, 1, iter) = ARRAY_ELEMENT(index_array1, 1, iter1);
            ARRAY_ELEMENT(value_array, 1, iter) = ARRAY_ELEMENT(value_array1, 1, iter1);
            iter1++;
        } else if (value_array1(iter1) <= value_array2(iter2)) {
            ARRAY_ELEMENT(index_array, 1, iter) = ARRAY_ELEMENT(index_array2, 1, iter2);
            ARRAY_ELEMENT(value_array, 1, iter) = ARRAY_ELEMENT(value_array2, 1, iter2);
            iter2++;
        }
        
        iter++;
        array_size++;
    }
    
    return array_size;
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
    assert(ROWS(outliers) == 1 && COLS(outliers) != N);
    assert(ROWS(outlier_scores) != 1 || COLS(outlier_scores) != N);
    
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
                    
                    removed_distance = sorted_insert(block_index, ARRAY_ARGUMENTS(neighbours), ARRAY_ARGUMENTS(neighbours_dist), ARRAY_ARGUMENTS(found), vector1, dist_squared);

                    if (removed_distance >= 0) {
                        ARRAY_ELEMENT(score, 1, block_index) = (ARRAY_ELEMENT(score, 1, block_index)*k - removed_distance + d)/k;
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
