#if !defined(STATS_H_) && defined(STATS)
#define STATS_H_

#include "utility.h" /* for lint_t, uint_t */

#ifndef DEBUG
    #error "STATS should only be defined in DEBUG mode."
#endif /* #ifndef DEBUG */

extern lint_t calls_counter;
extern uint_t num_pruned;

void get_stats(
    lint_t * const counter,
    uint_t * const prune_count
    );

#endif /* #if !defined(STATS_H_) && defined(STATS) */
