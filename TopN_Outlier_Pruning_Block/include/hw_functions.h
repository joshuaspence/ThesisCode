#ifndef HW_FUNCTIONS_H_
#define HW_FUNCTIONS_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "top_n_outlier_pruning_block.h" /* for N_VALUE */
#include "utility.h" /* for __BEGIN_DECLS, __END_DECLS */
/*----------------------------------------------------------------------------*/

__BEGIN_DECLS

/*
 * The hardware implementation of the `top_n_outlier_pruning_block` function.
 */
unsigned int top_n_outlier_pruning_block_hw(
    const size_t _num_vectors,
    const size_t _vector_dims,
    const double _data[],
    const size_t _k,
    const size_t _N,
    const size_t _block_size,
    unsigned int _outliers[N_VALUE],
    double _outlier_scores[N_VALUE]
    );

__END_DECLS

#endif /* #ifndef HW_FUNCTIONS_H_ */