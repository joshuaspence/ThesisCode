/******************************************************************************/
/* Includes                                                                   */
/******************************************************************************/
#include <assert.h>
#include <limits.h>
#include <mex.h>
#include "macros.h"
#include "top_n_outlier_pruning_block.h"
/******************************************************************************/

/* Forward declarations */
static inline double_t sorted_insert(
    const index_t block_index,
    uint_t * const ARRAY_SIGNATURE(index_array),
    double_t * const ARRAY_SIGNATURE(value_array),
    uint_t * const VECTOR_SIGNATURE(found),
    const uint_t new_index, const double_t new_value);
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
static inline double_t distance_squared(
    const double * const ARRAY_SIGNATURE(vectors),
    const index_t vector1,
    const index_t vector2);

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
        const double_t val = ARRAY_ELEMENT(vectors, vector1, col) - ARRAY_ELEMENT(vectors, vector2, col);
        const double_t val_squared = val * val;
        sum_of_squares += val_squared;
    }

    return sum_of_squares;
}

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
static inline double_t sorted_insert(const index_t block_index,
                              uint_t * const ARRAY_SIGNATURE(index_array),
                              double_t * const ARRAY_SIGNATURE(value_array),
                              uint_t * const VECTOR_SIGNATURE(found),
                              const uint_t new_index, const double_t new_value) {
    /* Error checking. */
    assert(ROWS(index_array) == ROWS(value_array) && COLS(index_array) == COLS(value_array));
    assert(ROWS(index_array) == ELEMENTS(found));
    assert(block_index >=1 && block_index <= ROWS(index_array));

    index_t index = 0; /* the index at which the new pair will be inserted */
    double_t removed_value = -1; /* the value that was removed from the value_array */
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
            if (new_value > ARRAY_ELEMENT(value_array, block_index, i) || (i == (index_t) (COLS(value_array) - curr_size))) {
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
static inline size_t best_outliers(uint_t * const VECTOR_SIGNATURE(outliers),
                            double_t * const VECTOR_SIGNATURE(outlier_scores),
                            const size_t outliers_size,
                            uint_t * const VECTOR_SIGNATURE(current_block),
                            double_t * const VECTOR_SIGNATURE(scores)) {
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
    const size_t new_outliers_size = merge(VECTOR_ARGUMENTS(outliers), VECTOR_ARGUMENTS(outlier_scores), outliers_size,
                                           VECTOR_ARGUMENTS(current_block), VECTOR_ARGUMENTS(scores), ELEMENTS(current_block),
                                           VECTOR_ARGUMENTS(temp_index), VECTOR_ARGUMENTS(temp_value));

    /* Copy values from temporary vectors to real vectors. */
    index_t i;
    for (i = 1; i <= ELEMENTS(outliers); i++) {
        VECTOR_ELEMENT(outliers,       i) = VECTOR_ELEMENT(temp_index, i);
        VECTOR_ELEMENT(outlier_scores, i) = VECTOR_ELEMENT(temp_value, i);
    }

    /* Delete temporary vector. */
    FREE_VECTOR(temp_index);
    FREE_VECTOR(temp_value);

    return new_outliers_size;
}

/*
 * TODO
 */
static inline void sort_vectors_descending(uint_t *   const VECTOR_SIGNATURE(index),
                                    double_t * const VECTOR_SIGNATURE(value)) {
    /* Error checking. */
    assert(ELEMENTS(index) == ELEMENTS(value));

    index_t i;
    for (i = 1; i <= ELEMENTS(value); i++) {
    	index_t j;
    	uint_t   ind = VECTOR_ELEMENT(index, i);
        double_t val = VECTOR_ELEMENT(value, i);
        for (j = i - 1; j >= 1; j--) {
            if (VECTOR_ELEMENT(value, j) >= val) {
                break;
            }
            VECTOR_ELEMENT(index, j+1) = VECTOR_ELEMENT(index, j);
            VECTOR_ELEMENT(value, j+1) = VECTOR_ELEMENT(value, j);
        }
        VECTOR_ELEMENT(index, j+1) = ind;
        VECTOR_ELEMENT(value, j+1) = val;
    }
}

/*
 * Merge two sorted arrays in descending order. Takes two pairs of 1xN arrays
 * and returns a pair of 1xN arrays.
 *
 * TODO
 */
static inline size_t merge(uint_t * const VECTOR_SIGNATURE(index1), double_t * const VECTOR_SIGNATURE(value1), const size_t size1,
                    uint_t * const VECTOR_SIGNATURE(index2), double_t * const VECTOR_SIGNATURE(value2), const size_t size2,
                    uint_t * const VECTOR_SIGNATURE(index),  double_t * const VECTOR_SIGNATURE(value)) {
    /* Error checking. */
    assert(ROWS(index1) = ROWS(value1) && COLS(index1) == COLS(value1));
    assert(ROWS(index2) == ROWS(value2) && COLS(index2) == COLS(value2));
    assert(ROWS(index) == ROWS(value) && COLS(index) == COLS(value));
    assert(size1 >= 1 && size1 <= ELEMENTS(index1));
    assert(size2 >= 1 && size2 <= ELEMENTS(index2));

    size_t  output_size = 0;
    index_t iter        = 1; /* iterator through output vector */
    index_t iter1       = 1; /* iterator through vector1 */
    index_t iter2       = 1; /* iterator through vector2 */
    while (iter <= ELEMENTS(value) && (iter1 <= size1 || iter2 <= size2)) {
        if (iter1 > size1 && iter2 <= size2) {
            /* There are no remaining elements remaining in vector1. */
            VECTOR_ELEMENT(index, iter) = VECTOR_ELEMENT(index2, iter2);
            VECTOR_ELEMENT(value, iter) = VECTOR_ELEMENT(value2, iter2);
            iter1++;
            iter2++;
        } else if (iter1 <= size1 && iter2 > size2) {
            /* There are no remaining elements remaining in vector2. */
            VECTOR_ELEMENT(index, iter) = VECTOR_ELEMENT(index1, iter1);
            VECTOR_ELEMENT(value, iter) = VECTOR_ELEMENT(value1, iter1);
            iter1++;
            iter2++;
        } else if (iter1 > size1 && iter2 >size2) {
            /*
             * There are no remaining elements remaining in either vector1 or
             * vector2.
             */
            iter1++;
            iter2++;
        } else if (VECTOR_ELEMENT(value1, iter1) >= VECTOR_ELEMENT(value2, iter2)) {
            VECTOR_ELEMENT(index, iter) = VECTOR_ELEMENT(index1, iter1);
            VECTOR_ELEMENT(value, iter) = VECTOR_ELEMENT(value1, iter1);
            iter1++;
        } else if (VECTOR_ELEMENT(value1, iter1) <= VECTOR_ELEMENT(value2, iter2)) {
            VECTOR_ELEMENT(index, iter) = VECTOR_ELEMENT(index2, iter2);
            VECTOR_ELEMENT(value, iter) = VECTOR_ELEMENT(value2, iter2);
            iter2++;
        }

        iter++;
        output_size++;
    }

    return output_size;
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
void top_n_outlier_pruning_block(const double_t * const ARRAY_SIGNATURE(data),
                                 const size_t k, const size_t N, const size_t block_size,
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
                    const double_t removed_distance = sorted_insert(block_index, ARRAY_ARGUMENTS(neighbours), ARRAY_ARGUMENTS(neighbours_dist), VECTOR_ARGUMENTS(found), vector1, dist_squared);

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
                    if (VECTOR_ELEMENT(found, block_index) >= (uint_t) k && VECTOR_ELEMENT(score, block_index) < (cutoff - DBL_EPSILON)) {
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
