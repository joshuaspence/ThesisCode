/* Includes */
#include <errno.h> /* for strerror, errno */
#include <stdio.h> /* for fopen, fread, fclose */
#include <stdlib.h> /* for size_t */
#include <string.h> /* for memset */
#include "utility.h" /* for double_t, index_t */
#include "stats.h" /* for get_stats */
#include "top_n_outlier_pruning_block.h" /* for top_n_outlier_pruning_block */

#define SUCCESS			(0)
#define FILE_NOT_FOUND	(1)
#define FILE_READ_ERROR	(2)
#define MALLOC_FAILED	(3)

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
                             size_t * const default_block_size) {
    FILE * const fp = fopen(filename, "rb");
    if (fp == NULL) {
    	fprintf(stderr, "Error opening %s: %s (%u)\n", filename, strerror(errno), errno);
    	return FILE_NOT_FOUND;
    }
    
    size_t result;
    size_t count;
    
    /* num_vectors */
    count = 1;
    if ((result = fread(num_vectors, sizeof(size_t), count, fp)) != count) {
    	fprintf(stderr, "Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", "num_vectors", filename, (unsigned int) count, (unsigned int) result);
    	return FILE_READ_ERROR;
    }
    
    /* vector_dims */
    count = 1;
    if ((result = fread(vector_dims, sizeof(size_t), count, fp)) != count) {
    	fprintf(stderr, "Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", "vector_dims", filename, (unsigned int) count, (unsigned int) result);
    	return FILE_READ_ERROR;
    }
    
    /* data */
    count = *num_vectors * *vector_dims;
    *data = (double_t *) malloc(count * sizeof(double_t));
    if (*data == NULL) {
    	fprintf(stderr, "Failed to allocate %u bytes for %s.\n", (unsigned int) (count * sizeof(double_t)), "*data");
    	return MALLOC_FAILED;
    } else {
	    if ((result = fread(*data, sizeof(double_t), count, fp)) != count) {
	    	fprintf(stderr, "Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", "*data", filename, (unsigned int) count, (unsigned int) result);
	    	return FILE_READ_ERROR;
	    }
    }
    
    /* k */
    count = 1;
    if ((result = fread(k, sizeof(size_t), 1, fp)) != count) {
	    fprintf(stderr, "Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", "vector_dims", filename, (unsigned int) count, (unsigned int) result);
	    free(*data);
    	return FILE_READ_ERROR;
	}
    
    /* N */
    count = 1;
    if ((result = fread(N, sizeof(size_t), count, fp)) != count) {
    	fprintf(stderr, "Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", "vector_dims", filename, (unsigned int) count, (unsigned int) result);
    	free(*data);
    	return FILE_READ_ERROR;
	}
    
    /* default_block_size */
    count = 1;
    if ((result = fread(default_block_size, sizeof(size_t), count, fp)) != count) {
	    fprintf(stderr, "Error reading %s from file %s. Expected count = %u. Actual count = %u.\n", "vector_dims", filename, (unsigned int) count, (unsigned int) result);
	    free(*data);
    	return FILE_READ_ERROR;
    }
    
    fclose(fp);
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
    
    int result;
    if ((result = read_variables_from_file(filename, &num_vectors, &vector_dims, &data, &k, &N, &block_size)) != 0)
    	return result;
	
	/* Create the output arrays. */
    index_t  outliers      [N];
    double_t outlier_scores[N];
    memset(outliers,       0, N * sizeof(index_t));
    memset(outlier_scores, 0, N * sizeof(double_t));

    /* Call the function. */
    top_n_outlier_pruning_block(num_vectors, vector_dims, (const double_t (* const)[num_vectors][vector_dims]) data, k, N, block_size, &outliers, &outlier_scores);

    /* Free dynamic memory. */
    free(data);
    
#ifdef STATS
    /* Print the number of calls to the distance function */
    lint_t num_calls;
    uint_t num_pruned;
    
    get_stats(&num_calls, &num_pruned);
    printf("Calls to distance function = %llu\n", num_calls);
    printf("Number of pruned vectors = %u\n", num_pruned);
#endif /* #ifdef STATS */
}
