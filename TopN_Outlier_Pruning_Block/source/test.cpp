/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */

#include "test.h" /* main header file */
#include "top_n_outlier_pruning_block.h" /* for top_n_outlier_pruning_block */
#include "utility.h" /* for boolean, index_t, double_t, false, PRINTF_STDOUT, size_t, true, uint_t */
#include "vardump.h" /* for read_vardump */

#include <stdlib.h> /* for free */
/*----------------------------------------------------------------------------*/

/*
 * Run the algorithm and compare the results with the specified (expected)
 * results.
 */
static boolean do_test(const char * const dataset,
                       const UNUSED size_t num_vectors,
                       const UNUSED size_t vector_dims,
                       const double_in_t * const data,
                       const UNUSED size_t k,
                       const UNUSED size_t N,
                       const UNUSED size_t block_size,
                       const index_t * const outliers_expected,
                       const double_t * const outlier_scores_expected) {
    boolean failed = false;
    
    /* Create the output arrays. */
    index_t  outliers      [N];
    double_t outlier_scores[N];
    MEMSET_1D(outliers,       0, N, sizeof(index_t));
    MEMSET_1D(outlier_scores, 0, N, sizeof(double_t));
    
    /* Call the function. */
    PRINTF_STDOUT("Running top_n_outlier_pruning_block function for data set '%s'.\n", dataset);
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
    
    const UNUSED uint_t num_pruned = top_n_outlier_pruning_block(const_cast<const double_in_t * const>(data), outliers, outlier_scores);
    
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
    
    PRINTF_STDOUT("Number of pruned vectors = %u\n", num_pruned);
    return failed;
}

boolean test_from_file(const char * const dataset, const char * filename) {    
    /* The inputs to the top_n_outlier_pruning_block_function. */
    size_t num_vectors;
    size_t vector_dims;
    double_in_t * data;
    size_t k;
    size_t N;
    size_t block_size;
    
    /* The expected outpt from the top_n_outlier_pruning_block_function. */
    index_t * outliers_expected;
    double_t * outlier_scores_expected;
    
    PRINTF_STDOUT("Reading variables from file '%s' for dataset '%s'.\n", filename, dataset);
    int result;
        if ((result = read_vardump_from_file(filename, &num_vectors, &vector_dims, &data, &k, &N, &block_size, &outliers_expected, &outlier_scores_expected)) != 0)
            return true; /* test failed */
    
    /* Run the algorithm and compares the results. */
    const boolean failed = do_test(dataset, num_vectors, vector_dims, data, k, N, block_size,outliers_expected, outlier_scores_expected);
    
    /* Free dynamic memory. */
    free(data);
    free(outliers_expected);
    free(outlier_scores_expected);
    
    return failed;
}

boolean test_from_array(const char * const dataset, const unsigned char * array) {
    /* The inputs to the top_n_outlier_pruning_block_function. */
    size_t num_vectors;
    size_t vector_dims;
    double_in_t * data;
    size_t k;
    size_t N;
    size_t block_size;
    
    /* The expected outpt from the top_n_outlier_pruning_block_function. */
    index_t * outliers_expected;
    double_t * outlier_scores_expected;
    
    PRINTF_STDOUT("Reading variables from variable for dataset '%s'.\n", dataset);
    int result;
        if ((result = read_vardump_from_array(&array, &num_vectors, &vector_dims, &data, &k, &N, &block_size, &outliers_expected, &outlier_scores_expected)) != 0)
            return true; /* test failed */
    
    /* Run the algorithm and compares the results. */
    const boolean failed = do_test(dataset, num_vectors, vector_dims, data, k, N, block_size,outliers_expected, outlier_scores_expected);
    
    /* Free dynamic memory. */
    free(data);
    free(outliers_expected);
    free(outlier_scores_expected);
    
    return failed;
}
