#ifndef TOP_N_OUTLIER_PRUNING_BLOCK_H_
#define TOP_N_OUTLIER_PRUNING_BLOCK_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "utility.h" /* for __BEGIN_DECLS, __END_DECLS */
#include <stddef.h> /* for size_t */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Hardcoded parameters                                                       */
/*============================================================================*/
#ifndef MAX_NUM_VECTORS
    #define MAX_NUM_VECTORS (67557)
#endif /* #ifndef NUM_VECTORS */

#ifndef VECTOR_DIMS
    #define VECTOR_DIMS     (200)
#endif /* #ifndef VECTOR_DIMS */

#ifndef K_VALUE
    #define K_VALUE         (15)
#endif /* #ifndef K_VALUE */

#ifndef N_VALUE
    #define N_VALUE         (40)
#endif /* #ifndef N_VALUE*/

#ifndef BLOCK_SIZE
    #define BLOCK_SIZE      (40)
#endif /* #ifndef BLOCK_SIZE */
/*----------------------------------------------------------------------------*/

__BEGIN_DECLS

/*============================================================================*/
/* Function handles                                                           */
/*============================================================================*/

/*
 * Set the "outer" vector. This vector will be used for multiple distance
 * computations.
 *
 * Parameters:
 *     - vector: An array of floating point numbers representing the vector.
 */
typedef void (* set_outer_vector_func)(const double vector[VECTOR_DIMS]);

/*
 * Calculate the square of the Euclidean distance between two the outer vector
 * and the inner vector (i.e. the sum of the squares of the distance in each
 * dimension).
 *
 * Parameters:
 *     - inner_vector: An array of floating point numbers representing the inner
 *           vector.
 *
 * Return value:
 *     The square of the distance between the outer vector and the inner vector.
 */
typedef double (* distance_squared_func)(const double inner_vector[VECTOR_DIMS]);
/*----------------------------------------------------------------------------*/

/*
 * Examine a data set and find the top N outliers. Performs operations on the
 * data array in blocks of size block_size.
 *
 * Parameters:
 *     - _num_vectors: The number of vectors in the _data array.
 *     - _vector_dims: The dimensionality of each vector in the _data array.
 *     - _data: The input data set.
 *     - _k: The number of nearest neighbours to consider.
 *     - _N: The number of outliers to return.
 *     - _block_size: The block size.
 *     - _outliers: A vector used to store the top N outliers identified by this
 *           function. Each entry in this vector will be an index (to the data
 *           array) of the outlying vector.
 *     - _outlier_scores: A vector used to score the score associated with
 *           each of the outliers stored in the outliers array.
 *     - _set_outer_vector_f: A pointer to the function used to set the outer
 *           vector.
 *     - _distance_squared_f: A pointer to the function used to calculate the
 *           square of the distance between two vectors.
 *
 * Return:
 *     The number of vectors pruned whilst executing this algorithm.
 */
unsigned int top_n_outlier_pruning_block(
    const size_t _num_vectors,
    const size_t _vector_dims,
    const double _data[],
    const size_t _k,
    const size_t _N,
    const size_t _block_size,
    unsigned int _outliers[N_VALUE],
    double _outlier_scores[N_VALUE],
    set_outer_vector_func _set_outer_vector_f,
    distance_squared_func _distance_squared_f
    );

__END_DECLS

#endif /* #ifndef TOP_N_OUTLIER_PRUNING_BLOCK_H_ */