#ifndef MATLAB_H_
#define MATLAB_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
/* 
 * For mxIsComplex, mxGetNumberOfDimensions, mxIsDouble, mxIsSparse, 
 * mexPutVariable, mxArray, mxCreateDoubleMatrix, mxGetData, mxGetM, mxGetN, 
 * mxDestroyArray
 */
#include <mex.h>
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
    (IS_REAL_2D_INTEGER(P) &&  !mxIsSparse(P))

#define IS_REAL_INTEGER(P) \
    (IS_REAL_2D_FULL_INTEGER(P) && mxGetNumberOfElements(P) == 1)
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Code-saving macros                                                         */
/*============================================================================*/
/* Export a variable to the MATLAB environment. */
#ifdef DEBUG
    #define EXPORT_TO_MATLAB(_name_, _array_) \
        do { mexPutVariable("caller", #_name_, _array_); } while (false)
#else
    #define EXPORT_TO_MATLAB(_name_, _array_) \
        EMPTY_STATEMENT()
#endif /* #ifdef DEBUG */

/* Create a matrix of doubles. */
#define CREATE_REAL_DOUBLE_ARRAY(_array_, _rows_, _cols_) \
    const array_index_t ROWS(_array_) = _rows_; \
    const array_index_t COLS(_array_) = _cols_; \
    mxArray * const UNUSED MATLAB_ARRAY(_array_) = mxCreateDoubleMatrix(ROWS(_array_), COLS(_array_), mxREAL); \
    array_double_t * const _array_ = mxGetData(MATLAB_ARRAY(_array_)); \
    EXPORT_TO_MATLAB(_array_, MATLAB_ARRAY(_array_)); \
    EMPTY_STATEMENT()

/* Create a matrix of unsigned integers. */
#define CREATE_REAL_UINT_ARRAY(_array_, _rows_, _cols_) \
    const array_index_t ROWS(_array_) = _rows_; \
    const array_index_t COLS(_array_) = _cols_; \
    mxArray * const UNUSED MATLAB_ARRAY(_array_) = mxCreateDoubleMatrix(ROWS(_array_), COLS(_array_), mxREAL); \
    array_uint_t * const _array_ = mxGetData(MATLAB_ARRAY(_array_)); \
    EXPORT_TO_MATLAB(_array, MATLAB_ARRAY(_array_)); \
    EMPTY_STATEMENT()

/* Retrieve a matrix of doubles from a specified location. */
#define MATLAB_RETRIEVE_REAL_DOUBLE_ARRAY(_array_, _location_) \
    const size_t UNUSED ROWS(_array_) = mxGetM(_location_); \
    const size_t UNUSED COLS(_array_) = mxGetN(_location_); \
    mxArray * const UNUSED MATLAB_ARRAY(_array_) = (mxArray *) _location_; \
    double * const _array_ = mxGetData(MATLAB_ARRAY(_array_)); \
    EXPORT_TO_MATLAB(_array_, MATLAB_ARRAY(_array_)); \
    EMPTY_STATEMENT()

/* Free the memory associated with an array. */
#define FREE_ARRAY(_array_) \
    do { mxDestroyArray(MATLAB_ARRAY(_array_)); } while (false)
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

#endif /* #ifndef MATLAB_H_ */
