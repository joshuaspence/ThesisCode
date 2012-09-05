#ifndef UTILITY_H_
#define UTILITY_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */

#include <stddef.h> /* for size_t */
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
    #if defined(_MSC_VER)
        #define INLINE              __forceinline
	#elif defined(__AUTOESL__)
		#define INLINE
    #else
        #define INLINE              inline
    #endif /* #if defined(_MSC_VER) */
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
typedef int                 int_t;
typedef int                 int_in_t;
typedef int                 int_out_t;
typedef int                 int_io_t;

typedef unsigned int        uint_t;
typedef unsigned int        uint_in_t;
typedef unsigned int        uint_out_t;
typedef unsigned int        uint_io_t;

typedef size_t              index_t;
typedef size_t              index_in_t;
typedef size_t              index_out_t;
typedef size_t              index_io_t;

typedef double              double_t;
typedef double              double_in_t;
typedef double              double_out_t;
typedef double              double_io_t;

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

#endif /* #ifndef UTILITY_H_ */
