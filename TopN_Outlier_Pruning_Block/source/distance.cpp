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

void distance_squared(double_in_t vector1[256],
                      double_in_t vector2[256],
                      double_t * sum) {
    /* Define AutoESL native interface behavior for val1 and val2 */
    AP_INTERFACE(sum,ap_none);
    
	/* Map val1 and val2 from a native AutoESL interface to AXI4-lite */
    AP_BUS_AXI4_LITE(sum,CONTROL_BUS);
	
    /* Map the control of the function to AXI4-lite */
    AP_CONTROL_BUS_AXI(CONTROL_BUS);
    
    /* Create an AXI4-stream interface for arrays A and B */
    AP_BUS_AXI_STREAM(vector1,INPUT_BUS_A);
	AP_BUS_AXI_STREAM(vector2,INPUT_BUS_B);
    
#define SUM_SPLIT (6)
    
    double_t sum_split[SUM_SPLIT] = { 0.0 };
    
    uint_t dim;
    dimension_loop: for (dim = 0; dim < 256; dim++) {
    #pragma AP PIPELINE II=1
        const double_t v1 = vector1[dim].data;
        const double_t v2 = vector2[dim].data;

        const double_t diff         = v1 - v2;
        const double_t diff_squared = diff * diff;

        sum_split[dim % SUM_SPLIT] += diff_squared;
    }

    double_t the_sum = 0.0;
    uint_t i;
    sum_split: for (i = 0; i < SUM_SPLIT; i++) {
#pragma AP UNROLL
    	the_sum += sum_split[i];
    }
    *sum = the_sum;
}
