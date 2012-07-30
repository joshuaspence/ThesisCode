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

/* Forward declarations */
static double sorted_insert(const index_t block_index, 
                            unsigned int * const ARRAY_SIGNATURE(index_array), 
                            double * const ARRAY_SIGNATURE(value_array), 
                            unsigned int * const VECTOR_SIGNATURE(found),
                            const unsigned int new_index, const double new_value);
static size_t best_outliers(unsigned int * const VECTOR_SIGNATURE(outliers), 
                            double * const VECTOR_SIGNATURE(outlier_scores), 
                            const size_t outliers_size, 
                            unsigned int * const VECTOR_SIGNATURE(current_block), 
                            double * const VECTOR_SIGNATURE(scores));
static void sort_vectors_descending(unsigned int * const VECTOR_SIGNATURE(index_vector),
                                    double * const VECTOR_SIGNATURE(value_vector));
static void merge_sort(unsigned int * const VECTOR_SIGNATURE(index_vector),
                       double * const VECTOR_SIGNATURE(value_vector),
                       index_t start, index_t end,
                       unsigned int * const VECTOR_SIGNATURE(output_index),
                       double * const VECTOR_SIGNATURE(output_value));
static size_t merge(unsigned int * const VECTOR_SIGNATURE(index_array1), double * const VECTOR_SIGNATURE(value_array1), const size_t array1_size, 
                    unsigned int * const VECTOR_SIGNATURE(index_array2), double * const VECTOR_SIGNATURE(value_array2), const size_t array2_size, 
                    unsigned int * const VECTOR_SIGNATURE(index_array),  double * const VECTOR_SIGNATURE(value_array));
void top_n_outlier_pruning_block(const double * const ARRAY_SIGNATURE(data),
                                 const unsigned int k, const unsigned int N, const unsigned int block_size, 
                                 unsigned int * VECTOR_SIGNATURE(outliers), 
                                 double * VECTOR_SIGNATURE(outlier_scores));

/* 
 * TODO
 *
 * Insert "index" into "index_array" and "value" into "value_array", whilst 
 * maintaining the sorted property of "value_array". Returns the value that was
 * removed from "value_array", else -1.
 *
 * Parameters:
 *     - block_index:
 *     - index_array: The index array.
 *     - index_array_rows: The number of vectors contained within index_array.
 *     - index_array_cols: The size of each vector within index_array.
 *     - value_array: The value array.
 *     - value_array_rows: The number of vectors contained within value_array.
 *     - value_array_cols: The size of each vector within value_array.
 *     - found:
 *     - found_rows:
 *     - found_cols:
 *     - new_index: The value to be inserted into index_array.
 *     - new_value: The value to be inserted into value_array.
 */
static double sorted_insert(const index_t block_index, 
                            unsigned int * const ARRAY_SIGNATURE(index_array), 
                            double * const ARRAY_SIGNATURE(value_array), 
                            unsigned int * const VECTOR_SIGNATURE(found),
                            const unsigned int new_index, const double new_value) {
    /* Error checking. */
    assert(ROWS(index_array) == ROWS(value_array) && COLS(index_array) == COLS(value_array));    assert(ROWS(index_array) == ELEMENTS(found));
    assert(block_index >=1 && block_index <= ROWS(index_array));
    
    index_t index = 0; /* the index at which the new pair will be inserted */   
    double removed_value = -1; /* the value that was removed from the value_array */
    const size_t curr_size = VECTOR_ELEMENT(found, block_index);
    
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
            if (new_value > ARRAY_ELEMENT(value_array, block_index, i) || (i == COLS(value_array) - curr_size)) {
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
    }
    
    /*
     * Insert the new pair and increment the current_size of the array (if 
     * necessary).
     */
    if (index != 0) {
        ARRAY_ELEMENT(index_array, block_index, index) = new_index;
        ARRAY_ELEMENT(value_array, block_index, index) = new_value;
        
        if (curr_size < COLS(value_array)) {
            VECTOR_ELEMENT(found, block_index) = curr_size + 1;
        }
    }
    
    return removed_value;
}

/*
 * Take the top N outliers based on the current outliers (identified by the 
 * (outliers, outlier_scores) pairs) and the new outliers from the current block 
 * (identified by the (block, scores) pairs).
 *
 * Note that the (outliers, outlier_scores) vectors should already be sorted. 
 * The (block, scores) vector need not be sorted. This function uses merge sort.
 *
 * This functions returns the number of initialised elements in the outliers 
 * vector.
 */
static size_t best_outliers(unsigned int * const VECTOR_SIGNATURE(outliers), 
                            double * const VECTOR_SIGNATURE(outlier_scores), 
                            const size_t outliers_size, 
                            unsigned int * const VECTOR_SIGNATURE(current_block), 
                            double * const VECTOR_SIGNATURE(scores)) {
    /* Error checking. */
    assert(ELEMENTS(outliers) == ELEMENTS(outlier_scores));
    assert(ELEMENTS(current_block) == ELEMENTS(scores));
    assert(outliers_size >= 1 && outliers_size <= ELEMENTS(outliers));

    /* Sort the (current_block, scores) vectors. */
    sort_vectors_descending(VECTOR_ARGUMENTS(current_block), VECTOR_ARGUMENTS(scores));
    
    /* Create two temporary vectors for the output of the "merge" function. */
    CREATE_REAL_UINT_VECTOR  (temp_index, ELEMENTS(outliers));
    CREATE_REAL_DOUBLE_VECTOR(temp_value, ELEMENTS(outlier_scores));
    
    /* Merge the two vectors. */
    const size_t outliers_size = merge(VECTOR_ARGUMENTS(outliers), VECTOR_ARGUMENTS(outlier_scores), outliers_size, 
                                       VECTOR_ARGUMENTS(current_block), VECTOR_ARGUMENTS(scores), ELEMENTS(current_block),
                                       VECTOR_ARGUMENTS(temp_index), VECTOR_ARGUMENTS(temp_value));
    
    /* Copy values from temporary vectors to real vectors. */
    index_t i;
    for (i = 1; i <= ELEMENTS(outliers); i++) {
        VECTOR_ELEMENT(outliers,        i) = VECTOR_ELEMENT(temp_index, i);
        VECTOR_ELEMENT(outliers_scores, i) = VECTOR_ELEMENT(temp_value, i);
    }
    
    /* Delete temporary vector. */
    FREE_VECTOR(temp_index);
    FREE_VECTOR(temp_value);
    
    return outliers_size;
}

/*
 * TODO
 */
static void sort_vectors_descending(unsigned int * const VECTOR_SIGNATURE(index_vector),
                                    double * const VECTOR_SIGNATURE(value_vector)) {
    /* Error checking. */
    assert(ELEMENTS(index_vector) == ELEMENTS(value_vector));
    
    /* Create temporary vectors for "merge_sort" function output. */
    CREATE_REAL_UINT_VECTOR  (temp_index, ELEMENTS(index_vector));
    CREATE_REAL_DOUBLE_VECTOR(temp_value, ELEMENTS(value_vector));
    
    merge_sort(VECTOR_ARGUMENTS(index_vector), VECTOR_ARGUMENTS(value_vector), 
               1, ELEMENTS(index_vector),
               VECTOR_ARGUMENTS(temp_index), VECTOR_ARGUMENTS(temp_value));
    
    /* Copy the values from the temporary vectors. */
    index_t i;
    for (i = 1; i <= ELEMENTS(index_vector); i++) {
        VECTOR_ELEMENT(index_vector, i) = VECTOR_ELEMENT(temp_index, i);
        VECTOR_ELEMENT(value_vector, i) = VECTOR_ELEMENT(temp_value, i);
    }
    
    /* Delete the temporary vectors. */
    FREE_VECTOR(temp_index);
    FREE_VECTOR(temp_value);
}

/*
 * TODO
 */
static void merge_sort(unsigned int * const VECTOR_SIGNATURE(index_vector),
                       double * const VECTOR_SIGNATURE(value_vector),
                       index_t start, index_t end,
                       unsigned int * const VECTOR_SIGNATURE(output_index),
                       double * const VECTOR_SIGNATURE(output_value)) {
    /* Error checking. */
    assert(ELEMENTS(index_vector) == ELEMENTS(value_vector));
    assert(ELEMENTS(output_index) == ELEMENTS(output_value));
    assert(ELEMENTS(index_vector) == ELEMENTS(output_index));
    assert(start >= 1 && start <= ELEMENTS(index_vector));
    assert(end >= 1 && end <= ELEMENTS(index_vector));
    assert(start <= end);
    
    const size_t size = end - start + 1;
    
    if (size <= 2) {
        /* Base case */
        
        if (size == 2) {
            if (VECTOR_ELEMENT(value_vector, start) < VECTOR_ELEMENT(value_vector, end)) {
                /* Swap the values around. */
                unsigned int temp_index = VECTOR_ELEMENT(index_vector, start);
                double       temp_value = VECTOR_ELEMENT(value_vector, start);
                
                VECTOR_ELEMENT(index_vector, start) = VECTOR_ELEMENT(index_vector, end);
                VECTOR_ELEMENT(value_vector, start) = VECTOR_ELEMENT(value_vector, end);
                
                VECTOR_ELEMENT(index_vector, end)   = temp_index;
                VECTOR_ELEMENT(value_vector, end)   = temp_value;
            }
        }
    } else {
        /* Recursion */
        const index_t left_start  = start;
        const index_t left_end    = start + (size-1) / 2;
        const index_t right_start = left_end + 1;
        const index_t right_end   = end;
        
        /* Sort the left half. */
        merge_sort(VECTOR_ARGUMENTS(index_vector), VECTOR_ARGUMENTS(value_vector), left_start,  left_end);
        
        /* Sort the right half. */
        merge_sort(VECTOR_ARGUMENTS(index_vector), VECTOR_ARGUMENTS(value_vector), right_start, right_end);
        
        /* Merge the two sorted halves. */
        index_t left_iter  = left_start;
        index_t right_iter = right_start;
        while (left_iter <= left_end || right_iter <= right_end) {
            assert(right_iter <= right_end);
            
            if (left_iter > left_end && right_iter <= right_end) {
                right_iter++;
            } 

            if (VECTOR_ELEMENT(value_vector, left_iter) >= VECTOR_ELEMENT(value_vector, right_iter)) {
                /* The two elements are ordered relatively correct. */
                left_iter++;
            }
            if (VECTOR_ELEMENT(value_vector, left_iter) < VECTOR_ELEMENT(value_vector, right_iter)) {
                /* Swap the values around. */
                unsigned int temp_index = VECTOR_ELEMENT(index_vector, left_iter);
                double       temp_value = VECTOR_ELEMENT(value_vector, left_iter);
                
                VECTOR_ELEMENT(index_vector, left_iter)  = VECTOR_ELEMENT(index_vector, right_iter);
                VECTOR_ELEMENT(value_vector, left_iter)  = VECTOR_ELEMENT(value_vector, right_iter);
                
                VECTOR_ELEMENT(index_vector, right_iter) = temp_index;
                VECTOR_ELEMENT(value_vector, right_iter) = temp_value;
                
                left_iter++;
            } else {
                left_iter++;
            }
        }
    }
}

/*
 * Merge two sorted arrays in descending order. Takes two pairs of 1xN arrays 
 * and returns a pair of 1xN arrays.
 *
 * TODO
 */
static size_t merge(unsigned int * const VECTOR_SIGNATURE(index_array1), double * const VECTOR_SIGNATURE(value_array1), const size_t array1_size, 
                    unsigned int * const VECTOR_SIGNATURE(index_array2), double * const VECTOR_SIGNATURE(value_array2), const size_t array2_size, 
                    unsigned int * const VECTOR_SIGNATURE(index_array),  double * const VECTOR_SIGNATURE(value_array)) {
    /* Error checking. */
    assert(ROWS(index_array1) = ROWS(value_array1) && COLS(index_array1) == COLS(value_array1));
    assert(ROWS(index_array2) == ROWS(value_array2) && COLS(index_array2) == COLS(value_array2));
    assert(ROWS(index_array) == ROWS(value_array) && COLS(index_array) == COLS(value_array));
    assert(array1_size >= 1 && array1_size <= ELEMENTS(index_array1));
    assert(array2_size >= 1 && array2_size <= ELEMENTS(index_array2));
    
    size_t  array_size  = 0;
    index_t iter        = 1; /* iterator through output array */
    index_t iter1       = 1; /* iterator through array1 */
    index_t iter2       = 1; /* iterator through array2 */
    while (iter <= ELEMENTS(value_array) && (iter1 <= array1_size || iter2 <= array2_size)) {
        if (iter1 > array1_size && iter2 <= array2_size) {
            /* There are no remaining elements remaining in array1. */
            VECTOR_ELEMENT(index_array, iter) = VECTOR_ELEMENT(index_array2, iter2);
            VECTOR_ELEMENT(value_array, iter) = VECTOR_ELEMENT(value_array2, iter2);
            iter1++;
            iter2++;
        } else if (iter1 <= array1_size && iter2 > array2_size) {
            /* There are no remaining elements remaining in array2. */
            VECTOR_ELEMENT(index_array, iter) = VECTOR_ELEMENT(index_array1, iter1);
            VECTOR_ELEMENT(value_array, iter) = VECTOR_ELEMENT(value_array1, iter1);
            iter1++;
            iter2++;
        } else if (iter1 > array1_size && iter2 > array2_size) {
            /* 
             * There are no remaining elements remaining in either array1 or 
             * array2.
             */
            iter1++;
            iter2++;
        } else if (VECTOR_ELEMENT(value_array1, iter1) >= VECTOR_ELEMENT(value_array2, iter2)) {
            VECTOR_ELEMENT(index_array, iter) = VECTOR_ELEMENT(index_array1, iter1);
            VECTOR_ELEMENT(value_array, iter) = VECTOR_ELEMENT(value_array1, iter1);
            iter1++;
        } else if (VECTOR_ELEMENT(value_array1, iter1) <= VECTOR_ELEMENT(value_array2, iter2)) {
            VECTOR_ELEMENT(index_array, iter) = VECTOR_ELEMENT(index_array2, iter2);
            VECTOR_ELEMENT(value_array, iter) = VECTOR_ELEMENT(value_array2, iter2);
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
 *     - data: An array consisting of 'data_rows' vectors, each of 
 *           dimensionality 'data_cols'.
 *     - data_rows: Number of vectors contained in the 'data' array.
 *     - data_cols: Size of each vector contained in the 'data' array.
 *     - k: The number of k-nearest neighbours for outlier detection.
 *     - N: The top 'N' outliers will be returned by this function.
 *     - block_size: The input 'data' matrix will be processed in blocks of
 *           size 'block_size'.
 *     - outliers: A vector used to store the top 'N' outliers identified by 
 *           this function. Each entry in this vector will be an index (to the 
 *           'data' array) of the outlying vector.
 *     - outliers_elements: Number of elements contained in the 'outliers' 
 *            vector.
 *     - outlier_scores: A vector used to score the score associated with 
 *           each of the outliers stored in the 'outliers' array.
 *     - outlier_scores_elements: Number of elements contained in the 
 *          'outlier_scores' vector.
 */
void top_n_outlier_pruning_block(const double * const ARRAY_SIGNATURE(data),
                                 const unsigned int k, const unsigned int N, const unsigned int block_size, 
                                 unsigned int * VECTOR_SIGNATURE(outliers), 
                                 double * VECTOR_SIGNATURE(outlier_scores)) {
    /* Error checking. */
    assert(ELEMENTS(outliers) == ELEMENTS(outlier_scores));
    assert(ELEMENTS(outliers) == N);
    assert(ROWS(data) >= N);
    assert(ROWS(data) >= k);
    
    double cutoff = 0;          /* vectors with a score less than the cutoff will be removed from the block */
    size_t outliers_size = 0;   /* the number of initialised elements in the outliers array */
    index_t block_begin;        /* the index of the first vector in the block currently being processed */
    size_t actual_block_size;   /* actual_block_size may be smaller than block_size if "ROWS(data) mod block_size != 0" */
    
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
        
        /* A vector used to mark a vector as being removed from the block. */
        CREATE_BOOLEAN_VECTOR(removed, actual_block_size);
        
        /* 
         * The "score" function can be any monotonically decreasing function of 
         * the nearest neighbor distances. We use the average distance to the 
         * "k" neighbours.
         */
        CREATE_REAL_DOUBLE_VECTOR(score, actual_block_size);
        
        /*
         * How many nearest neighbours we have found, for each vector in the 
         * block.
         */
        CREATE_REAL_UINT_VECTOR(found, actual_block_size);

        index_t vector1;
        for (vector1 = 1; vector1 <= ROWS(data); vector1++) {            
            index_t vector2;
            for (vector2 = block_begin; vector2 <= block_end; vector2++) {
                const index_t block_index = vector2-block_begin+1;

                if (vector1 != vector2 && VECTOR_ELEMENT(removed, block_index) != true) {
                    /* 
                     * Calculate the square of the distance between the two 
                     * vectors (indexed by "vector1" and "vector2")
                     */
                    const double dist_squared = distance_squared(ARRAY_ARGUMENTS(data), vector1, vector2);
                    
                    /* 
                     * Insert the new (index, distance) pair into the neighbours
                     * array for the current vector.
                     */
                    const double removed_distance = sorted_insert(block_index, ARRAY_ARGUMENTS(neighbours), ARRAY_ARGUMENTS(neighbours_dist), VECTOR_ARGUMENTS(found), vector1, dist_squared);

                    /* 
                     * Update the score (if the neighbours array was changed).
                     */
                    if (removed_distance >= 0) {
                        VECTOR_ELEMENT(score, block_index) = (VECTOR_ELEMENT(score, block_index) * k - removed_distance + dist_squared)/k;
                    }

                    /* 
                     * If the score for this vector is less than the cutoff, 
                     * then prune this vector from the block.
                     */
                    if (VECTOR_ELEMENT(found, block_index) >= k && VECTOR_ELEMENT(score, block_index) < cutoff) {
                        VECTOR_ELEMENT(removed, block_index) = true;
                        VECTOR_ELEMENT(score,   block_index) = 0.0;
                    }
                }
            }
        }
        
        /* Keep track of the top "N" outliers. */
        outliers_size = best_outliers(VECTOR_ARGUMENTS(outliers), VECTOR_ARGUMENTS(outlier_scores),
                                      outliers_size, block_begin, block_end, VECTOR_ARGUMENTS(score));
        
        /*
         * Set "cutoff" to the score of the weakest outlier. There is no need to
         * store an outlier in future iterations if its score is better than the
         * cutoff.
         */
        cutoff = VECTOR_ELEMENT(outlier_scores, N);
        
        /* Free memory. */
        FREE_ARRAY(neighbours);
        FREE_ARRAY(neighbours_dist);
        FREE_VECTOR(removed);
        FREE_VECTOR(score);
        FREE_VECTOR(found);
    }
}
