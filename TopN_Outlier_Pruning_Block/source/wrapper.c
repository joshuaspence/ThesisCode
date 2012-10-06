/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */

#include "test.h" /* for test, TEST_TYPE_DISABLED, TEST_TYPE_EMBEDDED, TEST_TYPE_FILE */
/*----------------------------------------------------------------------------*/

#if (TEST_TYPE == TEST_TYPE_EMBEDDED)
/*============================================================================*/
/* All data sets                                                              */
/*============================================================================*/
#include "all_datasets.h"
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
        PRINTF_STDERR("No data set specified!\n");
        return -1;
    } else {
#if (TEST_TYPE == TEST_TYPE_FILE)
        return test_from_file(argv[1], argv[1]);
#elif (TEST_TYPE == TEST_TYPE_EMBEDDED)
        return test_embedded_dataset(argv[1]);
#elif (TEST_TYPE == TEST_TYPE_DISABLED)
    #error "Tests are disabled."
#else
    #error "No test type is defined."
#endif /* #if (TEST_TYPE == TEST_TYPE_FILE) */
    }
}
