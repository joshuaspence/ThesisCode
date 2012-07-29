/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
/* Main header file */
#include "utility.h"

/* For index_t, ARRAY_SIGNATURE, ARRAY_ELEMENT */
#include "macros.h"
/*----------------------------------------------------------------------------*/

boolean equals_zero(const double x) {
    if (x <= EPSILON)
        return true;
    else
        return false;
}

double distance_squared(const double * const ARRAY_SIGNATURE(vectors), const index_t vector1, const index_t vector2) {
    double sum_of_squares = 0;
    
    index_t col;
    for (col = 1; col <= COLS(vectors); col++) {
        const double val = ARRAY_ELEMENT(vectors, vector1, col) - ARRAY_ELEMENT(vectors, vector2, col);
        const double val_squared = val * val;
        sum_of_squares += val_squared;
    }
    
    return sum_of_squares;
}
