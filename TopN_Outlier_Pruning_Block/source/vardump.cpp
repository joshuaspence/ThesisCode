/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "utility.h" /* for dbl_t, FILE_EXPECTED_EOF, FILE_IO_ERROR, FILE_NOT_FOUND, index_t, MALLOC_FAILED, size_t, SUCCESS */
#include "vardump.h" /* main header file */

#include <errno.h> /* for errno */
#include <stdlib.h> /* for free, malloc */
#include <stdio.h> /* for FILE, fclose, feof, fopen, fread, fwrite */
#include <string.h> /* for strerror */

#include <string> /* for std::string, std::endl */
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

/*
 * A function to write a variable to a given file.
 */
static int write_variable_to_file(const void * var, const size_t size, const size_t count, FILE * fp) {
    const unsigned char * ptr = (unsigned char *) var; /* current starting address for write operation */
    unsigned int counter = 0;
    
    while (counter++ < count) {
        const size_t elems = 1;
        size_t result;
        if ((result = fwrite(ptr, size, elems, fp)) != elems) {
            PRINTF_STDERR("Error writing to file. Expected count = " << elems << ". Actual count = " << result << "." << std::endl);
            perror("File I/O error");
            return FILE_IO_ERROR;
        }
        ptr += size;
    }
    
    return SUCCESS;
}

/*
 * TODO
 */
static int read_variable_from_file(void * var, const size_t size, const size_t count, FILE * fp) {
    size_t result;
    if ((result = fread(var, size, count, fp)) != count) {
        PRINTF_STDERR("Error reading from file. Expected count = " << count << ". Actual count = " << result << "." << std::endl);
        perror("File I/O error");
        return FILE_IO_ERROR;
    }
    
    return SUCCESS;
}

/*
 * TODO
 */
static int malloc_read_variable_from_file(void ** var, const size_t size, const size_t count, FILE * fp) {
    *var = malloc(count * size);
    if (*var == NULL) {
        PRINTF_STDERR("Failed to allocate " << (count * size) << " bytes.");
        return MALLOC_FAILED;
    } else {
        return read_variable_from_file(*var, size, count, fp);
    }
    
    return SUCCESS;
}

/*
 * TODO
 */
static int read_variable_from_array(void * var, const size_t size, const size_t count, const unsigned char ** array) {
    size_t result;
    if ((result = memread(var, size, count, array)) != count) {
        PRINTF_STDERR("Error reading from array. Expected count = " << count << ". Actual count = " << result << "." << std::endl);
        return FILE_IO_ERROR;
    }
    
    return SUCCESS;
}

/*
 * TODO
 */
static int malloc_read_variable_from_array(void ** var, const size_t size, const size_t count, const unsigned char ** array) {
    *var = malloc(count * size);
    if (*var == NULL) {
        PRINTF_STDERR("Failed to allocate " << (count * size) << " bytes." << std::endl);
        return MALLOC_FAILED;
    } else {
        return read_variable_from_array(*var, size, count, array);
    }
    
    return SUCCESS;
}

int save_vardump(
        const std::string & filename,
        const size_t & num_vectors,
        const size_t & vector_dims,
        const dbl_t * const & data,
        const size_t & k,
        const size_t & N,
        const size_t & block_size,
        const index_t * const & outliers,
        const dbl_t * const & outlier_scores
        ) {
    FILE * fp = fopen(filename.c_str(), "wb");
    if (fp == NULL) {
        PRINTF_STDERR("Error opening file: " << filename << std::endl);
        return FILE_NOT_FOUND;
    }
    
    /* num_vectors */
    write_variable_to_file(&num_vectors, sizeof(size_t), 1, fp);
    
    /* vector_dims */
    write_variable_to_file(&vector_dims, sizeof(size_t), 1, fp);
    
    /* data */
    write_variable_to_file(data, sizeof(dbl_t), num_vectors * vector_dims, fp);
    
    /* k */
    write_variable_to_file(&k, sizeof(size_t), 1, fp);
    
    /* N */
    write_variable_to_file(&N, sizeof(size_t), 1, fp);
    
    /* block_size */
    write_variable_to_file(&block_size, sizeof(size_t), 1, fp);
    
    /* outliers */
    write_variable_to_file(&outliers, sizeof(index_t), N, fp);
    
    /* outlier_scores */
    write_variable_to_file(&outlier_scores, sizeof(dbl_t), N, fp);
    
    if (fclose(fp) != 0) {
        PRINTF_STDERR("Error closing file." << std::endl);
        return FILE_IO_ERROR;
    }
    
    return SUCCESS;
}

int read_vardump_from_file(
        const std::string & filename,
        size_t & num_vectors,
        size_t & vector_dims,
        dbl_t * & data,
        size_t & k,
        size_t & N,
        size_t & block_size,
        index_t * & outliers,
        dbl_t * & outlier_scores
        ) {
    FILE * fp = fopen(filename.c_str(), "rb");
    if (fp == NULL) {
        PRINTF_STDERR("Error opening " << filename << ": " << strerror(errno) << " (" << errno << ")" << std::endl);
        return FILE_NOT_FOUND;
    }
    
    /* num_vectors */
    read_variable_from_file(&num_vectors, sizeof(size_t), 1, fp);
    
    /* vector_dims */
    read_variable_from_file(&vector_dims, sizeof(size_t), 1, fp);
    
    /* data */
    malloc_read_variable_from_file((void **) &data, sizeof(dbl_t), num_vectors * vector_dims, fp);
    
    /* k */
    read_variable_from_file(&k, sizeof(size_t), 1, fp);
    
    /* N */
    read_variable_from_file(&N, sizeof(size_t), 1, fp);
    
    /* block_size */
    read_variable_from_file(&block_size, sizeof(size_t), 1, fp);
    
    /* outliers */
    malloc_read_variable_from_file((void **) &outliers, sizeof(index_t), N, fp);
    
    /* outlier_scores */
    malloc_read_variable_from_file((void **) &outlier_scores, sizeof(dbl_t), N, fp);
    
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

int read_vardump_from_array(
        const unsigned char ** const & array,
        size_t & num_vectors,
        size_t & vector_dims,
        dbl_t * & data,
        size_t & k,
        size_t & N,
        size_t & block_size,
        index_t * & outliers,
        dbl_t * & outlier_scores
        ) {
    /* num_vectors */
    read_variable_from_array(&num_vectors, sizeof(size_t), 1, array);
    
    /* vector_dims */
    read_variable_from_array(&vector_dims, sizeof(size_t), 1, array);
    
    /* data */
    dbl_t * raw_data = NULL;
    malloc_read_variable_from_array((void **) &data, sizeof(dbl_t), num_vectors * vector_dims, array);
    data = (dbl_t *) malloc(num_vectors * vector_dims * sizeof(dbl_t));
    if (data == NULL) {
        PRINTF_STDERR("Failed to allocate " << (num_vectors * vector_dims * sizeof(dbl_t)) << " bytes for " << "data" << "." << std::endl);
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
                data[i * num_vectors + j] = raw_data[i * num_vectors + j];
            }
        }
        free(raw_data);
    } while (0);
    
    /* k */
    read_variable_from_array(&k, sizeof(size_t), 1, array);
    
    /* N */
    read_variable_from_array(&N, sizeof(size_t), 1, array);
    
    /* block_size */
    read_variable_from_array(&block_size, sizeof(size_t), 1, array);
    
    /* outliers */
    malloc_read_variable_from_array((void **) &outliers, sizeof(index_t), N, array);
    
    /* outlier_scores */
    malloc_read_variable_from_array((void **) &outlier_scores, sizeof(dbl_t), N, array);
    
    return SUCCESS;
}
