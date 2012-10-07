#ifndef PARAMETERS_HPP_
#define PARAMETERS_HPP_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.hpp" /* check for invalid preprocessor macro combinations */
#include "arch.hpp" /* set architecture specific macros */

#include "utility.hpp" /* for size_t */
/*----------------------------------------------------------------------------*/

__BEGIN_DECLS

#ifndef HARDCODED_NUM_VECTORS
extern size_t num_vectors_value;
#else
extern const size_t num_vectors_value;
#endif /* #ifndef HARDCODED_NUM_VECTORS */

#ifndef HARDCODED_VECTOR_DIMS
extern size_t vector_dims_value;
#else
extern const size_t vector_dims_value;
#endif /* #ifndef HARDCODED_VECTOR_DIMS */

#ifndef HARDCODED_K
extern size_t k_value;
#else
extern const size_t k_value;
#endif /* #ifndef HARDCODED_K */

#ifndef HARDCODED_N
extern size_t N_value;
#else
extern const size_t N_value;
#endif /* #ifndef HARDCODED_N */

#ifdef BLOCKING
#ifndef HARDCODED_BLOCK_SIZE
extern size_t block_size_value;
#else
extern const size_t block_size_value;
#endif /* #ifndef HARDCODED_BLOCK_SIZE */
#endif /* #ifdef BLOCKING */

/*
 * Set the number of vectors in the input data set.
 *
 * Parameters:
 *     - num_vectors: The number of vectors in the input data set.
 */
void set_num_vectors(const size_t num_vectors);

/*
 * Set the number of dimensions of the vectors in the input data set.
 *
 * Parameters:
 *     - vector_dims: The number of dimensions of the vectors in the input data 
 *           set.
 */
void set_vector_dims(const size_t vector_dims);

/*
 * Set the number of k-nearest neighbours to use for outlier detection.
 *
 * Parameters:
 *     - k: The number of k-nearest neighbours for outlier detection.
 */
void set_k(const size_t k);

/*
 * Set the top number of outliers to be returned by the
 * top_n_outlier_pruning_block function.
 *
 * Parameters:
 *     - N: The top N outliers will be returned by this function.
 */
void set_N(const size_t N);

/*
 * Set the block size with which to processed the input data array.
 *
 * Parameters:
 *     - block_size: The input data array will be processed in blocks of this 
 *       size.
 */
void set_block_size(const size_t block_size);

__END_DECLS

#endif /* #ifndef PARAMETERS_HPP_ */
