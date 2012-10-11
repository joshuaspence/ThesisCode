#ifndef DISTANCE_H_
#define DISTANCE_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */

#include "parameters.h" /* for vector_dims_value */
#include "utility.h" /* for __BEGIN_DECLS, __END_DECLS, double_t, double_in_t, double_out_t */
/*----------------------------------------------------------------------------*/

__BEGIN_DECLS

/*
 * Calculate the square of the Euclidean distance between two vectors (i.e. the
 * sum of the squares of the distance in each dimension).
 *
 * Parameters:
 *     - vector1: An array of floating point numbers representing the first
 *           vector.
 *     - vector2: An array of floating point numbers representing the second
 *           vector.
 *     - sum: The return value for the function, equal to the square of the
 *           distance between the two vectors.
 */
void distance_squared(
#if defined(__AUTOESL__) && defined(TOP__DISTANCE_SQUARED)
    const double_in_t vector1[BOUNDS(vector_dims_value)],
    const double_in_t vector2[BOUNDS(vector_dims_value)],
    double_out_t & sum
#else
    const double_t vector1[BOUNDS(vector_dims_value)],
    const double_t vector2[BOUNDS(vector_dims_value)],
    double_t & sum
#endif /* #if defined(__AUTOESL__) && defined(TOP__DISTANCE_SQUARED) */
    );

__END_DECLS

#endif /* #ifndef DISTANCE_H_ */
