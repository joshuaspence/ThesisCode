/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "utility.h" /* for double_t, FILE_EXPECTED_EOF, FILE_IO_ERROR, FILE_NOT_FOUND, index_t, MALLOC_FAILED, PRINTF_STDERR, size_t, SUCCESS */
#include "vardump.h" /* main header file */

#include <errno.h> /* for errno */
#include <stdlib.h> /* for free, malloc */
#include <stdio.h> /* for FILE, fclose, feof, fopen, fread, fwrite */
#include <string.h> /* for strerror */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Macros                                                                     */
/*============================================================================*/
#define WRITE_VARIABLE(_var_, _size_, _count_, _filename_, _fp_, _cleanup_code_) \
    do { \
        const size_t size  = (_size_); \
        const size_t count = (_count_); \
        size_t result; \
        \
        if ((result = fwrite((_var_), size, count, (_fp_))) != count) { \
            PRINTF_STDERR("Error writing %s to file %s. Expected count = %u. Actual count = %u.\n", (#_var_), (_filename_), (unsigned int) count, (unsigned int) result); \
            do { \
                _cleanup_code_ \
            } while (0); \
            return FILE_IO_ERROR; \
        } \
    } while (0)

#define READ_VARIABLE(_var_, _size_, _count_, _filename_, _fp_, _cleanup_code_) \
    do { \
        const size_t size  = (_size_); \
        const size_t count = (_count_); \
        size_t result; \
        \
        if ((result = fread((_var_), size, count, (_fp_))) != count) { \
            PRINTF_STDERR("Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", (#_var_), (_filename_), (unsigned int) count, (unsigned int) result); \
            do { \
                _cleanup_code_ \
            } while (0); \
            return FILE_IO_ERROR; \
        } \
    } while (0)

#define MALLOC_READ_VARIABLE(_var_, _size_, _count_, _filename_, _fp_, _cleanup_code_) \
    do { \
        const size_t size  = (_size_); \
        const size_t count = (_count_); \
        size_t result; \
        \
        *(_var_) = malloc(count * size); \
        if (*(_var_) == NULL) { \
            PRINTF_STDERR("Failed to allocate %u bytes for %s.\n", (unsigned int) (count * size), (#_var_)); \
            do { \
                _cleanup_code_ \
            } while (0); \
            return MALLOC_FAILED; \
        } else if ((result = fread(*(_var_), size, count, (_fp_))) != count) { \
            PRINTF_STDERR("Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", (#_var_), filename, (unsigned int) count, (unsigned int) result); \
            free(*(_var_)); \
            do { \
                _cleanup_code_ \
            } while (0); \
            return FILE_IO_ERROR; \
        } \
    } while (0)
/*----------------------------------------------------------------------------*/

int save_vardump(const char * const filename,
                 const size_t * const num_vectors,
                 const size_t * const vector_dims,
                 const double_t ** const data,
                 const size_t * const k,
                 const size_t * const N,
                 const size_t * const block_size,
                 index_t ** const outliers,
                 double_t ** const outlier_scores) {
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
    WRITE_VARIABLE(num_vectors, sizeof(size_t), 1, filename, fp, /* no cleanup code */);
    
    /* vector_dims */
    WRITE_VARIABLE(vector_dims, sizeof(size_t), 1, filename, fp, /* no cleanup code */);
    
    /* data */
    WRITE_VARIABLE(data, sizeof(double_t), (*num_vectors) * (*vector_dims), filename, fp, /* no cleanup code */);
    
    /* k */
    WRITE_VARIABLE(k, sizeof(size_t), 1, filename, fp, /* no cleanup code */);
    
    /* N */
    WRITE_VARIABLE(N, sizeof(size_t), 1, filename, fp, /* no cleanup code */);
    
    /* block_size */
    WRITE_VARIABLE(block_size, sizeof(size_t), 1, filename, fp, /* no cleanup code */);
    
    /* outliers */
    WRITE_VARIABLE(outliers, sizeof(index_t), *N, filename, fp, /* no cleanup code */);
    
    /* outlier_scores */
    WRITE_VARIABLE(outlier_scores, sizeof(double_t), *N, filename, fp, /* no cleanup code */);
    
    if (fclose(fp) != 0) {
        PRINTF_STDERR("Error closing file.\n");
        return FILE_IO_ERROR;
    }
    
    return SUCCESS;
}

int read_vardump(const char * const filename,
                 size_t * const num_vectors,
                 size_t * const vector_dims,
                 double_in_t ** const data,
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
    READ_VARIABLE(num_vectors, sizeof(size_t), 1, filename, fp, /* no cleanup code */);
    
    /* vector_dims */
    READ_VARIABLE(vector_dims, sizeof(size_t), 1, filename, fp, /* no cleanup code */);
    
    /* data */
    double_t ** const raw_data = malloc(sizeof(double_t *));
    if (raw_data == NULL) {
    	PRINTF_STDERR("Failed to allocate %u bytes for %s.\n", sizeof(double_t *), "raw_data");
    	return MALLOC_FAILED;
    }
    MALLOC_READ_VARIABLE(raw_data, sizeof(double_t), (*num_vectors) * (*vector_dims), filename, fp, free(raw_data));
    *data = malloc((*num_vectors) * (*vector_dims) * sizeof(double_in_t));
	if (*data == NULL) {
		PRINTF_STDERR("Failed to allocate %u bytes for %s.\n", (*num_vectors) * (*vector_dims) * sizeof(double_in_t), "data");
		do {
			free(*raw_data);
			free(raw_data);
		} while (0);
		return MALLOC_FAILED;
	}
	do {
		uint_t i;
		for (i = 0; i < (*num_vectors); i++) {
			uint_t j;
			for (j = 0; j < (*vector_dims); j++) {
#ifndef __AUTOESL__
				(*data[i][j])      = (*raw_data[i][j]);
#else
				(*data[i][j]).data = (*raw_data[i][j]);
				(*data[i][j]).keep = 0;
				(*data[i][j]).last = 0;
#endif /* #ifndef __AUTOESL__ */
			}
		}
	} while (0);
#endif /* #ifndef __AUTOESL__ */
    
    /* k */
    READ_VARIABLE(k, sizeof(size_t), 1, filename, fp, free(*data););
    
    /* N */
    READ_VARIABLE(N, sizeof(size_t), 1, filename, fp, free(*data););
    
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
