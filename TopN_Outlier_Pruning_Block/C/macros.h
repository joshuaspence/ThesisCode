#ifndef MACROS_H_
#define MACROS_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include <assert.h> /* for assert */
#include <stddef.h> /* for size_t */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* General purpose utility macros                                             */
/*============================================================================*/
#define MIN(X,Y)                ((X) < (Y) ? (X) : (Y))
#define MAX(X,Y)                ((X) > (Y) ? (X) : (Y))

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
        #define UNUSED          __attribute__((unused))
    #elif defined(__LCLINT__)
        #define UNUSED          /*@unused@*/
    #else
        #define UNUSED
    #endif /* #if defined(__GNUC__) */
#endif /* #ifndef UNUSED */

/* An empty statement to force the use of a semicolon. */
#define EMPTY_STATEMENT()       do {} while (0)
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
typedef double              double_t;
typedef int                 int_t;
typedef unsigned int        uint_t;
typedef size_t              index_t;
typedef unsigned long long  lint_t; /* large integer type */

static const index_t null_index  = 0;
static const index_t start_index = 1;
/*----------------------------------------------------------------------------*/

#endif /* #ifndef MACROS_H_ */
