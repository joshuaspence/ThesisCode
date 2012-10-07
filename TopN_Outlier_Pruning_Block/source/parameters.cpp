/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.hpp" /* check for invalid preprocessor macro combinations */
#include "arch.hpp" /* set architecture specific macros */

#include "parameters.hpp" /* main include file */
#include "utility.hpp" /* for UNUSED, size_t */
/*----------------------------------------------------------------------------*/

#ifndef HARDCODED_NUM_VECTORS
size_t num_vectors_value = 0;
void set_num_vectors(const size_t num_vectors) {
    num_vectors_value = num_vectors;
}
#else
const size_t num_vectors_value = (HARDCODED_NUM_VECTORS);
void set_num_vectors(const UNUSED size_t num_vectors) {}
#endif /* #ifndef HARDCODED_NUM_VECTORS */

#ifndef HARDCODED_VECTOR_DIMS
size_t vector_dims_value = 0;
void set_vector_dims(const size_t vector_dims) {
    vector_dims_value = vector_dims;
}
#else
const size_t vector_dims_value = (HARDCODED_VECTOR_DIMS);
void set_vector_dims(const UNUSED size_t vector_dims) {}
#endif /* #ifndef HARDCODED_VECTOR_DIMS */

#ifndef HARDCODED_K
size_t k_value = 0;
void set_k(const size_t k) {
    k_value = k;
}
#else
const size_t k_value = (HARDCODED_K);
void set_k(const UNUSED size_t k) {}
#endif /* #ifndef HARDCODED_K */

#ifndef HARDCODED_N
size_t N_value = 0;
void set_N(const size_t N) {
    N_value = N;
}
#else
const size_t N_value = (HARDCODED_N);
void set_N(const UNUSED size_t N) {}
#endif /* #ifndef HARDCODED_N */

#ifdef BLOCKING
#ifndef HARDCODED_BLOCK_SIZE
size_t block_size_value = 0;
void set_block_size(const size_t block_size) {
    block_size_value = block_size;
}
#else
const size_t block_size_value = (HARDCODED_BLOCK_SIZE);
void set_block_size(const UNUSED size_t block_size) {}
#endif /* #ifndef HARDCODED_BLOCK_SIZE */
#else
void set_block_size(const UNUSED size_t block_size) {}
#endif /* #ifdef BLOCKING */
