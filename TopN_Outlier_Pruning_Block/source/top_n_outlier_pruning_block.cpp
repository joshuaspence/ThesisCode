/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "top_n_outlier_pruning_block.h" /* main include file */
#include "utility.h" /* for ASSERT, MIN, NULL_INDEX, START_INDEX */

#include <float.h> /* for DBL_MIN */
#include <stddef.h> /* for size_t */
#include <string.h> /* for memset */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Static variables                                                           */
/*============================================================================*/
static size_t       num_vectors;
static double       data[MAX_NUM_VECTORS][VECTOR_DIMS];
static unsigned int outliers[N_VALUE];
static double       outlier_scores[N_VALUE];

#if (BLOCKING == ENABLED)
/* The current block */
static size_t       current_block_size;                     /* BLOCK_SIZE may be smaller than default_BLOCK_SIZE if "num_vectors_value mod default_BLOCK_SIZE != 0" */
static unsigned int current_block[BLOCK_SIZE];              /* the indexes of the vectors in the current block */
static unsigned int neighbours[BLOCK_SIZE][K_VALUE];        /* the "k" nearest neighbours for each vector in the current block */
static double       neighbours_dist[BLOCK_SIZE][K_VALUE];   /* the distance of the "k" nearest neighbours for each vector in the current block */
static double       score[BLOCK_SIZE];                      /* the average distance to the "k" neighbours */
static unsigned int found[BLOCK_SIZE];                      /* how many nearest neighbours we have found, for each vector in the block */
#else
static unsigned int current;
static unsigned int neighbours[K_VALUE];                    /* the "k" nearest neighbours for the current vector */
static double       neighbours_dist[K_VALUE];               /* the distance of the "k" nearest neighbours for the current vector */
static double       score;                                  /* the average distance to the "k" neighbours */
static unsigned int found;                                  /* how many nearest neighbours we have found */
static bool         removed = false;                        /* true if vector1 has been pruned */
#endif /* #if (BLOCKING == ENABLED) */

/* Global statistics */
static unsigned int num_pruned;     /* number of pruned vectors. */
static double       cutoff;         /* vectors with a score less than the cutoff will be removed from the block */
static size_t       outliers_found; /* the number of initialised elements in the outliers array */

/* Function handles */
static set_outer_vector_func set_outer_vector_f = NULL;
static distance_squared_func distance_squared_f = NULL;
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Methods to set parameters and initialise variables                         */
/*============================================================================*/
/*
 * TODO
 */
static void init(const size_t _num_vectors, const double _data[MAX_NUM_VECTORS * VECTOR_DIMS]) {
    ASSERT(_num_vectors > 0 && _num_vectors <= MAX_NUM_VECTORS);

    /* num_vectors */
    num_vectors = _num_vectors;

    /* data */
    unsigned int vector;
    for (vector = 0; vector < MAX_NUM_VECTORS; vector++) {
        unsigned int dim;
        for (dim = 0; dim < VECTOR_DIMS; dim++) {
            if (vector >= num_vectors) {
                data[vector][dim] = 0;
            } else {
                data[vector][dim] = _data[vector * VECTOR_DIMS + dim];
            }
        }
    }

    /* outliers and outlier_scores */
    memset(outliers,     NULL_INDEX, N_VALUE * sizeof(unsigned int));
    memset(outlier_scores,      0.0, N_VALUE * sizeof(double));

    /* num_pruned */
    num_pruned = 0;

    /* cutoff */
    cutoff = 0;

    /* outliers_found */
    outliers_found = 0;
}

/*
 * TODO
 */
#if (BLOCKING == ENABLED)
static void init_block(void) {
    memset(current_block,   NULL_INDEX,    N_VALUE *           sizeof(unsigned int));
    memset(neighbours,      NULL_INDEX, BLOCK_SIZE * K_VALUE * sizeof(unsigned int));
    memset(neighbours_dist,        0.0, BLOCK_SIZE * K_VALUE * sizeof(double));
    memset(score,                    0, BLOCK_SIZE *           sizeof(double));
    memset(found,                    0, BLOCK_SIZE *           sizeof(unsigned int));
}
#else
static void init_block(const unsigned int vector) {
    memset(neighbours,      NULL_INDEX, K_VALUE * sizeof(unsigned int));
    memset(neighbours_dist,        0.0, K_VALUE * sizeof(double));
    score = 0;
    found = 0;
    removed = false;
    current = vector;
}
#endif /* #if (BLOCKING == ENABLED) */
/*----------------------------------------------------------------------------*/

/*
 * Insert a neighbouring vector into the k nearest neighbours array for a
 * particular vector. Returns the distance value that was removed from the
 * "neighbours_dist" vector, else -1 if no vector was removed.
 *
 * Parameters:
 *     - neighbours: The k nearest neighbours for the current vector.
 *     - neighbours_dist: The distances to the k nearest neighbours for the
 *           current vector.
 *     - found: The number of initialised entries in the neighbours and
 *           neighbours_dist arrays.
 *     - new_neighbour: The new value to be inserted into the neighbours array.
 *     - new_neighbour_dist: The new value to be inserted into the
 *           neighbours_dist array.
 */
double add_neighbour(
#if (BLOCKING == ENABLED)
        const unsigned int vector_bi,
#endif /* #if (BLOCKING == ENABLED) */
        const unsigned int new_neighbour_i,
        const double new_neighbour_dist
        ) {
    /* Error checking. */
    ASSERT(K_VALUE > 0);
#if (BLOCKING == ENABLED)
    ASSERT(found[vector_bi] <= K_VALUE);
#else
    ASSERT(found <= K_VALUE);
#endif /* #if (BLOCKING == ENABLED) */
    ASSERT(new_neighbour_i >= START_INDEX);

    int    insert_index  = -1; /* the index at which the new outlier will be inserted */
    double removed_value = -1; /* the value that was removed from the neighbours_dist array */

#if (INSERT == SORTED)
    /*
     * Shuffle array elements from front to back. Elements greater than the new
     * value will be right-shifted by one index in the array.
     *
     * Note that uninitialised values in the array will appear on the left. That
     * is, if the array is incomplete (has a size n < N) then the data in the
     * array is stored in the rightmost n indexes.
     */
#if (BLOCKING == ENABLED)
    if (found[vector_bi] < K_VALUE) {
#else
    if (found < K_VALUE) {
#endif /* #if (BLOCKING == ENABLED) */
        /* Special handling required if the array is incomplete. */

        unsigned int i;
#if (BLOCKING == ENABLED)
        for (i = K_VALUE - found[vector_bi] - 1; i < K_VALUE; i++) {
            if (new_neighbour_dist > neighbours_dist[vector_bi][i] || i == (K_VALUE - found[vector_bi] - 1)) {
#else
        for (i = K_VALUE - found - 1; i < K_VALUE; i++) {
            if (new_neighbour_dist > neighbours_dist[i] || i == (K_VALUE - found - 1)) {
#endif /* #if (BLOCKING == ENABLED) */
                /* Shuffle values down the array. */
                if (i > 0) {
#if (BLOCKING == ENABLED)
                    neighbours     [vector_bi][i-1] = neighbours     [vector_bi][i];
                    neighbours_dist[vector_bi][i-1] = neighbours_dist[vector_bi][i];
#else
                    neighbours     [i-1] = neighbours     [i];
                    neighbours_dist[i-1] = neighbours_dist[i];
#endif /* #if (BLOCKING == ENABLED) */
                }
                insert_index  = i;
                removed_value = 0;
            } else {
                /* We have found the insertion point. */
                break;
            }
        }
    } else {
        int i;
        add_neighbour_loop2: for (i = K_VALUE - 1; i >= 0; i--) {
#if (BLOCKING == ENABLED)
            if (new_neighbour_dist < neighbours_dist[vector_bi][i]) {
#else
            if (new_neighbour_dist < neighbours_dist[i]) {
#endif /* #if (BLOCKING == ENABLED) */
                if ((unsigned) i == K_VALUE - 1) {
                    /*
                     * The removed value is the value of the last element in the
                     * array.
                     */
#if (BLOCKING == ENABLED)
                    removed_value = neighbours_dist[vector_bi][i];
#else
                    removed_value = neighbours_dist[i];
#endif /* #if (BLOCKING == ENABLED) */
                }

                /* Shuffle values down the array. */
                if (i > 0) {
#if (BLOCKING == ENABLED)
                    neighbours     [vector_bi][i] = neighbours     [vector_bi][i-1];
                    neighbours_dist[vector_bi][i] = neighbours_dist[vector_bi][i-1];
#else
                    neighbours     [i] = neighbours     [i-1];
                    neighbours_dist[i] = neighbours_dist[i-1];
#endif /* #if (BLOCKING == ENABLED) */
                }
                insert_index = i;
            } else {
                /* We have found the insertion point. */
                break;
            }
        }
    }
#elif (INSERT == UNSORTED)
#if (BLOCKING == ENABLED)
    if (found[vector_bi] < K_VALUE) {
        insert_index  = found[vector_bi];
#else
    if (found < K_VALUE) {
        insert_index  = found;
#endif /* #if (BLOCKING == ENABLED) */
        removed_value = 0;
    } else {
        int    max_index = -1;
        double max_value = DBL_MIN;

        int i;
        for (i = K_VALUE - 1; i >= 0; i--) {
#if (BLOCKING == ENABLED)
            if (max_index < 0 || neighbours_dist[vector_bi][i] > max_value) {
                max_value = neighbours_dist[vector_bi][i];
#else
            if (max_index < 0 || neighbours_dist[i] > max_value) {
                max_value = neighbours_dist[i];
#endif /* #if (BLOCKING == ENABLED) */
                max_index = i;
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
#if (BLOCKING == ENABLED)
        neighbours     [vector_bi][insert_index] = new_neighbour_i;
        neighbours_dist[vector_bi][insert_index] = new_neighbour_dist;

        if (found[vector_bi] < K_VALUE) {
            found[vector_bi]++;
        }
#else
        neighbours     [insert_index] = new_neighbour_i;
        neighbours_dist[insert_index] = new_neighbour_dist;

        if (found < K_VALUE) {
            found++;
        }
#endif /* #if (BLOCKING == ENABLED) */
    }

    return removed_value;
}

#if (BLOCKING == ENABLED)
/*
 * Sort paired vectors in descending order. This function uses bubble sort.
 *
 * Parameters:
 *     - BLOCK_SIZE: The number of elements in the indexes and values arrays.
 *     - indexes: A vector containing the indexes of the paired vectors.
 *     - values: A vector containing the values of the paired vectors.
 */
void sort_block_scores_descending(void) {
    /* Error checking. */
    ASSERT(current_block_size > 0 && current_block_size <= BLOCK_SIZE);

    unsigned int i;
    for (i = 0; i < current_block_size; i++) {
        int j;
        const unsigned int index = current_block[i];
        const double       value = score        [i];

        for (j = i - 1; j >= 0; j--) {
            if (score[j] >= value) {
                break;
            }
            current_block[j+1] = current_block[j];
            score        [j+1] = score        [j];
        }

        current_block[j+1] = index;
        score        [j+1] = value;
    }
}
#endif /* #if (BLOCKING == ENABLED) */

/*
 * Take the top N outliers based on the global outliers (identified by the
 * (outliers, outlier_scores) pairs) and the new outliers from the current block
 * (identified by the (current_block, scores) pairs).
 *
 * Note that the (outliers, outlier_scores) vectors should already be sorted.
 * The (current_block, scores) vector need not be sorted.
 *
 * Parameters:
 *     - outliers_size: The number of initialised entries in the outliers and
 *           outlier_scores arrays.
 *     - outliers: A vector containing the indexes of the current global
 *           outliers.
 *     - outlier_scores: A vector containing the scores of the current global
 *           outliers.
 *     - BLOCK_SIZE: The number of vectors in the current block.
 *     - current_block: An array containing the indexes of the vectors in the
 *           current block.
 *     - scores: A vector containing the outlier scores for each element in the
 *           current block.
 */
void update_best_outliers(void) {
    /* Error checking. */
    ASSERT(outliers_found <= N_VALUE);
    ASSERT(N_VALUE > 0);
#if (BLOCKING == ENABLED)
    ASSERT(BLOCK_SIZE > 0);
    ASSERT(current_block_size > 0 && current_block_size <= BLOCK_SIZE);
#endif /* #if (BLOCKING == ENABLED) */

#if (BLOCKING == ENABLED)
    sort_block_scores_descending();
#endif /* #if (BLOCKING == ENABLED) */

    /* Create two temporary vectors for the output of the "merge" function. */
    unsigned int new_outliers      [N_VALUE];
    double       new_outlier_scores[N_VALUE];
    size_t       new_outliers_size = 0;

    memset(new_outliers,       NULL_INDEX, N_VALUE * sizeof(unsigned int));
    memset(new_outlier_scores,          0, N_VALUE * sizeof(double));

    /* Merge the two vectors. */
    unsigned int iter         = 0; /* iterator through output array */
    unsigned int global       = 0; /* iterator through global array */
#if (BLOCKING == ENABLED)
    unsigned int local        = 0; /* iterator through local array */
#elif (BLOCKING == DISABLED)
    bool local          = false;
#endif /* #if (BLOCKING==ENABLED) */

#if (BLOCKING == ENABLED)
    while (iter < N_VALUE && (global < outliers_found || local < current_block_size)) {
        if (global >= outliers_found && local < current_block_size) {
#elif (BLOCKING == DISABLED)
    while (iter < N_VALUE && (global < outliers_found || !local)) {
        if (global >= outliers_found && !local) {
#endif /* #if (BLOCKING==ENABLED) */
            /* There are no remaining elements in the global arrays. */
#if (BLOCKING == ENABLED)
            new_outliers      [iter] = current_block[local];
            new_outlier_scores[iter] = score        [local];
            local++;
#elif (BLOCKING == DISABLED)
            new_outliers      [iter] = current;
            new_outlier_scores[iter] = score;
            local = true;
#endif /* #if (BLOCKING == ENABLED) */
            global++;
#if (BLOCKING == ENABLED)
        } else if (global < outliers_found && local >= current_block_size) {
#elif (BLOCKING == DISABLED)
        } else if (global < outliers_found && local) {
#endif /* #if (BLOCKING==ENABLED) */
            /* There are no remaining elements in the local arrays. */
            new_outliers      [iter] = outliers      [global];
            new_outlier_scores[iter] = outlier_scores[global];
#if (BLOCKING == ENABLED)
            local++;
#elif (BLOCKING == DISABLED)
            local = true;
#endif /* #if (BLOCKING == ENABLED) */
            global++;
#if (BLOCKING == ENABLED)
        } else if (global >= outliers_found && local >= current_block_size) {
#elif (BLOCKING == DISABLED)
        } else if (global >= outliers_found && local) {
#endif /* #if (BLOCKING == ENABLED) */
            /*
             * There are no remaining elements in either the global or local
             * arrays.
             */
            break;
#if (BLOCKING == ENABLED)
        } else if (outlier_scores[global] >= score[local]) {
#elif (BLOCKING == DISABLED)
        } else if (outlier_scores[global] >= score) {
#endif /* #if (BLOCKING == ENABLED) */
            new_outliers      [iter] = outliers      [global];
            new_outlier_scores[iter] = outlier_scores[global];
            global++;
#if (BLOCKING == ENABLED)
        } else if (outlier_scores[global] <= score[local]) {
            new_outliers      [iter] = current_block[local];
            new_outlier_scores[iter] = score        [local];
            local++;
#elif (BLOCKING == DISABLED)
        } else if (outlier_scores[global] <= score) {
            new_outliers      [iter] = current;
            new_outlier_scores[iter] = score;
            local = true;
#endif /* #if (BLOCKING == ENABLED) */
        }

        iter++;
        new_outliers_size++;
    }

    /* Copy values from temporary vectors to real vectors. */
    memcpy(outliers,       new_outliers,       N_VALUE * sizeof(unsigned int));
    memcpy(outlier_scores, new_outlier_scores, N_VALUE * sizeof(double));
    outliers_found = new_outliers_size;
}

unsigned int top_n_outlier_pruning_block(
        const size_t _num_vectors,
        UNUSED const size_t _vector_dims,
        const double _data[MAX_NUM_VECTORS * VECTOR_DIMS],
        UNUSED const size_t _k,
        UNUSED const size_t _N,
        UNUSED const size_t _block_size,
        unsigned int _outliers[N_VALUE],
        double _outlier_scores[N_VALUE],
        set_outer_vector_func _set_outer_vector_f,
        distance_squared_func _distance_squared_f
        ) {
    /* Error checking. */
    ASSERT(_set_outer_vector_f != NULL && _distance_squared_f != NULL);
    ASSERT(_num_vectors > 0 && _num_vectors <= MAX_NUM_VECTORS);
    ASSERT(_vector_dims == VECTOR_DIMS);
    ASSERT(_k == K_VALUE);
    ASSERT(_N == N_VALUE);
    ASSERT(_block_size == BLOCK_SIZE);

    /* Set function handles */
    set_outer_vector_f = _set_outer_vector_f;
    distance_squared_f = _distance_squared_f;

    /* Set global variables */
    init(_num_vectors, _data);

#if (BLOCKING == ENABLED)
    unsigned int block_begin; /* the index of the first vector in the block currently being processed */
    for (block_begin = 0; block_begin < num_vectors; block_begin += current_block_size) { /* while there are still blocks to process */
        current_block_size = MIN(block_begin + BLOCK_SIZE, num_vectors) - block_begin; /* the number of vectors in the current block */
        ASSERT(current_block_size <= BLOCK_SIZE);

        /* Initialise the current block */
        init_block();
        do {
            unsigned int i;
            for (i = 0; i < current_block_size; i++)
                current_block[i] = ((block_begin + i) + START_INDEX);
        } while (0);

        unsigned int vector1;
        for (vector1 = START_INDEX; vector1 < num_vectors + START_INDEX; vector1++) {
            unsigned int vector2_bi;
            (*set_outer_vector_f)(data[(vector1 - START_INDEX)]);

            for (vector2_bi = 0; vector2_bi < current_block_size; vector2_bi++) {
                const unsigned int vector2 = current_block[vector2_bi];
                if (vector1 != vector2 && vector2 >= START_INDEX) {
                    /*
                     * Calculate the square of the distance between the two
                     * vectors (indexed by "vector1_index" and "vector2_index").
                     */
                    const double dist_squared = (*distance_squared_f)(data[(vector2 - START_INDEX)]);

                    /*
                     * Insert the new (index, distance) pair into the neighbours
                     * array for the current vector.
                     */
                    const double removed_distance = add_neighbour(vector2_bi, vector1, dist_squared);

                    /*
                     * Update the score (if the neighbours array was changed).
                     */
                    if (removed_distance >= 0) {
                        score[vector2_bi] = ((score[vector2_bi] * K_VALUE - removed_distance + dist_squared) / K_VALUE);
                    }

                    /*
                     * If the score for this vector is less than the cutoff,
                     * then prune this vector from the block.
                     */
                    if (found[vector2_bi] >= K_VALUE && score[vector2_bi] < cutoff) {
                        current_block[vector2_bi] = NULL_INDEX;
                        score        [vector2_bi] = 0;
                        num_pruned++;
                    }
                }
            }
        }

        /* Keep track of the top "N" outliers. */
        update_best_outliers();

        /*
         * Set "cutoff" to the score of the weakest outlier. There is no need to
         * store an outlier in future iterations if its score is better than the
         * cutoff.
         */
        cutoff = outlier_scores[N_VALUE - 1];
    }
#elif (BLOCKING == DISABLED)
    unsigned int vector1;
    for (vector1 = START_INDEX; vector1 < num_vectors + START_INDEX; vector1++) {
        init_block(vector1);
        (*set_outer_vector_f)(data[(vector1 - START_INDEX)]);

        unsigned int vector2;
        inner_loop: for (vector2 = START_INDEX; vector2 < num_vectors + START_INDEX && !removed; vector2++) {
            if (vector1 != vector2) {
                /*
                 * Calculate the square of the distance between the two
                 * vectors (indexed by "vector1" and "vector2")
                 */
                const double dist_squared = (*distance_squared_f)(data[(vector2 - START_INDEX)]);

                /*
                 * Insert the new (index, distance) pair into the neighbours
                 * array for the current vector.
                 */
                const double removed_distance = add_neighbour(vector1, dist_squared);

                /* Update the score (if the neighbours array was changed). */
                if (removed_distance >= 0) {
                    score = ((score * K_VALUE - removed_distance + dist_squared) / K_VALUE);
                }

                /*
                 * If the score for this vector is less than the cutoff,
                 * then prune this vector from the block.
                 */
                if (found >= K_VALUE && score < cutoff) {
                    removed = true;
                    num_pruned++;
                    break;
                }
            }
        }

        if (!removed) {
            /* Keep track of the top "N" outliers. */
            update_best_outliers();

            /*
             * Set "cutoff" to the score of the weakest outlier. There is no need to
             * store an outlier in future iterations if its score is better than the
             * cutoff.
             */
            cutoff = outlier_scores[N_VALUE - 1];
        }
    }
#endif /* #if (BLOCKING == ENABLED) */

    memcpy(_outliers,       outliers,       N_VALUE * sizeof(unsigned int));
    memcpy(_outlier_scores, outlier_scores, N_VALUE * sizeof(double));

    return num_pruned;
}