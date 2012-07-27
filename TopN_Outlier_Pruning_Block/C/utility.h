#ifndef UTILITY_H_
#define UTILITY_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
/* For boolean, array_double_t, array_index_t, ARRAY_SIGNATURE */
#include "macros.h"
/*----------------------------------------------------------------------------*/

/* For comparing floating point numbers to zero. */
#define EPSILON         0.0000001

/*
 * Check if a double is equal to zero (within a small tolerance epsilon).
 *
 * Parameters:
 *     - x: The value to be compared with zero.
 *
 * Return:
 *    True if the input x is within epsilon of zero, otherwise false.
 */
boolean equals_zero(const array_double_t x);

/*
 * Calculate the average of all values within a single row of an array.
 *
 * Parameters:
 *     - array: The array of which to calculate the average over a row.
 *     - array_rows: The number of rows in the array.
 *     - array_cols: The number of columns in the array.
 *     - row: The row number of the row to be averaged. Note that the row index 
 *           follows the MATLAB convention of beginning at 1.
 *
 * Return:
 *    The average of all values within the single row of the array.
 */
array_double_t average_over_row(const array_double_t * const ARRAY_SIGNATURE(array), const array_index_t row);

/*
 * Calculate the Euclidean distance between two vectors (square root of the sum 
 * of the squares of the distance in each dimension).
 *
 * Parameters:
 *     - vectors: The array containg the vectors between which to calculate the 
 *           distance.
 *     - vectors_rows: The number of vectors contained within the array.
 *     - vectors_cols: The size of each vector within the array.
 *     - vector1: The row index of one of the vectors. Note that the row index 
 *           follows the MATLAB convention of beginning at 1.
 *     - vector2: The row index of the other vector. Note that the row index 
 *           follows the MATLAB convention of beginning at 1.
 *
 * Return:
 *    The sum of the distance between values of the rows.
 */
array_double_t distance(const array_double_t * const ARRAY_SIGNATURE(vectors), const array_index_t vector1, const array_index_t vector2);

/*
 * Round a double to a specified number of digits.
 *
 * Parameters:
 *     - num: The decimal number to be rounded.
 *     - num_dp: The number of decimals places to be rounded to.
 *
 * Return:
 *    The rounded decimal number.
 */
array_double_t round_dp(const array_double_t num, const unsigned int num_dp);

#endif /* #ifndef UTILITY_H_ */
