/* Includes */
#include <errno.h> /* for strerror, errno */
#include <stdio.h> /* for fopen, fread, fclose */
#include <stdlib.h> /* for size_t */
#include <string.h> /* for memset */
#include "utility.h" /* for double_t, index_t */
#include "stats.h" /* for get_stats */
#include "top_n_outlier_pruning_block.h" /* for top_n_outlier_pruning_block */

#define SUCCESS             (0)
#define FILE_NOT_FOUND      (1)
#define FILE_IO_ERROR       (2)
#define MALLOC_FAILED       (3)
#define FILE_EXPECTED_EOF   (4)

/*
 * Save the input and output parameters of the top_n_outlier_pruning_block 
 * function to a binary file.
 */
int read_variables_from_file(const char * const filename,
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

int main(int argc, char * argv[]) {
    /* Check for proper number of arguments. */
    if (argc < 1)
        fprintf(stderr, "No input file specified.\n");
    
    const char * const filename = argv[1];
    size_t num_vectors;
    size_t vector_dims;
    double_t * data;
    size_t k;
    size_t N;
    size_t block_size;
    index_t * outliers_expected;
    double_t * outlier_scores_expected;
    
    int result;
    if ((result = read_variables_from_file(filename, &num_vectors, &vector_dims, &data, &k, &N, &block_size, &outliers_expected, &outlier_scores_expected)) != 0)
        return result;
    
    /* Create the output arrays. */
    index_t  outliers      [N];
    double_t outlier_scores[N];
    memset(outliers,       0, N * sizeof(index_t));
    memset(outlier_scores, 0, N * sizeof(double_t));

    /* Call the function. */
    top_n_outlier_pruning_block(num_vectors, vector_dims, (const double_t (* const)[num_vectors][vector_dims]) data, k, N, block_size, &outliers, &outlier_scores);
    
    /* Compare outliers. */
    do {
        printf("Comparing outliers... ");
        uint_t i;
        uint_t similarity = 0;
        for (i = 0; i < N; i++) {
            uint_t j;
            for (j = 0; j < N; j++) {
                if (outliers_expected[i] != outliers[j]) {
                    similarity++;
                    break;
                }
            }
        }
        printf("%u out of %u\n", (unsigned int) similarity, (unsigned int) N); 
    } while (0);
    
    /* Compare scores. */
    do {
        printf("Comparing scores... ");
        uint_t i;
        uint_t similarity = 0;
        for (i = 0; i < N; i++) {
            uint_t j;
            for (j = 0; j < N; j++) {
                if (outlier_scores_expected[i] != outlier_scores[j]) {
                    similarity++;
                    break;
                }
            }
        }
        printf("%u out of %u\n", (unsigned int) similarity, (unsigned int) N); 
    } while (0);
    
    /* Free dynamic memory. */
    free(data);
    free(outliers_expected);
    free(outlier_scores_expected);
    
#ifdef STATS
    /* Print the number of calls to the distance function */
    lint_t num_calls;
    uint_t num_pruned;
    
    get_stats(&num_calls, &num_pruned);
    printf("\nCalls to distance function = %llu\n", num_calls);
    printf("Number of pruned vectors = %u\n", num_pruned);
#endif /* #ifdef STATS */

    return SUCCESS;
}
