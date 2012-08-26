#ifndef STATS_H_
#define STATS_H_

#ifdef STATS
    /*========================================================================*/
    /* Includes                                                               */
    /*========================================================================*/
    #include "utility.h" /* for ASSERT, EMPTY_STATEMENT, lint_t, uint_t, UNUSED */
    /*------------------------------------------------------------------------*/
    
    #define STATS_INCREMENT_CALLS_COUNTER() \
        do { \
            const UNUSED lint_t old_calls_counter = calls_counter; \
            calls_counter++; \
            ASSERT(calls_counter > old_calls_counter); \
        } while (0)
    
    #define STATS_INCREMENT_NUM_PRUNED() \
        do { \
            const UNUSED uint_t old_num_pruned = num_pruned; \
            num_pruned++; \
            ASSERT(num_pruned > old_num_pruned); \
        } while (0)
    
    extern lint_t calls_counter;
    extern uint_t num_pruned;

    void get_stats(
        lint_t * const counter,
        uint_t * const prune_count
        );

#else
    #define STATS_INCREMENT_CALLS_COUNTER()     EMPTY_STATEMENT()
    #define STATS_INCREMENT_NUM_PRUNED()        EMPTY_STATEMENT()
#endif /* #ifdef STATS */

#endif /* #ifndef STATS_H_ */
