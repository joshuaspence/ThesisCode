/*
 * This header files checks for invalid combinations of preprocessor macros. It
 * also ensures that required preprocessor macros have been defined.
 */
 
#ifndef CHECKS_H_
#define CHECKS_H_

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
#ifndef BLOCKING
    #error "Blocking mode not specified. Define either: BLOCKING=ENABLED or BLOCKING=DISABLED"
#endif /* #ifndef BLOCKING */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* AutoESL stuff                                                              */
/*============================================================================*/
#ifndef __AUTOESL__
    #ifdef TOP__DISTANCE_SQUARED
        #error "TOP__DISTANCE_SQUARED should only be defined for AutoESL builds"
    #endif /* #ifdef TOP__DISTANCE_SQUARED */
#endif /* #ifndef __AUTOESL__ */
/*----------------------------------------------------------------------------*/

#endif /* #ifndef CHECKS_H_ */
