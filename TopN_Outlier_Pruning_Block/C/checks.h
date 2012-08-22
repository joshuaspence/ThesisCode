/*
 * This header files checks for invalid combinations of preprocessor macros. It 
 * also ensure that require preprocessor macros have been defined.
 */
 
#ifndef CHECKS_H_
#define CHECKS_H_

/*============================================================================*/
/* Architecture                                                               */
/*============================================================================*/
#undef _ARCH_SET_

/* __C__ */
#ifdef __C__
    #ifdef _ARCH_SET_
        #error "Only one architecture should be specified."
    #else
        #define _ARCH_SET_
    #endif /* #ifdef _ARCH_SET_ */
#endif /* #ifdef __C__ */

/* __MEX__ */
#ifdef __MEX__
    #ifdef _ARCH_SET_
        #error "Only one architecture should be specified."
    #else
        #define _ARCH_SET_
    #endif /* #ifdef _ARCH_SET_ */
#endif /* #ifdef __MEX__ */

#ifdef __AUTOESL__
    #ifdef _ARCH_SET_
        #error "Only one architecture should be specified."
    #else
        #define _ARCH_SET_
    #endif /* #ifdef _ARCH_SET_ */
#endif /* #ifdef __AUTOESL__ */

#ifndef _ARCH_SET_
    #error "No architecture set. Define one of: __PURE_C__, __MEX__, __AUTOESL__"
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

/* SORTED_INSERT */
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
/* Stats                                                                      */
/*============================================================================*/
#if !defined(DEBUG) && defined(STATS)
    #error "STATS should only be defined in DEBUG mode."
#endif /* #if !defined(DEBUG) && defined(STATS) */
/*----------------------------------------------------------------------------*/

#endif /* #ifndef CHECKS_H_ */
