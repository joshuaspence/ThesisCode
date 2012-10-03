#ifndef TOP_N_OUTLIER_PRUNING_BLOCK_H_
#define TOP_N_OUTLIER_PRUNING_BLOCK_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */

#include "utility.h" /* for __BEGIN_DECLS, __END_DECLS, double_t, double_in_t, double_out_t, index_out_t, size_t, size_in_t, uint_out_t */
/*----------------------------------------------------------------------------*/

__BEGIN_DECLS

#ifndef HARDCODED_NUM_VECTORS
extern size_t num_vectors_value;

/*
 * Set the number of vectors in the input data set.
 *
 * Parameters:
 *     - num_vectors: The number of vectors in the input data set.
 */
void set_num_vectors(const size_in_t num_vectors);
#else
    #define num_vectors_value   (HARDCODED_NUM_VECTORS)
#endif /* #ifndef HARDCODED_NUM_VECTORS */

#ifndef HARDCODED_VECTOR_DIMS
extern size_t vector_dims_value;

/*
 * Set the number of dimensions of the vectors in the input data set.
 *
 * Parameters:
 *     - vector_dims: The number of dimensions of the vectors in the input data 
 *                    set.
 */
void set_vector_dims(const size_in_t vector_dims);
#else
    #define vector_dims_value   (HARDCODED_VECTOR_DIMS)
#endif /* #ifndef HARDCODED_VECTOR_DIMS */

#ifndef HARDCODED_K
extern size_t k_value;

/*
 * Set the number of k-nearest neighbours to use for outlier detection.
 *
 * Parameters:
 *     - k: The number of k-nearest neighbours for outlier detection.
 */
void set_k(const size_in_t k);
#else
    #define k_value             (HARDCODED_K)
#endif /* #ifndef HARDCODED_K */

#ifndef HARDCODED_N
extern size_t N_value;

/*
 * Set the top number of outliers to be returned by the
 * top_n_outlier_pruning_block function.
 *
 * Parameters:
 *     - N: The top N outliers will be returned by this function.
 */
void set_N(const size_in_t N);
#else
    #define N_value             (HARDCODED_N)
#endif /* #ifndef HARDCODED_N */

#ifdef BLOCKING
#ifndef HARDCODED_BLOCK_SIZE
extern size_t block_size_value;

/*
 * Set the block size with which to processed the input data array.
 *
 * Parameters:
 *     - block_size: The input data array will be processed in blocks of this 
 *       size.
 */
void set_block_size(const size_in_t block_size);
#else
    #define block_size_value    (HARDCODED_BLOCK_SIZE)
#endif /* #ifndef HARDCODED_BLOCK_SIZE */
#endif /* #ifdef BLOCKING */

/*
 * Calculate the square of the Euclidean distance between two vectors (i.e. the
 * sum of the squares of the distance in each dimension).
 *
 * Parameters:
 *     - vector1: An array of floating point numbers representing the first
 *           vector.
 *     - vector2: An array of floating point numbers representing the second
 *           vector.
 *
 * Return:
 *    The square of the distance between the two vectors.
 */
void distance_squared(
    const double_in_t vector1[vector_dims_value],
    const double_in_t vector2[vector_dims_value],
    double_out_t * const sum
    );

/*
 * Insert a neighbouring vector into the k nearest neighbours array for a
 * particular vector. Returns the distance value that was removed from the
 * "neighbours_dist" vector, else -1 if no vector was removed.
 *
 * Parameters:
 *     - neighbours: The k nearest neighbours for the current vector.
 *     - neighbours_dist: The distances to the k nearest neighbours for the
 *           current vector.
 *     - found: The number of initialised entries in the neighbours and
 *           neighbours_dist arrays.
 *     - new_neighbour: The new value to be inserted into the neighbours array.
 *     - new_neighbour_dist: The new value to be inserted into the 
 *           neighbours_dist array.
 */
double_out_t add_neighbour(
    index_io_t neighbours[k_value],
    double_io_t neighbours_dist[k_value],
    uint_t * const found,
    const index_in_t new_neighbour,
    const double_in_t new_neighbour_dist
    );

/*
 * Take the top N outliers based on the global outliers (identified by the
 * (outliers, outlier_scores) pairs) and the new outliers from the current block
 * (identified by the (current_block, scores) pairs).
 *
 * Note that the (outliers, outlier_scores) vectors should already be sorted.
 * The (current_block, scores) vector need not be sorted.
 *
 * Parameters:
 *     - outliers_size: The number of initialised entries in the outliers and
 *           outlier_scores arrays.
 *     - outliers: A vector containing the indexes of the current global
 *           outliers.
 *     - outlier_scores: A vector containing the scores of the current global
 *           outliers.
 *     - block_size: The number of vectors in the current block.
 *     - current_block: An array containing the indexes of the vectors in the
             current block.
 *     - scores: A vector containing the outlier scores for each element in the
 *           current block.
 */
void best_outliers(
    size_io_t * const outliers_size,
    index_io_t outliers[N_value],
    double_io_t outlier_scores[N_value],
#if defined(BLOCKING)
    const size_in_t block_size,
    const index_in_t current_block[block_size_value],
    const double_in_t scores[block_size_value]
#elif defined(NO_BLOCKING)
    const index_in_t vector,
    const double_in_t score
#endif /* #if defined(BLOCKING) */
    );

#ifdef BLOCKING
/*
 * Sort paired vectors in descending order. This function uses bubble sort.
 *
 * Parameters:
 *     - block_size: The number of elements in the indexes and values arrays.
 *     - indexes: A vector containing the indexes of the paired vectors.
 *     - values: A vector containing the values of the paired vectors.
 */
void sort_block_scores_descending(
    const size_in_t block_size,
    index_io_t indexes[block_size_value],
    double_io_t values[block_size_value]
    );
#endif /* #ifdef BLOCKING */

/*
 * Merge two sorted vector in descending order. Takes two pairs of vectors and
 * and returns a (sorted) pair of vectors.
 *
 * Parameters:
 *     - global_outliers_size: The number of initialised elements in the 
 *           current_outliers and current_outlier_scores arrays.
 *     - global_outliers: The indexes of the current global outliers.
 *     - global_outlier_scores: The sccores associated with the current global
 *           outliers.
 *     - block_size: The size of the current block.
 *     - local_outliers: The indexes of the outliers determined from the current
 *           block.
 *     - local_outlier_scores: The scores associated with the local outliers.
 *     - new_outliers_size: The size of the resultant merged outliers array.
 *     - new_outliers: The resultant merged outliers array.
 *     - new_outlier_scores: The scores associated with the resultant merged 
 *           outliers array.
 */
void merge(
    const size_in_t global_outliers_size,
    const index_in_t global_outliers[N_value],
    const double_in_t global_outlier_scores[N_value],
#if defined(BLOCKING)
    const size_in_t block_size,
    const index_in_t local_outliers[block_size_value],
    const double_in_t local_outlier_scores[block_size_value],
#elif defined(NO_BLOCKING)
    const index_in_t local_outlier,
    const double_in_t local_outlier_score,
#endif /* #if defined(BLOCKING) */
    size_out_t * const new_outliers_size,
    index_out_t new_outliers[N_value],
    double_out_t new_outlier_scores[N_value]
    );

/*
 * Examine a data set and find the top N outliers. Performs operations on the
 * data array in blocks of size block_size.
 *
 * NOTE: Unless using hardcoded values for k, N and block_size, these variables
 * should be set prior to calling this function, using the set_k(), set_N() and
 * set_block_size functions(), respectively.
 *
 * Parameters:
 *     - data: The input data set.
 *     - outliers: A vector used to store the top N outliers identified by this
 *           function. Each entry in this vector will be an index (to the data
 *           array) of the outlying vector.
 *     - outlier_scores: A vector used to score the score associated with
 *           each of the outliers stored in the outliers array.
 *
 * Return:
 *     The number of vectors pruned whilst executing this algorithm.
 */
uint_out_t top_n_outlier_pruning_block(
    const double_in_t data[MAX_NUM_VECTORS(num_vectors_value)][vector_dims_value],
    index_out_t outliers[N_value],
    double_out_t outlier_scores[N_value]
    );

__END_DECLS

#endif /* #ifndef TOP_N_OUTLIER_PRUNING_BLOCK_H_ */
