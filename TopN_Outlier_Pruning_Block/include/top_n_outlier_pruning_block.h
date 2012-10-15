#ifndef TOP_N_OUTLIER_PRUNING_BLOCK_H_
#define TOP_N_OUTLIER_PRUNING_BLOCK_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */

#include "utility.h" /* for __BEGIN_DECLS, __END_DECLS, double_t, index_t, size_t, uint_t */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Parameters                                                                 */
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
/* Constants                                                                  */
/*============================================================================*/
extern const size_t max_num_vectors;
extern const size_t vector_dims;
extern const size_t k;
extern const size_t N;
extern const size_t block_size;
/*----------------------------------------------------------------------------*/

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
    const size_t _num_vectors,
    const size_t _vector_dims,
    const double_t _data[],
    const size_t _k,
    const size_t _N,
    const size_t _block_size,
    index_t _outliers[N_VALUE],
    double_t _outlier_scores[N_VALUE]
    );

__END_DECLS

#endif /* #ifndef TOP_N_OUTLIER_PRUNING_BLOCK_H_ */
