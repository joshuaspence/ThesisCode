/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */

#include "top_n_outlier_pruning_block.h" /* main include file */
#include "utility.h" /* for ASSERT, double_t, index_t, int_t, MIN, NULL_INDEX, START_INDEX, size_t, uint_t */

#include <float.h> /* for DBL_MIN */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Constants                                                                  */
/*============================================================================*/
const size_t max_num_vectors = MAX_NUM_VECTORS;
const size_t vector_dims = VECTOR_DIMS;
const size_t k = K_VALUE;
const size_t N = N_VALUE;
const size_t block_size = BLOCK_SIZE;
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Static variables                                                           */
/*============================================================================*/
static size_t   num_vectors;
static double_t data[max_num_vectors][vector_dims];
static index_t  outliers[N];
static double_t outlier_scores[N];

#if (BLOCKING == ENABLED)
/* The current block */
static size_t   current_block_size;             /* block_size may be smaller than default_block_size if "num_vectors_value mod default_block_size != 0" */
static index_t  current_block[block_size];      /* the indexes of the vectors in the current block */
static index_t  neighbours[block_size][k];      /* the "k" nearest neighbours for each vector in the current block */
static double_t neighbours_dist[block_size][k]; /* the distance of the "k" nearest neighbours for each vector in the current block */
static double_t score[block_size];              /* the average distance to the "k" neighbours */
static uint_t   found[block_size];              /* how many nearest neighbours we have found, for each vector in the block */
#else
static index_t  current;
static index_t  neighbours[k];                  /* the "k" nearest neighbours for the current vector */
static double_t neighbours_dist[k];             /* the distance of the "k" nearest neighbours for the current vector */
static double_t score;                          /* the average distance to the "k" neighbours */
static uint_t   found;                          /* how many nearest neighbours we have found */
static bool     removed = false;                /* true if vector1 has been pruned */
#endif /* #if (BLOCKING == ENABLED) */

/* Global statistics */
static uint_t   num_pruned;                     /* number of pruned vectors. */
static double_t cutoff;                         /* vectors with a score less than the cutoff will be removed from the block */
static size_t   outliers_found;                 /* the number of initialised elements in the outliers array */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Methods to set parameters and initialise variables                         */
/*============================================================================*/
/*
 * TODO
 */
static void init(const size_t _num_vectors, const double_t _data[MAX_NUM_VECTORS * VECTOR_DIMS]) {
    /* num_vectors */
    num_vectors = _num_vectors;
    
    /* data */
    // TODO: MEMCPY_2D
    uint_t vector;
    for (vector = 0; vector < max_num_vectors; vector++) {
        uint_t dim;
        for (dim = 0; dim < vector_dims; dim++) {
            if (vector >= num_vectors) {
                data[vector][dim] = 0;
            } else {
                data[vector][dim] = _data[vector * vector_dims + dim];
            }
        }
    }
    
    /* outliers and outlier_scores */
    MEMSET_1D(outliers,       NULL_INDEX, N, sizeof(index_t));
    MEMSET_1D(outlier_scores,        0.0, N, sizeof(double_t));
    
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
    MEMSET_1D(current_block,   NULL_INDEX,          N,    sizeof(index_t));
    MEMSET_2D(neighbours,      NULL_INDEX, block_size, k, sizeof(index_t));
    MEMSET_2D(neighbours_dist,        0.0, block_size, k, sizeof(double_t));
    MEMSET_1D(score,                    0, block_size,    sizeof(double_t));
    MEMSET_1D(found,                    0, block_size,    sizeof(uint_t));
}
#else
static void init_block(const index_t vector) {
    MEMSET_1D(neighbours,      NULL_INDEX, k,             sizeof(index_t));
    MEMSET_1D(neighbours_dist,        0.0, k,             sizeof(double_t));
    score = 0;
    found = 0;
    removed = false;
    current = vector;
}
#endif /* #if (BLOCKING == ENABLED) */

/*----------------------------------------------------------------------------*/

/*
 * Calculate the square of the Euclidean distance between two vectors (i.e. the
 * sum of the squares of the distance in each dimension).
 *
 * Parameters:
 *     - vector1: An array of floating point numbers representing the first
 *           vector.
 *     - vector2: An array of floating point numbers representing the second
 *           vector.
 *
 * Return value:
 *     The return value for the function, equal to the square of the distance
 *     between the two vectors.
 */
double_t distance_squared(
        const index_t vector1_i,
        const index_t vector2_i
        ) {
    ASSERT(vector_dims > 0);
    
#ifndef __AUTOESL__
    #define SUM_SPLIT (1)
#else
    #define SUM_SPLIT (8)
#endif /* #ifndef __AUTOESL__ */
    
    double_t sum_of_squares__split[SUM_SPLIT] = { 0.0 };
    
    uint_t dim;
    dimension_loop: for (dim = 0; dim < vector_dims; dim++) {
        const double_t v1                      = data[vector1_i - START_INDEX][dim];
        const double_t v2                      = data[vector2_i - START_INDEX][dim];
        const double_t diff                    = v1 - v2;
        const double_t diff_squared            = diff * diff;
        sum_of_squares__split[dim % SUM_SPLIT] += diff_squared;
    }
    
    double_t sum = 0;
    uint_t i;
    sum_loop: for (i = 0; i < SUM_SPLIT; i++) {
        sum += sum_of_squares__split[i];
    }
    return sum;
}

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
double_t add_neighbour(
#if (BLOCKING == ENABLED)
        const blockindex_t vector_bi,
#endif /* #if (BLOCKING == ENABLED) */
        const index_t new_neighbour_i,
        const double_t new_neighbour_dist
        ) {
    /* Error checking. */
    ASSERT(k > 0);
#if (BLOCKING == ENABLED)
    ASSERT(found[vector_bi] <= k);
#else
    ASSERT(found <= k);
#endif /* #if (BLOCKING == ENABLED) */
    ASSERT(new_neighbour_i >= START_INDEX);
    
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
#if (BLOCKING == ENABLED)
    if (found[vector_bi] < k) {
#else
    if (found < k) {
#endif /* #if (BLOCKING == ENABLED) */
        /* Special handling required if the array is incomplete. */
        
        uint_t i;
#if (BLOCKING == ENABLED)
        for (i = k - found[vector_bi] - 1; i < k; i++) {
            if (new_neighbour_dist > neighbours_dist[vector_bi][i] || i == (k - found[vector_bi] - 1)) {
#else
        for (i = k - found - 1; i < k; i++) {
            if (new_neighbour_dist > neighbours_dist[i] || i == (k - found - 1)) {
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
        int_t i;
        for (i = k - 1; i >= 0; i--) {
#if (BLOCKING == ENABLED)
            if (new_neighbour_dist < neighbours_dist[vector_bi][i]) {
#else
            if (new_neighbour_dist < neighbours_dist[i]) {
#endif /* #if (BLOCKING == ENABLED) */
                if ((unsigned) i == k - 1) {
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
    if (found[vector_bi] < k) {
        insert_index  = found[vector_bi];
#else
    if (found < k) {
        insert_index  = found;
#endif /* #if (BLOCKING == ENABLED) */
        removed_value = 0;
    } else {
        int_t    max_index = -1;
        double_t max_value = DBL_MIN;
        
        int_t i;
        for (i = k - 1; i >= 0; i--) {
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
        
        if (found[vector_bi] < k) {
            found[vector_bi]++;
        }
#else
        neighbours     [insert_index] = new_neighbour_i;
        neighbours_dist[insert_index] = new_neighbour_dist;
        
        if (found < k) {
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
 *     - block_size: The number of elements in the indexes and values arrays.
 *     - indexes: A vector containing the indexes of the paired vectors.
 *     - values: A vector containing the values of the paired vectors.
 */
void sort_block_scores_descending(void) {
    /* Error checking. */
    ASSERT(current_block_size > 0 && current_block_size <= block_size);
    
    uint_t i;
    for (i = 0; i < current_block_size; i++) {
        int_t j;
        const index_t  index = current_block[i];
        const double_t value = score        [i];
        
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
 *     - block_size: The number of vectors in the current block.
 *     - current_block: An array containing the indexes of the vectors in the
 *           current block.
 *     - scores: A vector containing the outlier scores for each element in the
 *           current block.
 */
void update_best_outliers(void) {
    /* Error checking. */
    ASSERT(outliers_found <= N);
    ASSERT(N > 0);
#if (BLOCKING == ENABLED)
    ASSERT(block_size > 0);
    ASSERT(current_block_size > 0 && current_block_size <= block_size);
#endif /* #if (BLOCKING == ENABLED) */
    
#if (BLOCKING == ENABLED)    
    sort_block_scores_descending();
#endif /* #if (BLOCKING == ENABLED) */
    
    /* Create two temporary vectors for the output of the "merge" function. */
    index_t  new_outliers      [N];
    double_t new_outlier_scores[N];
    size_t   new_outliers_size = 0;
    
    MEMSET_1D(new_outliers,       NULL_INDEX, N, sizeof(index_t));
    MEMSET_1D(new_outlier_scores,          0, N, sizeof(double_t));
    
    /* Merge the two vectors. */
    uint_t iter         = 0; /* iterator through output array */
    uint_t global       = 0; /* iterator through global array */
#if (BLOCKING == ENABLED)
    uint_t local        = 0; /* iterator through local array */
#elif (BLOCKING == DISABLED)
    bool local          = false;
#endif /* #if (BLOCKING==ENABLED) */
    
#if (BLOCKING == ENABLED)
    while (iter < N && (global < outliers_found || local < current_block_size)) {
        if (global >= outliers_found && local < current_block_size) {
#elif (BLOCKING == DISABLED)
    while (iter < N && (global < outliers_found || !local)) {
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
    MEMCPY_1D(outliers,       new_outliers,       N, sizeof(index_t));
    MEMCPY_1D(outlier_scores, new_outlier_scores, N, sizeof(double_t));
    outliers_found = new_outliers_size;
}

uint_t top_n_outlier_pruning_block(
        const size_t _num_vectors,
        UNUSED const size_t _vector_dims,
        const double_t _data[MAX_NUM_VECTORS * VECTOR_DIMS],
        UNUSED const size_t _k,
        UNUSED const size_t _N,
        UNUSED const size_t _block_size,
        index_t _outliers[N],
        double_t _outlier_scores[N]
        ) {
    /* Error checking. */
    ASSERT(_num_vectors > 0 && _num_vectors <= max_num_vectors);
    ASSERT(_vector_dims == vector_dims);
    ASSERT(_k == k);
    ASSERT(_N == N);
    ASSERT(_block_size == block_size);
    
    /* Set global variables */
    init(_num_vectors, _data);
    
#if (BLOCKING == ENABLED)
    index_t block_begin;           /* the index of the first vector in the block currently being processed */
    block_loop: for (block_begin = 0; block_begin < num_vectors; block_begin += current_block_size) { /* while there are still blocks to process */
        current_block_size = MIN(block_begin + block_size, num_vectors) - block_begin; /* the number of vectors in the current block */
        ASSERT(current_block_size <= block_size);
        
        /* Initialise the current block */
        init_block();
        do {
            blockindex_t i;
            for (i = 0; i < current_block_size; i++)
                current_block[i] = (index_t) ((block_begin + i) + START_INDEX);
        } while (0);
        
        index_t vector1;
        outer_loop: for (vector1 = START_INDEX; vector1 < num_vectors + START_INDEX; vector1++) {
            blockindex_t vector2_bi;
            inner_loop: for (vector2_bi = 0; vector2_bi < current_block_size; vector2_bi++) {
                const index_t vector2 = current_block[vector2_bi];
                if (vector1 != vector2 && vector2 >= START_INDEX) {
                    /*
                     * Calculate the square of the distance between the two
                     * vectors (indexed by "vector1_index" and "vector2_index").
                     */
                    const double_t dist_squared = distance_squared(vector1, vector2);
                    
                    /*
                     * Insert the new (index, distance) pair into the neighbours
                     * array for the current vector.
                     */
                    const double_t removed_distance = add_neighbour(vector2_bi, vector1, dist_squared);
                    
                    /*
                     * Update the score (if the neighbours array was changed).
                     */
                    if (removed_distance >= 0) {
                        score[vector2_bi] = (double_t) ((score[vector2_bi] * k - removed_distance + dist_squared) / k);
                    }
                    
                    /*
                     * If the score for this vector is less than the cutoff,
                     * then prune this vector from the block.
                     */
                    if (found[vector2_bi] >= k && score[vector2_bi] < cutoff) {
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
        cutoff = outlier_scores[N-1];
    }
#elif (BLOCKING == DISABLED)
    index_t vector1;
    outer_loop: for (vector1 = START_INDEX; vector1 < num_vectors + START_INDEX; vector1++) {
        init_block(vector1);
        
        index_t vector2;
        inner_loop: for (vector2 = START_INDEX; vector2 < num_vectors + START_INDEX && !removed; vector2++) {
            if (vector1 != vector2) {
                /*
                 * Calculate the square of the distance between the two
                 * vectors (indexed by "vector1" and "vector2")
                 */
                const double_t dist_squared = distance_squared(vector1, vector2);
                
                /*
                 * Insert the new (index, distance) pair into the neighbours
                 * array for the current vector.
                 */
                const double_t removed_distance = add_neighbour(vector1, dist_squared);
                
                /* Update the score (if the neighbours array was changed). */
                if (removed_distance >= 0) {
                    score = (double_t) ((score * k - removed_distance + dist_squared) / k);
                }
                
                /*
                 * If the score for this vector is less than the cutoff,
                 * then prune this vector from the block.
                 */
                if (found >= k && score < cutoff) {
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
            cutoff = outlier_scores[N-1];
        }
    }
#endif /* #if (BLOCKING == ENABLED) */
    
    MEMCPY_1D(_outliers,       outliers,       N, sizeof(index_t));
    MEMCPY_1D(_outlier_scores, outlier_scores, N, sizeof(double_t));
    
    return num_pruned;
}
