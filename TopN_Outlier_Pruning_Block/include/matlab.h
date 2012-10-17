#ifndef MATLAB_H_
#define MATLAB_H_

/*============================================================================*/
/* Checks                                                                     */
/*============================================================================*/
#ifndef __MEX__
    #error This file should only be included in MEX builds
#endif /* #ifndef __MEX__ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "utility.h" /* for EMPTY_STATEMENT, UNUSED */
#include <mex.h> /* for mxCreateDoubleMatrix, mxDestroyArray, mxGetData, mxGetM, mxGetN, mxGetNumberOfDimensions, mxGetNumberOfElements, mxIsComplex, mxIsDouble, mxIsSparse */
#include <stddef.h> /* for size_t */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Utility macros                                                             */
/*============================================================================*/
#define IS_REAL_2D_DOUBLE(P) \
    (!mxIsComplex(P) && mxGetNumberOfDimensions(P) == 2 && mxIsDouble(P))
#define IS_REAL_2D_FULL_DOUBLE(P) \
    (IS_REAL_2D_DOUBLE(P) && !mxIsSparse(P))

#define IS_REAL_SCALAR(P) \
    (IS_REAL_2D_FULL_DOUBLE(P) && mxGetNumberOfElements(P) == 1)

#define IS_REAL_2D_INTEGER(P) \
    (!mxIsComplex(P) && mxGetNumberOfDimensions(P) == 2 && !mxIsDouble(P))

#define IS_REAL_2D_FULL_INTEGER(P) \
    (IS_REAL_2D_INTEGER(P) && !mxIsSparse(P))

#define IS_REAL_INTEGER(P) \
    (IS_REAL_2D_FULL_INTEGER(P) && mxGetNumberOfElements(P) == 1)
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Variable naming                                                            */
/*============================================================================*/
#define ROWS(array)         array##_rows
#define COLS(array)         array##_cols
#define ELEMENTS(vector)    vector##_elements
#define ARRAY(array)        array##_array
#define VECTOR(vector)      vector##_vector
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Macros for arrays                                                          */
/*============================================================================*/
/* Retrieve a matrix of doubles from a specified location. */
#define RETRIEVE_REAL_DOUBLE_ARRAY(array, location) \
    const size_t UNUSED ROWS(array) = mxGetM(location); \
    const size_t UNUSED COLS(array) = mxGetN(location); \
    mxArray * const UNUSED ARRAY(array) = (mxArray *) location; \
    double * const array = (double *) mxGetData(ARRAY(array)); \
    EMPTY_STATEMENT()

/* Free the memory associated with an array. */
#define FREE_ARRAY(array) \
    mxDestroyArray(ARRAY(array)); \
    EMPTY_STATEMENT()

/* To access an array element. Uses one-based row/column indexing. */
#define ARRAY_ELEMENT(array, row, col) \
    array[(row) + (ROWS(array) * (col))]
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Macros for vectors                                                         */
/*============================================================================*/
/* Create a vector of doubles. */
#define CREATE_REAL_DOUBLE_VECTOR(vector, elements) \
    const size_t ELEMENTS(vector) = elements; \
    mxArray * const UNUSED VECTOR(vector) = mxCreateDoubleMatrix(1, ELEMENTS(vector), mxREAL); \
    double * const vector = (double *) mxGetData(VECTOR(vector)); \
    EMPTY_STATEMENT()

/* Free the memory associated with a vector. */
#define FREE_VECTOR(vector) \
    mxDestroyArray(VECTOR(vector)); \
    EMPTY_STATEMENT()

/* To access a vector element. Uses one-based element indexing. */
#define VECTOR_ELEMENT(vector, element) \
    vector[(element)]
/*----------------------------------------------------------------------------*/

#endif /* #ifndef MATLAB_H_ */