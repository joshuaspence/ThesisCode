/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.hpp" /* check for invalid preprocessor macro combinations */
#include "arch.hpp" /* set architecture specific macros */

#include "test.hpp" /* for test, TEST_TYPE_DISABLED, TEST_TYPE_EMBEDDED, TEST_TYPE_FILE */
#include <string> /* for std::endl, std::string */
/*----------------------------------------------------------------------------*/

#if (TEST_TYPE == TEST_TYPE_EMBEDDED)
/*============================================================================*/
/* All data sets                                                              */
/*============================================================================*/
#include "all_datasets.h" /* for data set arrays */
/*----------------------------------------------------------------------------*/
#endif /* #if (TEST_TYPE == TEST_TYPE_EMBEDDED) */

/*
 * A wrapper to test the algorithm on a specified data set.
 *
 * Return:
 *    The number of failed tests.
 */
int main(int argc, char * argv[]) {
    if (argc <= 1) {
        PRINTF_STDERR("No data set specified!" << std::endl);
        return -1;
    } else {
#if (TEST_TYPE == TEST_TYPE_FILE)
        const std::string filename (argv[1]);
        return test_from_file(filename, filename);
#elif (TEST_TYPE == TEST_TYPE_EMBEDDED)
        const std::string dataset (argv[1]);
        return test_embedded_dataset(dataset);
#elif (TEST_TYPE == TEST_TYPE_DISABLED)
    #error "Tests are disabled."
#endif /* #if (TEST_TYPE == TEST_TYPE_FILE) */
    }
}
