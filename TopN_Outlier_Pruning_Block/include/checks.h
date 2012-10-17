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
        #error Only one architecture should be specified
    #else
        #define _ARCH_SET_
    #endif /* #ifdef _ARCH_SET_ */
#endif /* #ifdef __C__ */

/* __MEX__ = MEX file for MATLAB */
#ifdef __MEX__
    #ifdef _ARCH_SET_
        #error Only one architecture should be specified
    #else
        #define _ARCH_SET_
    #endif /* #ifdef _ARCH_SET_ */
#endif /* #ifdef __MEX__ */

/* __SYNTHESIS__ = AutoESL high level synthesis */
#ifdef __AUTOESL__
    #ifdef _ARCH_SET_
        #error Only one architecture should be specified
    #else
        #define _ARCH_SET_
    #endif /* #ifdef _ARCH_SET_ */
#endif /* #ifdef __SYNTHESIS__ */

 /* __ARM__ = Arm Cortex A9 */
#ifdef __ARM__
    #ifdef _ARCH_SET_
        #error Only one architecture should be specified
    #else
        #define _ARCH_SET_
    #endif /* #ifdef _ARCH_SET_ */
#endif /* #ifdef __ARM__ */
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
    #error Insert type not specified. Define either: INSERT=SORTED or INSERT=UNSORTED
#endif /* #ifndef INSERT */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Blocking mode                                                              */
/*============================================================================*/
#ifndef BLOCKING
    #error Blocking mode not specified. Define either: BLOCKING=ENABLED or BLOCKING=DISABLED
#endif /* #ifndef BLOCKING */
/*----------------------------------------------------------------------------*/

#endif /* #ifndef CHECKS_H_ */