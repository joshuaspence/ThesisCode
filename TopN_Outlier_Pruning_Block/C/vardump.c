/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "utility.h"
#include "vardump.h"

#include <errno.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Macros                                                                     */
/*============================================================================*/
#define WRITE_VARIABLE(_var_, _size_, _count_, _filename_, _fp_) \
    do { \
        const size_t size  = _size_; \
        const size_t count = _count_; \
        size_t result; \
        \
        if ((result = fwrite(_var_, size, count, _fp_)) != count) { \
            fprintf(stderr, "Error writing %s to file %s. Expected count = %u. Actual count = %u.\n", #_var_, _filename_, (unsigned int) count, (unsigned int) result); \
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
            fprintf(stderr, "Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", #_var_, _filename_, (unsigned int) count, (unsigned int) result); \
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
            fprintf(stderr, "Failed to allocate %u bytes for %s.\n", (unsigned int) (count * size), #_var_); \
            _cleanup_code_ \
            return MALLOC_FAILED; \
        } else { \
            if ((result = fread(*outlier_scores, size, count, fp)) != count) { \
                fprintf(stderr, "Error reading %s from file %s. Expected count = %u. Actual count = %u.\n",#_var_, filename, (unsigned int) count, (unsigned int) result); \
                free(*_var_); \
                _cleanup_code_ \
                return FILE_IO_ERROR; \
            } \
        } \
    } while (0);
/*----------------------------------------------------------------------------*/

/*
 * Save the input and output parameters of the top_n_outlier_pruning_block 
 * function to a binary file.
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
        fprintf(stderr, "No filename specified.\n");
        return FILE_NOT_FOUND;
    }
    FILE * const fp = fopen(filename, "wb");
    if (fp == NULL) {
        fprintf(stderr, "Error opening file: %s", filename);
        return FILE_NOT_FOUND;
    }
    
    /* num_vectors */
    WRITE_VARIABLE(num_vectors, sizeof(size_t), 1, filename, fp);
    
    /* vector_dims */
    WRITE_VARIABLE(vector_dims, sizeof(size_t), 1, filename, fp);
    
    /* data */
    WRITE_VARIABLE(data, sizeof(double_t), (*num_vectors) * (*vector_dims), filename, fp);
    
    /* k */
    WRITE_VARIABLE(k, sizeof(size_t), 1, filename, fp);
    
    /* N */
    WRITE_VARIABLE(N, sizeof(size_t), 1, filename, fp);
    
    /* block_size */
    WRITE_VARIABLE(block_size, sizeof(size_t), 1, filename, fp);
    
    /* outliers */
    WRITE_VARIABLE(outliers, sizeof(index_t), (*N), filename, fp);
    
    /* outlier_scores */
    WRITE_VARIABLE(outlier_scores, sizeof(double_t), (*N), filename, fp);
    
    if (fclose(fp) != 0) {
        fprintf(stderr, "Error closing file.\n");
        return FILE_IO_ERROR;
    }
    
    return SUCCESS;
}

/*
 * Read the input and output parameters of the top_n_outlier_pruning_block 
 * function from a binary file.
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
        fprintf(stderr, "Error opening %s: %s (%u)\n", filename, strerror(errno), errno);
        return FILE_NOT_FOUND;
    }
    
    /* num_vectors */
    READ_VARIABLE(num_vectors, sizeof(size_t), 1, filename, fp,);
    
    /* vector_dims */
    READ_VARIABLE(vector_dims, sizeof(size_t), 1, filename, fp,);
    
    /* data */
    MALLOC_READ_VARIABLE(data, sizeof(double_t), (*num_vectors) * (*vector_dims), filename, fp,);
    
    /* k */
    READ_VARIABLE(k, sizeof(size_t), 1, filename, fp,);
    
    /* N */
    READ_VARIABLE(N, sizeof(size_t), 1, filename, fp,);
    
    /* block_size */
    READ_VARIABLE(block_size, sizeof(size_t), 1, filename, fp,);
    
    /* outliers */
    MALLOC_READ_VARIABLE(outliers, sizeof(index_t), (*N), filename, fp, free(*data););
    
    /* outlier_scores */
    MALLOC_READ_VARIABLE(outlier_scores, sizeof(double_t), (*N), filename, fp, free(*data); free(*outliers););
    
#if 0
    if (!feof(fp)) {
        fprintf(stderr, "Error reading from file %s. Expected end of file.\n", filename);
        free(*data);
        free(*outliers);
        free(*outlier_scores);
        return FILE_EXPECTED_EOF;
    }
#endif
    
    if (fclose(fp) != 0) {
        fprintf(stderr, "Error closing file.\n");
        return FILE_IO_ERROR;
    }
    
    return SUCCESS;
}
