#ifndef TEST_H_
#define TEST_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "utility.h" /* for __BEGIN_DECLS, __END_DECLS */
#include <string> /* for std::string */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Test types                                                                 */
/*============================================================================*/
#define TEST_TYPE_DISABLED  (1)
#define TEST_TYPE_EMBEDDED  (2)
#define TEST_TYPE_FILE      (3)

#ifndef TEST_TYPE
    #define TEST_TYPE       TEST_TYPE_DISABLED
#endif /* #ifndef TEST_TYPE */
/*----------------------------------------------------------------------------*/

__BEGIN_DECLS

/*
 * Reads variable from a variable dump file and runs the
 * top_n_outlier_pruning_block algorithm on the input data. After the algorithm
 * completes, compares the actual output with the expected output.
 *
 * Parameters:
 *     - dataset: The name of the data set being tested.
 *     - filename: The name of the variable dump file.
 *
 * Return:
 *     False is the test was successful. True if the test failed.
 */
bool test_from_file(
    const std::string & dataset,
    const std::string & filename
    );

/*
 * Reads variables from an internal array and runs the
 * top_n_outlier_pruning_block algorithm on the input data. After the algorithm
 * completes, compares the actual output with the expected output.
 *
 * Parameters:
 *     - dataset: The name of the data set being tested.
 *     - array: The array containing the data set data.
 *
 * Return:
 *     False is the test was successful. True if the test failed.
 */
bool test_from_array(
    const std::string & dataset,
    const unsigned char array[]
    );

__END_DECLS

#endif /* #ifndef TEST_H_ */
