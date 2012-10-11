/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */

#include "parameters.h" /* main include file */
#include "utility.h" /* for UNUSED, size_t */
/*----------------------------------------------------------------------------*/

#ifndef HARDCODED_NUM_VECTORS
size_t num_vectors_value = 0;
void set_num_vectors(const size_t num_vectors) {
#ifdef MAX_NUM_VECTORS
    ASSERT(num_vectors <= MAX_NUM_VECTORS);
#endif /* #ifdef MAX_NUM_VECTORS */
    num_vectors_value = num_vectors;
}
#endif /* #ifndef HARDCODED_NUM_VECTORS */

#ifndef HARDCODED_VECTOR_DIMS
size_t vector_dims_value = 0;
void set_vector_dims(const size_t vector_dims) {
    vector_dims_value = vector_dims;
}
#endif /* #ifndef HARDCODED_VECTOR_DIMS */

#ifndef HARDCODED_K
size_t k_value = 0;
void set_k(const size_t k) {
    k_value = k;
}
#endif /* #ifndef HARDCODED_K */

#ifndef HARDCODED_N
size_t N_value = 0;
void set_N(const size_t N) {
    N_value = N;
}
#endif /* #ifndef HARDCODED_N */

#if (BLOCKING==ENABLED)
#ifndef HARDCODED_BLOCK_SIZE
size_t block_size_value = 0;
void set_block_size(const size_t block_size) {
    block_size_value = block_size;
}
#endif /* #ifndef HARDCODED_BLOCK_SIZE */
#endif /* #if (BLOCKING==ENABLED) */
