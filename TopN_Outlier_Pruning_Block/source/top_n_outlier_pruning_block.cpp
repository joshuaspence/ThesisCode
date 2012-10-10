/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */

#include "distance.h" /* for distance_squared */
#include "parameters.h" /* for block_size_value, k_value, N_value, num_vectors_value, vector_dims_value */
#include "top_n_outlier_pruning_block.h" /* main include file */
#include "utility.h" /* for ASSERT, double_t, index_t, int_t, MIN, NULL_INDEX, START_INDEX, size_t, uint_t */

#include <float.h> /* for DBL_MIN */
/*----------------------------------------------------------------------------*/

double_t add_neighbour(
        index_t neighbours[k_value],
        double_t neighbours_dist[k_value],
        uint_t & found,
        const index_t new_neighbour,
        const double_t new_neighbour_dist
        ) {
    /* Error checking. */
    ASSERT(k_value > 0);
    ASSERT(found <= k_value);
    ASSERT(new_neighbour >= START_INDEX);
    
    int_t    insert_index  = -1; /* the index at which the new outlier will be inserted */
    double_t removed_value = -1; /* the value that was removed from the neighbours_dist array */
    
#if (INSERT == SORTED)
    /*
     * Shuffle array elements from front to back. Elements greater than the new
     * value will be right-shifted by one index in the array.
     *
     * Note that uninitialised values in the array will appear on the left. That
     * is, if the array is incomplete (has a size n < N) then the data in the
     * array is stored in the rightmost n indexes.
     */
    
    if (found < k_value) {
        /* Special handling required if the array is incomplete. */
        
        uint_t i;
        for (i = k_value - found-1; i < k_value; i++) {
            if (new_neighbour_dist > neighbours_dist[i] || i == (k_value-found-1)) {
                /* Shuffle values down the array. */
                if (i > 0) {
                    neighbours     [i-1] = neighbours     [i];
                    neighbours_dist[i-1] = neighbours_dist[i];
                }
                insert_index  = i;
                removed_value = 0;
            } else {
                /* We have found the insertion point. */
                break;
            }
        }
    } else {
        int_t i;
        for (i = k_value - 1; i >= 0; i--) {
            if (new_neighbour_dist < neighbours_dist[i]) {
                if ((unsigned) i == k_value - 1)
                    /*
                     * The removed value is the value of the last element in the
                     * array.
                     */
                    removed_value = neighbours_dist[i];
                /* Shuffle values down the array. */
                
                if (i > 0) {
                    neighbours     [i] = neighbours     [i-1];
                    neighbours_dist[i] = neighbours_dist[i-1];
                }
                insert_index = i;
            } else {
                /* We have found the insertion point. */
                break;
            }
        }
    }
#elif (INSERT == UNSORTED)
    if (found < k_value) {
        insert_index  = found;
        removed_value = 0;
    } else {
        int_t    max_index = -1;
        double_t max_value = DBL_MIN;
        
        int_t i;
        for (i = k_value - 1; i >= 0; i--) {
            if (max_index < 0 || neighbours_dist[i] > max_value) {
                max_index = i;
                max_value = neighbours_dist[i];
            }
        }
        
        if (new_neighbour_dist < max_value) {
            insert_index  = max_index;
            removed_value = max_value;
        }
    }
#endif /* #if (INSERT == SORTED) */
    
    /*
     * Insert the new pair and increment the current_size of the array (if
     * necessary).
     */
    if (insert_index >= 0) {
        neighbours     [insert_index] = new_neighbour;
        neighbours_dist[insert_index] = new_neighbour_dist;
        
        if (found < k_value)
            found++;
    }
    
    return removed_value;
}

void best_outliers(
        size_t & outliers_size,
        index_t outliers[N_value],
        double_t outlier_scores[N_value],
#if (BLOCKING == ENABLED)
        const size_t block_size,
        const index_t current_block[block_size_value],
        const double_t scores[block_size_value]
#elif (BLOCKING==DISABLED)
        const index_t vector,
        const double_t score
#endif /* #if (BLOCKING==ENABLED) */
        ) {
    /* Error checking. */
    ASSERT(outliers_size <= N_value);
    ASSERT(N_value > 0);
#if (BLOCKING == ENABLED)
    ASSERT(block_size > 0);
    ASSERT(block_size <= block_size_value);
#endif /* #if (BLOCKING == ENABLED) */
    
#if (BLOCKING==ENABLED)
    /* 
     * Sort the (current_block, scores) vectors in descending order of value.
     *
     * Make a copy first, so that we don't need to modify the input block and 
     * score arrays.
     */
    index_t  block_copy [block_size_value];
    double_t scores_copy[block_size_value];
    
    MEMCPY_1D(block_copy,  current_block, block_size, sizeof(index_t));
    MEMCPY_1D(scores_copy, scores,        block_size, sizeof(double_t));
    
    sort_block_scores_descending(block_size, block_copy, scores_copy);
#endif /* #if (BLOCKING == ENABLED) */
    
    /* Create two temporary vectors for the output of the "merge" function. */
    index_t  new_outliers      [N_value];
    double_t new_outlier_scores[N_value];
    size_t   new_outliers_size = 0;
    
    MEMSET_1D(new_outliers,       NULL_INDEX, N_value, sizeof(index_t));
    MEMSET_1D(new_outlier_scores,          0, N_value, sizeof(double_t));
    
    /* Merge the two vectors. */
#if (BLOCKING == ENABLED)
    merge(outliers_size, outliers, outlier_scores, block_size, block_copy, scores_copy, new_outliers_size, new_outliers, new_outlier_scores);
#elif (BLOCKING == DISABLED)
    merge(outliers_size, outliers, outlier_scores,             vector,     score,       new_outliers_size, new_outliers, new_outlier_scores);
#endif /* #if (BLOCKING==ENABLED) */
    
    /* Copy values from temporary vectors to real vectors. */
    MEMCPY_1D(outliers,       new_outliers,       N_value, sizeof(index_t));
    MEMCPY_1D(outlier_scores, new_outlier_scores, N_value, sizeof(double_t));
    outliers_size = new_outliers_size;
}

#if (BLOCKING == ENABLED)
void sort_block_scores_descending(
        const size_t block_size,
        index_t indexes[block_size_value],
        double_t values[block_size_value]
        ) {
    /* Error checking. */
    ASSERT(block_size > 0);
    ASSERT(block_size <= block_size_value);
    
    uint_t i;
    for (i = 0; i < block_size; i++) {
        int_t j;
        index_t  index = indexes[i];
        double_t value = values [i];
        
        for (j = i-1; j >= 0; j--) {
            if (values[j] >= value)
                break;
            indexes[j+1] = indexes[j];
            values [j+1] = values [j];
        }
        
        indexes[j+1] = index;
        values [j+1] = value;
    }
}
#endif /* #if (BLOCKING == ENABLED) */

void merge(const size_t global_outliers_size, const index_t global_outliers[], const double_t global_outlier_scores[],
#if (BLOCKING == ENABLED)
           const size_t block_size,           const index_t local_outliers[],  const double_t local_outlier_scores[],
#elif (BLOCKING == DISABLED)
                                              const index_t local_outlier,     const double_t local_outlier_score,
#endif /* #if (BLOCKING == ENABLED) */
           size_t & new_outliers_size,        index_t new_outliers[],          double_t new_outlier_scores[]) {
    /* Error checking. */
    ASSERT(global_outliers_size <= N_value);
    ASSERT(N_value > 0);
#if (BLOCKING == ENABLED)
    ASSERT(block_size > 0);
    ASSERT(block_size <= block_size_value);
#endif /* #if (BLOCKING == ENABLED) */
    
    new_outliers_size   = 0;
    uint_t iter         = 0; /* iterator through output array */
    uint_t global       = 0; /* iterator through global array */
#if (BLOCKING == ENABLED)
    uint_t local        = 0; /* iterator through local array */
#elif (BLOCKING == DISABLED)
    bool local          = false;
#endif /* #if (BLOCKING==ENABLED) */
    
#if (BLOCKING == ENABLED)
    while (iter < N_value && (global < global_outliers_size || local < block_size)) {
        if (global >= global_outliers_size && local < block_size) {
#elif (BLOCKING == DISABLED)
    while (iter < N_value && (global < global_outliers_size || !local)) {
        if (global >= global_outliers_size && !local) {
#endif /* #if (BLOCKING==ENABLED) */
            /* There are no remaining elements in the global arrays. */
#if (BLOCKING == ENABLED)
            new_outliers      [iter] = local_outliers      [local];
            new_outlier_scores[iter] = local_outlier_scores[local];
            local++;
#elif (BLOCKING == DISABLED)
            new_outliers      [iter] = local_outlier;
            new_outlier_scores[iter] = local_outlier_score;
            local = true;
#endif /* #if (BLOCKING == ENABLED) */
            global++;
#if (BLOCKING == ENABLED)
        } else if (global < global_outliers_size && local >= block_size) {
#elif (BLOCKING == DISABLED)
        } else if (global < global_outliers_size && local) {
#endif /* #if (BLOCKING==ENABLED) */
            /* There are no remaining elements in the local arrays. */
            new_outliers      [iter] = global_outliers      [global];
            new_outlier_scores[iter] = global_outlier_scores[global];
#if (BLOCKING == ENABLED)
            local++;
#elif (BLOCKING == DISABLED)
            local = true;
#endif /* #if (BLOCKING == ENABLED) */
            global++;
#if (BLOCKING == ENABLED)
        } else if (global >= global_outliers_size && local >= block_size) {
#elif (BLOCKING == DISABLED)
        } else if (global >= global_outliers_size && local) {
#endif /* #if (BLOCKING == ENABLED) */
            /*
             * There are no remaining elements in either the global or local 
             * arrays.
             */
            break;
#if (BLOCKING == ENABLED)
        } else if (global_outlier_scores[global] >= local_outlier_scores[local]) {
#elif (BLOCKING == DISABLED)
        } else if (global_outlier_scores[global] >= local_outlier_score) {
#endif /* #if (BLOCKING == ENABLED) */
            new_outliers      [iter] = global_outliers      [global];
            new_outlier_scores[iter] = global_outlier_scores[global];
            global++;
#if (BLOCKING == ENABLED)
        } else if (global_outlier_scores[global] <= local_outlier_scores[local]) {
            new_outliers      [iter] = local_outliers      [local];
            new_outlier_scores[iter] = local_outlier_scores[local];
            local++;
#elif (BLOCKING == DISABLED)
        } else if (global_outlier_scores[global] <= local_outlier_score) {
            new_outliers      [iter] = local_outlier;
            new_outlier_scores[iter] = local_outlier_score;
            local = true;
#endif /* #if (BLOCKING == ENABLED) */
        }
        
        iter++;
        new_outliers_size++;
    }
}

/* TODO: Make a setup function */
uint_t top_n_outlier_pruning_block(
        const size_t _num_vectors,
        UNUSED const size_t _vector_dims,
        const double_t data[][vector_dims_value],
        UNUSED const size_t _k,
        UNUSED const size_t _N,
        UNUSED const size_t _block_size,
        index_t outliers[N_value],
        double_t outlier_scores[N_value]
        ) {
    /* Error checking. */
    ASSERT(_num_vectors > 0);
    ASSERT(_vector_dims > 0);
    ASSERT(_k > 0);
    ASSERT(_N > 0);
    ASSERT(_block_size > 0);
    
    set_num_vectors(_num_vectors);
    set_vector_dims(_vector_dims);
    set_k(_k);
    set_N(_N);
    set_block_size(_block_size);

    /* Number of pruned vectors. */
    uint_t num_pruned = 0;
    
    /* Set output to zero. */
    MEMSET_1D(outliers,       NULL_INDEX, _N, sizeof(index_t));
    MEMSET_1D(outlier_scores,          0, _N, sizeof(double_t));
    
    double_t cutoff = 0;            /* vectors with a score less than the cutoff will be removed from the block */
    size_t   outliers_found = 0;    /* the number of initialised elements in the outliers array */
    
#if (BLOCKING == ENABLED)
    index_t  block_begin;           /* the index of the first vector in the block currently being processed */
    size_t   block_size;            /* block_size may be smaller than default_block_size if "num_vectors_value mod default_block_size != 0" */
    
    block_loop: for (block_begin = 0; block_begin < num_vectors_value; block_begin += block_size) { /* while there are still blocks to process */
        block_size = MIN(block_begin + block_size_value, num_vectors_value) - block_begin; /* the number of vectors in the current block */
        ASSERT(block_size <= _block_size);
        
        index_t  current_block[block_size_value];               /* the indexes of the vectors in the current block */
        index_t  neighbours[block_size_value][k_value];         /* the "k" nearest neighbours for each vector in the current block */
        double_t neighbours_dist[block_size_value][k_value];    /* the distance of the "k" nearest neighbours for each vector in the current block */
        double_t score[block_size_value];                       /* the average distance to the "k" neighbours */
        uint_t   found[block_size_value];                       /* how many nearest neighbours we have found, for each vector in the block */
        
        /* Reset array contents */
        do {
            uint_t i;
            for (i = 0; i < block_size; i++)
                current_block[i] = (index_t) ((block_begin + i) + START_INDEX);
        } while (0);
        MEMSET_2D(neighbours,      NULL_INDEX, block_size, _k, sizeof(index_t));
        MEMSET_2D(neighbours_dist,          0, block_size, _k, sizeof(double_t));
        MEMSET_1D(score,                    0, block_size,     sizeof(double_t));
        MEMSET_1D(found,                    0, block_size,     sizeof(uint_t));
        
        index_t vector1;
        outer_loop: for (vector1 = START_INDEX; vector1 < num_vectors_value + START_INDEX; vector1++) {
            uint_t block_index;
            inner_loop: for (block_index = 0; block_index < block_size; block_index++) {
                const index_t vector2 = current_block[block_index];
                if (vector1 != vector2 && vector2 >= START_INDEX) {
                    /*
                     * Calculate the square of the distance between the two
                     * vectors (indexed by "vector1" and "vector2")
                     */
                    double_t dist_squared = 0;
                    double_t vector1_in[num_vectors_value];
                    double_t vector2_in[num_vectors_value];

                    uint_t i;
                    for (i = 0; i < num_vectors_value; i++) {
#if defined(__AUTOESL__) && defined(TOP__DISTANCE_SQUARED)
                        vector1_in[i].data = data[vector1-START_INDEX][i];
                        vector1_in[i].keep = 0;
                        vector1_in[i].last = 0;

                        vector2_in[i].data = data[vector2-START_INDEX][i];
                        vector2_in[i].keep = 0;
						vector2_in[i].last = 0;
#else
                    	vector1_in[i] = data[vector1-START_INDEX][i];
						vector2_in[i] = data[vector2-START_INDEX][i];
#endif /* #if defined(__AUTOESL__) && defined(TOP__DISTANCE_SQUARED) */
                    }
                    distance_squared(vector1_in, vector2_in, dist_squared);
                    
                   /*
                     * Insert the new (index, distance) pair into the neighbours
                     * array for the current vector.
                     */
                    const double_t removed_distance = add_neighbour(neighbours[block_index], neighbours_dist[block_index], found[block_index], vector1, dist_squared);
                    
                    /*
                     * Update the score (if the neighbours array was changed).
                     */
                    if (removed_distance >= 0)
                        score[block_index] = (double_t) ((score[block_index] * _k - removed_distance + dist_squared) / _k);
                    
                    /*
                     * If the score for this vector is less than the cutoff,
                     * then prune this vector from the block.
                     */
                    if (found[block_index] >= _k && score[block_index] < cutoff) {
                        current_block[block_index] = NULL_INDEX;
                        score        [block_index] = 0;
                        INCREMENT_UINT_T(num_pruned);
                    }
                }
            }
        }
        
        /* Keep track of the top "N" outliers. */
        best_outliers(outliers_found, outliers, outlier_scores, block_size, current_block, score);
        
        /*
         * Set "cutoff" to the score of the weakest outlier. There is no need to
         * store an outlier in future iterations if its score is better than the
         * cutoff.
         */
        cutoff = outlier_scores[N_value - 1];
    }
#elif (BLOCKING == DISABLED)
    index_t vector1;
    outer_loop: for (vector1 = START_INDEX; vector1 < num_vectors_value + START_INDEX; vector1++) {
        index_t  neighbours[k_value];       /* the "k" nearest neighbours for the current vector */
        double_t neighbours_dist[k_value];  /* the distance of the "k" nearest neighbours for the current vector */
        double_t score = 0;                 /* the average distance to the "k" neighbours */
        uint_t   found = 0;                 /* how many nearest neighbours we have found */
        bool     removed = false;           /* true if vector1 has been pruned */
        
        MEMSET_1D(neighbours,      NULL_INDEX, _k, sizeof(index_t));
        MEMSET_1D(neighbours_dist,          0, _k, sizeof(double_t));
        
        index_t vector2;
        inner_loop: for (vector2 = START_INDEX; vector2 < num_vectors_value + START_INDEX && !removed; vector2++) {
            if (vector1 != vector2) {
                /*
                 * Calculate the square of the distance between the two
                 * vectors (indexed by "vector1" and "vector2")
                 */
                double_t dist_squared = 0;
                double_t vector1_in[num_vectors_value];
                double_t vector2_in[num_vectors_value];

                uint_t i;
                for (i = 0; i < num_vectors_value; i++) {
                    vector1_in[i] = data[vector1-START_INDEX][i];
                    vector2_in[i] = data[vector2-START_INDEX][i];
                }
                distance_squared(vector1_in, vector2_in, dist_squared);
                
                /*
                 * Insert the new (index, distance) pair into the neighbours
                 * array for the current vector.
                 */
                const double_t removed_distance = add_neighbour(neighbours, neighbours_dist, found, vector1, dist_squared);
                
                /* Update the score (if the neighbours array was changed). */
                if (removed_distance >= 0)
                    score = (double_t) ((score * k_value - removed_distance + dist_squared) / k_value);
                
                /*
                 * If the score for this vector is less than the cutoff,
                 * then prune this vector from the block.
                 */
                if (found >= k_value && score < cutoff) {
                    removed = true;
                    INCREMENT_UINT_T(num_pruned);
                    break;
                }
            }
        }
        
        if (!removed) {
            /* Keep track of the top "N" outliers. */
            best_outliers(outliers_found, outliers, outlier_scores, vector1, score);
            
            /*
             * Set "cutoff" to the score of the weakest outlier. There is no need to
             * store an outlier in future iterations if its score is better than the
             * cutoff.
             */
            cutoff = outlier_scores[N_value - 1];
        }
    }
#endif /* #if (BLOCKING == ENABLED) */    
    return num_pruned;
}
