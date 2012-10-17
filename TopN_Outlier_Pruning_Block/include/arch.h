/*
 * This header file enables and disables certain code features based on the
 * chosen architecture.
 *
 * The following architectures are available:
 *     - C (__C__)
 *     - Matlab [MEX file] (__MEX__)
 *     - AutoESL high level synthesis (__SYNTHESIS__)
 *     - Arm Cortex A9 (__ARM__)
 *
 * NOTE: Only one architecture should be defined.
 */

#ifndef ARCH_H_
#define ARCH_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* __C__ = Stand-alone C program                                              */
/*============================================================================*/
#ifdef __C__
    /* Printing to stdout and stderr */
    #include <iostream> /* for std::cerr, std::cout */
    #define PRINTF_STDOUT(X) std::cout << X;
    #define PRINTF_STDERR(X) std::cerr << X;

    /* Create an assertion */
    #include <assert.h> /* for assert */
    #define ASSERT(X) assert(X)
#endif /* #ifdef __C__ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* __MEX__ = MEX file for MATLAB                                              */
/*============================================================================*/
#ifdef __MEX__
    /* Printing to stdout and stderr */
    #include <mex.h> /* for mexPrintf, mexErrMsgTxt */
    #include <sstream> /* for stringstream */
    #define PRINTF_STDOUT(X) \
        do { \
            std::stringstream buffer; \
            buffer << X; \
            mexPrintf(buffer.str().c_str()); \
        } while (0)
    #define PRINTF_STDERR(X) \
        do { \
            std::stringstream buffer; \
            buffer << X; \
            mexErrMsgTxt(buffer.str().c_str()); \
        } while (0)

    /* Create an assertion */
    #include <mex.h> /* for mxAssert */
    #define ASSERT(X) mxAssert(X, #X)
#endif /* #ifdef __MEX__ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* __SYNTHESIS__ = AutoESL high level synthesis                               */
/*============================================================================*/
#ifdef __SYNTHESIS__
    #define PRINTF_STDOUT(X)
    #define PRINTF_STDERR(X)
    #define ASSERT(X)
#endif /* #ifdef __SYNTHESIS__ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* __ARM__ = Arm Cortex A9                                                    */
/*============================================================================*/
#ifdef __ARM__
    /* Printing to stdout and stderr */
    #include <iostream> /* for std::cerr, std::cout */
    #define PRINTF_STDOUT(X) std::cout << X;
    #define PRINTF_STDERR(X) std::cerr << X;

    /* Create an assertion */
    #define ASSERT(X)
#endif /* #ifdef __ARM__ */
/*----------------------------------------------------------------------------*/

#endif /* #ifndef ARCH_H_ */