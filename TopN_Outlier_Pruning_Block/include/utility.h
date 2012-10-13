#ifndef UTILITY_H_
#define UTILITY_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */

#ifdef __AUTOESL__
    #include "ap_interfaces.h" /* ap_mm2s */
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
        #define INLINE          __forceinline
    #elif defined(__AUTOESL__)
        #define INLINE
    #else
        #define INLINE          inline
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

/* index_t, index_in_t, index_out_t, index_io_t */
typedef size_t              index_t;
typedef index_t             index_in_t;
typedef index_t             index_out_t;
typedef index_t             index_io_t;

/* double_t, double_in_t, double_out_t, intdoubleio_t */
typedef double              double_t;
#ifndef __AUTOESL__
typedef double_t            double_in_t;
typedef double_t            double_out_t;
typedef double_t            double_io_t;
#else

template<int D>
struct ap_mm2s_double {
    ap_int<D> data;
    ap_uint<(D/8)> keep;
    ap_uint<1> last;
};

#if 0
typedef ap_mm2s<64,1,1,1>    double_in_t;
typedef double_t             double_out_t;
#else
typedef ap_mm2s_double<64>   double_in_t;
typedef double_t             double_out_t;
#endif
typedef double_t             double_io_t;
#endif /* #ifndef __AUTOESL__ */

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

/*============================================================================*/
/* Stats                                                                      */
/*============================================================================*/
#define INCREMENT_UINT_T(_var_) \
    do { \
        const UNUSED uint_t old_var_ = (_var_); \
        (_var_)++; \
        ASSERT((_var_) > (old_var_)); /* check for overflow */ \
    } while (0)
/*----------------------------------------------------------------------------*/

#endif /* #ifndef UTILITY_H_ */
