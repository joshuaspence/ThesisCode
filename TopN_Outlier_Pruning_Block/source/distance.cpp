/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.hpp" /* check for invalid preprocessor macro combinations */
#include "arch.hpp" /* set architecture specific macros */

#include "distance.hpp" /* main include file */
#include "parameters.hpp" /* for vector_dims_value */
#include "utility.hpp" /* for ASSERT, double_t, double_in_t, double_out_t, uint_t */

#ifdef __AUTOESL__
    #include "ap_interfaces.h" /* for AP_INTERFACE */
#endif /* #ifdef __AUTOESL__ */
/*----------------------------------------------------------------------------*/

void distance_squared(
#if defined(__AUTOESL__) && defined(TOP__DISTANCE_SQUARED)
                      const double_in_t vector1[vector_dims_value],
                      const double_in_t vector2[vector_dims_value],
                      double_out_t & sum
#else
                      const double_t vector1[vector_dims_value],
                      const double_t vector2[vector_dims_value],
                      double_t & sum
#endif /* #if defined(__AUTOESL__) && defined(TOP__DISTANCE_SQUARED) */
                      ) {
    ASSERT(vector_dims_value > 0);
    
#ifndef __AUTOESL__
    #define SUM_SPLIT (1)
#else
    #define SUM_SPLIT (8)
#endif /* #ifndef __AUTOESL__ */
    
    double_t sum_of_squares__split[SUM_SPLIT] = { 0 };
    
    uint_t dim;
    dimension_loop: for (dim = 0; dim < vector_dims_value; dim++) {
#if defined(__AUTOESL__) && defined(TOP__DISTANCE_SQUARED)
        const double_t vector1_data            = vector1[dim].data;
        const double_t vector2_data            = vector2[dim].data;
#else
        const double_t vector1_data            = vector1[dim];
        const double_t vector2_data            = vector2[dim];
#endif /* #if defined(__AUTOESL__) && defined(TOP__DISTANCE_SQUARED) */
        const double_t diff                    = vector1_data - vector2_data;
        const double_t diff_squared            = diff * diff;
        sum_of_squares__split[dim % SUM_SPLIT] += diff_squared;
    }
    
    sum = 0;
    uint_t i;
    sum_loop: for (i = 0; i < SUM_SPLIT; i++) {
        sum += sum_of_squares__split[i];
    }
}
