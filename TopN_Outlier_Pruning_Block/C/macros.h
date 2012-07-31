#ifndef MACROS_H_
#define MACROS_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include <stddef.h> /* for size_t */
#include <stdlib.h> /* for malloc, free */
#include <string.h> /* for memset */
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

#define EMPTY_STATEMENT()       do {} while (0)
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Variable naming                                                            */
/*============================================================================*/
#define ROWS(array)             array##_rows
#define COLS(array)             array##_cols
#define ELEMENTS(vector)        vector##_elements
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Types                                                                      */
/*============================================================================*/
typedef size_t index_t;
typedef double double_t;
typedef unsigned int uint_t;
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Macros for arrays                                                          */
/*============================================================================*/
/* Create an array of doubles. */
#define CREATE_REAL_DOUBLE_ARRAY(_array_, _rows_, _cols_) \
    const size_t ROWS(_array_) = _rows_; \
    const size_t COLS(_array_) = _cols_; \
    double_t * const _array_ = (double_t *) malloc(ROWS(_array_) * COLS(_array_) * sizeof(double_t)); \
    memset(_array_, 0, ROWS(_array_) * COLS(_array_) * sizeof(double_t)); \
    EMPTY_STATEMENT()

/* Create an array of unsigned integers. */
#define CREATE_REAL_UINT_ARRAY(_array_, _rows_, _cols_) \
    const size_t ROWS(_array_) = _rows_; \
    const size_t COLS(_array_) = _cols_; \
    uint_t * const _array_ = (uint_t *) malloc(ROWS(_array_) * COLS(_array_) * sizeof(uint_t)); \
    memset(_array_, 0, ROWS(_array_) * COLS(_array_) * sizeof(uint_t)); \
    EMPTY_STATEMENT()

/* Free the memory associated with an array. */
#define FREE_ARRAY(_array_) \
    do { if ((_array_) != NULL) free(_array_); } while (0)
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

/*============================================================================*/
/* Macros for vectors                                                         */
/*============================================================================*/
/* Create a vector of doubles. */
#define CREATE_REAL_DOUBLE_VECTOR(_vector_, _elements_) \
    const size_t ELEMENTS(_vector_) = _elements_; \
    double_t * const _vector_ = (double_t *) malloc(ELEMENTS(_vector_) * sizeof(double_t)); \
    memset(_vector_, 0, ELEMENTS(_vector_) * sizeof(double_t)); \
    EMPTY_STATEMENT()

/* Create a vector of unsigned integers. */
#define CREATE_REAL_UINT_VECTOR(_vector_, _elements_) \
    const size_t ELEMENTS(_vector_) = _elements_; \
    uint_t * const _vector_ = (uint_t *) malloc(ELEMENTS(_vector_) * sizeof(uint_t)); \
    memset(_vector_, 0, ELEMENTS(_vector_) * sizeof(uint_t)); \
    EMPTY_STATEMENT()

/* Free the memory associated with a vector. */
#define FREE_VECTOR(_vector_) \
    do { if ((_vector_) != NULL) free(_vector_); } while (0)
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Vector properties                                                          */
/*============================================================================*/
/* To access a vector element. Uses one-based element indexing. */
#define VECTOR_ELEMENT(_vector_, _element_) \
    _vector_[((_element_) - 1)]

/* To declare a vector and the dimensions of the vector in a function signature. */
#define VECTOR_SIGNATURE(_vector_) \
    _vector_, const size_t UNUSED ELEMENTS(_vector_)

/* To call a function that requires a vector as well as the vector dimensions. */
#define VECTOR_ARGUMENTS(_vector_) \
    _vector_, ELEMENTS(_vector_)
/*----------------------------------------------------------------------------*/

#endif /* #ifndef MACROS_H_ */
