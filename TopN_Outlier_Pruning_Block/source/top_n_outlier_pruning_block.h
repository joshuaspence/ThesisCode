#ifndef TOP_N_OUTLIER_PRUNING_BLOCK_H_
#define TOP_N_OUTLIER_PRUNING_BLOCK_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */

#include "utility.h" /* for double_t, double_in_t, double_out_t, index_out_t, size_t, size_in_t, uint_out_t */
/*----------------------------------------------------------------------------*/

#ifndef HARDCODED_NUM_VECTORS
extern size_t num_vectors_value;
void set_num_vectors(const size_in_t num_vectors);
#else
    #define num_vectors_value   (HARDCODED_NUM_VECTORS)
#endif /* #ifndef HARDCODED_NUM_VECTORS */

#ifndef HARDCODED_VECTOR_DIMS
extern size_t vector_dims_value;
void set_vector_dims(const size_in_t vector_dims);
#else
    #define vector_dims_value   (HARDCODED_VECTOR_DIMS)
#endif /* #ifndef HARDCODED_VECTOR_DIMS */

#ifndef HARDCODED_K
extern size_t k_value;
void set_k(const size_in_t k);
#else
    #define k_value             (HARDCODED_K)
#endif /* #ifndef HARDCODED_K */

#ifndef HARDCODED_N
extern size_t N_value;
void set_N(const size_in_t N);
#else
    #define N_value             (HARDCODED_N)
#endif /* #ifndef HARDCODED_N */

#ifdef BLOCKING
#ifndef HARDCODED_BLOCK_SIZE
extern size_t block_size_value;
void set_block_size(const size_in_t block_size);
#else
    #define block_size_value    (HARDCODED_BLOCK_SIZE)
#endif /* #ifndef HARDCODED_BLOCK_SIZE */
#endif /* #ifdef BLOCKING */

uint_out_t top_n_outlier_pruning_block(
    const double_in_t data[MAX_NUM_VECTORS(num_vectors_value)][vector_dims_value],
    index_out_t outliers[N_value],
    double_out_t outlier_scores[N_value]
    );
#endif /* #ifndef TOP_N_OUTLIER_PRUNING_BLOCK_H_ */
