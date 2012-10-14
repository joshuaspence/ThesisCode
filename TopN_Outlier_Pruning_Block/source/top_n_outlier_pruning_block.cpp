/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.hpp" /* check for invalid preprocessor macro combinations */
#include "arch.hpp" /* set architecture specific macros */

#include "distance.hpp" /* for distance_squared */
#include "parameters.hpp" /* for block_size_value, k_value, N_value, num_vectors_value, vector_dims_value */
#include "top_n_outlier_pruning_block.hpp" /* main include file */
#include "utility.hpp" /* for ASSERT, double_t, index_t, int_t, MIN, NULL_INDEX, START_INDEX, size_t, uint_t */

#include <float.h> /* for DBL_MIN */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Constants                                                                  */
/*============================================================================*/
static const size_t max_num_vectors;
static const size_t vector_dims;
static const size_t k;
static const size_t N;
static const size_t block_size;
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Static variables                                                           */
/*============================================================================*/
static size_t   num_vectors;
static double_t data[max_num_vectors][vector_dims];
static index_t  outliers[N];
static double_t outlier_scores[N];

/* The current block */
static size_t   current_block_size;
static index_t  current_block[block_size];      /* the indexes of the vectors in the current block */
static index_t  neighbours[block_size][k];      /* the "k" nearest neighbours for each vector in the current block */
static double_t neighbours_dist[block_size][k]; /* the distance of the "k" nearest neighbours for each vector in the current block */
static double_t score[block_size];              /* the average distance to the "k" neighbours */
static uint_t   found[block_size];              /* how many nearest neighbours we have found, for each vector in the block */

/* Global statistics */
static uint_t   num_pruned;                     /* number of pruned vectors. */
static double_t cutoff;                         /* vectors with a score less than the cutoff will be removed from the block */
static size_t   outliers_found;                 /* the number of initialised elements in the outliers array */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Methods to set parameters and initialise variables                         */
/*============================================================================*/
static void init(const size_t _num_vectors, const double_t * const & _data) {
	ASSERT(_num_vectors > 0);
	ASSERT(_num_vectors <= max_num_vectors);
	ASSERT(_data != NULL);
	
	/* num_vectors */
	num_vectors = _num_vectors;
	
	/* data */
	// TODO: MEMCPY_2D
	uint_t vector;
	for (vector = 0; i < max_num_vectors; vector++) {
		uint_t dim;
		for (dim = 0; dim < vector_dims; dim++) {
			if (vector >= num_vectors) {
				data[vector][dim] = 0;
			} else {
				data[vector][dim] = _data[vector][dim];
			}
		}
	}
	
	/* outliers and outlier_scores */
    MEMSET_1D(outliers,       NULL_INDEX, _N, sizeof(index_t));
    MEMSET_1D(outlier_scores,          0, _N, sizeof(double_t));
	
	/* num_pruned */
	num_pruned = 0;
	
	/* cutoff */
	cutoff = 0;
	
	/* outliers_found */
	outliers_found = 0;
}

static void init_block(void) {
	MEMSET_1D(current_block,   NULL_INDEX, N,             sizeof(index_t));
	MEMSET_2D(neighbours,      NULL_INDEX, block_size, k, sizeof(index_t));
	MEMSET_2D(neighbours_dist, 0.0,        block_size, k, sizeof(double_t));
	MEMSET_1D(score,           0,          block_size,    sizeof(double_t));
	MEMSET_1D(found,           0,          block_size,    sizeof(uint_t));
}
/*----------------------------------------------------------------------------*/

double_t distance_squared(
		const blockindex_t vector1_blockindex
		const blockindex_t vector2_blockindex
		) {
    ASSERT(vector_dims > 0);
	
#ifndef __AUTOESL__
    #define SUM_SPLIT (1)
#else
    #define SUM_SPLIT (8)
#endif /* #ifndef __AUTOESL__ */
    
	const index_t vector1 = current_block[vector1_blockindex];
	const index_t vector2 = current_block[vector2_blockindex];
	
    double_t sum_of_squares__split[SUM_SPLIT] = { 0.0 };
    
    uint_t dim;
    dimension_loop: for (dim = 0; dim < vector_dims; dim++) {
        const double_t v1                      = data[vector1][dim];
        const double_t v2                      = data[vector2][dim];
        const double_t diff                    = vector1_data - vector2_data;
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

double_out_t add_neighbour(
		const blockindex_t block_index,
		const index_t new_neighbour,
		const double_t new_neighbour_dist
		) {
    /* Error checking. */
    ASSERT(k > 0);
    ASSERT(found[block_index] <= k);
    ASSERT(new_neighbour >= START_INDEX);
    
    int_t    insert_index  = -1; /* the index at which the new outlier will be inserted */
    double_t removed_value = -1; /* the value that was removed from the neighbours_dist array */
    
#if (INSERT==SORTED)
    /*
     * Shuffle array elements from front to back. Elements greater than the new
     * value will be right-shifted by one index in the array.
     *
     * Note that uninitialised values in the array will appear on the left. That
     * is, if the array is incomplete (has a size n < N) then the data in the
     * array is stored in the rightmost n indexes.
     */
    
    if (found[block_index] < k) {
        /* Special handling required if the array is incomplete. */
        
        uint_t i;
        for (i = k - found[block_index] - 1; i < k; i++) {
            if (new_neighbour_dist > neighbours_dist[block_index][i] || i == (k - found[block_index] - 1)) {
                /* Shuffle values down the array. */
                if (i > 0) {
                    neighbours     [block_index][i-1] = neighbours     [block_index][i];
                    neighbours_dist[block_index][i-1] = neighbours_dist[block_index][i];
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
            if (new_neighbour_dist < neighbours_dist[block_index][i]) {
                if ((unsigned) i == k-1)
                    /*
                     * The removed value is the value of the last element in the
                     * array.
                     */
                    removed_value = neighbours_dist[block_index][i];
                /* Shuffle values down the array. */
                
                if (i > 0) {
                    neighbours     [block_index][i] = neighbours     [block_index][i-1];
                    neighbours_dist[block_index][i] = neighbours_dist[block_index][i-1];
                }
                insert_index = i;
            } else {
                /* We have found the insertion point. */
                break;
            }
        }
    }
#elif (INSERT==UNSORTED)
    if (found[block_index] < k) {
        insert_index  = found[block_index];
        removed_value = 0;
    } else {
        int_t    max_index = -1;
        double_t max_value = DBL_MIN;
        
        int_t i;
        for (i = k-1; i >= 0; i--) {
            if (max_index < 0 || neighbours_dist[block_index][i] > max_value) {
                max_index = i;
                max_value = neighbours_dist[block_index][i];
            }
        }
        
        if (new_neighbour_dist < max_value) {
            insert_index  = max_index;
            removed_value = max_value;
        }
    }
#endif /* #if (INSERT==SORTED) */
    
    /*
     * Insert the new pair and increment the current_size of the array (if
     * necessary).
     */
    if (insert_index >= 0) {
        neighbours     [block_index][insert_index] = new_neighbour;
        neighbours_dist[block_index][insert_index] = new_neighbour_dist;
        
        if (found[block_index] < k)
            found[block_index]++;
    }
    
    return removed_value;
}

void best_outliers(void) {
    /* Error checking. */
    ASSERT(outliers_found <= N);
    ASSERT(N > 0);
#if (BLOCKING==ENABLED)
    ASSERT(block_size > 0);
	ASSERT(current_block_size > 0);
    ASSERT(current_block_size <= block_size);
#endif /* #if (BLOCKING==ENABLED) */
    
#if (BLOCKING==ENABLED)
    /* 
     * Sort the (current_block, scores) vectors in descending order of value.
     *
     * Make a copy first, so that we don't need to modify the input block and 
     * score arrays.
     */
    index_t  block_copy [block_size];
    double_t scores_copy[block_size];
    
    MEMCPY_1D(block_copy,  current_block, block_size, sizeof(index_t));
    MEMCPY_1D(scores_copy, scores,        block_size, sizeof(double_t));
    
    sort_block_scores_descending(block_size, block_copy, scores_copy);
#endif /* #if (BLOCKING==ENABLED) */
    
    /* Create two temporary vectors for the output of the "merge" function. */
    index_t  new_outliers      [N_value];
    double_t new_outlier_scores[N_value];
    size_t   new_outliers_size = 0;
    
    MEMSET_1D(new_outliers,       NULL_INDEX, N_value, sizeof(index_t));
    MEMSET_1D(new_outlier_scores,          0, N_value, sizeof(double_t));
    
    /* Merge the two vectors. */
#if (BLOCKING==ENABLED)
    merge(outliers_size, outliers, outlier_scores, block_size, block_copy, scores_copy, new_outliers_size, new_outliers, new_outlier_scores);
#elif (BLOCKING==DISABLED)
    merge(outliers_size, outliers, outlier_scores,             vector,     score,       new_outliers_size, new_outliers, new_outlier_scores);
#endif /* #if (BLOCKING==ENABLED) */
    
    /* Copy values from temporary vectors to real vectors. */
    MEMCPY_1D(outliers,       new_outliers,       N_value, sizeof(index_t));
    MEMCPY_1D(outlier_scores, new_outlier_scores, N_value, sizeof(double_t));
    outliers_size = new_outliers_size;
}

#if (BLOCKING==ENABLED)
void sort_block_scores_descending(const size_t block_size,
                                  index_t indexes[],
                                  double_t values[]) {
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
#endif /* #if (BLOCKING==ENABLED) */

void merge(const size_t global_outliers_size, const index_t global_outliers[], const double_t global_outlier_scores[],
#if (BLOCKING==ENABLED)
           const size_t block_size,           const index_t local_outliers[],  const double_t local_outlier_scores[],
#elif (BLOCKING==DISABLED)
                                              const index_t local_outlier,     const double_t local_outlier_score,
#endif /* #if (BLOCKING==ENABLED) */
           size_t & new_outliers_size,        index_t new_outliers[],          double_t new_outlier_scores[]) {
    /* Error checking. */
    ASSERT(global_outliers_size <= N_value);
    ASSERT(N_value > 0);
#if (BLOCKING==ENABLED)
    ASSERT(block_size > 0);
    ASSERT(block_size <= block_size_value);
#endif /* #if (BLOCKING==ENABLED) */
    
    new_outliers_size   = 0;
    uint_t iter         = 0; /* iterator through output array */
    uint_t global       = 0; /* iterator through global array */
#if (BLOCKING==ENABLED)
    uint_t local        = 0; /* iterator through local array */
#elif (BLOCKING==DISABLED)
    bool local          = false;
#endif /* #if (BLOCKING==ENABLED) */
    
#if (BLOCKING==ENABLED)
    while (iter < N_value && (global < global_outliers_size || local < block_size)) {
        if (global >= global_outliers_size && local < block_size) {
#elif (BLOCKING==DISABLED)
    while (iter < N_value && (global < global_outliers_size || !local)) {
        if (global >= global_outliers_size && !local) {
#endif /* #if (BLOCKING==ENABLED) */
            /* There are no remaining elements in the global arrays. */
#if (BLOCKING==ENABLED)
            new_outliers      [iter] = local_outliers      [local];
            new_outlier_scores[iter] = local_outlier_scores[local];
            local++;
#elif (BLOCKING==DISABLED)
            new_outliers      [iter] = local_outlier;
            new_outlier_scores[iter] = local_outlier_score;
            local = true;
#endif /* #if (BLOCKING==ENABLED) */
            global++;
#if (BLOCKING==ENABLED)
        } else if (global < global_outliers_size && local >= block_size) {
#elif (BLOCKING==DISABLED)
        } else if (global < global_outliers_size && local) {
#endif /* #if (BLOCKING==ENABLED) */
            /* There are no remaining elements in the local arrays. */
            new_outliers      [iter] = global_outliers      [global];
            new_outlier_scores[iter] = global_outlier_scores[global];
#if (BLOCKING==ENABLED)
            local++;
#elif (BLOCKING==DISABLED)
            local = true;
#endif /* #if (BLOCKING==ENABLED) */
            global++;
#if (BLOCKING==ENABLED)
        } else if (global >= global_outliers_size && local >= block_size) {
#elif (BLOCKING==DISABLED)
        } else if (global >= global_outliers_size && local) {
#endif /* #if defined(BLOCKING) */
            /*
             * There are no remaining elements in either the global or local 
             * arrays.
             */
            break;
#if (BLOCKING==ENABLED)
        } else if (global_outlier_scores[global] >= local_outlier_scores[local]) {
#elif (BLOCKING==DISABLED)
        } else if (global_outlier_scores[global] >= local_outlier_score) {
#endif /* #if (BLOCKING==ENABLED) */
            new_outliers      [iter] = global_outliers      [global];
            new_outlier_scores[iter] = global_outlier_scores[global];
            global++;
#if (BLOCKING==ENABLED)
        } else if (global_outlier_scores[global] <= local_outlier_scores[local]) {
            new_outliers      [iter] = local_outliers      [local];
            new_outlier_scores[iter] = local_outlier_scores[local];
            local++;
#elif (BLOCKING==DISABLED)
        } else if (global_outlier_scores[global] <= local_outlier_score) {
            new_outliers      [iter] = local_outlier;
            new_outlier_scores[iter] = local_outlier_score;
            local = true;
#endif /* #if (BLOCKING==ENABLED) */
        }
        
        iter++;
        new_outliers_size++;
    }
}

uint_t top_n_outlier_pruning_block(const size_t _num_vectors,
                                   const size_t _vector_dims,
                                   const double_t * const & _data,
                                   const size_t _k,
                                   const size_t _N,
                                   const size_t _block_size,
                                   index_t _outliers[],
                                   double_t _outlier_scores[]) {
    /* Error checking. */
    ASSERT(_num_vectors > 0);
	ASSERT(_num_vectors < max_num_vectors);
    ASSERT(_vector_dims == vector_dims);
    ASSERT(_k == k;
    ASSERT(_N == N);
    ASSERT(_block_size == block_size);
	
	/* Set global variables */
	init(_num_vectors, _data);
    
#if (BLOCKING==ENABLED)
    index_t  block_begin;           /* the index of the first vector in the block currently being processed */
    size_t   block_size;            /* block_size may be smaller than default_block_size if "num_vectors_value mod default_block_size != 0" */
    
    block_loop: for (block_begin = 0; block_begin < _num_vectors; block_begin += block_size) { /* while there are still blocks to process */
        current_block_size = MIN(block_begin + _block_size, _num_vectors) - block_begin; /* the number of vectors in the current block */
        ASSERT(current_block_size <= block_size);
        
        /* Reset array contents */
		init_block();
        do {
            uint_t i;
            for (i = 0; i < current_block_size; i++)
                current_block[i] = (index_t) ((block_begin + i) + START_INDEX);
        } while (0);
        
        blockindex_t vector1_index;
        outer_loop: for (vector1_index = START_INDEX; vector1 < num_vectors + START_INDEX; vector1++) {
			const index_t vector1 = current_block[vector1_index];
			
            blockindex_t vector2_index;
            inner_loop: for (vector2_index = 0; vector2_index < current_block_size; vector2_index++) {
				const index_t vector2 = current_block[vector2_index];
				
                if (vector1 != vector2 && vector2 >= START_INDEX) {
                    /*
                     * Calculate the square of the distance between the two
                     * vectors (indexed by "vector1_index" and "vector2_index")
                     */
                    const double_t dist_squared = distance_squared(vector1_index, vector2_index);
                    
                    /*
                     * Insert the new (index, distance) pair into the neighbours
                     * array for the current vector.
                     */
                    const double_t removed_distance = add_neighbour(vector2_index, vector1, dist_squared);
                    
                    /*
                     * Update the score (if the neighbours array was changed).
                     */
                    if (removed_distance >= 0)
                        score[vector2_index] = (double_t) ((score[vector2_index] * k - removed_distance + dist_squared) / k);
                    
                    /*
                     * If the score for this vector is less than the cutoff,
                     * then prune this vector from the block.
                     */
                    if (found[vector2_index] >= k && score[vector2_index] < cutoff) {
                        current_block[vector2_index] = NULL_INDEX;
                        score        [vector2_index] = 0;
                        num_pruned++;
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
        cutoff = outlier_scores[N-1];
    }
#elif (BLOCKING==DISABLED)
    blockindex_t vector1_index;
    outer_loop: for (vector1_index = START_INDEX; vector1_index < num_vectors + START_INDEX; vector1_index++) {
		const index_t vector1 = current_block
        index_t  neighbours[_k];        /* the "k" nearest neighbours for the current vector */
        double_t neighbours_dist[_k];   /* the distance of the "k" nearest neighbours for the current vector */
        double_t score = 0;             /* the average distance to the "k" neighbours */
        uint_t   found = 0;             /* how many nearest neighbours we have found */
        bool     removed = false;       /* true if vector1 has been pruned */
        
        MEMSET_1D(neighbours,      NULL_INDEX, _k, sizeof(index_t));
        MEMSET_1D(neighbours_dist,          0, _k, sizeof(double_t));
        
        index_t vector2;
        inner_loop: for (vector2 = START_INDEX; vector2 < _num_vectors + START_INDEX && !removed; vector2++) {
            if (vector1 != vector2) {
                /*
                 * Calculate the square of the distance between the two
                 * vectors (indexed by "vector1" and "vector2")
                 */
                double_t dist_squared = 0;
                double_t vector1_in[_num_vectors];
                double_t vector2_in[_num_vectors];

                uint_t i;
                for (i = 0; i < _num_vectors; i++) {
                    vector1_in[i] = data[(vector1-START_INDEX) * vector_dims_value + i];
                    vector2_in[i] = data[(vector2-START_INDEX) * vector_dims_value + i];
                }
                distance_squared(vector1_in, vector2_in, dist_squared);
                
                /*
                 * Insert the new (index, distance) pair into the neighbours
                 * array for the current vector.
                 */
                const double_t removed_distance = add_neighbour(neighbours, neighbours_dist, found, vector1, dist_squared);
                
                /* Update the score (if the neighbours array was changed). */
                if (removed_distance >= 0)
                    score = (double_t) ((score * _k - removed_distance + dist_squared) / _k);
                
                /*
                 * If the score for this vector is less than the cutoff,
                 * then prune this vector from the block.
                 */
                if (found >= _k && score < cutoff) {
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
            cutoff = outlier_scores[_N - 1];
        }
    }
#endif /* #if (BLOCKING==ENABLED) */    
    return num_pruned;
}