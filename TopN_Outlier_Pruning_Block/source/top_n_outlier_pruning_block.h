#ifndef TOP_N_OUTLIER_PRUNING_BLOCK_H_
#define TOP_N_OUTLIER_PRUNING_BLOCK_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "utility.h" /* for double_t, index_t, UNUSED */
#include <stddef.h> /* for size_t */
/*----------------------------------------------------------------------------*/

#ifdef __AUTOESL__
void top_n_outlier_pruning_block(int * dummy);
#else
void top_n_outlier_pruning_block(
    const size_t num_vectors,
    const size_t vector_dims,
    const double_t (* const data)[num_vectors][vector_dims],
    const size_t k,
    const size_t N,
    const UNUSED size_t default_block_size,
    index_t (* const outliers)[N],
    double_t (* const outlier_scores)[N]
    );
#endif /* #ifdef __AUTOESL__ */

#endif /* #ifndef TOP_N_OUTLIER_PRUNING_BLOCK_H_ */
