/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "utility.h" /* for double_t, index_t */

#include <errno.h> /* for errno */
#include <stddef.h> /* for size_t */
#include <stdlib.h> /* for size_t, malloc, free */
#include <stdio.h> /* for fopen, fread, fclose */
#include <string.h> /* for strerror */

#include "vardump.h"
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
    
    size_t result;
    size_t size;
    size_t count;
    
    /* num_vectors */
    size = sizeof(size_t);
    count = 1;
    if ((result = fwrite(num_vectors, size, count, fp)) != count) {
        fprintf(stderr, "Error writing %s to file %s. Expected count = %u. Actual count = %u.\n", "num_vectors", filename, (unsigned int) count, (unsigned int) result);
        return FILE_IO_ERROR;
    }
    
    /* vector_dims */
    size = sizeof(size_t);
    count = 1;
    if ((result = fwrite(vector_dims, size, count, fp)) != count) {
        fprintf(stderr, "Error writing %s to file %s. Expected count = %u. Actual count = %u.\n", "vector_dims", filename, (unsigned int) count, (unsigned int) result);
        return FILE_IO_ERROR;
    }
    
    /* data */
    size = sizeof(double_t);
    count = *num_vectors * *vector_dims;
    if ((result = fwrite(data, size, count, fp)) != count) {
        fprintf(stderr, "Error writing %s to file %s. Expected count = %u. Actual count = %u.\n", "data", filename, (unsigned int) count, (unsigned int) result);
        return FILE_IO_ERROR;
    }
    
    /* k */
    size = sizeof(size_t);
    count = 1;
    if ((result = fwrite(k, size, count, fp)) != count) {
        fprintf(stderr, "Error writing %s to file %s. Expected count = %u. Actual count = %u.\n", "k", filename, (unsigned int) count, (unsigned int) result);
        return FILE_IO_ERROR;
    }
    
    /* N */
    size = sizeof(size_t);
    count = 1;
    if ((result = fwrite(N, size, count, fp)) != count) {
        fprintf(stderr, "Error writing %s to file %s. Expected count = %u. Actual count = %u.\n", "N", filename, (unsigned int) count, (unsigned int) result);
        return FILE_IO_ERROR;
    }
    
    /* block_size */
    size = sizeof(size_t);
    count = 1;
    if ((result = fwrite(block_size, size, count, fp)) != count) {
        fprintf(stderr, "Error writing %s to file %s. Expected count = %u. Actual count = %u.\n", "block_size", filename, (unsigned int) count, (unsigned int) result);
        return FILE_IO_ERROR;
    }
    
    /* outliers */
    size = sizeof(index_t);
    count = *N;
    if ((result = fwrite(outliers, size, count, fp)) != count) {
        fprintf(stderr, "Error writing %s to file %s. Expected count = %u. Actual count = %u.\n", "outliers", filename, (unsigned int) count, (unsigned int) result);
        return FILE_IO_ERROR;
    }
    
    /* outlier_scores */
    size = sizeof(double_t);
    count = *N;
    if ((result = fwrite(outlier_scores, size, count, fp)) != count) {
        fprintf(stderr, "Error writing %s to file %s. Expected count = %u. Actual count = %u.\n", "outlier_scores", filename, (unsigned int) count, (unsigned int) result);
        return FILE_IO_ERROR;
    }
    
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
    
    size_t result;
    size_t size;
    size_t count;
    
    /* num_vectors */
    size = sizeof(size_t);
    count = 1;
    if ((result = fread(num_vectors, size, count, fp)) != count) {
        fprintf(stderr, "Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", "num_vectors", filename, (unsigned int) count, (unsigned int) result);
        return FILE_IO_ERROR;
    }
    
    /* vector_dims */
    size = sizeof(size_t);
    count = 1;
    if ((result = fread(vector_dims, size, count, fp)) != count) {
        fprintf(stderr, "Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", "vector_dims", filename, (unsigned int) count, (unsigned int) result);
        return FILE_IO_ERROR;
    }
    
    /* data */
    size = sizeof(double_t);
    count = *num_vectors * *vector_dims;
    *data = (double_t *) malloc(count * size);
    if (*data == NULL) {
        fprintf(stderr, "Failed to allocate %u bytes for %s.\n", (unsigned int) (count * size), "data");
        return MALLOC_FAILED;
    } else {
        if ((result = fread(*data, size, count, fp)) != count) {
            fprintf(stderr, "Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", "data", filename, (unsigned int) count, (unsigned int) result);
            return FILE_IO_ERROR;
        }
    }
    
    /* k */
    size = sizeof(size_t);
    count = 1;
    if ((result = fread(k, size, 1, fp)) != count) {
        fprintf(stderr, "Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", "vector_dims", filename, (unsigned int) count, (unsigned int) result);
        free(*data);
        return FILE_IO_ERROR;
    }
    
    /* N */
    size = sizeof(size_t);
    count = 1;
    if ((result = fread(N, size, count, fp)) != count) {
        fprintf(stderr, "Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", "vector_dims", filename, (unsigned int) count, (unsigned int) result);
        free(*data);
        return FILE_IO_ERROR;
    }
    
    /* block_size */
    size = sizeof(size_t);
    count = 1;
    if ((result = fread(block_size, size, count, fp)) != count) {
        fprintf(stderr, "Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", "block_size", filename, (unsigned int) count, (unsigned int) result);
        free(*data);
        return FILE_IO_ERROR;
    }
    
    /* outliers */
    size = sizeof(index_t);
    count = *N;
    *outliers = (index_t *) malloc(count * size);
    if (*outliers == NULL) {
        fprintf(stderr, "Failed to allocate %u bytes for %s.\n", (unsigned int) (count * size), "outliers");
        free(*data);
        return MALLOC_FAILED;
    } else {
        if ((result = fread(*outliers, size, count, fp)) != count) {
            fprintf(stderr, "Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", "pit;oers", filename, (unsigned int) count, (unsigned int) result);
            free(*data);
            free(*outliers);
            return FILE_IO_ERROR;
        }
    }
    
    /* outlier_scores */
    size = sizeof(double_t);
    count = *N;
    *outlier_scores = (double_t *) malloc(count * size);
    if (*outlier_scores == NULL) {
        fprintf(stderr, "Failed to allocate %u bytes for %s.\n", (unsigned int) (count * size), "outlier_scores");
        free(*data);
        free(*outliers);
        return MALLOC_FAILED;
    } else {
        if ((result = fread(*outlier_scores, size, count, fp)) != count) {
            fprintf(stderr, "Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", "outlier_scores", filename, (unsigned int) count, (unsigned int) result);
            free(*data);
            free(*outliers);
            free(*outlier_scores);
            return FILE_IO_ERROR;
        }
    }
    
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
