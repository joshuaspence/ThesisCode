#include "utility.h" /* main header file */
#include "macros.h" /* for boolean, ARRAY_DOUBLE_T, ARRAY_PARAMS, ARRAY_ELEMENT */
#include <math.h> /* for pow, sqrt */

/* For comparing floating point numbers to zero. */
#define EPSILON			0.0000001

boolean equals_zero(const double x) {
	if (x <= EPSILON)
		return true;
	else
		return false;
}

ARRAY_DOUBLE_T average_over_row(const ARRAY_DOUBLE_T * const ARRAY_PARAMS(array), const unsigned int row) {
    unsigned int count = 0;
    ARRAY_DOUBLE_T sum = 0;
    
    unsigned int col;
    for (col = 1; col <= COLS(array); col++) {
        sum += ARRAY_ELEMENT(array, row, col);
        count++;
    }

    return sum / count;
}

ARRAY_DOUBLE_T distance(const ARRAY_DOUBLE_T * const ARRAY_PARAMS(vectors), const unsigned int vector1, const unsigned int vector2) {
    ARRAY_DOUBLE_T sum_of_squares = 0;
    
    unsigned int col;
    for (col = 1; col <= COLS(vectors); col++)
        sum_of_squares += pow(ARRAY_ELEMENT(vectors, vector1, col) - ARRAY_ELEMENT(vectors, vector2, col), 2);
        
    return sqrt(sum_of_squares);
}
