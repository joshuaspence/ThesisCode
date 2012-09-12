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

/*
 * Explanation of #define macros:
 *
 *     USE_ASSERT               Enable/disable the assert() function.
 *     USE_DYNAMIC_ARRAY_SIZE   If enabled, use dynamically-sized arrays; if
 *                              disabled, used statically-sized arrays, where
 *                              necessary.
 *     USE_MEMSET               If enabled, use memset() to set the value of a
 *                              memory range; if disabled, use a for-loop 
 *                              instead.
 */

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* __C__ = Stand-alone C program                                              */
/*============================================================================*/
#ifdef __C__
    #ifndef USE_ASSERT
        #define USE_ASSERT              ENABLED
    #endif /* #ifndef USE_ASSERT */
    
    #ifndef USE_DYNAMIC_ARRAY_SIZE
        #define USE_DYNAMIC_ARRAY_SIZE  ENABLED
    #endif /* #ifndef USE_DYNAMIC_ARRAY_SIZE */
    
    #ifndef USE_MEMSET
        #define USE_MEMSET              ENABLED
    #endif /* #ifndef USE_MEMSET */
    
    #include <stdio.h> /* for fprintf */
    
    #define PRINTF_STDOUT(...)          fprintf(stdout, __VA_ARGS__)
    #define PRINTF_STDERR(...)          fprintf(stderr, __VA_ARGS__)
#endif /* #ifdef __C__ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* __MEX__ = MEX file for MATLAB                                              */
/*============================================================================*/
#ifdef __MEX__
    #ifndef USE_ASSERT
        #define USE_ASSERT              ENABLED
    #endif /* #ifndef USE_ASSERT */
    
    #ifndef USE_DYNAMIC_ARRAY_SIZE
        #define USE_DYNAMIC_ARRAY_SIZE  ENABLED
    #endif /* #ifndef USE_DYNAMIC_ARRAY_SIZE */
    
    #ifndef USE_MEMSET
        #define USE_MEMSET              ENABLED
    #endif /* #ifndef USE_MEMSET */
    
    #include <mex.h> /* for mexPrintf, mexErrMsgTxt */
    //#include <stdio.h> /* for sprintf */
    
    #define PRINTF_STDOUT(...)          mexPrintf(__VA_ARGS__)
    #define PRINTF_STDERR(...)          \
        do { \
            char buffer[1024]; \
            /*sprintf(buffer, __VA_ARGS__);*/ \
            mexErrMsgTxt(buffer); \
        } while (0)
#endif /* #ifdef __MEX__ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* __AUTOESL__ = AutoESL project                                              */
/*============================================================================*/
#ifdef __AUTOESL__
    #ifndef USE_ASSERT
        #define USE_ASSERT              DISABLED
    #endif /* #ifndef USE_ASSERT */
    
    #ifndef USE_DYNAMIC_ARRAY_SIZE
        #define USE_DYNAMIC_ARRAY_SIZE  DISABLED
    #endif /* #ifndef USE_DYNAMIC_ARRAY_SIZE */
    
    #ifndef USE_MEMSET
        #define USE_MEMSET              DISABLED
    #endif /* #ifndef USE_MEMSET */
    
	#include <stdio.h> /* for fprintf */

    #define PRINTF_STDOUT(...)          fprintf(stdout, __VA_ARGS__)
    #define PRINTF_STDERR(...)          fprintf(stderr, __VA_ARGS__)
#endif /* #ifdef __AUTOESL__ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* MEMSET and MEMCPY macros                                                   */
/*============================================================================*/
#if USE_MEMSET
    #include <string.h> /* for memset, memcpy */
    
    #define MEMSET_1D(_var_, _value_, _count_, _size_) \
        memset(_var_, _value_, (_count_)*(_size_))
    #define MEMSET_2D(_var_, _value_, _count1_, _count2_, _size_) \
        MEMSET_1D(_var_, _value_, (_count1_)*(_count2_), _size_)
    #define MEMCPY_1D(_dst_, _src_, _count_, _size_) \
        memcpy(_dst_, _src_, (_count_)*(_size_))
#else
    #include "utility.h" /* for uint_t */
    
    #define MEMSET_1D(_var_, _value_, _count_, _size_) \
        do { \
            uint_t i; \
            for (i = 0; i < (_count_); i++) \
                (_var_)[i] = (_value_); \
        } while (0)
    #define MEMSET_2D(_var_, _value_, _count1_, _count2_, _size_) \
        do { \
            uint_t i; \
            for (i = 0; i < (_count1_); i++) { \
                uint_t j; \
                for (j = 0; j < (_count2_); j++) \
                    (_var_)[i][j] = (_value_); \
            } \
        } while (0)
    #define MEMCPY_1D(_dst_, _src_, _count_, _size_) \
        do { \
            uint_t i; \
            for (i = 0; i < (_count_); i++) \
                (_dst_)[i] = (_src_)[i]; \
        } while (0)
#endif /* #if USE_MEMSET */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Statically or dynamically sized arrays                                     */
/*============================================================================*/
#if USE_DYNAMIC_ARRAY_SIZE
    #define MAX_NUM_VECTORS(N)              N
#else
    #ifndef MAX_NUM_VECTORS
        #define MAX_NUM_VECTORS(N)          67557
    #endif /* #ifndef MAX_NUM_VECTORS */
    
    #ifndef HARDCODED_VECTOR_DIMS
        #define HARDCODED_VECTOR_DIMS       200
    #endif /* #ifndef HARDCODED_VECTOR_DIMS */
    
    #ifndef HARDCODED_K
        #define HARDCODED_K                 15
    #endif /* #ifndef HARDCODED_K */
    
    #ifndef HARDCODED_N
        #define HARDCODED_N                 40
    #endif /* #ifndef HARDCODED_N */
    
    #ifndef HARDCODED_BLOCK_SIZE
        #define HARDCODED_BLOCK_SIZE        40
    #endif /* HARDCODED_BLOCK_SIZE */
#endif /* #if USE_DYNAMIC_ARRAY_SIZE */
/*----------------------------------------------------------------------------*/

#endif /* #ifndef ARCH_H_ */
