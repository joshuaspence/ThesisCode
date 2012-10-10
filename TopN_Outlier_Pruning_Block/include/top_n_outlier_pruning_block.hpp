#ifndef TOP_N_OUTLIER_PRUNING_BLOCK_HPP_
#define TOP_N_OUTLIER_PRUNING_BLOCK_HPP_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.hpp" /* check for invalid preprocessor macro combinations */
#include "arch.hpp" /* set architecture specific macros */

#include "parameters.hpp" /* for block_size_value, k_value, N_value */
#include "utility.hpp" /* for __BEGIN_DECLS, __END_DECLS, double_t, index_t, size_t, uint_t */
/*----------------------------------------------------------------------------*/

__BEGIN_DECLS

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
double_t add_neighbour(
    index_t neighbours[k_value],
    double_t neighbours_dist[k_value],
    uint_t & found,
    const index_t new_neighbour,
    const double_t new_neighbour_dist
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
    size_t & outliers_size,
    index_t outliers[N_value],
    double_t outlier_scores[N_value],
#if (BLOCKING==ENABLED)
    const size_t block_size,
    const index_t current_block[block_size_value],
    const double_t scores[block_size_value]
#elif (BLOCKING==DISABLED)
    const index_t vector,
    const double_t score
#endif /* #if (BLOCKING==ENABLED) */
    );

#if (BLOCKING==ENABLED)
/*
 * Sort paired vectors in descending order. This function uses bubble sort.
 *
 * Parameters:
 *     - block_size: The number of elements in the indexes and values arrays.
 *     - indexes: A vector containing the indexes of the paired vectors.
 *     - values: A vector containing the values of the paired vectors.
 */
void sort_block_scores_descending(
    const size_t block_size,
    index_t indexes[block_size_value],
    double_t values[block_size_value]
    );
#endif /* #if (BLOCKING==ENABLED) */

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
    const size_t global_outliers_size,
    const index_t global_outliers[N_value],
    const double_t global_outlier_scores[N_value],
#if (BLOCKING==ENABLED)
    const size_t block_size,
    const index_t local_outliers[block_size_value],
    const double_t local_outlier_scores[block_size_value],
#elif (BLOCKING==DISABLED)
    const index_t local_outlier,
    const double_t local_outlier_score,
#endif /* #if (BLOCKING==ENABLED) */
    size_t & new_outliers_size,
    index_t new_outliers[N_value],
    double_t new_outlier_scores[N_value]
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
uint_t top_n_outlier_pruning_block(
    const size_t num_vectors,
    const size_t vector_dims,
    const double_t data[],
    const size_t k,
    const size_t N,
    const size_t block_size,
    index_t outliers[N_value],
    double_t outlier_scores[N_value]
    );

__END_DECLS

#endif /* #ifndef TOP_N_OUTLIER_PRUNING_BLOCK_H_ */
