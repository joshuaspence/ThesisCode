#ifndef UTILITY_H_
#define UTILITY_H_

#include "macros.h" /* for ARRAY_DOUBLE_T, ARRAY_PARAMS */

/* For comparing floating point numbers to zero. */
#define EPSILON			0.0000001

/*
 * Check if a double is equal to zero (within a small tolerance epsilon).
 *
 * Parameters:
 *     - x: The value to be compared with zero.
 *
 * Return:
 *    True if the input x is within epsilon of zero, otherwise false.
 */
boolean equals_zero(const double x);

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
ARRAY_DOUBLE_T average_over_row(const ARRAY_DOUBLE_T * const ARRAY_PARAMS(array), const unsigned int row);

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
ARRAY_DOUBLE_T distance(const ARRAY_DOUBLE_T * const ARRAY_PARAMS(vectors), const unsigned int vector1, const unsigned int vector2);

#endif /* #ifndef UTILITY_H_ */
