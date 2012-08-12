#ifndef TOP_N_OUTLIER_PRUNING_BLOCK_H_
#define TOP_N_OUTLIER_PRUNING_BLOCK_H_

#include <stddef.h> /* for size_t */
#include "macros.h" /* for double_t, index_t */

void top_n_outlier_pruning_block(
    const size_t num_vectors,
    const size_t vector_dims,
    const double_t (* const data)[num_vectors][vector_dims],
    const size_t k,
    const size_t N,
    const size_t default_block_size,
    index_t (*outliers)[N],
    double_t (*outlier_scores)[N]
    );

#endif /* #ifndef TOP_N_OUTLIER_PRUNING_BLOCK_H_ */
