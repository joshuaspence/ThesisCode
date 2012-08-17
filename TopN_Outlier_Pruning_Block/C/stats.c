#include "stats.h"
#include "utility.h" /* for lint_t, uint_t, ASSERT_NOT_NULL */

lint_t calls_counter = 0;
uint_t num_pruned    = 0;

void get_stats(lint_t * const counter, uint_t * const prune_count) {
    ASSERT_NOT_NULL(counter);
    ASSERT_NOT_NULL(prune_count);
    
    *counter = calls_counter;
    *prune_count = num_pruned;
}
