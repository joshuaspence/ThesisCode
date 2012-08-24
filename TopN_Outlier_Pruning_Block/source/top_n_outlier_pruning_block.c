/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */

#include "stats.h" /* for STATS_INCREMENT_CALLS_COUNTER, STATS_INCREMENT_NUM_PRUNED */
#include "top_n_outlier_pruning_block.h"
#include "utility.h" /* for ASSERT, ASSERT_NOT_NULL, boolean, double_t, false, index_t, int_t, MEMCPY, MEMSET, MIN, null_index, start_index, true, uint_t */

#include <float.h> /* for DBL_MIN */
#include <stddef.h> /* for size_t */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Forward declarations                                                       */
/*============================================================================*/
static inline double_t distance_squared(
    const size_t vector_dims,
    const double_t (* const vector1)[vector_dims],
    const double_t (* const vector2)[vector_dims]
    );
static inline double_t insert(
    const size_t k,
    index_t (* const neighbours)[k],
    double_t (* const neighbours_dist)[k],    
    uint_t * const found,
    const index_t new_neighbour, 
    const double_t new_neighbour_dist
    );
static inline void best_outliers(
    const size_t N,
    size_t * const outliers_size,
    index_t (* const outliers)[N],
    double_t (* const outlier_scores)[N],
    const size_t block_size,
    index_t (* const current_block)[block_size],
    double_t (* const scores)[block_size]
    );
static inline void sort_vectors_descending(
    const size_t size,
    index_t (* const indexes)[size],
    double_t (* const values)[size]
    );
static inline void merge(
    const size_t N,
    const size_t global_outliers_size,
    index_t (* const global_outliers)[N],
    double_t (* const global_outlier_scores)[N],
    const size_t block_size,
    index_t (* const local_outliers)[block_size],
    double_t (* const local_outlier_scores)[block_size],
    size_t * const new_outliers_size,
    index_t (* const new_outliers)[N],
    double_t (* const new_outlier_scores)[N]
    );
/*----------------------------------------------------------------------------*/

/*
 * Calculate the square of the Euclidean distance between two vectors (i.e. the
 * sum of the squares of the distance in each dimension).
 *
 * Parameters:
 *     - vector_dims: The dimensionality of the vectors.
 *     - vectors: The array containg the vectors between which to calculate the
 *           distance.
 *     - vector1: An array of floating point numbers representing the first 
 *           vector.
 *     - vector1: An array of floating point numbers representing the second 
 *           vector.
 *
 * Return:
 *    The square of the distance between the two vectors.
 */
static inline double_t distance_squared(const size_t vector_dims,
                                        const double_t (* const vector1)[vector_dims],
                                        const double_t (* const vector2)[vector_dims]) {
    ASSERT_NOT_NULL(vector1);
    ASSERT_NOT_NULL(vector2);
    ASSERT(vector_dims > 0);
    
    STATS_INCREMENT_CALLS_COUNTER();
	
    double_t sum_of_squares = 0;
    
    uint_t dim;
    for (dim = 0; dim < vector_dims; dim++) {
        const double_t val         = (*vector1)[dim] - (*vector2)[dim];
        const double_t val_squared = val * val;
        sum_of_squares            += val_squared;
    }
    
    return sum_of_squares;
}

/*
 * Insert a neighbouring vector into the k nearest neighbours array for a 
 * particular vector. Returns the distance value that was removed from the 
 * "neighbours_dist" vector, else -1 if no vector was removed.
 *
 * Parameters:
 *     - k: The number of neighbours to keep track of for each vector.
 *     - neighbours: The k nearest neighbours for the current vector.
 *     - neighbours_dist: The distances to the k nearest neighbours for the 
 *           current vector.
 *     - found: The number of initialised entries in the neighbours and 
 *           neighbours_dist arrays.
 *     - new_neighbour: The new value to be inserted into the neighbours array.
 *     - new_neighbour_dist: The new value to be inserted into the 
 *           neighbours_dist array.
 */
static inline double_t insert(const size_t k,
                              index_t (* const neighbours)[k],
                              double_t (* const neighbours_dist)[k],
                              uint_t * const found,
                              const index_t new_neighbour, 
                              const double_t new_neighbour_dist) {
    /* Error checking. */
    ASSERT_NOT_NULL(neighbours);
    ASSERT_NOT_NULL(neighbours_dist);
    ASSERT(k > 0);
    ASSERT_NOT_NULL(found);
    ASSERT(*found <= k);
    ASSERT(new_neighbour >= start_index);
    
    int_t    insert_index  = -1; /* the index at which the new outlier will be inserted */
    double_t removed_value = -1; /* the value that was removed from the neighbours_dist array */
    
#if defined(SORTED_INSERT)
    /*
     * Shuffle array elements from front to back. Elements greater than the new
     * value will be right-shifted by one index in the array.
     *
     * Note that uninitialised values in the array will appear on the left. That
     * is, if the array is incomplete (has a size n < N) then the data in the
     * array is stored in the rightmost n indexes.
     */
    
    if (*found < k) {
        /* Special handling required if the array is incomplete. */
        
        uint_t i;
        for (i = k - *found - 1; i < k; i++) {
            if (new_neighbour_dist > (*neighbours_dist)[i] || i == (k - *found - 1)) {
                /* Shuffle values down the array. */
                if (i > 0) {
                    (*neighbours     )[i-1] = (*neighbours     )[i];
                    (*neighbours_dist)[i-1] = (*neighbours_dist)[i];
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
        for (i = k-1; i >= 0; i--) {
            if (new_neighbour_dist < (*neighbours_dist)[i]) {
                if ((unsigned) i == k - 1)
                    /*
                     * The removed value is the value of the last element in the
                     * array.
                     */
                    removed_value = (*neighbours_dist)[i];
                /* Shuffle values down the array. */
                if (i > 0) {
                    (*neighbours     )[i] = (*neighbours     )[i-1];
                    (*neighbours_dist)[i] = (*neighbours_dist)[i-1];
                }
                insert_index = i;
            } else {
                /* We have found the insertion point. */
                break;
            }
        }
    }
#elif defined(UNSORTED_INSERT)
    if (*found < k) {
        insert_index  = *found;
        removed_value = 0;
    } else {
        int_t    max_index = -1;
        double_t max_value = DBL_MIN;
    
        int_t i;
        for (i = k-1; i >= 0; i--) {
            if (max_index < 0 || (*neighbours_dist)[i] > max_value) {
                max_index = i;
                max_value = (*neighbours_dist)[i];
            }
        }
        
        if (new_neighbour_dist < max_value) {
            insert_index  = max_index;
            removed_value = max_value;
        }
    }   
#endif /* #if defined(SORTED_INSERT) */
    
    /*
     * Insert the new pair and increment the current_size of the array (if
     * necessary).
     */
    if (insert_index >= 0) {
        (*neighbours     )[insert_index] = new_neighbour;
        (*neighbours_dist)[insert_index] = new_neighbour_dist;
        
        if (*found < k)
            (*found)++;
    }
    
    return removed_value;
}

/*
 * Take the top N outliers based on the global outliers (identified by the
 * (outliers, outlier_scores) pairs) and the new outliers from the current block
 * (identified by the (current_block, scores) pairs).
 *
 * Note that the (outliers, outlier_scores) vectors should already be sorted.
 * The (current_block, scores) vector need not be sorted.
 *
 * Parameters:
 *     - N: The number of outliers to locate.
 *     - outliers_size: The number of initialised entries in the outliers and 
 *           outlier_scores arrays.
 *     - outliers: A vector containing the indexes of the current global 
 *           outliers.
 *     - outlier_scores: A vector containing the scores of the current global 
 *           outliers.
 *     - block_size: The number of vectors in the current block.
 *     - current_block: An array containing the indexes of the vectors in the
             current block.
 *     - scores: A vector containing the outlier scores for each element in the 
 *           current block.
 */
static inline void best_outliers(const size_t N, size_t * outliers_size,
                                 index_t (*const outliers)[N],
                                 double_t (*const outlier_scores)[N],
                                 const size_t block_size,
                                 index_t (* const current_block)[block_size],
                                 double_t (* const scores)[block_size]
                                 ) {
    /* Error checking. */
    ASSERT_NOT_NULL(outliers);
    ASSERT_NOT_NULL(outlier_scores);
    ASSERT_NOT_NULL(outliers_size);
    ASSERT(*outliers_size <= N);
    ASSERT(N > 0);
    ASSERT_NOT_NULL(current_block);
    ASSERT_NOT_NULL(scores);
    ASSERT(block_size > 0);
    
    /* Sort the (current_block, scores) vectors in descending order of value. */
    sort_vectors_descending(block_size, current_block, scores);
    
    /* Create two temporary vectors for the output of the "merge" function. */
    index_t  new_outliers      [N];
    double_t new_outlier_scores[N];
    size_t   new_outliers_size = 0;
    
    MEMSET(new_outliers,       null_index, N, sizeof(index_t));
    MEMSET(new_outlier_scores,          0, N, sizeof(double_t));
    
    /* Merge the two vectors. */
    merge(N, *outliers_size, outliers, outlier_scores, block_size, current_block, scores, &new_outliers_size, &new_outliers, &new_outlier_scores);
    
    /* Copy values from temporary vectors to real vectors. */
    MEMCPY(*outliers,       new_outliers,       N, sizeof(index_t));
    MEMCPY(*outlier_scores, new_outlier_scores, N, sizeof(double_t));
    *outliers_size = new_outliers_size;
}

/*
 * Sort paired vectors in descending order. This function uses bubble sort.
 *
 * Parameters:
 *     - size: The number of elements in the indexes and values arrays.
 *     - indexes: A vector containing the indexes of the paired vectors.
 *     - values: A vector containing the values of the paired vectors.
 */
static inline void sort_vectors_descending(const size_t size,
                                           index_t (* const indexes)[size],
                                           double_t (* const values)[size]) {
    /* Error checking. */
    ASSERT_NOT_NULL(indexes);
    ASSERT_NOT_NULL(values);
    ASSERT(size > 0);
    
    uint_t i;
    for (i = 0; i < size; i++) {
    	int_t j;
    	index_t  ind = (*indexes)[i];
        double_t val = (*values )[i];
        for (j = i-1; j >= 0; j--) {
            if ((*values)[j] >= val)
                break;
            (*indexes)[j+1] = (*indexes)[j];
            (*values )[j+1] = (*values )[j];
        }
        (*indexes)[j+1] = ind;
        (*values )[j+1] = val;
    }
}

/*
 * Merge two sorted vector in descending order. Takes two pairs of vectors and
 * and returns a (sorted) pair of vectors.
 *
 * Parameters:
 *     - N: The number of outliers to keep track of.
 *     - global_outliers_size: The number of initialised elements in the 
 *           current_outliers and current_outlier_scores arrays.
 *     - global_outliers: The indexes of the current global outliers.
 *     - global_outlier_scores: The sccores associated with the current global
 *           outliers.
 *     - block_size: The size of the current block.
 *     - local_outliers: The indexes of the outliers determined from the current
 *           block.
 *     - local_outlier_scores: The scores associated with the local outliers.
 *     - new_outliers_size: The size of the resultant merged outliers array.
 *     - new_outliers: The resultant merged outliers array.
 *     - new_outlier_scores: The scores associated with the resultant merged 
 *           outliers array.
 */
static inline void merge(const size_t N,
                         const size_t global_outliers_size, index_t (* const global_outliers)[N],         double_t (* const global_outlier_scores)[N],
                         const size_t block_size,           index_t (* const local_outliers)[block_size], double_t (* const local_outlier_scores)[block_size],
                         size_t * const new_outliers_size,  index_t (* const new_outliers)[N],            double_t (* const new_outlier_scores)[N]) {
    /* Error checking. */
    ASSERT_NOT_NULL(global_outliers);
    ASSERT_NOT_NULL(global_outlier_scores);
    ASSERT(global_outliers_size <= N);
    ASSERT(N > 0);
    ASSERT_NOT_NULL(local_outliers);
    ASSERT_NOT_NULL(local_outlier_scores);
    ASSERT(block_size > 0);
    ASSERT_NOT_NULL(new_outliers);
    ASSERT_NOT_NULL(new_outlier_scores);
    ASSERT_NOT_NULL(new_outliers_size);
    
    *new_outliers_size  = 0;
    uint_t iter         = 0; /* iterator through output array */
    uint_t global       = 0; /* iterator through global array */
    uint_t local        = 0; /* iterator through local array */
    while (iter < N && (global < global_outliers_size || local < block_size)) {
        if (global >= global_outliers_size && local < block_size) {
            /* There are no remaining elements in the global arrays. */
            (*new_outliers      )[iter] = (*local_outliers      )[local];
            (*new_outlier_scores)[iter] = (*local_outlier_scores)[local];
            local ++;
            global++;
        } else if (global < global_outliers_size && local >= block_size) {
            /* There are no remaining elements in the local arrays. */
            (*new_outliers      )[iter] = (*global_outliers      )[global];
            (*new_outlier_scores)[iter] = (*global_outlier_scores)[global];
            local ++;
            global++;
        } else if (global >= global_outliers_size && local >= block_size) {
            /*
             * There are no remaining elements in either the global or local 
             * arrays.
             */
            break;
        } else if ((*global_outlier_scores)[global] >= (*local_outlier_scores)[local]) {
            (*new_outliers      )[iter] = (*global_outliers      )[global];
            (*new_outlier_scores)[iter] = (*global_outlier_scores)[global];
            global++;
        } else if ((*global_outlier_scores)[global] <= (*local_outlier_scores)[local]) {
            (*new_outliers      )[iter] = (*local_outliers      )[local];
            (*new_outlier_scores)[iter] = (*local_outlier_scores)[local];
            local++;
        }
        
        iter++;
        (*new_outliers_size)++;
    }
}

/*
 * Examine a data set and find the top N outliers. Performs operations on the
 * data array in blocks of size block_size.
 *
 * Parameters:
 *     - num_vectors: The number of vectors contained in the data array.
 *     - vector_dims: The dimensionality of each vector contained in the data 
 *           array.
 *     - data: The input data set.
 *     - k: The number of k-nearest neighbours for outlier detection.
 *     - N: The top N outliers will be returned by this function.
 *     - default_block_size: The input data array will be processed in blocks of
 *           size block_size, where possible.
 *     - outliers: A vector used to store the top N outliers identified by this
 *           function. Each entry in this vector will be an index (to the data
 *           array) of the outlying vector.
 *     - outlier_scores: A vector used to score the score associated with
 *           each of the outliers stored in the outliers array.
 */
#ifdef __AUTOESL__
void top_n_outlier_pruning_block(int * dummy) {
	*dummy = 0;
}
#else
void top_n_outlier_pruning_block(const size_t num_vectors, const size_t vector_dims,
                                 const double_t (* const data)[num_vectors][vector_dims],
                                 const size_t k, const size_t N, const UNUSED size_t default_block_size,
                                 index_t (* const outliers)[N], double_t (* const outlier_scores)[N]) {
    /* Error checking. */
    ASSERT_NOT_NULL(data);
    ASSERT(vector_dims > 0);
    ASSERT(k > 0);
    ASSERT(N > 0);
    ASSERT(default_block_size > 0);
    ASSERT_NOT_NULL(outliers);
    ASSERT_NOT_NULL(outlier_scores);
    
    /* Set output to zero. */
    MEMSET(*outliers,       null_index, N, sizeof(index_t));
    MEMSET(*outlier_scores,          0, N, sizeof(double_t));
    
    double_t cutoff = 0;            /* vectors with a score less than the cutoff will be removed from the block */
    size_t   outliers_found = 0;    /* the number of initialised elements in the outliers array */
    
#ifndef NO_BLOCKING
    index_t  block_begin;           /* the index of the first vector in the block currently being processed */
    size_t   block_size;            /* block_size may be smaller than devfault_block_size if "num_vectors mod default_block_size != 0" */
    
    for (block_begin = 0; block_begin < num_vectors; block_begin += block_size) { /* while there are still blocks to process */
        block_size = MIN(block_begin + default_block_size, num_vectors) - block_begin; /* the number of vectors in the current block */
        ASSERT(block_size <= default_block_size);
        
        index_t  current_block[block_size];         /* the indexes of the vectors in the current block */
        index_t  neighbours[block_size][k];         /* the "k" nearest neighbours for each vector in the current block */
        double_t neighbours_dist[block_size][k];    /* the distance of the "k" nearest neighbours for each vector in the current block */
        double_t score[block_size];                 /* the average distance to the "k" neighbours */
        uint_t   found[block_size];                 /* how many nearest neighbours we have found, for each vector in the block */
        
        /* Reset array contents */
        do {
            uint_t i;
            for (i = 0; i < block_size; i++)
                current_block[i] = (index_t)((block_begin + i) + start_index);
        } while (0);
        MEMSET(&neighbours,      null_index, block_size * k, sizeof(index_t));
        MEMSET(&neighbours_dist,          0, block_size * k, sizeof(double_t));
        MEMSET(&score,                    0, block_size,     sizeof(double_t));
        MEMSET(&found,                    0, block_size,     sizeof(uint_t));
        
        index_t vector1;
        for (vector1 = start_index; vector1 < num_vectors + start_index; vector1++) {
            uint_t block_index;
            for (block_index = 0; block_index < block_size; block_index++) {
                const index_t vector2 = current_block[block_index];
                
                if (vector1 != vector2 && vector2 >= start_index) {
                    /*
                     * Calculate the square of the distance between the two
                     * vectors (indexed by "vector1" and "vector2")
                     */
                    const double_t dist_squared = distance_squared(vector_dims, &((*data)[vector1-start_index]), &((*data)[vector2-start_index]));
                    
                    /*
                     * Insert the new (index, distance) pair into the neighbours
                     * array for the current vector.
                     */
                    
                    const double_t removed_distance = insert(k, &(neighbours[block_index]), &(neighbours_dist[block_index]), &(found[block_index]), vector1, dist_squared);
                    
                    /*
                     * Update the score (if the neighbours array was changed).
                     */
                    if (removed_distance >= 0)
                        score[block_index] = (double_t) ((score[block_index] * k - removed_distance + dist_squared) / k);
                    
                    /*
                     * If the score for this vector is less than the cutoff,
                     * then prune this vector from the block.
                     */
                    if (found[block_index] >= k && score[block_index] < cutoff) {
                        current_block[block_index] = null_index;
                        score        [block_index] = 0;
                        STATS_INCREMENT_NUM_PRUNED();
                    }
                }
            }
        }
        
        /* Keep track of the top "N" outliers. */
        best_outliers(N, &outliers_found, outliers, outlier_scores, block_size, &current_block, &score);
        
        /*
         * Set "cutoff" to the score of the weakest outlier. There is no need to
         * store an outlier in future iterations if its score is better than the
         * cutoff.
         */
        cutoff = (*outlier_scores)[N-1];
    }
#else
    index_t vector1;
    for (vector1 = start_index; vector1 < num_vectors + start_index; vector1++) {
        index_t  neighbours[k];         /* the "k" nearest neighbours for the current vector */
        double_t neighbours_dist[k];    /* the distance of the "k" nearest neighbours for the current vector */
        double_t score = 0;             /* the average distance to the "k" neighbours */
        uint_t   found = 0;             /* how many nearest neighbours we have found */
        boolean  removed = false;       /* true if vector1 has been pruned */
        
        MEMSET(neighbours,      null_index, k, sizeof(index_t));
        MEMSET(neighbours_dist,          0, k, sizeof(double_t));
        
        index_t vector2;
        for (vector2 = start_index; vector2 < num_vectors + start_index && !removed; vector2++) {
            if (vector1 != vector2) {
                /*
                 * Calculate the square of the distance between the two
                 * vectors (indexed by "vector1" and "vector2")
                 */
                const double_t dist_squared = distance_squared(vector_dims, &((*data)[vector1-start_index]), &((*data)[vector2-start_index]));
                
                /*
                 * Insert the new (index, distance) pair into the neighbours
                 * array for the current vector.
                 */
                const double_t removed_distance = insert(k, &neighbours, &neighbours_dist, &found, vector1, dist_squared);
                
                /* Update the score (if the neighbours array was changed). */
                if (removed_distance >= 0)
                    score = (double_t) ((score * k - removed_distance + dist_squared) / k);
                
                /*
                 * If the score for this vector is less than the cutoff,
                 * then prune this vector from the block.
                 */
                if (found >= k && score < cutoff) {
                    removed = true;
                    STATS_INCREMENT_NUM_PRUNED();
                    break;
                }
            }
        }
        
        if (!removed) {
        	index_t block_array[]  = { vector1 };
        	double_t score_array[] = { score };
        	
            /* Keep track of the top "N" outliers. */
            best_outliers(N, &outliers_found, outliers, outlier_scores, 1, &block_array, &score_array);
            
            /*
             * Set "cutoff" to the score of the weakest outlier. There is no need to
             * store an outlier in future iterations if its score is better than the
             * cutoff.
             */
            cutoff = (*outlier_scores)[N-1];
        }
    }
#endif /* #ifndef NO_BLOCKING */
}
#endif /* #ifdef __AUTOESL__ */
