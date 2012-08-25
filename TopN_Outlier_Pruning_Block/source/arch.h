/*
 * This header files enables and disables certain code features based on the
 * chosen architecture.
 *
 * The following architectures are available: C (__C__), MEX (__MEX__) and 
 * AutoESL (__AUTOESL__).
 */

#ifndef ARCH_H_
#define ARCH_H_

#define DISABLED    0
#define ENABLED     1

#undef _ASSERT_
#undef _DYNAMIC_
#undef _MEMSET_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* __C__ = Stand-alone C program                                              */
/*============================================================================*/
#ifdef __C__
    #define _ASSERT_                ENABLED
    #define _DYNAMIC_				ENABLED
    #define _MEMSET_                ENABLED
    
    #include <stdio.h>
    #define PRINTF_STDOUT(...)      fprintf(stdout, __VA_ARGS__)
    #define PRINTF_STDERR(...)      fprintf(stderr, __VA_ARGS__)
#endif /* #ifdef __C__ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* __MEX__ = MEX file for MATLAB                                              */
/*============================================================================*/
#ifdef __MEX__
    #define _ASSERT_                ENABLED
    #define _DYNAMIC_				ENABLED
    #define _MEMSET_                ENABLED
    
    #include <mex.h>
    #define PRINTF_STDOUT(...)      mexPrintf(__VA_ARGS__)
    #define PRINTF_STDERR(...)      \
        do { \
            char buffer[1024]; \
            sprintf(buffer, __VA_ARGS__); \
            mexErrMsgTxt(buffer); \
        } while (0)
#endif /* #ifdef __MEX__ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* __AUTOESL__ = AutoESL project                                              */
/*============================================================================*/
#ifdef __AUTOESL__
    #define _ASSERT_                DISABLED
    #define _DYNAMIC_				DISABLED
    #define _MEMSET_                DISABLED
    
    #include <stdio.h>
    #define PRINTF_STDOUT(...)      fprintf(stdout, __VA_ARGS__)
    #define PRINTF_STDERR(...)      fprintf(stderr, __VA_ARGS__)
#endif /* #ifdef __AUTOESL__ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* MEMSET and MEMCPY macros                                                   */
/*============================================================================*/
#if _MEMSET_
    #include <string.h>
    
    #define MEMSET(_var_, _value_, _count_, _size_) \
        memset(_var_, _value_, (_count_) * (_size_))
    #define MEMSET2(_var_, _value_, _count1_, _count2_, _size_) \
        MEMSET(_var_, _value_, (_count1_)*(_count2_), _size_)
        
    #define MEMCPY(_dst_, _src_, _count_, _size_) \
        memcpy(_dst_, _src_, (_count_) * (_size_))
#else
    #include "utility.h"
    
    #define MEMSET(_var_, _value_, _count_, _size_) \
        do { \
            uint_t i; \
            for (i = 0; i < _count_; i++) \
                (_var_)[i] = _value_; \
        } while (0)
    #define MEMSET2(_var_, _value_, _count1_, _count2_, _size_) \
        do { \
            uint_t i; \
            for (i = 0; i < _count1_; i++) { \
            	uint_t j; \
            	for (j = 0; j < _count2_; j++) \
                    (_var_)[i][j] = _value_; \
            } \
        } while (0)
    
    #define MEMCPY(_dst_, _src_, _count_, _size_) \
        do { \
            uint_t i; \
            for (i = 0; i < _count_; i++) \
                (_dst_)[i] = (_src_)[i]; \
        } while (0);
#endif /* #if _MEMSET_ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Static or dynamic arrays                                                   */
/*============================================================================*/
#if _DYNAMIC_
	#define MAX_NUM_VECTORS(X)  X
	#define MAX_VECTOR_DIMS(X)  X
	#define MAX_K(X)            X
	#define MAX_N(X)            X
	#define MAX_BLOCK_SIZE(X)   X
#else
	#define MAX_NUM_VECTORS(X)  1000
	#define MAX_VECTOR_DIMS(X)  200
	#define MAX_K(X)            15
	#define MAX_N(X)            40
	#define MAX_BLOCK_SIZE(X)   40
#endif /* #if _DYNAMIC_ */
/*----------------------------------------------------------------------------*/

#endif /* #ifndef ARCH_H_ */
