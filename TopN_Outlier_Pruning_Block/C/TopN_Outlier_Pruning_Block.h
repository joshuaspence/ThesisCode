#ifndef TOPN_OUTLIER_PRUNING_BLOCK_H_
#define TOPN_OUTLIER_PRUNING_BLOCK_H_

#include "macros.h"

void top_n_outlier_pruning_block(const double_t * const ARRAY_SIGNATURE(data),
                                 const size_t k, const size_t N, const size_t block_size,
                                 uint_t * VECTOR_SIGNATURE(outliers),
                                 double_t * VECTOR_SIGNATURE(outlier_scores));

#endif /* #ifndef TOPN_OUTLIER_PRUNING_BLOCK_H_ */
