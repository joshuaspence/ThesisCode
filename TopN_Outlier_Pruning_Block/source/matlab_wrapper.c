/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros. for PRINTF_STDERR */

#include "matlab.h" /* for ARRAY_ELEMENT, COLS, CREATE_REAL_DOUBLE_VECTOR, IS_REAL_2D_FULL_DOUBLE, IS_REAL_SCALAR, m_double_t, RETRIEVE_REAL_DOUBLE_ARRAY, ROWS, VECTOR, VECTOR_ELEMENT */
#ifdef STATS
    #include "stats.h" /* for get_stats */
#endif /* #ifdef STATS */
#include "top_n_outlier_pruning_block.h" /* for top_n_outlier_pruning_block */
#include "utility.h" /* for double_t, index_t, lint_t, null_index, uint_t */
#ifdef VARDUMP
    #include "vardump.h" /* save_vardump */
#endif /* #ifdef VARDUMP */

#include <mex.h> /* for mxGetScalar */
#include <stdlib.h> /* for free, malloc, size_t */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Checks                                                                     */
/*============================================================================*/
#ifndef __MEX__
    #error "This file should only be included in MEX builds."
#endif /* #ifndef __MEX__ */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Input and output arguments. */
/*============================================================================*/
#define DATA_IN             prhs[0]
#define K_IN                prhs[1]
#define N_IN                prhs[2]
#define BLOCKSIZE_IN        prhs[3]
#define OUTLIERS_OUT        plhs[0]
#define OUTLIERSCORES_OUT   plhs[1]
/*----------------------------------------------------------------------------*/

/*
 * Gateway function
 *
 * This is the entry point MATLAB uses to access the DLL.
 *
 * Parameters:
 *     - nlhs: The number of lhs (output) arguments.
 *     - plhs: Pointer to an array which will hold the output data, each element
 *           is type mxArray.
 *     - nrhs: The number of rhs (input) arguments.
 *     - prhs: Pointer to an array which holds the input data, each element is
 *           type const mxArray.
 *
 * Calling syntax:
 *     [Outliers, Outlier_Scores] = TopN_Outlier_Pruning_Block(data, k, N, block_size);
 *
 * Notes:
 *     - data is a real full 2D double array.
 *     - k is an integer-valued scalar.
 *     - N is an integer-valued scalar.
 *     - block_size is an integer-valued scalar.
 */
void mexFunction(int nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[]) {    
    /* Check for proper number of arguments. */
    if (nrhs != 4) {
        PRINTF_STDERR("Four inputs required.");
        return;
    }
    if (nlhs <= 0 || nlhs > 2) {
        PRINTF_STDERR("One or two outputs required.");
        return;
    }
    
    /*
     * Make sure the first input argument is a real 2D full (non-sparse) double
     * array.
     */
    if (!IS_REAL_2D_FULL_DOUBLE(DATA_IN)) {
        PRINTF_STDERR("Input 'data' must be a real full 2D double array.");
        return;
    }
    RETRIEVE_REAL_DOUBLE_ARRAY(data, DATA_IN);
    
    /* Make sure the second input argument is an integer. */
    if (!IS_REAL_SCALAR(K_IN)) {
        PRINTF_STDERR("Input 'k' must be a scalar.");
        return;
    }
    const double k_dbl = mxGetScalar(K_IN);
    if ((int) k_dbl <= 0) { /* make sure the second input argument is greater than zero */
        PRINTF_STDERR("Input 'k' must be positive.");
        return;
    }
    const size_t k = (size_t) k_dbl;
    
    /* Make sure the third input argument is an integer. */
    if (!IS_REAL_SCALAR(N_IN)) {
        PRINTF_STDERR("Input 'N' must be a scalar.");
        return;
    }
    const double N_dbl = mxGetScalar(N_IN);
    if ((int) N_dbl <= 0) { /* make sure the third input argument is greater than zero */
        PRINTF_STDERR("Input 'N' must be positive.");
        return;
    }
    const size_t N = (size_t) N_dbl;
    
    /* Make sure the fourth input argument is an integer. */
    if (!IS_REAL_SCALAR(BLOCKSIZE_IN)) {
        PRINTF_STDERR("Input 'block_size' must be a scalar.");
        return;
    }
    const double block_size_dbl = mxGetScalar(BLOCKSIZE_IN);
    if ((int) block_size_dbl <= 0) { /* make sure the fourth input argument is greater than zero */
        PRINTF_STDERR("Input 'block_size' must be positive.");
        return;
    }
    const size_t block_size = (size_t) block_size_dbl;
    
    /* Additional error checking. */
    if (ROWS(data) < N) {
        PRINTF_STDERR("Input 'N' must be less than or equal to the number of vectors in the 'data' array.");
        return;
    }
    if (ROWS(data) < k) {
        PRINTF_STDERR("Input 'k' must be less than or equal to the number of vectors in the 'data' array.");
        return;
    }
    
    /*
     * Convert the input to proper format for the "top_n_outlier_pruning_block" 
     * function.
     */
    const size_t num_vectors = ROWS(data);
    const size_t vector_dims = COLS(data);
    double_t * data_in = (double_t *) malloc(num_vectors * vector_dims * sizeof(double_t));
    if (data_in == NULL) {
        PRINTF_STDERR("Unable to allocate memory for data array.");
        return;
    }

    uint_t vector;
    for (vector = 0; vector < num_vectors; vector++) {
        uint_t dim;
        for (dim = 0; dim < vector_dims; dim++) {
            data_in[vector * vector_dims + dim] = (double_t) ARRAY_ELEMENT(data, vector, dim);
        }
    }
    
    /* Create the output arrays. */
    index_t  outliers_out      [N];
    double_t outlier_scores_out[N];
    MEMSET_1D(outliers_out,       NULL_INDEX, N, sizeof(index_t));
    MEMSET_1D(outlier_scores_out,          0, N, sizeof(double_t));
    
    /* Call the function. */
#ifndef HARDCODED_NUM_VECTORS
    set_num_vectors(num_vectors);
#endif /* #ifndef HARDCODED_NUM_VECTORS */
#ifndef HARDCODED_VECTOR_DIMS
    set_vector_dims(vector_dims);
#endif /* #ifndef HARDCODED_VECTOR_DIMS */
#ifndef HARDCODED_K
    set_k(k);
#endif /* #ifndef HARDCODED_K */
#ifndef HARDCODED_N
    set_N(N);
#endif /* #ifndef HARDCODED_N */
#ifndef HARDCODED_BLOCK_SIZE
    set_block_size(block_size);
#endif /* #ifndef HARDCODED_BLOCK_SIZE */
    top_n_outlier_pruning_block((void *) data_in, outliers_out, outlier_scores_out);
    
#ifdef VARDUMP
    /* Save input and output parameters. */
    save_vardump("vars.dat", &num_vectors, &vector_dims, (void *) data_in, &k, &N, &block_size, &outliers_out, &outlier_scores_out);
#endif /* #ifdef VARDUMP */
    
    /* Free dynamic memory. */
    if (data_in != NULL)
        free(data_in);

    /* Convert the output to MATLAB format. */
    if (nlhs >= 1) {
        CREATE_REAL_DOUBLE_VECTOR(outliers, N);
        OUTLIERS_OUT = VECTOR(outliers);
        
        uint_t i;
        for (i = 0; i < ELEMENTS(outliers); i++)
            VECTOR_ELEMENT(outliers, i) = (m_double_t) outliers_out[i];
    }
    if (nlhs >= 2) {
        CREATE_REAL_DOUBLE_VECTOR(outlier_scores, N);
        OUTLIERSCORES_OUT = VECTOR(outlier_scores);
        
        uint_t i;
        for (i = 0; i < ELEMENTS(outlier_scores); i++)
            VECTOR_ELEMENT(outlier_scores, i) = (m_double_t) outlier_scores_out[i];
    }
    
#ifdef STATS
    /* Print the number of calls to the distance function */
    lint_t num_calls;
    uint_t num_pruned;
    
    get_stats(&num_calls, &num_pruned);
    PRINTF_STDOUT("Calls to distance function = %llu\n", num_calls);
    PRINTF_STDOUT("Number of pruned vectors = %u\n", num_pruned);
#endif /* #ifdef STATS */
}
