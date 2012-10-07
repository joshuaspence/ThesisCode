/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "utility.hpp" /* for double_t, FILE_EXPECTED_EOF, FILE_IO_ERROR, FILE_NOT_FOUND, index_t, MALLOC_FAILED, size_t, SUCCESS */
#include "vardump.hpp" /* main header file */

#include <errno.h> /* for errno */
#include <stdlib.h> /* for free, malloc */
#include <stdio.h> /* for FILE, fclose, feof, fopen, fread, fwrite */
#include <string.h> /* for strerror */

#include <string> /* for std::string, std::endl */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Macros                                                                     */
/*============================================================================*/
#define WRITE_VARIABLE_TO_FILE(_var_, _size_, _count_, _filename_, _fp_, _cleanup_code_) \
    do { \
        const size_t size  = (_size_); \
        const size_t count = (_count_); \
        size_t result; \
        \
        if ((result = fwrite((_var_), size, count, (_fp_))) != count) { \
            PRINTF_STDERR("Error writing " << (#_var_) << " to file " << (_filename_) << ". Expected count = " << count << ". Actual count = " << result << "." << std::endl); \
            do { \
                _cleanup_code_ \
            } while (0); \
            return FILE_IO_ERROR; \
        } \
    } while (0)

#define READ_VARIABLE_FROM_FILE(_var_, _size_, _count_, _filename_, _fp_, _cleanup_code_) \
    do { \
        const size_t size  = (_size_); \
        const size_t count = (_count_); \
        size_t result; \
        \
        if ((result = fread((_var_), size, count, (_fp_))) != count) { \
            PRINTF_STDERR("Error writing " << (#_var_) << " to file " << (_filename_) << ". Expected count = " << count << ". Actual count = " << result << "." << std::endl); \
            do { \
                _cleanup_code_ \
            } while (0); \
            return FILE_IO_ERROR; \
        } \
    } while (0)

#define MALLOC_READ_VARIABLE_FROM_FILE(_type_, _var_, _size_, _count_, _filename_, _fp_, _cleanup_code_) \
    do { \
        const size_t size  = (_size_); \
        const size_t count = (_count_); \
        (_var_) = (_type_) malloc(count * size); \
        if ((_var_) == NULL) { \
            PRINTF_STDERR("Failed to allocate " << (count * size) << " bytes for " << (#_var_) << "."); \
            do { \
                _cleanup_code_ \
            } while (0); \
            return MALLOC_FAILED; \
        } else { \
            READ_VARIABLE_FROM_FILE((_var_), (_size_), (_count_), (_filename_), (_fp_), _cleanup_code_ free((_var_));); \
        } \
    } while (0)

#define READ_VARIABLE_FROM_ARRAY(_var_, _size_, _count_, _array_, _cleanup_code_) \
    do { \
        const size_t size  = (_size_); \
        const size_t count = (_count_); \
        size_t result; \
        \
        if ((result = memread((_var_), size, count, (_array_))) != count) { \
            PRINTF_STDERR("Error reading " << (#_var_) << " from variable " << (#_array_) << ". Expected count = " << count << ". Actual count = " << result << "." << std::endl); \
            do { \
                _cleanup_code_ \
            } while (0); \
            return FILE_IO_ERROR; \
        } \
    } while (0)

#define MALLOC_READ_VARIABLE_FROM_ARRAY(_type_, _var_, _size_, _count_, _array_, _cleanup_code_) \
    do { \
        const size_t size  = (_size_); \
        const size_t count = (_count_); \
        (_var_) = (_type_) malloc(count * size); \
        if ((_var_) == NULL) { \
            PRINTF_STDERR("Failed to allocate " << (count * size) << " bytes for " << (#_var_) << "." << std::endl); \
            do { \
                _cleanup_code_ \
            } while (0); \
            return MALLOC_FAILED; \
        } else { \
            READ_VARIABLE_FROM_ARRAY((_var_), (_size_), (_count_), (_array_), _cleanup_code_ free(_var_);); \
        } \
    } while (0)

/*----------------------------------------------------------------------------*/

/* 
 * A function similar to fread, except that it reads from an array instead of
 * from a file.
 */
static size_t memread(void * const ptr, const size_t size, const size_t count, const unsigned char ** const array) {
    memcpy(ptr, *array, size * count);
    *array += size * count;
    return count;
}

int save_vardump(const std::string & filename,
                 const size_t & num_vectors,
                 const size_t & vector_dims,
                 const double_t * const & data,
                 const size_t & k,
                 const size_t & N,
                 const size_t & block_size,
                 const index_t * const & outliers,
                 const double_t * const & outlier_scores) {
    FILE * const fp = fopen(filename.c_str(), "wb");
    if (fp == NULL) {
        PRINTF_STDERR("Error opening file: " << filename << std::endl);
        return FILE_NOT_FOUND;
    }
    
    /* num_vectors */
    WRITE_VARIABLE_TO_FILE(&num_vectors, sizeof(size_t), 1, filename, fp, /* no cleanup code */);
    
    /* vector_dims */
    WRITE_VARIABLE_TO_FILE(&vector_dims, sizeof(size_t), 1, filename, fp, /* no cleanup code */);
    
    /* data */
    WRITE_VARIABLE_TO_FILE(&data, sizeof(double_t), num_vectors * vector_dims, filename, fp, /* no cleanup code */);
    
    /* k */
    WRITE_VARIABLE_TO_FILE(&k, sizeof(size_t), 1, filename, fp, /* no cleanup code */);
    
    /* N */
    WRITE_VARIABLE_TO_FILE(&N, sizeof(size_t), 1, filename, fp, /* no cleanup code */);
    
    /* block_size */
    WRITE_VARIABLE_TO_FILE(&block_size, sizeof(size_t), 1, filename, fp, /* no cleanup code */);
    
    /* outliers */
    WRITE_VARIABLE_TO_FILE(&outliers, sizeof(index_t), N, filename, fp, /* no cleanup code */);
    
    /* outlier_scores */
    WRITE_VARIABLE_TO_FILE(&outlier_scores, sizeof(double_t), N, filename, fp, /* no cleanup code */);
    
    if (fclose(fp) != 0) {
        PRINTF_STDERR("Error closing file." << std::endl);
        return FILE_IO_ERROR;
    }
    
    return SUCCESS;
}

int read_vardump_from_file(const std::string & filename,
                           size_t & num_vectors,
                           size_t & vector_dims,
                           double_t * & data,
                           size_t & k,
                           size_t & N,
                           size_t & block_size,
                           index_t * & outliers,
                           double_t * & outlier_scores) {
    FILE * const fp = fopen(filename.c_str(), "rb");
    if (fp == NULL) {
        PRINTF_STDERR("Error opening " << filename << ": " << strerror(errno) << " (" << errno << ")" << std::endl);
        return FILE_NOT_FOUND;
    }
    
    /* num_vectors */
    READ_VARIABLE_FROM_FILE(&num_vectors, sizeof(size_t), 1, filename, fp, /* no cleanup code */);
    
    /* vector_dims */
    READ_VARIABLE_FROM_FILE(&vector_dims, sizeof(size_t), 1, filename, fp, /* no cleanup code */);
    
    /* data */
    double_t * raw_data = NULL;
    MALLOC_READ_VARIABLE_FROM_FILE(double_t *, data, sizeof(double_t), num_vectors * vector_dims, filename, fp, /* no cleanup code */);
    data = (double_t *) malloc(num_vectors * vector_dims * sizeof(double_t));
    if (data == NULL) {
        PRINTF_STDERR("Failed to allocate " << (num_vectors * vector_dims * sizeof(double_t)) << " bytes for " << "data" << "." << std::endl);
        do {
            free(raw_data);
        } while (0);
        return MALLOC_FAILED;
    }
    do {
        uint_t i;
        for (i = 0; i < num_vectors; i++) {
            uint_t j;
            for (j = 0; j < vector_dims; j++) {
#ifndef __AUTOESL__
                data[i * num_vectors + j] = raw_data[i * num_vectors + j];
#else
                data[i * num_vectors + j].data = raw_data[i * num_vectors + j];
                data[i * num_vectors + j].keep = 0;
                data[i * num_vectors + j].last = 0;
#endif /* #ifndef __AUTOESL__ */
            }
        }
        free(raw_data);
    } while(0);
    
    /* k */
    READ_VARIABLE_FROM_FILE(&k, sizeof(size_t), 1, filename, fp, free(data););
    
    /* N */
    READ_VARIABLE_FROM_FILE(&N, sizeof(size_t), 1, filename, fp, free(data););
    
    /* block_size */
    READ_VARIABLE_FROM_FILE(&block_size, sizeof(size_t), 1, filename, fp, free(data););
    
    /* outliers */
    MALLOC_READ_VARIABLE_FROM_FILE(index_t *, outliers, sizeof(index_t), N, filename, fp, free(data););
    
    /* outlier_scores */
    MALLOC_READ_VARIABLE_FROM_FILE(double_t *, outlier_scores, sizeof(double_t), N, filename, fp, free(data); free(outliers););
    
#if 0 /* this code doesn't seem to work */
    if (!feof(fp)) {
        PRINTF_STDERR("Error reading from file " << filename << ". Expected end of file." << std::endl);
        
        free(data);
        free(outliers);
        free(outlier_scores);
        return FILE_EXPECTED_EOF;
    }
#endif /* #if 0 */
    
    if (fclose(fp) != 0) {
        PRINTF_STDERR("Error closing file." << std::endl);
        free(data);
        free(outliers);
        free(outlier_scores);
        return FILE_IO_ERROR;
    }
    
    return SUCCESS;
}

int read_vardump_from_array(const unsigned char ** const & array,
                            size_t & num_vectors,
                            size_t & vector_dims,
                            double_t * & data,
                            size_t & k,
                            size_t & N,
                            size_t & block_size,
                            index_t * & outliers,
                            double_t * & outlier_scores) {
    /* num_vectors */
    READ_VARIABLE_FROM_ARRAY(&num_vectors, sizeof(size_t), 1, array, /* no cleanup code */);
    
    /* vector_dims */
    READ_VARIABLE_FROM_ARRAY(&vector_dims, sizeof(size_t), 1, array, /* no cleanup code */);
    
    /* data */
    double_t * raw_data = NULL;
    MALLOC_READ_VARIABLE_FROM_ARRAY(double_t *, data, sizeof(double_t), num_vectors * vector_dims, array, /* no cleanup code */);
    data = (double_t *) malloc(num_vectors * vector_dims * sizeof(double_t));
    if (data == NULL) {
        PRINTF_STDERR("Failed to allocate " << (num_vectors * vector_dims * sizeof(double_t)) << " bytes for " << "data" << "." << std::endl);
        do {
            free(raw_data);
        } while (0);
        return MALLOC_FAILED;
    }
    do {
        uint_t i;
        for (i = 0; i < num_vectors; i++) {
            uint_t j;
            for (j = 0; j < vector_dims; j++) {
#ifndef __AUTOESL__
                data[i * num_vectors + j] = raw_data[i * num_vectors + j];
#else
                data[i * num_vectors + j].data = raw_data[i * num_vectors + j];
                data[i * num_vectors + j].keep = 0;
                data[i * num_vectors + j].last = 0;
#endif /* #ifndef __AUTOESL__ */
            }
        }
        free(raw_data);
    } while(0);
    
    /* k */
    READ_VARIABLE_FROM_ARRAY(&k, sizeof(size_t), 1, array, free(data););
    
    /* N */
    READ_VARIABLE_FROM_ARRAY(&N, sizeof(size_t), 1, array, free(data););
    
    /* block_size */
    READ_VARIABLE_FROM_ARRAY(&block_size, sizeof(size_t), 1, array, free(data););
    
    /* outliers */
    MALLOC_READ_VARIABLE_FROM_ARRAY(index_t *, outliers, sizeof(index_t), N, array, free(data););
    
    /* outlier_scores */
    MALLOC_READ_VARIABLE_FROM_ARRAY(double_t *, outlier_scores, sizeof(double_t), N, array, free(data); free(outliers););
    
    return SUCCESS;
}

