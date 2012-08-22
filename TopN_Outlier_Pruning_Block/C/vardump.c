/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "utility.h" /* for double_t, FILE_EXPECTED_EOF, FILE_IO_ERROR, FILE_NOT_FOUND, index_t, MALLOC_FAILED, PRINTF_STDERR, SUCCESS */
#include "vardump.h" /* main header file */

#include <errno.h> /* for errno */
#include <stdlib.h> /* for free, malloc, size_t */
#include <stdio.h> /* for FILE, fclose, feof, fopen, fread, fwrite */
#include <string.h> /* for strerror */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Macros                                                                     */
/*============================================================================*/
#define WRITE_VARIABLE(_var_, _size_, _count_, _filename_, _fp_, _cleanup_code_) \
    do { \
        const size_t size  = _size_; \
        const size_t count = _count_; \
        size_t result; \
        \
        if ((result = fwrite(_var_, size, count, _fp_)) != count) { \
            PRINTF_STDERR("Error writing %s to file %s. Expected count = %u. Actual count = %u.\n", #_var_, _filename_, (unsigned int) count, (unsigned int) result); \
            _cleanup_code_ \
            return FILE_IO_ERROR; \
        } \
    } while (0)

#define READ_VARIABLE(_var_, _size_, _count_, _filename_, _fp_, _cleanup_code_) \
    do { \
        const size_t size  = _size_; \
        const size_t count = _count_; \
        size_t result; \
        \
        if ((result = fread(_var_, size, count, _fp_)) != count) { \
            PRINTF_STDERR("Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", #_var_, _filename_, (unsigned int) count, (unsigned int) result); \
            _cleanup_code_ \
            return FILE_IO_ERROR; \
        } \
    } while (0)

#define MALLOC_READ_VARIABLE(_var_, _size_, _count_, _filename_, _fp_, _cleanup_code_) \
    do { \
        const size_t size  = _size_; \
        const size_t count = _count_; \
        size_t result; \
        *_var_ = malloc(count * size); \
        if (*_var_ == NULL) { \
            PRINTF_STDERR("Failed to allocate %u bytes for %s.\n", (unsigned int) (count * size), #_var_); \
            _cleanup_code_ \
            return MALLOC_FAILED; \
        } else { \
            if ((result = fread(*_var_, size, count, fp)) != count) { \
                PRINTF_STDERR("Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", #_var_, filename, (unsigned int) count, (unsigned int) result); \
                free(*_var_); \
                _cleanup_code_ \
                return FILE_IO_ERROR; \
            } \
        } \
    } while (0)
/*----------------------------------------------------------------------------*/

/*
 * Save the input and output parameters of the top_n_outlier_pruning_block 
 * function to a binary file.
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
int save_vardump(const char * const filename,
                 const size_t * const num_vectors,
                 const size_t * const vector_dims,
                 const double_t (* const data)[*num_vectors][*vector_dims],
                 const size_t * const k,
                 const size_t * const N,
                 const size_t * const block_size,
                 index_t (* const outliers)[*N],
                 double_t (* const outlier_scores)[*N]) {
    if (filename == NULL) {
        PRINTF_STDERR("No filename specified.\n");
        return FILE_NOT_FOUND;
    }
    FILE * const fp = fopen(filename, "wb");
    if (fp == NULL) {
        PRINTF_STDERR("Error opening file: %s", filename);
        return FILE_NOT_FOUND;
    }
    
    /* num_vectors */
    WRITE_VARIABLE(num_vectors, sizeof(size_t), 1, filename, fp,);
    
    /* vector_dims */
    WRITE_VARIABLE(vector_dims, sizeof(size_t), 1, filename, fp,);
    
    /* data */
    WRITE_VARIABLE(data, sizeof(double_t), (*num_vectors) * (*vector_dims), filename, fp,);
    
    /* k */
    WRITE_VARIABLE(k, sizeof(size_t), 1, filename, fp,);
    
    /* N */
    WRITE_VARIABLE(N, sizeof(size_t), 1, filename, fp,);
    
    /* block_size */
    WRITE_VARIABLE(block_size, sizeof(size_t), 1, filename, fp,);
    
    /* outliers */
    WRITE_VARIABLE(outliers, sizeof(index_t), (*N), filename, fp,);
    
    /* outlier_scores */
    WRITE_VARIABLE(outlier_scores, sizeof(double_t), (*N), filename, fp,);
    
    if (fclose(fp) != 0) {
        PRINTF_STDERR("Error closing file.\n");
        return FILE_IO_ERROR;
    }
    
    return SUCCESS;
}

/*
 * Read the input and output parameters of the top_n_outlier_pruning_block 
 * function from a binary file.
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
int read_vardump(const char * const filename,
                 size_t * const num_vectors,
                 size_t * const vector_dims,
                 double_t ** const data,
                 size_t * const k,
                 size_t * const N,
                 size_t * const block_size,
                 index_t ** const outliers,
                 double_t ** const outlier_scores) {
    FILE * const fp = fopen(filename, "rb");
    if (fp == NULL) {
        PRINTF_STDERR("Error opening %s: %s (%u)\n", filename, strerror(errno), errno);
        return FILE_NOT_FOUND;
    }
    
    /* num_vectors */
    READ_VARIABLE(num_vectors, sizeof(size_t), 1, filename, fp,);
    
    /* vector_dims */
    READ_VARIABLE(vector_dims, sizeof(size_t), 1, filename, fp,);
    
    /* data */
    MALLOC_READ_VARIABLE(data, sizeof(double_t), (*num_vectors) * (*vector_dims), filename, fp,);
#if 0
    do {
        const size_t size = sizeof(double_t);
        const size_t count = (*num_vectors) * (*vector_dims);
        size_t result;
        
        *data = malloc(count * size);
        if (*data == NULL) {
            PRINTF_STDERR("Failed to allocate %u bytes for %s.\n", (unsigned int) (count * size), "data");
            return (3);
        } else {
            if ((result = fread(*outlier_scores, size, count, fp)) != count) {
                PRINTF_STDERR("Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", "data", filename, (unsigned int) count, (unsigned int) result);
                free(*data);
                return (2);
            }
        }
    } while (0);
#endif
    
    /* k */
    READ_VARIABLE(k, sizeof(size_t), 1, filename, fp, free(*data););
    
    /* N */
    READ_VARIABLE(N, sizeof(size_t), 1, filename, fp,);
    
    /* block_size */
    READ_VARIABLE(block_size, sizeof(size_t), 1, filename, fp, free(*data););
    
    /* outliers */
    MALLOC_READ_VARIABLE(outliers, sizeof(index_t), (*N), filename, fp, free(*data););
    
    /* outlier_scores */
    MALLOC_READ_VARIABLE(outlier_scores, sizeof(double_t), (*N), filename, fp, free(*data); free(*outliers););
    
#if 0 /* this code doesn't seem to work */
    if (!feof(fp)) {
        PRINTF_STDERR("Error reading from file %s. Expected end of file.\n", filename);
        free(*data);
        free(*outliers);
        free(*outlier_scores);
        return FILE_EXPECTED_EOF;
    }
#endif /* #if 0 */

    if (fclose(fp) != 0) {
        PRINTF_STDERR("Error closing file.\n");
        return FILE_IO_ERROR;
    }
    
    return SUCCESS;
}
