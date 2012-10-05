#ifndef VARDUMP_H_
#define VARDUMP_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "utility.h" /* for __BEGIN_DECLS, __END_DECLS, double_t, index_t, size_t */
/*----------------------------------------------------------------------------*/

__BEGIN_DECLS

/*
 * Save the input and output parameters of the top_n_outlier_pruning_block 
 * function to a binary file.
 * 
 * Parameters:
 *     - filename: The file to read the variable dump file.
 *     - num_vectors: A pointer to a variable to read from the variable dump file.
 *     - vector_dims: A variable to read from the variable dump file.
 *     - data: A variable to read from the variable dump file.
 *     - k: A variable to read from the variable dump file.
 *     - N: A variable to read from the variable dump file.
 *     - block_size: A variable to read from the variable dump file.
 *     - outliers: A variable to read from the variable dump file.
 *     - outlier_scores: A variable to read from the variable dump file.
 *
 * Return:
 *     A return value indicating either success, or a non-zero integer 
 *     representing failure.
 */
int save_vardump(
    const char * const filename,
    const size_t * const num_vectors,
    const size_t * const vector_dims,
    const double_t ** const data,
    const size_t * const k,
    const size_t * const N,
    const size_t * const block_size,
    index_t ** const outliers,
    double_t ** const outlier_scores
    );

/*
 * Read the input and output parameters of the top_n_outlier_pruning_block 
 * function from a binary file.
 *
 * NOTE: The caller must free the memory allocated for data, outliers and 
 * outlier scores.
 *
 * Parameters:
 *     - filename: The file to read the variable dump file.
 *     - num_vectors: A variable to read from the variable dump file.
 *     - vector_dims: A variable to read from the variable dump file.
 *     - data: A variable to read from the variable dump file.
 *     - k: A variable to read from the variable dump file.
 *     - N: A variable to read from the variable dump file.
 *     - block_size: A variable to read from the variable dump file.
 *     - outliers: A variable to read from the variable dump file.
 *     - outlier_scores: A variable to read from the variable dump file.
 *
 * Return:
 *     A return value indicating either success, or a non-zero integer 
 *     representing failure.
 */
int read_vardump(
    const char * const filename,
    size_t * const num_vectors,
    size_t * const vector_dims,
    double_in_t ** const data,
    size_t * const k,
    size_t * const N,
    size_t * const block_size,
    index_t ** const outliers,
    double_t ** const outlier_scores
    );

__END_DECLS

#endif /* #ifndef VARDUMP_H_ */
