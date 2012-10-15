#ifndef UTILITY_H_
#define UTILITY_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */

#ifdef __AUTOESL__
    #include "ap_int.h" /* for ap_int, ap_uint */
#endif /* #ifdef __AUTOESL__ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* General purpose utility macros                                             */
/*============================================================================*/
#define MIN(X,Y)                    ((X) < (Y) ? (X) : (Y))
#define MAX(X,Y)                    ((X) > (Y) ? (X) : (Y))

/* An empty statement to force the use of a semicolon. */
#define EMPTY_STATEMENT()           do {} while (0)

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
    #if defined(_MSC_VER)
        #define INLINE              __forceinline
    #elif defined(__AUTOESL__)
        #define INLINE
    #else
        #define INLINE              inline
    #endif /* #if defined(_MSC_VER) */
#endif /* #ifndef INLINE */

/** Prevent C++ namespace mangling */
#ifdef __cplusplus
    #define __BEGIN_DECLS           extern "C" {
    #define __END_DECLS             } /* extern "C" */
#else
    #define __BEGIN_DECLS
    #define __END_DECLS
#endif /* #ifdef __cplusplus */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Types                                                                      */
/*============================================================================*/

/* size_t */
#ifndef __SIZE_TYPE__
    #define __SIZE_TYPE__ long unsigned int
#endif /* #ifndef __SIZE_TYPE */

#if !defined (_STDDEF_H) && !defined (__need_size_t) && !defined(size_t)
typedef __SIZE_TYPE__       size_t;
#endif /* #if !defined (_STDDEF_H) && !defined (__need_size_t) */

/* size_t, size_in_t, size_out_t */
typedef size_t              size_in_t;
typedef size_t              size_out_t;
typedef size_t              size_io_t;

/* int_t, int_in_t, int_out_t, int_io_t */
typedef int                 int_t;
typedef int_t               int_in_t;
typedef int_t               int_out_t;
typedef int_t               int_io_t;

/* uint_t, uint_in_t, uint_out_t, uint_io_t */
typedef unsigned int        uint_t;
typedef uint_t              uint_in_t;
typedef uint_t              uint_out_t;
typedef uint_t              uint_io_t;

/* blockindex_t, blockindex_in_t, blockindex_out_t, blockindex_io_t */
typedef size_t              blockindex_t;
typedef blockindex_t        blockindex_in_t;
typedef blockindex_t        blockindex_out_t;
typedef blockindex_t        blockindex_io_t;

/* index_t, index_in_t, index_out_t, index_io_t */
typedef size_t              index_t;
typedef index_t             index_in_t;
typedef index_t             index_out_t;
typedef index_t             index_io_t;

/* dbl_t, dbl_in_t, dbl_out_t, dbl_io_t */
typedef double              dbl_t;
#ifndef __AUTOESL__
typedef dbl_t               dbl_in_t;
#else
typedef struct ap_mm2s_dbl {
    dbl_t data;
    ap_uint<8> keep;
    ap_uint<1> last;
}                           dbl_in_t;
#endif /* #ifndef __AUTOESL__ */
typedef dbl_t               dbl_out_t;
typedef dbl_t               dbl_io_t;

#define NULL_INDEX          (0)
#define START_INDEX         (1)
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

#endif /* #ifndef UTILITY_H_ */
