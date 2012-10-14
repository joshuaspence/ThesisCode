/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.hpp" /* check for invalid preprocessor macro combinations */
#include "arch.hpp" /* set architecture specific macros */

#include "test.hpp" /* main header file */
#include "top_n_outlier_pruning_block.hpp" /* for top_n_outlier_pruning_block */
#include "utility.hpp" /* for index_t, double_t, size_t, uint_t */
#include "vardump.hpp" /* for read_vardump */

#include <stdlib.h> /* for free */
#include <string> /* for std::endl, std::string */
/*----------------------------------------------------------------------------*/

/*
 * Run the algorithm and compare the results with the specified (expected)
 * results.
 */
static bool do_test(
		const std::string & dataset,
		const size_t num_vectors,
		const size_t vector_dims,
		const double_t data[],
		const size_t k,
		const size_t N,
		const size_t block_size,
		const index_t outliers_expected[],
		const double_t outlier_scores_expected[]
		) {
    bool failed = false;
    
    /* Create the output arrays. */
    index_t  outliers      [N];
    double_t outlier_scores[N];
    MEMSET_1D(outliers,       0, N, sizeof(index_t));
    MEMSET_1D(outlier_scores, 0, N, sizeof(double_t));
    
    /* Call the function. */
    PRINTF_STDOUT("Running top_n_outlier_pruning_block function for data set '" << dataset << "'" << std::endl);    
    const UNUSED uint_t num_pruned = top_n_outlier_pruning_block(num_vectors, vector_dims, const_cast<const double_in_t * const>(data), k, N, block_size, outliers, outlier_scores);
    
    /* Compare outliers. */
    do {
        PRINTF_STDOUT("Comparing outliers... ");
        uint_t i;
        uint_t similarity = 0;
        bool used[N];
        MEMSET_1D(used, false, N, sizeof(bool));
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
        
        PRINTF_STDOUT(similarity << " out of " << N << std::endl);
        if (similarity != N)
            failed = true;
    } while (0);
    
    /* Compare scores. */
    do {
        PRINTF_STDOUT("Comparing scores... ");
        uint_t i;
        uint_t similarity = 0;
        bool used[N];
        MEMSET_1D(used, false, N, sizeof(bool));
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
        
        PRINTF_STDOUT(similarity << " out of " << N << std::endl);
        if (similarity != N)
            failed = true;
    } while (0);
    
    PRINTF_STDOUT("Number of pruned vectors = " << num_pruned << std::endl);
    return failed;
}

bool test_from_file(const std::string & dataset, const std::string & filename) {    
    /* The inputs to the top_n_outlier_pruning_block_function. */
    size_t num_vectors;
    size_t vector_dims;
    double_t * data;
    size_t k;
    size_t N;
    size_t block_size;
    
    /* The expected outpt from the top_n_outlier_pruning_block_function. */
    index_t * outliers_expected;
    double_t * outlier_scores_expected;
    
    PRINTF_STDOUT("Reading variables from file '" << filename << "' for dataset '" << dataset << "'" << std::endl);
    int result;
        if ((result = read_vardump_from_file(filename, num_vectors, vector_dims, data, k, N, block_size, outliers_expected, outlier_scores_expected)) != 0)
            return true; /* test failed */
    
    /* Run the algorithm and compares the results. */
    const bool failed = do_test(dataset, num_vectors, vector_dims, data, k, N, block_size, outliers_expected, outlier_scores_expected);
    
    /* Free dynamic memory. */
    free(data);
    free(outliers_expected);
    free(outlier_scores_expected);
    
    return failed;
}

bool test_from_array(const std::string & dataset, const unsigned char array[]) {
    /* The inputs to the top_n_outlier_pruning_block_function. */
    size_t num_vectors;
    size_t vector_dims;
    double_t * data;
    size_t k;
    size_t N;
    size_t block_size;
    
    /* The expected outpt from the top_n_outlier_pruning_block_function. */
    index_t * outliers_expected;
    double_t * outlier_scores_expected;
    
    PRINTF_STDOUT("Reading variables from variable for dataset '" << dataset << "'" << std::endl);
    int result;
        if ((result = read_vardump_from_array(&array, num_vectors, vector_dims, data, k, N, block_size, outliers_expected, outlier_scores_expected)) != 0)
            return true; /* test failed */
    
    /* Run the algorithm and compares the results. */
    const bool failed = do_test(dataset.c_str(), num_vectors, vector_dims, data, k, N, block_size, outliers_expected, outlier_scores_expected);
    
    /* Free dynamic memory. */
    free(data);
    free(outliers_expected);
    free(outlier_scores_expected);
    
    return failed;
}