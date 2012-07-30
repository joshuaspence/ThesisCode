#ifndef TOPN_OUTLIER_PRUNING_BLOCK_H_
#define TOPN_OUTLIER_PRUNING_BLOCK_H_

#include "macros.h" /* for ARRAY_SIGNATURE, VECTOR_SIGNATURE */

void top_n_outlier_pruning_block(const double * const ARRAY_SIGNATURE(data),
                                 const unsigned int k, const unsigned int N, const unsigned int block_size, 
                                 unsigned int * VECTOR_SIGNATURE(outliers), 
                                 double * VECTOR_SIGNATURE(outlier_scores));
                                 
#endif /* #ifndef TOPN_OUTLIER_PRUNING_BLOCK_H_ */
