/*
 * This header files checks for invalid combinations of preprocessor macros. It
 * also ensures that required preprocessor macros have been defined.
 */
 
#ifndef CHECKS_HPP_
#define CHECKS_HPP_

/*============================================================================*/
/* Architecture                                                               */
/*============================================================================*/
#undef _ARCH_SET_

/* __C__ = Stand-alone C program */
#ifdef __C__
    #ifdef _ARCH_SET_
        #error "Only one architecture should be specified."
    #else
        #define _ARCH_SET_
    #endif /* #ifdef _ARCH_SET_ */
#endif /* #ifdef __C__ */

/* __MEX__ = MEX file for MATLAB */
#ifdef __MEX__
    #ifdef _ARCH_SET_
        #error "Only one architecture should be specified."
    #else
        #define _ARCH_SET_
    #endif /* #ifdef _ARCH_SET_ */
#endif /* #ifdef __MEX__ */

/* __AUTOESL__ = AutoESL project */
#ifdef __AUTOESL__
    #ifdef _ARCH_SET_
        #error "Only one architecture should be specified."
    #else
        #define _ARCH_SET_
    #endif /* #ifdef _ARCH_SET_ */
#endif /* #ifdef __AUTOESL__ */

#ifndef _ARCH_SET_
    #error "No architecture set. Define one of: __C__, __MEX__, __AUTOESL__"
#endif /* #ifndef _ARCH_SET_ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Insert type                                                                */
/*============================================================================*/
#ifndef SORTED
    #define SORTED      (1)
#endif /* #ifndef SORTED */
#ifndef UNSORTED
    #define UNSORTED    (2)
#endif /* #ifndef UNSORTED */

#ifndef INSERT
    #error "Insert type not specified. Define either: INSERT=SORTED or INSERT=UNSORTED"
#endif /* #ifndef INSERT */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Blocking mode                                                              */
/*============================================================================*/
#ifndef DISABLED
    #define DISABLED    (0)
#endif /* #ifndef DISABLED */
#ifndef ENABLED
    #define ENABLED     (1)
#endif /* #ifndef ENABLED */

#ifndef BLOCKING
    #error "Blocking mode not specified. Define either: BLOCKING=ENABLED or BLOCKING=DISABLED"
#endif /* #ifndef BLOCKING */
/*----------------------------------------------------------------------------*/

#endif /* #ifndef CHECKS_HPP_ */
