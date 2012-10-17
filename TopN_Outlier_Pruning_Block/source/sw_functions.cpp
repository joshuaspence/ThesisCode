/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "sw_functions.h" /* main include file */
#include "top_n_outlier_pruning_block.h" /* for distance_squared_func, set_outer_vector_func, top_n_outlier_pruning_block, VECTOR_DIMS */
#include "utility.h" /* for SQUARED */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Static variables                                                           */
/*============================================================================*/
static double outer_vector[VECTOR_DIMS];
static bool   outer_vector_set = false;
/*----------------------------------------------------------------------------*/

static void set_outer_vector_sw(const double vector[VECTOR_DIMS]) {
    unsigned int dim;
    for (dim = 0; dim < VECTOR_DIMS; dim++) {
        outer_vector[dim] = vector[dim];
    }
    outer_vector_set = true;
}

static double distance_squared_sw(const double inner_vector[VECTOR_DIMS]) {
    ASSERT(VECTOR_DIMS > 0);
    ASSERT(outer_vector_set);

    double sum = 0;
    unsigned int dim;
    for (dim = 0; dim < VECTOR_DIMS; dim++) {
        sum += SQUARE(outer_vector[dim] - inner_vector[dim]);
    }
    return sum;
}

unsigned int top_n_outlier_pruning_block_sw(
        const size_t _num_vectors,
        const size_t _vector_dims,
        const double _data[],
        const size_t _k,
        const size_t _N,
        const size_t _block_size,
        unsigned int _outliers[N_VALUE],
        double _outlier_scores[N_VALUE]
        ) {
    return top_n_outlier_pruning_block(_num_vectors, _vector_dims, _data,
            _k, _N, _block_size, _outliers, _outlier_scores,
            set_outer_vector_sw, distance_squared_sw);
}