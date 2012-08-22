/*
 * This header files enables and disables certain code features based on the 
 * chosen architecture.
 */

#ifndef ARCH_H_
#define ARCH_H_

#define DISABLED    (0)
#define ENABLED     (1)

#undef _POINTER_COMPARISON
#undef _MEMSET

/* __C__ */
#ifdef __C__
    #define _POINTER_COMPARISON_    ENABLED
    #define _MEMSET_                ENABLED
#endif /* #ifdef __C__ */

/* __MEX__ */
#ifdef __MEX__
    #define _POINTER_COMPARISON_    ENABLED
    #define _MEMSET_                ENABLED
#endif /* #ifdef __MEX__ */

/* __AUTOESL__ */
#ifdef __AUTOESL__
    #define _POINTER_COMPARISON_    DISABLED
    #define _MEMSET_                ENABLED
#endif /* #ifdef __AUTOESL__ */

#endif /* #ifndef ARCH_H_ */
