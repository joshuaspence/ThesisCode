#ifndef TEST_H_
#define TEST_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "utility.h" /* for __BEGIN_DECLS, __END_DECLS, size_t */
/*----------------------------------------------------------------------------*/

/* Options to perform tests using embedded data files or extenal files. */
#define TEST_TYPE_DISABLED  (1)
#define TEST_TYPE_EMBEDDED  (2)
#define TEST_TYPE_FILE      (3)

__BEGIN_DECLS

/*
 * Reads variable from a variable dump file or an internal variable and runs the
 * top_n_outlier_pruning_block algorithm on the input data. After the algorithm
 * completes, compares the actual output with the expected output.
 *
 * Parameters:
 *     - dataset: The name of the data set.
 *     - input: The name of the variable dump file / internal variable.
 *
 * Return:
 *    Zero if the test was successful, otherwise 1.
 */
int test(
    const char * const dataset,
    const unsigned char * const input
    );

__END_DECLS

#endif /* #ifndef TEST_H_ */
