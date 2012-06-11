#ifndef MACROS_H_
#define MACROS_H_

#include "mex.h"

/*============================================================================*/
/* General purpose utility macros                                             */
/*============================================================================*/
#define MIN(X,Y) 			((X) < (Y) ? (X) : (Y))
#define MAX(X,Y) 			((X) > (Y) ? (X) : (Y))

/* Declare an unused variable. */
#ifdef UNUSED
#elif defined(__GNUC__)
	#define UNUSED			__attribute__ ((unused))
#elif defined(__LCLINT__)
	#define UNUSED 			/*@unused@*/
#else
	#define UNUSED			
#endif
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
/* Code-saving macros                                                         */
/*============================================================================*/
/* Export a variable to the MATLAB environment. */
#ifdef DEBUG
	#define EXPORT_TO_MATLAB(_name_, _array_) \
		do { mexPutVariable("caller", #_name_, _array_); } while (0)
#else
	#define EXPORT_TO_MATLAB(_name_, _array_) \
		do {} while (0)
#endif

/* Create a matrix of doubles. */
#define CREATE_REAL_DOUBLE_ARRAY(array, rows, cols) \
	const unsigned int ROWS(array) = rows; \
	const unsigned int COLS(array) = cols; \
	mxArray * const UNUSED MATLAB_ARRAY(array) = mxCreateDoubleMatrix(ROWS(array), COLS(array), mxREAL); \
	double * const array = mxGetData(MATLAB_ARRAY(array)); \
	EXPORT_TO_MATLAB(array, MATLAB_ARRAY(array))

#define CREATE_REAL_UINT_ARRAY(array, rows, cols) \
	const unsigned int ROWS(array) = rows; \
	const unsigned int COLS(array) = cols; \
	mxArray * const UNUSED MATLAB_ARRAY(array) = mxCreateDoubleMatrix(ROWS(array), COLS(array), mxREAL); \
	unsigned int * const array = mxGetData(MATLAB_ARRAY(array)); \
	EXPORT_TO_MATLAB(array, MATLAB_ARRAY(array))

#define RETRIEVE_REAL_DOUBLE_ARRAY(array, location) \
	const unsigned int UNUSED ROWS(array) = mxGetM(location); \
	const unsigned int UNUSED COLS(array) = mxGetN(location); \
	mxArray * const UNUSED MATLAB_ARRAY(array) = (mxArray *) location; \
	double * const array = mxGetData(MATLAB_ARRAY(array)); \
	EXPORT_TO_MATLAB(array, MATLAB_ARRAY(array))

#define FREE_ARRAY(array) \
	mxDestroyArray(MATLAB_ARRAY(array))
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Array properties                                                           */
/*============================================================================*/
#define ARRAY_ELEMENT(array, row, column) \
	array[((row) - 1) + ROWS(array) * ((column) - 1)]
	
#define ARRAY_SIZE_PARAMS(array) \
	const unsigned int ROWS(array), const unsigned int COLS(array)

#define ARRAY_PROPERTIES(array) \
	array, ROWS(array), COLS(array)
/*----------------------------------------------------------------------------*/

#endif /* #ifndef MACROS_H_ */
