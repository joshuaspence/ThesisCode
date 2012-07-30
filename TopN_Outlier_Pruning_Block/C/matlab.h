#ifndef MATLAB_H_
#define MATLAB_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
/* 
 * For mxIsComplex, mxGetNumberOfDimensions, mxIsDouble, mxIsSparse, 
 * mxArray, mxCreateDoubleMatrix, mxGetData, mxGetM, mxGetN, mxDestroyArray
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
    (IS_REAL_2D_INTEGER(P) && !mxIsSparse(P))

#define IS_REAL_INTEGER(P) \
    (IS_REAL_2D_FULL_INTEGER(P) && mxGetNumberOfElements(P) == 1)
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Variable naming                                                            */
/*============================================================================*/
#define MATLAB_ROWS(array)      array##_rows
#define MATLAB_COLS(array)      array##_cols
#define MATLAB_ELEMENTS(array)  array##_elements
#define MATLAB_ARRAY(array)     array##_matlab
#define MATLAB_VECTOR(array)    array##_vector
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Macros for arrays                                                          */
/*============================================================================*/
/* Create a matrix of doubles. */
#define MATLAB_CREATE_REAL_DOUBLE_ARRAY(_array_, _rows_, _cols_) \
    const array_index_t MATLAB_ROWS(_array_) = _rows_; \
    const array_index_t MATLAB_COLS(_array_) = _cols_; \
    mxArray * const UNUSED MATLAB_ARRAY(_array_) = mxCreateDoubleMatrix(MATLAB_ROWS(_array_), MATLAB_COLS(_array_), mxREAL); \
    double * const _array_ = mxGetData(MATLAB_ARRAY(_array_)); \
    EMPTY_STATEMENT()

/* Retrieve a matrix of doubles from a specified location. */
#define MATLAB_RETRIEVE_REAL_DOUBLE_ARRAY(_array_, _location_) \
    const size_t UNUSED MATLAB_ROWS(_array_) = mxGetM(_location_); \
    const size_t UNUSED MATLAB_COLS(_array_) = mxGetN(_location_); \
    mxArray * const UNUSED MATLAB_ARRAY(_array_) = (mxArray *) _location_; \
    double * const _array_ = mxGetData(MATLAB_ARRAY(_array_)); \
    EMPTY_STATEMENT()

/* Free the memory associated with an array. */
#define MATLAB_FREE_ARRAY(_array_) \
    do { mxDestroyArray(MATLAB_ARRAY(_array_)); } while (0)
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Array properties                                                           */
/*============================================================================*/
/* To access an array element. Uses one-based row/column indexing. */
#define MATLAB_ARRAY_ELEMENT(_array_, _row_, _column_) \
    _array_[((_row_) - 1) + MATLAB_ROWS(_array_) * ((_column_) - 1)]

/* To declare an array and the dimensions of the array in a function signature. */
#define MATLAB_ARRAY_SIGNATURE(_array_) \
    _array_, const size_t UNUSED MATLAB_ROWS(_array_), const size_t UNUSED MATLAB_COLS(_array_)

/* To call a function that requires an array as well as the array dimensions. */
#define MATLAB_ARRAY_ARGUMENTS(_array_) \
    _array_, MATLAB_ROWS(_array_), MATLAB_COLS(_array_)
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Macros for vectors                                                         */
/*============================================================================*/
/* Create a vector of doubles. */
#define MATLAB_CREATE_REAL_DOUBLE_VECTOR(_vector_, _elements_) \
    const size_t MATLAB_ELEMENTS(_vector_) = _elements_; \
    mxArray * const UNUSED MATLAB_VECTOR(_vector_) = mxCreateDoubleMatrix(1, MATLAB_ELEMENTS(_vector_), mxREAL); \
    double * const _vector_ = mxGetData(MATLAB_VECTOR(_vector_)); \
    EMPTY_STATEMENT()

/* Free the memory associated with a vector. */
#define MATLAB_FREE_VECTOR(_vector_) \
    do { mxDestroyArray(MATLAB_VECTOR(_vector)); } while (0)
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Vector properties                                                          */
/*============================================================================*/
/* To access a vector element. Uses one-based element indexing. */
#define MATLAB_VECTOR_ELEMENT(_vector_, _element_) \
    _vector_[((_element_) - 1)]

/* To declare a vector and the dimensions of the vector in a function signature. */
#define MATLAB_VECTOR_SIGNATURE(_vector_) \
    _vector_, const size_t UNUSED MATLAB_ELEMENTS(_vector_)

/* To call a function that requires a vector as well as the vector dimensions. */
#define MATLAB_VECTOR_ARGUMENTS(_vector_) \
    _vector_, MATLAB_ELEMENTS(_vector_)
/*----------------------------------------------------------------------------*/

#endif /* #ifndef MATLAB_H_ */
