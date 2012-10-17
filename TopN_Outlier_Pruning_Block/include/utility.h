#ifndef UTILITY_H_
#define UTILITY_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* General purpose utility macros                                             */
/*============================================================================*/
#define MIN(X,Y)                    ((X) < (Y) ? (X) : (Y))
#define MAX(X,Y)                    ((X) > (Y) ? (X) : (Y))
#define SQUARE(X)                   ((X) * (X))

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
/* Constants for array indexing                                               */
/*============================================================================*/
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