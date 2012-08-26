ith/*
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
#undef _INSERT_TYPE_SET_

/* SORTED_INSERT */
#ifdef SORTED_INSERT
    #ifdef _INSERT_TYPE_SET_
        #error "Only one insert type should be specified."
    #else
        #define _INSERT_TYPE_SET_
    #endif /* #ifdef _INSERT_TYPE_SET_ */
#endif /* #ifdef SORTED_INSERT */

/* UNSORTED_INSERT */
#ifdef UNSORTED_INSERT
    #ifdef _INSERT_TYPE_SET_
        #error "Only one insert type should be specified."
    #else
        #define _INSERT_TYPE_SET_
    #endif /* #ifdef _INSERT_TYPE_SET_ */
#endif /* #ifdef UNSORTED_INSERT */

#ifndef _INSERT_TYPE_SET_
    #error "Insert type not set. Define one of: SORTED_INSERT, UNSORTED_INSERT"
#endif /* #ifndef _INSERT_TYPE_SET_ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Blocking mode                                                              */
/*============================================================================*/
#undef _BLOCKING_MODE_SET_

/* BLOCKING */
#ifdef BLOCKING
    #ifdef _BLOCKING_MODE_SET_
        #error "Only one blocking mode should be specified."
    #else
        #define _BLOCKING_MODE_SET_
    #endif /* #ifdef _BLOCKING_MODE_SET_ */
#endif /* #ifdef BLOCKING */

/* NO_BLOCKING */
#ifdef NO_BLOCKING
    #ifdef _BLOCKING_MODE_SET_
        #error "Only one blocking mode should be specified."
    #else
        #define _BLOCKING_MODE_SET_
    #endif /* #ifdef _BLOCKING_MODE_SET_ */
#endif /* #ifdef NO_BLOCKING */

#ifndef _BLOCKING_MODE_SET_
    #error "Blocking mode not set. Define one of: BLOCKING, NO_BLOCKING"
#endif /* #ifndef _BLOCKING_MODE_SET_ */
/*----------------------------------------------------------------------------*/

#endif /* #ifndef CHECKS_H_ */
