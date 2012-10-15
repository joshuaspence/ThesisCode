#ifndef VARDUMP_H_
#define VARDUMP_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "utility.h" /* for __BEGIN_DECLS, __END_DECLS, dbl_t, index_t, size_t */
#include <string> /* for std::string */
/*----------------------------------------------------------------------------*/

__BEGIN_DECLS

/*
 * Save the input and output parameters of the top_n_outlier_pruning_block
 * function to a binary file.
 * 
 * Parameters:
 *     - filename: The file to read the variable dump file.
 *     - num_vectors: A pointer to a variable to read from the variable dump
 *           file.
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
    const std::string & filename,
    const size_t & num_vectors,
    const size_t & vector_dims,
    const dbl_t * const & data, /* an array of size num_vectors x vector_dims */
    const size_t & k,
    const size_t & N,
    const size_t & block_size,
    const index_t * const & outliers, /* a vector of length N */
    const dbl_t * const & outlier_scores /* a vector of length N */
    );

/*
 * Read the input and output parameters of the top_n_outlier_pruning_block
 * function from a binary file.
 *
 * NOTE: The caller must free the memory allocated for data, outliers and
 * outlier scores.
 *
 * Parameters:
 *     - filename: The name of the file to read the variable dump from.
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
int read_vardump_from_file(
    const std::string & filename,
    size_t & num_vectors,
    size_t & vector_dims,
    dbl_t * & data, /* an array of size num_vectors x vector_dims */
    size_t & k,
    size_t & N,
    size_t & block_size,
    index_t * & outliers, /* a vector of length N */
    dbl_t * & outlier_scores /* a vector of length N */
    );

/*

 * Read the input and output parameters of the top_n_outlier_pruning_block
 * function from an array.
 *
 * NOTE: The caller must free the memory allocated for data, outliers and
 * outlier scores.
 *
 * Parameters:
 *     - array: The array to read the variable dump from.
 *     - num_vectors: A variable to read from the variable dump array.
 *     - vector_dims: A variable to read from the variable dump array.
 *     - data: A variable to read from the variable dump array.
 *     - k: A variable to read from the variable dump array.
 *     - N: A variable to read from the variable dump array.
 *     - block_size: A variable to read from the variable dump array.
 *     - outliers: A variable to read from the variable dump array.
 *     - outlier_scores: A variable to read from the variable dump array.
 *
 * Return:
 *     A return value indicating either success, or a non-zero integer
 *     representing failure.
 */
int read_vardump_from_array(
    const unsigned char ** const & array,
    size_t & num_vectors,
    size_t & vector_dims,
    dbl_t * & data, /* an array of size num_vectors x vector_dims */
    size_t & k,
    size_t & N,
    size_t & block_size,
    index_t * & outliers, /* a vector of length N */
    dbl_t * & outlier_scores /* a vector of length N */
    );

__END_DECLS

#endif /* #ifndef VARDUMP_H_ */
