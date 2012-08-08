/******************************************************************************/
/* Includes                                                                   */
/******************************************************************************/
#include <assert.h>
#include <mex.h>
#include "macros.h"
#include "top_n_outlier_pruning_block.h"
/******************************************************************************/

/* Check definitions. */
#if defined(UNSORTED_INSERT) && defined(SORTED_INSERT)
    #error "Only one of UNSORTED_INSERT and SORTED_INSERT should be defined."
#endif /* #if defined(UNSORTED_INSERT) && defined(SORTED_INSERT) */

/* Forward declarations */
static inline double_t distance_squared(
    const double * const ARRAY_SIGNATURE(vectors),
    const index_t vector1,
    const index_t vector2);
#ifdef SORTED_INSERT
static inline double_t sorted_insert(
    const index_t block_index,
    uint_t * const ARRAY_SIGNATURE(index_array),
    double_t * const ARRAY_SIGNATURE(value_array),
    uint_t * const VECTOR_SIGNATURE(found),
    const uint_t new_index, const double_t new_value);
#endif /* #ifdef SORTED_INSERT */
#ifdef UNSORTED_INSERT
static inline double_t unsorted_insert(
    const index_t block_index,
    uint_t * const ARRAY_SIGNATURE(index_array),
    double_t * const ARRAY_SIGNATURE(value_array),
    uint_t * const VECTOR_SIGNATURE(found),
    const uint_t new_index, const double_t new_value);
#endif /* #ifdef UNSORTED_INSERT */
static inline size_t best_outliers(
    uint_t * const VECTOR_SIGNATURE(outliers),
    double_t * const VECTOR_SIGNATURE(outlier_scores),
    const size_t outliers_size,
    uint_t * const VECTOR_SIGNATURE(current_block),
    double_t * const VECTOR_SIGNATURE(scores));
static inline void sort_vectors_descending(
    uint_t * const VECTOR_SIGNATURE(index_vector),
    double_t * const VECTOR_SIGNATURE(value_vector));
static inline size_t merge(
    uint_t * const VECTOR_SIGNATURE(index_array1),
    double_t * const VECTOR_SIGNATURE(value_array1),
    const size_t array1_size,
    uint_t * const VECTOR_SIGNATURE(index_array2),
    double_t * const VECTOR_SIGNATURE(value_array2),
    const size_t array2_size,
    uint_t * const VECTOR_SIGNATURE(index_array),
    double_t * const VECTOR_SIGNATURE(value_array));

/*
 * Calculate the square of the Euclidean distance between two vectors (i.e. the
 * sum of the squares of the distance in each dimension).
 *
 * Parameters:
 *     - vectors: The array containg the vectors between which to calculate the
 *           distance.
 *     - vectors_rows: The number of vectors contained within the array.
 *     - vectors_cols: The size of each vector within the array.
 *     - vector1: The row index of one of the vectors. Note that the row index
 *           follows the MATLAB convention of beginning at 1.
 *     - vector2: The row index of the other vector. Note that the row index
 *           follows the MATLAB convention of beginning at 1.
 *
 * Return:
 *    The sum of the distance between values of the rows.
 */
static inline double_t distance_squared(const double_t * const ARRAY_SIGNATURE(vectors), const index_t vector1, const index_t vector2) {
    double_t sum_of_squares = 0;
    
    index_t col;
    for (col = 1; col <= COLS(vectors); col++) {
        const double_t val         = ARRAY_ELEMENT(vectors, vector1, col) - ARRAY_ELEMENT(vectors, vector2, col);
        const double_t val_squared = val * val;
        sum_of_squares            += val_squared;
    }
    
    return sum_of_squares;
}

#ifdef SORTED_INSERT
/*
 * Insert "new_index" into the "indexes" vector and "new_value" into the 
 * "values" vector, whilst maintaining the sorted property of the "values" 
 * vector. Returns the value  that was removed from the "values" vector, else 
 * -1 if nothing was removed from the vector.
 *
 * Parameters:
 *     - block_index: The index of the current vector (row) within the block. 
 *           This indicates the row that will be used to read/write the 
 *           "indexes" and "values" arrays.
 *     - indexes: The index array.
 *     - indexes_rows: The number of vectors contained within the "indexes" 
 *           array.
 *     - indexes_cols: The size of each vector within the "indexes" array.
 *     - values: The value array.
 *     - values_rows: The number of vectors contained within the "values" array.
 *     - values_cols: The size of each vector within the "values" array.
 *     - found: A vector storing the number of initialised entries in the
 *           "indexes" and "values" arrays for each vector.
 *     - found_elements: The number of elements in the "found" vector.
 *     - new_index: The value to be inserted into the "indexes" array.
 *     - new_value: The value to be inserted into the "values" array.
 */
static inline double_t sorted_insert(const index_t block_index,
                                     uint_t * const ARRAY_SIGNATURE(indexes),
                                     double_t * const ARRAY_SIGNATURE(values),
                                     uint_t * const VECTOR_SIGNATURE(found),
                                     const uint_t new_index, const double_t new_value) {
    /* Error checking. */
    assert(ROWS(indexes) == ROWS(values) && COLS(indexes) == COLS(values));
    assert(ROWS(indexes) == ELEMENTS(found));
    assert(block_index >=1 && block_index <= ROWS(indexes));
    
    index_t insert_index   = 0; /* the index at which the new pair will be inserted */
    double_t removed_value = -1; /* the value that was removed from the values vector */
    const size_t curr_size = VECTOR_ELEMENT(found, block_index);
    
    /*
     * Shuffle array elements from front to back. Elements greater than the new
     * value will be right-shifted by one index in the array.
     *
     * Note that uninitialised values in the array will appear on the left. That
     * is, if the array is incomplete (has a size n < N) then the data in the
     * array is stored in the rightmost n indexes.
     */
    
    if (curr_size < COLS(values)) {
        /* Special handling required if the array is incomplete. */
        
        index_t i;
        for (i = COLS(values) - curr_size; i <= COLS(values); i++) {
            if (new_value > ARRAY_ELEMENT(values, block_index, i) || (i == (index_t) (COLS(values) - curr_size))) {
                /* Shuffle values down the array. */
                if (i != 1) {
                    ARRAY_ELEMENT(indexes, block_index, i-1) = ARRAY_ELEMENT(indexes, block_index, i);
                    ARRAY_ELEMENT(values,  block_index, i-1) = ARRAY_ELEMENT(values,  block_index, i);
                }
                insert_index  = i;
                removed_value = (double_t) 0;
            } else {
                /* We have found the insertion point. */
                break;
            }
        }
    } else {
        index_t i;
        for (i = COLS(values); i >= 1; i--) {
            if (new_value < ARRAY_ELEMENT(values, block_index, i)) {
                if (i == COLS(values)) {
                    /*
                     * The removed value is the value of the last element in the
                     * array.
                     */
                    removed_value = ARRAY_ELEMENT(values, block_index, i);
                }

                /* Shuffle values down the array. */
                if (i != 1) {
                    ARRAY_ELEMENT(indexes, block_index, i) = ARRAY_ELEMENT(indexes, block_index, i-1);
                    ARRAY_ELEMENT(values,  block_index, i) = ARRAY_ELEMENT(values,  block_index, i-1);
                }
                insert_index = i;
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
    if (insert_index != 0) {
        ARRAY_ELEMENT(indexes, block_index, insert_index) = new_index;
        ARRAY_ELEMENT(values,  block_index, insert_index) = new_value;
        
        if (curr_size < COLS(values)) {
            VECTOR_ELEMENT(found, block_index) = curr_size + 1;
        }
    }
    
    return removed_value;
}
#endif /* #ifdef SORTED_INSERT */

#ifdef UNSORTED_INSERT
/*
 * Insert "new_index" into the "indexes" vector and "new_value" into the 
 * "values" vector. Returns the value  that was removed from the "values" 
 * vector, else -1 if nothing was removed from the vector.
 *
 * Parameters:
 *     - block_index: The index of the current vector (row) within the block. 
 *           This indicates the row that will be used to read/write the 
 *           "indexes" and "values" arrays.
 *     - indexes: The index array.
 *     - indexes_rows: The number of vectors contained within the "indexes" 
 *           array.
 *     - indexes_cols: The size of each vector within the "indexes" array.
 *     - values: The value array.
 *     - values_rows: The number of vectors contained within the "values" array.
 *     - values_cols: The size of each vector within the "values" array.
 *     - found: A vector storing the number of initialised entries in the
 *           "indexes" and "values" arrays for each vector.
 *     - found_elements: The number of elements in the "found" vector.
 *     - new_index: The value to be inserted into the "indexes" array.
 *     - new_value: The value to be inserted into the "values" array.
 */
static inline double_t unsorted_insert(const index_t block_index,
                                       uint_t * const ARRAY_SIGNATURE(indexes),
                                       double_t * const ARRAY_SIGNATURE(values),
                                       uint_t * const VECTOR_SIGNATURE(found),
                                       const uint_t new_index, const double_t new_value) {
    /* Error checking. */
    assert(ROWS(indexes) == ROWS(values) && COLS(indexes) == COLS(values));
    assert(ROWS(indexes) == ELEMENTS(found));
    assert(block_index >=1 && block_index <= ROWS(indexes));
    
    index_t insert_index   = 0; /* the index at which the new pair will be inserted */
    double_t removed_value = -1; /* the value that was removed from the values vector */
    const size_t curr_size = VECTOR_ELEMENT(found, block_index);
    
    /*
     * Shuffle array elements from front to back. Elements greater than the new
     * value will be right-shifted by one index in the array.
     *
     * Note that uninitialised values in the array will appear on the left. That
     * is, if the array is incomplete (has a size n < N) then the data in the
     * array is stored in the rightmost n indexes.
     */
    
    if (curr_size < COLS(values)) {
        insert_index  = curr_size + 1;
        removed_value = (double_t) 0;
    } else {
        uint_t max_index = 0;
        double_t max_value;
    
        index_t i;
        for (i = COLS(values); i >= 1; i--) {
            if (max_index == 0 || ARRAY_ELEMENT(values, block_index, i) > max_value) {
                max_index = (uint_t) i;
                max_value = ARRAY_ELEMENT(values, block_index, i);
            }
        }
        
        if (new_value < max_value) {
            insert_index  = max_index;
            removed_value = max_value;
        }
    }

    /*
     * Insert the new pair and increment the current_size of the array (if
     * necessary).
     */
    if (insert_index != 0) {
        ARRAY_ELEMENT(indexes, block_index, insert_index) = new_index;
        ARRAY_ELEMENT(values,  block_index, insert_index) = new_value;
        
        if (curr_size < COLS(values)) {
            VECTOR_ELEMENT(found, block_index) = curr_size + 1;
        }
    }
    
    return removed_value;
}
#endif /* #ifdef UNSORTED_INSERT */

/*
 * Take the top N outliers based on the current outliers (identified by the
 * (outliers, outlier_scores) pairs) and the new outliers from the current block
 * (identified by the (block, scores) pairs).
 *
 * Note that the (outliers, outlier_scores) vectors should already be sorted.
 * The (block, scores) vector need not be sorted.
 *
 * This functions returns the number of initialised elements in the outliers
 * vector.
 *
 * Parameters:
 *     - outliers: A vector containing the indexes of the current outliers.
 *     - outliers_elements: The number of elements contained in the 
 *           "outliers" vector.
 *     - outlier_scores: A vector containing the scores of the current outliers.
 *     - outlier_scores_elements: The number of elements contained in the 
 *           "outlier_scores" vector.
 *     - outliers_size: The number of initialised elements in the "outliers" and
 *           "outlier_scores" vectors.
 *     - current_block: A vector containing the indexes of the vector in the 
 *           current block.
 *     - current_block_elements: The number of elements contained in the 
 *           "current_block" vector.
 *     - scores: A vector containing the outlier scores for each element in the 
 *           current block.
 *     - scores_elements: The number of elements contained in the "scores" 
 *           array.
 */
static inline size_t best_outliers(uint_t * const VECTOR_SIGNATURE(outliers),
                                   double_t * const VECTOR_SIGNATURE(outlier_scores),
                                   const size_t outliers_size,
                                   uint_t * const VECTOR_SIGNATURE(current_block),
                                   double_t * const VECTOR_SIGNATURE(scores)) {
    /* Error checking. */
    assert(ELEMENTS(outliers) == ELEMENTS(outlier_scores));
    assert(ELEMENTS(current_block) == ELEMENTS(scores));
    assert(outliers_size >= 1 && outliers_size <= ELEMENTS(outliers));
    
    /* Sort the (current_block, scores) vectors in descending order of value. */
    sort_vectors_descending(VECTOR_ARGUMENTS(current_block), VECTOR_ARGUMENTS(scores));
    
    /* Create two temporary vectors for the output of the "merge" function. */
    CREATE_REAL_UINT_VECTOR  (temp_index, ELEMENTS(outliers));
    CREATE_REAL_DOUBLE_VECTOR(temp_value, ELEMENTS(outlier_scores));
    
    /* Merge the two vectors. */
    const size_t new_outliers_size = merge(VECTOR_ARGUMENTS(outliers),      VECTOR_ARGUMENTS(outlier_scores), outliers_size,
                                           VECTOR_ARGUMENTS(current_block), VECTOR_ARGUMENTS(scores), ELEMENTS(current_block),
                                           VECTOR_ARGUMENTS(temp_index),    VECTOR_ARGUMENTS(temp_value));
    
    /* Copy values from temporary vectors to real vectors. */
    index_t i;
    for (i = 1; i <= ELEMENTS(outliers); i++) {
        VECTOR_ELEMENT(outliers,       i) = VECTOR_ELEMENT(temp_index, i);
        VECTOR_ELEMENT(outlier_scores, i) = VECTOR_ELEMENT(temp_value, i);
    }
    
    /* Delete temporary vectors. */
    FREE_VECTOR(temp_index);
    FREE_VECTOR(temp_value);

    return new_outliers_size;
}

/*
 * Sort paired vectors in descending order. This function uses bubble sort.
 *
 * Parameters:
 *     - indexes: A vector containing the indexes of the paired vectors.
 *     - indexes_elements: The number of elements contained in the "indexes" 
 *           vector.
 *     - values: A vector containing the values of the paired vectors.
 *     - values_elements: The number of elements contained in the "values" 
 *           vector.
 */
static inline void sort_vectors_descending(uint_t *   const VECTOR_SIGNATURE(indexes),
                                           double_t * const VECTOR_SIGNATURE(values)) {
    /* Error checking. */
    assert(ELEMENTS(indexes) == ELEMENTS(values));
    
    index_t i;
    for (i = 1; i <= ELEMENTS(values); i++) {
    	index_t j;
    	uint_t   ind = VECTOR_ELEMENT(indexes, i);
        double_t val = VECTOR_ELEMENT(values,  i);
        for (j = i - 1; j >= 1; j--) {
            if (VECTOR_ELEMENT(values, j) >= val) {
                break;
            }
            VECTOR_ELEMENT(indexes, j+1) = VECTOR_ELEMENT(indexes, j);
            VECTOR_ELEMENT(values,  j+1) = VECTOR_ELEMENT(values,  j);
        }
        VECTOR_ELEMENT(indexes, j+1) = ind;
        VECTOR_ELEMENT(values,  j+1) = val;
    }
}

/*
 * Merge two sorted vector in descending order. Takes two pairs of vectors and
 * and returns a (sorted) pair of vectors.
 *
 * Parameters:
 *     - indexes1: A vector containing the indexes of the first of the paired 
 *           vectors.
 *     - indexes1_elements: The number of elements contained in the "indexes1" 
 *           vector.
 *     - values1: A vector containing the values of the first of the paired 
 *           vectors.
 *     - values1_elements: The number of elements contained in the "values1" 
 *           vector.
 *     - size1: The number of initialised elements in the "indexes1" and 
 *           "values1" vectors.
 *     - indexes2: A vector containing the indexes of the second of the paired 
 *           vectors.
 *     - indexes2_elements: The number of elements contained in the "indexes2" 
 *           vector.
 *     - values2: A vector containing the values of the second of the paired 
 *           vectors.
 *     - values2_elements: The number of elements contained in the "values2" 
 *           vector.
 *     - size2: The number of initialised elements in the "indexes2" and 
 *           "values2" vectors.
 *     - indexes: The output indexes vector.
 *     - indexes1_elements: The number of elements contained in the "indexes" 
 *           vector.
 *     - values: The output values vector.
 *     - values_elements: The number of elements contained in the "values" 
 *           vector.
 */
static inline size_t merge(uint_t * const VECTOR_SIGNATURE(indexes1), double_t * const VECTOR_SIGNATURE(values1), const size_t size1,
                           uint_t * const VECTOR_SIGNATURE(indexes2), double_t * const VECTOR_SIGNATURE(values2), const size_t size2,
                           uint_t * const VECTOR_SIGNATURE(indexes),  double_t * const VECTOR_SIGNATURE(values)) {
    /* Error checking. */
    assert(ROWS(indexes1) = ROWS(values1) && COLS(indexes1) == COLS(values1));
    assert(ROWS(indexes2) == ROWS(values2) && COLS(indexes2) == COLS(values2));
    assert(ROWS(indexes) == ROWS(values) && COLS(indexes) == COLS(values));
    assert(size1 >= 1 && size1 <= ELEMENTS(indexes1));
    assert(size2 >= 1 && size2 <= ELEMENTS(indexes2));
    
    size_t  output_size = 0;
    index_t iter        = 1; /* iterator through output vector */
    index_t iter1       = 1; /* iterator through vector1 */
    index_t iter2       = 1; /* iterator through vector2 */
    while (iter <= ELEMENTS(values) && (iter1 <= size1 || iter2 <= size2)) {
        if (iter1 > size1 && iter2 <= size2) {
            /* There are no remaining elements remaining in vector1. */
            VECTOR_ELEMENT(indexes, iter) = VECTOR_ELEMENT(indexes2, iter2);
            VECTOR_ELEMENT(values,  iter) = VECTOR_ELEMENT(values2,  iter2);
            iter1++;
            iter2++;
        } else if (iter1 <= size1 && iter2 > size2) {
            /* There are no remaining elements remaining in vector2. */
            VECTOR_ELEMENT(indexes, iter) = VECTOR_ELEMENT(indexes1, iter1);
            VECTOR_ELEMENT(values,  iter) = VECTOR_ELEMENT(values1,  iter1);
            iter1++;
            iter2++;
        } else if (iter1 > size1 && iter2 >size2) {
            /*
             * There are no remaining elements remaining in either vector1 or
             * vector2.
             */
            iter1++;
            iter2++;
        } else if (VECTOR_ELEMENT(values1, iter1) >= VECTOR_ELEMENT(values2, iter2)) {
            VECTOR_ELEMENT(indexes, iter) = VECTOR_ELEMENT(indexes1, iter1);
            VECTOR_ELEMENT(values,  iter) = VECTOR_ELEMENT(values1,  iter1);
            iter1++;
        } else if (VECTOR_ELEMENT(values1, iter1) <= VECTOR_ELEMENT(values2, iter2)) {
            VECTOR_ELEMENT(indexes, iter) = VECTOR_ELEMENT(indexes2, iter2);
            VECTOR_ELEMENT(values,  iter) = VECTOR_ELEMENT(values2,  iter2);
            iter2++;
        }
        
        iter++;
        output_size++;
    }
    
    return output_size;
}

/*
 * Examine a data set and find the top 'N' outliers. Performs operations on the
 * "data" array in 'blocks' of size "block_size".
 *
 * Parameters:
 *     - data: An array consisting of "data_rows" vectors, each of
 *           dimensionality "data_cols".
 *     - data_rows: Number of vectors contained in the "data" array.
 *     - data_cols: Size of each vector contained in the "data" array.
 *     - k: The number of k-nearest neighbours for outlier detection.
 *     - N: The top "N" outliers will be returned by this function.
 *     - block_size: The input "data" array will be processed in blocks of size
 *           "block_size".
 *     - outliers: A vector used to store the top "N" outliers identified by
 *           this function. Each entry in this vector will be an index (to the
 *           "data" array) of the outlying vector.
 *     - outliers_elements: Number of elements contained in the "outliers"
 *            vector.
 *     - outlier_scores: A vector used to score the score associated with
 *           each of the outliers stored in the "outliers" array.
 *     - outlier_scores_elements: Number of elements contained in the
 *          "outlier_scores" vector.
 */
void top_n_outlier_pruning_block(const double_t * const ARRAY_SIGNATURE(data),
                                 const size_t k, const size_t N, size_t block_size,
                                 uint_t * VECTOR_SIGNATURE(outliers),
                                 double_t * VECTOR_SIGNATURE(outlier_scores)) {
    /* Error checking. */
    assert(data != NULL);
    assert(outliers != NULL);
    assert(outlier_scores != NULL);
    assert(ELEMENTS(outliers) == ELEMENTS(outlier_scores));
    assert(ELEMENTS(outliers) == N);
    assert(ROWS(data) >= N);
    assert(ROWS(data) >= k);
    
#ifdef NO_BLOCKING
    block_size = 1;
#endif /* #ifdef NO_BLOCKING */
    
    double_t cutoff = 0;        /* vectors with a score less than the cutoff will be removed from the block */
    size_t   outliers_size = 0; /* the number of initialised elements in the outliers array */
    index_t  block_begin;       /* the index of the first vector in the block currently being processed */
    size_t   actual_block_size; /* actual_block_size may be smaller than block_size if "ROWS(data) mod block_size != 0" */
    
    for (block_begin = 1; block_begin <= ROWS(data); block_begin += actual_block_size) { /* while there are still blocks to process */
        const index_t block_end = MIN(block_begin+block_size-1, ROWS(data)); /* the index of the last vector in the block */
        actual_block_size = block_end-block_begin+1; /* the number of vectors in the current block */
        
        CREATE_REAL_UINT_VECTOR(current_block, actual_block_size);
        index_t i;
        for (i = 1; i <= ELEMENTS(current_block); i++) {
            VECTOR_ELEMENT(current_block, i) = (uint_t) (block_begin + (i-1));
        }
        
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
            index_t block_index;
            for (block_index = 1; block_index <= actual_block_size; block_index++) {
                const index_t vector2 = (index_t) VECTOR_ELEMENT(current_block, block_index);
                
                if (vector1 != vector2 && vector2 != 0) {
                    /*
                     * Calculate the square of the distance between the two
                     * vectors (indexed by "vector1" and "vector2")
                     */
                    const double_t dist_squared = distance_squared(ARRAY_ARGUMENTS(data), vector1, vector2);
                    
                    /*
                     * Insert the new (index, distance) pair into the neighbours
                     * array for the current vector.
                     */
#ifdef SORTED_INSERT
                    const double_t removed_distance = sorted_insert(block_index, ARRAY_ARGUMENTS(neighbours), ARRAY_ARGUMENTS(neighbours_dist), VECTOR_ARGUMENTS(found), vector1, dist_squared);
#endif /* #ifdef SORTED_INSERT */
#ifdef UNSORTED_INSERT
                    const double_t removed_distance = unsorted_insert(block_index, ARRAY_ARGUMENTS(neighbours), ARRAY_ARGUMENTS(neighbours_dist), VECTOR_ARGUMENTS(found), vector1, dist_squared);
#endif /* #ifdef UNSORTED_INSERT */
                    
                    /*
                     * Update the score (if the neighbours array was changed).
                     */
                    if (removed_distance >= 0) {
                        VECTOR_ELEMENT(score, block_index) = (double_t) ((VECTOR_ELEMENT(score, block_index) * k - removed_distance + dist_squared) / k);
                    }
                    
                    /*
                     * If the score for this vector is less than the cutoff,
                     * then prune this vector from the block.
                     */
                    if (VECTOR_ELEMENT(found, block_index) >= (uint_t) k && VECTOR_ELEMENT(score, block_index) < cutoff) {
                        VECTOR_ELEMENT(current_block, block_index) = (uint_t)   0;
                        VECTOR_ELEMENT(score,         block_index) = (double_t) 0;
                    }
                }
            }
        }
        
        /* Keep track of the top "N" outliers. */
        outliers_size = best_outliers(VECTOR_ARGUMENTS(outliers), VECTOR_ARGUMENTS(outlier_scores), outliers_size,
                                      VECTOR_ARGUMENTS(current_block), VECTOR_ARGUMENTS(score));
        
        /*
         * Set "cutoff" to the score of the weakest outlier. There is no need to
         * store an outlier in future iterations if its score is better than the
         * cutoff.
         */
        cutoff = VECTOR_ELEMENT(outlier_scores, N);
        
        /* Free memory. */
        FREE_ARRAY(neighbours);
        FREE_ARRAY(neighbours_dist);
        FREE_VECTOR(current_block);
        FREE_VECTOR(score);
        FREE_VECTOR(found);
    }
}
