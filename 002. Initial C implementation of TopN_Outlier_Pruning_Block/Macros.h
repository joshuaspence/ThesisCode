#ifndef MACROS_H_
#define MACROS_H_

#include "mex.h"

/*============================================================================*/
/* Boolean type                                                               */
/*============================================================================*/
typedef int boolean;

#ifndef true
	#define true 1
#endif /* #ifndef true */

#ifndef false
	#define false 0
#endif /* #ifndef false */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* General purpose utility macros                                             */
/*============================================================================*/
#define MIN(X,Y)			((X) < (Y) ? (X) : (Y))
#define MAX(X,Y)			((X) > (Y) ? (X) : (Y))

/* Declare an unused variable. */
#ifdef UNUSED
#elif defined(__GNUC__)
	#define UNUSED			__attribute__ ((unused))
#elif defined(__LCLINT__)
	#define UNUSED 			/*@unused@*/
#else
	#define UNUSED
#endif /* #ifdef UNUSED */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Variable naming                                                            */
/*============================================================================*/
#define ROWS(array)				array##_rows
#define COLS(array) 			array##_cols
#define MATLAB_ARRAY(array)		array##_matlab
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
/* Types                                                                      */
/*============================================================================*/
#define ARRAY_UINT_T		double
#define ARRAY_DOUBLE_T		double
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Code-saving macros                                                         */
/*============================================================================*/
/* Export a variable to the MATLAB environment. */
#ifdef DEBUG
	#define EXPORT_TO_MATLAB(_name, _array) \
		do { mexPutVariable("caller", #_name, _array); } while (0)
#else
	#define EXPORT_TO_MATLAB(_name, _array) \
		do {} while (0)
#endif /* #ifdef DEBUG */

/* Create a matrix of doubles. */
#define CREATE_REAL_DOUBLE_ARRAY(_array, _rows, _cols) \
	const unsigned int ROWS(_array) = _rows; \
	const unsigned int COLS(_array) = _cols; \
	mxArray * const UNUSED MATLAB_ARRAY(_array) = mxCreateDoubleMatrix(ROWS(_array), COLS(_array), mxREAL); \
	ARRAY_DOUBLE_T * const _array = mxGetData(MATLAB_ARRAY(_array)); \
	EXPORT_TO_MATLAB(_array, MATLAB_ARRAY(_array)); \
	do {} while (0)

/* Create a matrix of unsigned integers. */
#define CREATE_REAL_UINT_ARRAY(_array, _rows, _cols) \
	const unsigned int ROWS(_array) = _rows; \
	const unsigned int COLS(_array) = _cols; \
	mxArray * const UNUSED MATLAB_ARRAY(_array) = mxCreateDoubleMatrix(ROWS(_array), COLS(_array), mxREAL); \
	ARRAY_UINT_T * const _array = mxGetData(MATLAB_ARRAY(_array)); \
	EXPORT_TO_MATLAB(_array, MATLAB_ARRAY(_array)); \
	do {} while (0)

/* Retrieve a matrix of doubles from a specified location. */
#define RETRIEVE_REAL_DOUBLE_ARRAY(_array, _location) \
	const unsigned int UNUSED ROWS(_array) = mxGetM(_location); \
	const unsigned int UNUSED COLS(_array) = mxGetN(_location); \
	mxArray * const UNUSED MATLAB_ARRAY(_array) = (mxArray *) _location; \
	ARRAY_DOUBLE_T * const _array = mxGetData(MATLAB_ARRAY(_array)); \
	EXPORT_TO_MATLAB(_array, MATLAB_ARRAY(_array)); \
	do {} while (0)

/* Retrieve a matrix of doubles from a specified location. */
#define RETRIEVE_REAL_UINT_ARRAY(_array, _location) \
	const unsigned int UNUSED ROWS(_array) = mxGetM(_location); \
	const unsigned int UNUSED COLS(_array) = mxGetN(_location); \
	mxArray * const UNUSED MATLAB_ARRAY(_array) = (mxArray *) _location; \
	ARRAY_UINT_T * const _array = mxGetData(MATLAB_ARRAY(_array)); \
	EXPORT_TO_MATLAB(_array, MATLAB_ARRAY(_array)); \
	do {} while (0)

/* Free the memory associated with an array. */
#define FREE_ARRAY(array) \
	do { mxDestroyArray(MATLAB_ARRAY(array)); } while (0)
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Array properties                                                           */
/*============================================================================*/
#define ARRAY_ELEMENT(_array, _row, _column) \
	_array[((_row) - 1) + ROWS(_array) * ((_column) - 1)]

/* To declare the dimensions of an array in a function signature. */
#define ARRAY_SIZE_PARAMS(_array) \
	const unsigned int UNUSED ROWS(_array), const unsigned int UNUSED COLS(_array)

/* To call a function that requires an array as well as the array dimensions. */
#define ARRAY_PROPERTIES(_array) \
	_array, ROWS(_array), COLS(_array)
/*----------------------------------------------------------------------------*/

#endif /* #ifndef MACROS_H_ */
