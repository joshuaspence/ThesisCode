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

#undef _ASSERT_             /* enable/disable the assert() function .*/
#undef _DYNAMIC_ARRAY_SIZE_ /* if enabled, use dynamically-sized arrays; if disabled, used statically-sized arrays, where necessary. */
#undef _MEMSET_             /* if enabled, use memset() to set the value of a memory range; if disabled, use a for-loop instead. */

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
    #define _DYNAMIC_ARRAY_SIZE_	ENABLED
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
    #define _DYNAMIC_ARRAY_SIZE_	ENABLED
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
    #define _DYNAMIC_ARRAY_SIZE_	DISABLED
    #define _MEMSET_                DISABLED
    
    #define PRINTF_STDOUT(...)
    #define PRINTF_STDERR(...)
#endif /* #ifdef __AUTOESL__ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* MEMSET and MEMCPY macros                                                   */
/*============================================================================*/
#if _MEMSET_
    #include <string.h> /* for memset */
    
    #define MEMSET_1D(_var_, _value_, _count_, _size_) \
        memset(_var_, _value_, (_count_) * (_size_))
    #define MEMSET_2D(_var_, _value_, _count1_, _count2_, _size_) \
        MEMSET_1D(_var_, _value_, (_count1_)*(_count2_), _size_)
        
    #define MEMCPY_1D(_dst_, _src_, _count_, _size_) \
        memcpy(_dst_, _src_, (_count_) * (_size_))
#else
    #include "utility.h" /* for uint_t */
    
    #define MEMSET_1D(_var_, _value_, _count_, _size_) \
        do { \
            uint_t i; \
            for (i = 0; i < _count_; i++) \
                (_var_)[i] = _value_; \
        } while (0)
    #define MEMSET_2D(_var_, _value_, _count1_, _count2_, _size_) \
        do { \
            uint_t i; \
            for (i = 0; i < _count1_; i++) { \
            	uint_t j; \
            	for (j = 0; j < _count2_; j++) \
                    (_var_)[i][j] = _value_; \
            } \
        } while (0)
    
    #define MEMCPY_1D(_dst_, _src_, _count_, _size_) \
        do { \
            uint_t i; \
            for (i = 0; i < _count_; i++) \
                (_dst_)[i] = (_src_)[i]; \
        } while (0)
#endif /* #if _MEMSET_ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Statically or dynamically sized arrays                                     */
/*============================================================================*/
#if _DYNAMIC_
	#define ARRAYSIZE_NUM_VECTORS(N)    N
	#define ARRAYSIZE_VECTOR_DIMS(N)    N
	#define ARRAYSIZE_K(N)              N
	#define ARRAYSIZE_N(N)              N
	#define ARRAYSIZE_BLOCK_SIZE(N)     N
#else
	#define ARRAYSIZE_NUM_VECTORS(N)    1000
	#define ARRAYSIZE_VECTOR_DIMS(N)    200
	#define ARRAYSIZE_K(N)              15
	#define ARRAYSIZE_N(N)              40
	#define ARRAYSIZE_BLOCK_SIZE(N)     40
#endif /* #if _DYNAMIC_ */
/*----------------------------------------------------------------------------*/

#endif /* #ifndef ARCH_H_ */
