#ifndef TOP_N_OUTLIER_PRUNING_BLOCK_H_
#define TOP_N_OUTLIER_PRUNING_BLOCK_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "utility.h" /* for double_t, index_t, UNUSED */
#include <stddef.h> /* for size_t */
/*----------------------------------------------------------------------------*/

void top_n_outlier_pruning_block(
    const size_t num_vectors,
    const size_t vector_dims,
    const double_t data[ARRAYSIZE_NUM_VECTORS(num_vectors)][ARRAYSIZE_VECTOR_DIMS(vector_dims)],
    const size_t k,
    const size_t N,
    const UNUSED size_t default_block_size,
    index_t outliers[ARRAYSIZE_N(N)],
    double_t outlier_scores[ARRAYSIZE_N(N)]
    );

#endif /* #ifndef TOP_N_OUTLIER_PRUNING_BLOCK_H_ */
