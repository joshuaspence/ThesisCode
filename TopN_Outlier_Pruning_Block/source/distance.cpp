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

void distance_squared(const double_in_t vector1[],
                      const double_in_t vector2[],
                      double_t & sum) {
#ifdef __AUTOESL__
    #pragma AP INTERFACE ap_ctrl_hs port=return
    
    /* Define AutoESL native interface behavior for val1 and val2 */
    AP_INTERFACE(sum, ap_none);
    
    /* Map the control of the function to AXI4-lite */
    AP_CONTROL_BUS_AXI(CONTROL_BUS);
    
    /* Map val1 and val2 from a native AutoESL interface to AXI4-lite */
    AP_BUS_AXI4_LITE(sum, CONTROL_BUS);
    
    /* Create an AXI4-stream interface for arrays A and B */
    AP_BUS_AXI_STREAMD(vector1, INPUT_STREAM_A);
    AP_BUS_AXI_STREAMD(vector2, INPUT_STREAM_B);
#endif /* #ifdef __AUTOESL__ */
    
    ASSERT(vector_dims_value > 0);
    
#ifndef __AUTOESL__
    #define SUM_SPLIT (1)
#else
    #define SUM_SPLIT (8)
#endif /* #ifndef __AUTOESL__ */
    
    double_t sum_of_squares__split[SUM_SPLIT] = { 0 };
    
    uint_t dim;
    dimension_loop: for (dim = 0; dim < HARDCODED_VECTOR_DIMS; dim++) {
#ifdef __AUTOESL__
    #pragma AP PIPELINE II=1
#endif /* #ifdef __AUTOESL__ */
#ifndef __AUTOESL__
        const double_t vector1_data            = vector1[dim];
        const double_t vector2_data            = vector2[dim];
#else
        const double_t vector1_data            = vector1[dim].data;
        const double_t vector2_data            = vector2[dim].data;
#endif /* #ifndef __AUTOESL__ */
        const double_t diff                    = vector1_data - vector2_data;
        const double_t diff_squared            = diff * diff;
        sum_of_squares__split[dim % SUM_SPLIT] += diff_squared;
    }
    
    sum = 0;
    uint_t i;
    sum_loop: for (i = 0; i < SUM_SPLIT; i++) {
#ifdef __AUTOESL__
    #pragma AP UNROLL
#endif /* #ifdef __AUTOESL__ */
        sum += sum_of_squares__split[i];
    }
}
