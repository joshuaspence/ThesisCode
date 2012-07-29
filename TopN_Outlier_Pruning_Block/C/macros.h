#ifndef MACROS_H_
#define MACROS_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
/* For malloc, free */
#include <stdlib.h>
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Boolean type                                                               */
/*============================================================================*/
typedef char boolean;

#ifndef true
    #define true ((char) 1)
#endif /* #ifndef true */

#ifndef false
    #define false ((char) 0)
#endif /* #ifndef false */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* General purpose utility macros                                             */
/*============================================================================*/
#define MIN(X,Y)                ((X) < (Y) ? (X) : (Y))
#define MAX(X,Y)                ((X) > (Y) ? (X) : (Y))

/* Declare an unused variable. */
#ifndef UNUSED
    #if defined(__GNUC__)
        #define UNUSED          __attribute__((unused))
    #elif defined(__LCLINT__)
        #define UNUSED          /*@unused@*/
    #else
        #define UNUSED
    #endif /* #if defined(__GNUC__) */
#endif /* #ifndef UNUSED */

#define EMPTY_STATEMENT()       do {} while (false)
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Variable naming                                                            */
/*============================================================================*/
#define ROWS(array)             array##_rows
#define COLS(array)             array##_cols
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Types                                                                      */
/*============================================================================*/
typedef size_t index_t;
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Code-saving macros                                                         */
/*============================================================================*/
/* Create a matrix of doubles. */
#define CREATE_REAL_DOUBLE_ARRAY(_array_, _rows_, _cols_) \
    const size_t ROWS(_array_) = _rows_; \
    const size_t COLS(_array_) = _cols_; \
    double * const _array_ = (double *) malloc(ROWS(_array_) * COLS(_array_) * sizeof(double)); \
    EMPTY_STATEMENT()

/* Create a matrix of unsigned integers. */
#define CREATE_REAL_UINT_ARRAY(_array_, _rows_, _cols_) \
    const size_t ROWS(_array_) = _rows_; \
    const size_t COLS(_array_) = _cols_; \
    unsigned int * const _array_ = (unsigned int *) malloc(ROWS(_array_) * COLS(_array_) * sizeof(unsigned int)); \
    EMPTY_STATEMENT()

/* Create a matrix of booleans. */
#define CREATE_REAL_BOOLEAN_ARRAY(_array_, _rows_, _cols_) \
    const size_t ROWS(_array_) = _rows_; \
    const size_t COLS(_array_) = _cols_; \
    boolean * const _array_ = (boolean *) malloc(ROWS(_array_) * COLS(_array_) * sizeof(boolean)); \
    EMPTY_STATEMENT()

/* Free the memory associated with an array. */
#define FREE_ARRAY(_array_) \
    do { if ((_array_) != NULL) free(_array_); } while (false)
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Array properties                                                           */
/*============================================================================*/
/* To access an array element. Uses one-based row/column indexing. */
#define ARRAY_ELEMENT(_array_, _row_, _column_) \
    _array_[((_row_) - 1) + ROWS(_array_) * ((_column_) - 1)]

/* To declare an array and the dimensions of the array in a function signature. */
#define ARRAY_SIGNATURE(_array_) \
    _array_, const size_t UNUSED ROWS(_array_), const size_t UNUSED COLS(_array_)

/* To call a function that requires an array as well as the array dimensions. */
#define ARRAY_ARGUMENTS(_array_) \
    _array_, ROWS(_array_), COLS(_array_)
/*----------------------------------------------------------------------------*/

#endif /* #ifndef MACROS_H_ */
