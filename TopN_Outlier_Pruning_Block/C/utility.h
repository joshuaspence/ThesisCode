#ifndef UTILITY_H_
#define UTILITY_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
/* For boolean, index_t, ARRAY_SIGNATURE */
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
boolean equals_zero(const double x);

/*
 * Calculate the square of the Euclidean distance between two vectors (i.e. the 
 * sum of the squares of the distance in each dimension).
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
double distance_squared(const double * const ARRAY_SIGNATURE(vectors), const index_t vector1, const index_t vector2);

#endif /* #ifndef UTILITY_H_ */
