/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */

#include "test.h" /* main header file */
#include "top_n_outlier_pruning_block.h" /* for top_n_outlier_pruning_block */
#include "utility.h" /* for boolean, index_t, double_t, false, lint_t, PRINTF_STDOUT, true, uint_t */
#include "vardump.h" /* for read_vardump */

#include <stdlib.h> /* for size_t, free */
/*----------------------------------------------------------------------------*/

#ifndef VARDUMP
    #error "This file requires VARDUMP to be enabled."
#endif /* #ifndef VARDUMP */

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
    MEMSET_1D(outliers,       0, N, sizeof(index_t));
    MEMSET_1D(outlier_scores, 0, N, sizeof(double_t));
    
    /* Call the function. */
    PRINTF_STDOUT("Running top_n_outlier_pruning_block() for data set '%s'.\n", data_file);
#ifndef HARDCODED_NUM_VECTORS
    set_num_vectors(num_vectors);
#endif /* #ifndef HARDCODED_NUM_VECTORS */
#ifndef HARDCODED_VECTOR_DIMS
    set_vector_dims(vector_dims);
#endif /* #ifndef HARDCODED_VECTOR_DIMS */
#ifndef HARDCODED_K
    set_k(k);
#endif /* #ifndef HARDCODED_K */
#ifndef HARDCODED_N
    set_N(N);
#endif /* #ifndef HARDCODED_N */
#if defined(BLOCKING) && !defined(HARDCODED_BLOCK_SIZE)
    set_block_size(block_size);
#endif /* #if defined(BLOCKING) && !defined(HARDCODED_BLOCK_SIZE) */
    const uint_t num_pruned = top_n_outlier_pruning_block((void *) data, outliers, outlier_scores);
    
    /* Compare outliers. */
    do {
        PRINTF_STDOUT("Comparing outliers... ");
        
        uint_t i;
        uint_t similarity = 0;
        boolean used[N];
        MEMSET_1D(used, false, N, sizeof(boolean));
        for (i = 0; i < N; i++) {
            uint_t j;
            for (j = 0; j < N; j++) {
                if (!used[j] && outliers_expected[i] == outliers[j]) {
                    used[j] = true;
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
        PRINTF_STDOUT("Comparing scores... ");
        
        uint_t i;
        uint_t similarity = 0;
        boolean used[N];
        MEMSET_1D(used, false, N, sizeof(boolean));
        for (i = 0; i < N; i++) {
            uint_t j;
            for (j = 0; j < N; j++) {
                if (!used[j] && outlier_scores_expected[i] == outlier_scores[j]) {
                    used[j] = true;
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
    
    PRINTF_STDOUT("Number of pruned vectors = %u\n", num_pruned);
    
    return failed;
}
