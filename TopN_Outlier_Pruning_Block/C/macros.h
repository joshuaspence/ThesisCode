#ifndef MACROS_H_
#define MACROS_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include <stddef.h> /* for size_t */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* General purpose utility macros                                             */
/*============================================================================*/
#define MIN(X,Y)                ((X) < (Y) ? (X) : (Y))
#define MAX(X,Y)                ((X) > (Y) ? (X) : (Y))

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
/* Types                                                                      */
/*============================================================================*/
typedef double          double_t;
typedef int             int_t;
typedef unsigned int    uint_t;
typedef size_t          index_t;

static const index_t null_index  = 0;
static const index_t start_index = 1;
/*----------------------------------------------------------------------------*/

#endif /* #ifndef MACROS_H_ */
