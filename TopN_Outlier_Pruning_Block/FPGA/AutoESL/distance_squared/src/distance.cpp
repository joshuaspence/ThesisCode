/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */

#include "top_n_outlier_pruning_block.h" /* for VECTOR_DIMS */
#include "utility.h" /* for ASSERT, dbl_t, dbl_in_t, dbl_out_t, uint_t */

#ifdef __AUTOESL__
	#include "ap_interfaces.h"
#endif /* #ifdef __AUTOESL__ */
/*----------------------------------------------------------------------------*/

void distance_squared(
		const dbl_in_t vector1[VECTOR_DIMS],
		const dbl_in_t vector2[VECTOR_DIMS],
		dbl_out_t & sum
		) {
    ASSERT(vector_dims_value > 0);

#ifdef __AUTOESL__
    AP_BUS_AXI4_LITE(sum,OUTPUT_BUS,ap_none);
    AP_CONTROL_BUS_AXI(OUTPUT_BUS);
    AP_BUS_AXI_STREAMD(vector1,INPUT_STREAM_A);
    AP_BUS_AXI_STREAMD(vector2,INPUT_STREAM_B);
#endif /* #ifdef __AUTOESL__ */

#ifndef __AUTOESL__
    #define SUM_SPLIT (1)
#else
    #define SUM_SPLIT (8)
#endif /* #ifndef __AUTOESL__ */

    dbl_t sum_of_squares__split[SUM_SPLIT] = { 0 };

    uint_t dim;
    dimension_loop: for (dim = 0; dim < VECTOR_DIMS; dim++) {
#if defined(__AUTOESL__) && defined(TOP__DISTANCE_SQUARED)
        const dbl_t vector1_data                = vector1[dim].data;
        const dbl_t vector2_data                = vector2[dim].data;
#else
        const dbl_t vector1_data                = vector1[dim];
        const dbl_t vector2_data                = vector2[dim];
#endif /* #if defined(__AUTOESL__) && defined(TOP__DISTANCE_SQUARED) */
        const dbl_t diff                        = vector1_data - vector2_data;
        const dbl_t diff_squared                = diff * diff;
        sum_of_squares__split[dim % SUM_SPLIT] += diff_squared;
    }

    sum = 0;
    uint_t i;
    sum_loop: for (i = 0; i < SUM_SPLIT; i++) {
        sum += sum_of_squares__split[i];
    }
}
