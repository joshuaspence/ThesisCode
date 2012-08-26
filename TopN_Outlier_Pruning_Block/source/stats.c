/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "stats.h" /* main header file */
#include "utility.h" /* for lint_t, uint_t, ASSERT */
/*----------------------------------------------------------------------------*/

lint_t calls_counter     = 0;
uint_t num_pruned        = 0;

/*
 * Retrieve statistics describing the profile execution.
 *
 * Parameters:
 *     - counter: Stores the number of ties that the distance_squared function
 *           was called.
 *     - prune_count: Calculates the number of vectors that were pruned by this
 *           algorithm.
 */
void get_stats(lint_t * const counter, uint_t * const prune_count) {
    ASSERT(counter != NULL);
    ASSERT(prune_count != NULL);
    
    *counter            = calls_counter;
    *prune_count        = num_pruned;
}
