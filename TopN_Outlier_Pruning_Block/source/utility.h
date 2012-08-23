#ifndef UTILITY_H_
#define UTILITY_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */

#include <assert.h> /* for assert */
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
    #define ASSERT(x)               assert(x)
#endif /* #ifndef ASSERT */

/* Assert that a variable is not null. */
#ifndef ASSERT_NOT_NULL
    #if _POINTER_COMPARISON_
        #define ASSERT_NOT_NULL(p)  ASSERT(p != NULL)
    #else
        #define ASSERT_NOT_NULL(p)  EMPTY_STATEMENT()
    #endif /* #if _POINTER_COMPARISON */
#endif /* #ifndef ASSERT_NOT_NULL */

#ifndef ASSERT
    #define ASSERT(x) \
        assert(x)
#endif /* #ifndef ASSERT */

#ifndef ASSERT_NOT_NULL
    #ifdef __AUTOESL__
        #define ASSERT_NOT_NULL(p) \
            ASSERT(p != NULL)
    #else
        #define ASSERT_NOT_NULL(p)
    #endif /* #ifdef __AUTOESL__ */
#endif /* #ifndef ASSERT_NOT_NULL */

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
typedef unsigned int        uint_t;
typedef size_t              index_t; /* a type to index into arrays */
typedef double              double_t;
typedef unsigned long long  lint_t; /* large integer type */

static const index_t null_index  = 0;
static const index_t start_index = 1;
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
