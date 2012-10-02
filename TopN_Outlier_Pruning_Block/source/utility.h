#ifndef UTILITY_H_
#define UTILITY_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */
#ifdef __AUTOESL__
    #include "ap_interfaces.h"
#endif /* #ifdef __AUTOESL__ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* General purpose utility macros                                             */
/*============================================================================*/
#define MIN(X,Y)                    ((X) < (Y) ? (X) : (Y))
#define MAX(X,Y)                    ((X) > (Y) ? (X) : (Y))

/* An empty statement to force the use of a semicolon. */
#define EMPTY_STATEMENT()           do {} while (0)

/* Create an assertion. */
#ifndef ASSERT
    #if USE_ASSERT
        #include <assert.h> /* for assert */
        #define ASSERT(x)           assert(x)
    #else
        #define ASSERT(x)           EMPTY_STATEMENT()
    #endif /* #if USE_ASSERT */
#endif /* #ifndef ASSERT */

/* Declare an unused variable. */
#ifndef UNUSED
    #if defined(__GNUC__)
        #define UNUSED              __attribute__((unused))
    #elif defined(__LCLINT__)
        #define UNUSED              /*@unused@*/
    #else
        #define UNUSED
    #endif /* #if defined(__GNUC__) */
#endif /* #ifndef UNUSED */

/* Declare a function as inline. */
#ifndef INLINE
    #ifdef USE_INLINE
        #if USE_INLINE
            #if defined(_MSC_VER)
                #define INLINE              __forceinline
            #elif defined(__AUTOESL__)
            #define INLINE              inline
            #else
                #define INLINE              inline
            #endif /* #if defined(_MSC_VER) */
        #else
            #if defined(_MSC_VER)
                #define INLINE
            #elif defined(__AUTOESL__)
            #define INLINE
            #else
                #define INLINE
            #endif /* #if defined(_MSC_VER) */
        #endif /* #if USE_INLINE */
    #else
        #if defined(_MSC_VER)
            #define INLINE                  __forceinline
        #elif defined(__AUTOESL__)
            #define INLINE
        #else
            #define INLINE                  inline
        #endif /* #if defined(_MSC_VER) */
    #endif /* #ifdef USE_INLINE */
#endif /* #ifndef INLINE */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Boolean type                                                               */
/*============================================================================*/
typedef int boolean;

#ifndef true
    #define true 1
#endif /* #ifndef true */

#ifndef false
    #define false 0
#endif /* #ifndef true */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Types                                                                      */
/*============================================================================*/

/* size_t */
#ifndef __SIZE_TYPE__
    #define __SIZE_TYPE__ long unsigned int
#endif /* #ifndef __SIZE_TYPE */

#if !defined (_STDDEF_H) && !defined (__need_size_t)
typedef __SIZE_TYPE__       size_t;
#endif /* #if !defined (_STDDEF_H) && !defined (__need_size_t) */

/* size_t, size_in_t, size_out_t, size_io_t */
#ifndef __AUTOESL__
typedef __SIZE_TYPE__       size_in_t;
typedef __SIZE_TYPE__       size_out_t;
typedef __SIZE_TYPE__       size_io_t;
#else
typedef __SIZE_TYPE__       size_in_t;
typedef __SIZE_TYPE__       size_out_t;
typedef __SIZE_TYPE__       size_io_t;
#endif /* #ifndef __AUTOESL__ */

/* int_t, int_in_t, int_out_t, int_io_t */
#ifndef __AUTOESL__
typedef int                 int_t;
typedef int                 int_in_t;
typedef int                 int_out_t;
typedef int                 int_io_t;
#else
typedef int                 int_t;
typedef int                 int_in_t;
typedef int                 int_out_t;
typedef int                 int_io_t;
#endif /* #ifndef __AUTOESL__ */

/* uint_t, uint_in_t, uint_out_t, uint_io_t */
#ifndef __AUTOESL__
typedef unsigned int        uint_t;
typedef unsigned int        uint_in_t;
typedef unsigned int        uint_out_t;
typedef unsigned int        uint_io_t;
#else
typedef unsigned int        uint_t;
typedef unsigned int        uint_in_t;
typedef unsigned int        uint_out_t;
typedef unsigned int        uint_io_t;
#endif /* #ifndef __AUTOESL__ */

/* index_t, index_in_t, index_out_t, index_io_t */
#ifndef __AUTOESL__
typedef size_t              index_t;
typedef size_t              index_in_t;
typedef size_t              index_out_t;
typedef size_t              index_io_t;
#else
typedef size_t              index_t;
typedef size_t              index_in_t;
typedef size_t              index_out_t;
typedef size_t              index_io_t;
#endif /* #ifndef __AUTOESL__ */

/* double_t, double_in_t, double_out_t, intdoubleio_t */
#ifndef __AUTOESL__
typedef double              double_t;
typedef double              double_in_t;
typedef double              double_out_t;
typedef double              double_io_t;
#else
#include "ap_int.h"

template<int D, int U, int TI, int TD>
struct ap_mm2s {
    ap_int<D> data;
    ap_uint<(D+7)/8> keep;
    ap_uint<1> last;
};

typedef double              double_t;
typedef double              double_in_t;
//typedef ap_mm2s<64,1,1,1>   double_in_t;
typedef double              double_out_t;
//typedef ap_mm2s<64,1,1,1>   double_io_t;
typedef double              double_io_t;
#endif /* #ifndef __AUTOESL__ */

#define NULL_INDEX          0
#define START_INDEX         1
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Return values                                                              */
/*============================================================================*/
#define SUCCESS             (0)
#define FILE_NOT_FOUND      (1)
#define FILE_IO_ERROR       (2)
#define MALLOC_FAILED       (3)
#define FILE_EXPECTED_EOF   (4)
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Stats                                                                      */
/*============================================================================*/
#define INCREMENT_UINT_T(_var_) \
    do { \
        const UNUSED uint_t old_var_ = (_var_); \
        (_var_)++; \
        ASSERT((_var_) > (old_var_)); \
    } while (0)
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* AutoESL directives                                                         */
/*============================================================================*/
#ifndef __AUTOESL__
    #define DIRECTIVE(x)
#else
    #define PRAGMA(x)       _Pragma(#x)
    #define DIRECTIVE(x)    PRAGMA(x)
#endif /* #ifndef __AUTOESL__ */
/*----------------------------------------------------------------------------*/

#endif /* #ifndef UTILITY_H_ */
