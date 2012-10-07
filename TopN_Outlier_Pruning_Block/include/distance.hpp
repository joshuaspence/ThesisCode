#ifndef DISTANCE_HPP_
#define DISTANCE_HPP_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.hpp" /* check for invalid preprocessor macro combinations */
#include "arch.hpp" /* set architecture specific macros */

#include "utility.hpp" /* for __BEGIN_DECLS, __END_DECLS, double_in_t, double_out_t */
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
    const double_in_t vector1[],
    const double_in_t vector2[],
    double_out_t & sum
    );

__END_DECLS

#endif /* #ifndef DISTANCE_HPP_ */
