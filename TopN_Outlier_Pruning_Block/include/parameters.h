#ifndef PARAMETERS_H_
#define PARAMETERS_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */

#include "utility.h" /* for __BEGIN_DECLS, __END_DECLS, ASSERT, MIN, size_t */
/*----------------------------------------------------------------------------*/

__BEGIN_DECLS

#ifndef HARDCODED_NUM_VECTORS
extern size_t num_vectors_value;

/*
 * Set the number of vectors in the input data set.
 *
 * Parameters:
 *     - num_vectors: The number of vectors in the input data set.
 */
void set_num_vectors(const size_t num_vectors);
#else
#define num_vectors_value (HARDCODED_NUM_VECTORS)
#define set_num_vectors(num_vectors)
#endif /* #ifndef HARDCODED_NUM_VECTORS */

#ifndef MAX_NUM_VECTORS
    #define NUM_VECTORS(N)  (N)
#else
    #define NUM_VECTORS(N)  MIN(N,MAX_NUM_VECTORS)
#endif /* #ifndef HARDCODED_NUM_VECTORS */

#ifndef HARDCODED_VECTOR_DIMS
extern size_t vector_dims_value;

/*
 * Set the number of dimensions of the vectors in the input data set.
 *
 * Parameters:
 *     - vector_dims: The number of dimensions of the vectors in the input data
 *           set.
 */
void set_vector_dims(const size_t vector_dims);
#else
#define vector_dims_value (HARDCODED_VECTOR_DIMS)
#define set_vector_dims(vector_dims)    ASSERT(vector_dims == vector_dims_value)
#endif /* #ifndef HARDCODED_VECTOR_DIMS */

#ifndef HARDCODED_K
extern size_t k_value;

/*
 * Set the number of k-nearest neighbours to use for outlier detection.
 *
 * Parameters:
 *     - k: The number of k-nearest neighbours for outlier detection.
 */
void set_k(const size_t k);
#else
#define k_value HARDCODED_K
#define set_k(k)                        ASSERT(k == k_value)
#endif /* #ifndef HARDCODED_K */

#ifndef HARDCODED_N
extern size_t N_value;

/*
 * Set the top number of outliers to be returned by the
 * top_n_outlier_pruning_block function.
 *
 * Parameters:
 *     - N: The top N outliers will be returned by this function.
 */
void set_N(const size_t N);
#else
#define N_value (HARDCODED_N)
#define set_N(N)                        ASSERT(N == N_value)
#endif /* #ifndef HARDCODED_N */

#if (BLOCKING==ENABLED)
#ifndef HARDCODED_BLOCK_SIZE
extern size_t block_size_value;

/*
 * Set the block size with which to processed the input data array.
 *
 * Parameters:
 *     - block_size: The input data array will be processed in blocks of this
 *       size.
 */
void set_block_size(const size_t block_size);
#else
#define block_size_value (HARDCODED_BLOCK_SIZE)
#define set_block_size(block_size)      ASSERT(block_size == block_size_value)
#endif /* #ifndef HARDCODED_BLOCK_SIZE */
#else
#define set_block_size(block_size)
#endif /* #if (BLOCKING==ENABLED) */

#if (USE_DYNAMIC_ARRAY_SIZE == ENABLED)
#define BOUNDS(X)
#elif (USE_DYNAMIC_ARRAY_SIZE == DISABLED)
#define BOUNDS(X)                       (X)
#endif /* #if (USE_DYNAMIC_ARRAY_SIZE == ENABLED) */

__END_DECLS

#endif /* #ifndef PARAMETERS_H_ */
