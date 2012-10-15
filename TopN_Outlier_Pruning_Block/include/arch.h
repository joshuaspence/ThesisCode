/*
 * This header file enables and disables certain code features based on the
 * chosen architecture.
 *
 * The following architectures are available:
 *     - C (__C__)
 *     - MEX (__MEX__)
 *     - AutoESL (__AUTOESL__)
 */

#ifndef ARCH_H_
#define ARCH_H_

#ifndef DISABLED
    #define DISABLED    (0)
#endif /* #ifndef DISABLED */
#ifndef ENABLED
    #define ENABLED     (1)
#endif /* #ifndef ENABLED */

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* __C__ = Stand-alone C program                                              */
/*============================================================================*/
#ifdef __C__
    #ifndef USE_DYNAMIC_ARRAY_SIZE
        #define USE_DYNAMIC_ARRAY_SIZE  (ENABLED)
    #endif /* #ifndef USE_DYNAMIC_ARRAY_SIZE */
    
    /* Use memset for memory initialisation */
    #include <string.h> /* for memset, memcpy */
    #define MEMSET_1D(_var_, _value_, _count_, _size_) \
        memset(_var_, _value_, (_count_)*(_size_))
    #define MEMSET_2D(_var_, _value_, _count1_, _count2_, _size_) \
        MEMSET_1D(_var_, _value_, (_count1_)*(_count2_), _size_)
    #define MEMCPY_1D(_dst_, _src_, _count_, _size_) \
        memcpy(_dst_, _src_, (_count_)*(_size_))
    
    /* Printing to stdout and stderr */
    #include <iostream> /* for std::cerr, std::cout */
    #define PRINTF_STDOUT(_str_)        std::cout << _str_;
    #define PRINTF_STDERR(_str_)        std::cerr << _str_;
    
    /* Create an assertion */
    #include <assert.h> /* for assert */
    #define ASSERT(X)                   assert(X)
#endif /* #ifdef __C__ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* __MEX__ = MEX file for MATLAB                                              */
/*============================================================================*/
#ifdef __MEX__
    #ifndef USE_DYNAMIC_ARRAY_SIZE
        #define USE_DYNAMIC_ARRAY_SIZE  (ENABLED)
    #endif /* #ifndef USE_DYNAMIC_ARRAY_SIZE */
    
    /* Use memset for memory initialisation */
    #include <string.h> /* for memset, memcpy */
    #define MEMSET_1D(_var_, _value_, _count_, _size_) \
        memset(_var_, _value_, (_count_)*(_size_))
    #define MEMSET_2D(_var_, _value_, _count1_, _count2_, _size_) \
        MEMSET_1D(_var_, _value_, (_count1_)*(_count2_), _size_)
    #define MEMCPY_1D(_dst_, _src_, _count_, _size_) \
        memcpy(_dst_, _src_, (_count_)*(_size_))
    
    /* Printing to stdout and stderr */
    #include <mex.h> /* for mexPrintf, mexErrMsgTxt */
    #include <sstream> /* for stringstream */
    #define PRINTF_STDOUT(_str_) \
        do { \
            std::stringstream buffer; \
            buffer << _str_; \
            mexPrintf(buffer.str().c_str()); \
        } while (0)
    #define PRINTF_STDERR(_str_) \
        do { \
            std::stringstream buffer; \
            buffer << _str_; \
            mexErrMsgTxt(buffer.str().c_str()); \
        } while (0)
    
    /* Create an assertion */
    #include <mex.h> /* for mxAssert */
    #define ASSERT(X)                   mxAssert(X, #X)
#endif /* #ifdef __MEX__ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* __AUTOESL__ = AutoESL project                                              */
/*============================================================================*/
#ifdef __AUTOESL__
    /* Compilation fixes */
    #if defined(__gnu_linux__)
        #define __USE_XOPEN2K8
        #include <locale.h>
        #include <xlocale.h>
    #elif defined(_MSC_VER)
    #else
        /* Prevent MinGW from attempting to define double_t */
        #define __FLT_EVAL_METHOD__ (-1)
    #endif /* #if defined(__GCC__) */
    
    #ifndef USE_DYNAMIC_ARRAY_SIZE
        #define USE_DYNAMIC_ARRAY_SIZE  DISABLED
    #endif /* #ifndef USE_DYNAMIC_ARRAY_SIZE */
    
    /* Use for loops for memory initialisation */
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
    
    /* Printing to stdout and stderr */
    #include <iostream> /* for std::cerr, std::cout */
    #define PRINTF_STDOUT(_str_)        std::cout << _str_;
    #define PRINTF_STDERR(_str_)        std::cerr << _str_;
    
    /* Create an assertion */
    #define ASSERT(x)
#endif /* #ifdef __AUTOESL__ */
/*----------------------------------------------------------------------------*/ 

#endif /* #ifndef ARCH_H_ */
