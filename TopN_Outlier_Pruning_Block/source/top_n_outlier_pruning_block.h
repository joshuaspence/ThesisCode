#ifndef TOP_N_OUTLIER_PRUNING_BLOCK_H_
#define TOP_N_OUTLIER_PRUNING_BLOCK_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "utility.h" /* for double_t, index_t */
#include <stddef.h> /* for size_t */
/*----------------------------------------------------------------------------*/

/*
 * Set the number of k-nearest neighbours to use for outlier detection.
 *
 * Parameters:
 *     - k: The number of k-nearest neighbours for outlier detection.
 */
#ifndef HARDCODED_K
extern size_t k_value;
void set_k(const size_t k);
#else
    #define k_value             (HARDCODED_K)
#endif /* #ifndef HARDCODED_K */

/*
 * Set the top number of outliers to be returned by the
 * top_n_outlier_pruning_block function.
 *
 * Parameters:
 *     - N: The top N outliers will be returned by this function.
 */
#ifndef HARDCODED_N
extern size_t N_value;
void set_N(const size_t N);
#else
    #define N_value             (HARDCODED_N)
#endif /* #ifndef HARDCODED_N */

/*
 * Set the block size with which to processed the input data array.
 *
 * Parameters:
 *     - block_size: The input data array will be processed in blocks of this 
 *       size.
 */
#ifndef HARDCODED_BLOCK_SIZE
extern size_t block_size_value;
void set_block_size(const size_t block_size);
#else
    #define block_size_value    (HARDCODED_BLOCK_SIZE)
#endif /* #ifndef HARDCODED_BLOCK_SIZE */

void top_n_outlier_pruning_block(
    const size_t num_vectors,
    const size_t vector_dims,
    const double_t data[ARRAYSIZE_NUM_VECTORS(num_vectors)][ARRAYSIZE_VECTOR_DIMS(vector_dims)],
    index_t outliers[N_value],
    double_t outlier_scores[N_value]
    );

#endif /* #ifndef TOP_N_OUTLIER_PRUNING_BLOCK_H_ */
