/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "stats.h" /* for get_stats */
#include "test.h" /* main header file */
#include "top_n_outlier_pruning_block.h" /* for top_n_outlier_pruning_block */
#include "utility.h" /* for boolean, index_t, double_t, false, lint_t, MEMSET, PRINTF_STDOUT, true, uint_t */
#include "vardump.h" /* for read_vardump */

#include <stdlib.h> /* for size_t, free */
/*----------------------------------------------------------------------------*/

/*
 * Reads variable from a variable dump file and runs the
 * top_n_outlier_pruning_block algorithm on the input data. After the algorithm 
 * completes, compares the actual output with the expected output.
 *
 * Parameters:
 *     - data_file: The variable dump file to read the data from.
 *
 * Return:
 *    Zero if the test was successful, otherwise 1.
 */
int test(const char * const data_file) {
    boolean failed = false;
       
    size_t num_vectors;
    size_t vector_dims;
    double_t * data;
    size_t k;
    size_t N;
    size_t block_size;
    index_t * outliers_expected;
    double_t * outlier_scores_expected;
    
    PRINTF_STDOUT("Reading variables from '%s'.\n", data_file); 
    int result;
    if ((result = read_vardump(data_file, &num_vectors, &vector_dims, &data, &k, &N, &block_size, &outliers_expected, &outlier_scores_expected)) != 0)
        return result;
    
    /* Create the output arrays. */
    index_t  outliers      [N];
    double_t outlier_scores[N];
    MEMSET(outliers,       0, N, sizeof(index_t));
    MEMSET(outlier_scores, 0, N, sizeof(double_t));
    
    /* Call the function. */
    PRINTF_STDOUT("Running top_n_outlier_pruning_block(...) for data set '%s'.\n", data_file);
    top_n_outlier_pruning_block(num_vectors, vector_dims, (const double_t (*)[MAX_NUM_VECTORS(num_vectors) * MAX_VECTOR_DIMS(vector_dims)]) data, k, N, block_size, outliers, outlier_scores);
    
    /* Compare outliers. */
    do {
        PRINTF_STDOUT("Comparing outliers... ");
        
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
        
        PRINTF_STDOUT("%u out of %u\n", (unsigned int) similarity, (unsigned int) N);
        
        if (similarity != N)
            failed = true;
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
        
        PRINTF_STDOUT("%u out of %u\n", (unsigned int) similarity, (unsigned int) N);
        
        if (similarity != N)
            failed = true;
    } while (0);
    
    /* Free dynamic memory. */
    free(data);
    free(outliers_expected);
    free(outlier_scores_expected);
    
#ifdef STATS
    /* Print the number of calls to the distance function */
    lint_t num_calls;
    uint_t num_pruned;
    lint_t num_scaled_pruned;
    
    get_stats(&num_calls, &num_pruned, &num_scaled_pruned);
    PRINTF_STDOUT("Calls to distance function = %llu\n", num_calls);
    PRINTF_STDOUT("Number of pruned vectors = %u\n", num_pruned);
    PRINTF_STDOUT("Number of pruned vectors (scaled) = %llu\n", num_scaled_pruned);
#endif /* #ifdef STATS */
    
    return failed;
}
