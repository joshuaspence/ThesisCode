/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
/* Main header file */
#include "utility.h"

/* 
 * For array_double_t, array_index_t, begin_index, ARRAY_PARAMS, ARRAY_ELEMENT 
 */
#include "macros.h"

/* For floor, pow, round, sqrt */
#include <math.h>
/*----------------------------------------------------------------------------*/

boolean equals_zero(const array_double_t x) {
    if (x <= EPSILON)
        return true;
    else
        return false;
}

array_double_t average_over_row(const array_double_t * const ARRAY_SIGNATURE(array), const array_index_t row) {
#if 0
    array_double_t average = 0.0;
      
    array_index_t col;
    for (col = begin_index; col <= COLS(array); col++)
        average += round_dp(ARRAY_ELEMENT(array, row, col), 6) / (array_double_t) COLS(array);
    
    return average;
#else
    unsigned int   count   = 0;
    long           int_sum = 0;
    array_double_t dbl_sum = 0.0;
      
    array_index_t col;
    for (col = begin_index; col <= COLS(array); col++) {
        const long           int_val = floor(ARRAY_ELEMENT(array, row, col));
        const array_double_t dbl_val = ARRAY_ELEMENT(array, row, col) - int_val;
        
        int_sum += int_val;
        dbl_sum += dbl_val;
        count++;
    }
    
    return ((array_double_t) int_sum / (array_double_t) count) + (dbl_sum / (array_double_t) count);
#endif
}

array_double_t distance(const array_double_t * const ARRAY_SIGNATURE(vectors), const array_index_t vector1, const array_index_t vector2) {
    array_double_t sum_of_squares = 0;
    
    array_index_t col;
    for (col = begin_index; col <= COLS(vectors); col++) {
        const array_double_t val = ARRAY_ELEMENT(vectors, vector1, col) - ARRAY_ELEMENT(vectors, vector2, col);
        const array_double_t val_squared = val * val;
        sum_of_squares += val_squared;
    }
    
    return (array_double_t) sqrt(sum_of_squares);
}

array_double_t round_dp(const array_double_t num, const unsigned int num_dp) {
    const array_double_t offset = (array_double_t) pow(10, num_dp);
    return ((array_double_t) round(num * offset)) / offset;
}
