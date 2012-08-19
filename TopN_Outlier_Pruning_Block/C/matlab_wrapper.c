/* Includes */
#include <mex.h>
#include <stdlib.h> /* for size_t */
#include <string.h> /* for memset */
#include "utility.h" /* for double_t, index_t */
#include "matlab.h" /* for IS_REAL_2D_FULL_DOUBLE, IS_REAL_SCALAR, RETRIEVE_REAL_DOUBLE_ARRAY */
#include "stats.h" /* for get_stats */
#include "top_n_outlier_pruning_block.h" /* for top_n_outlier_pruning_block */

/* Input and output arguments. */
#define DATA_IN             prhs[0]
#define K_IN                prhs[1]
#define N_IN                prhs[2]
#define BLOCKSIZE_IN        prhs[3]
#define OUTLIERS_OUT        plhs[0]
#define OUTLIERSCORES_OUT   plhs[1]

/*
 * Save the input and output parameters of the top_n_outlier_pruning_block 
 * function to a binary file.
 */
void save_variables_to_file(const size_t num_vectors,
                            const size_t vector_dims,
                            const double_t (* const data)[num_vectors][vector_dims],
                            const size_t k,
                            const size_t N,
                            const size_t default_block_size,
                            index_t (* const outliers)[N],
                            double_t (* const outlier_scores)[N]) {
    FILE * fp;
    fp = fopen("vars.dat", "wb");
    
    fwrite(       &num_vectors,   sizeof(size_t),                         1, fp); /* num_vectors */
    fwrite(       &vector_dims,   sizeof(size_t),                         1, fp); /* vector_dims */
    fwrite(               data, sizeof(double_t), num_vectors * vector_dims, fp); /* data */
    fwrite(                 &k,   sizeof(size_t),                         1, fp); /* k */
    fwrite(                 &N,   sizeof(size_t),                         1, fp); /* N */
    fwrite(&default_block_size,   sizeof(size_t),                         1, fp); /* default_block_size */
    fwrite(           outliers,  sizeof(index_t),                         N, fp); /* outliers */
    fwrite(     outlier_scores, sizeof(double_t),                         N, fp); /* outlier_scores */
    
    fclose(fp);
}

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
    if (nrhs != 4)
        mexErrMsgTxt("Four inputs required.");
    if (nlhs <= 0 || nlhs > 2)
        mexErrMsgTxt("One or two outputs required.");
    
    /*
     * Make sure the first input argument is a real 2D full (non-sparse) double
     * array.
     */
    if (!IS_REAL_2D_FULL_DOUBLE(DATA_IN))
        mexErrMsgTxt("Input 'data' must be a real full 2D double array.");
    RETRIEVE_REAL_DOUBLE_ARRAY(data, DATA_IN);
    
    /* Make sure the second input argument is an integer. */
    if (!IS_REAL_SCALAR(K_IN))
        mexErrMsgTxt("Input 'k' must be a scalar.");
    const double k_dbl = mxGetScalar(K_IN);
    if ((int) k_dbl <= 0) /* make sure the second input argument is greater than zero */
        mexErrMsgTxt("Input 'k' must be positive.");
    const size_t k = (size_t) k_dbl;
    
    /* Make sure the third input argument is an integer. */
    if (!IS_REAL_SCALAR(N_IN))
        mexErrMsgTxt("Input 'N' must be a scalar.");
    const double N_dbl = mxGetScalar(N_IN);
    if ((int) N_dbl <= 0) /* make sure the third input argument is greater than zero */
        mexErrMsgTxt("Input 'N' must be positive.");
    const size_t N = (size_t) N_dbl;
    
    /* Make sure the fourth input argument is an integer. */
    if (!IS_REAL_SCALAR(BLOCKSIZE_IN))
        mexErrMsgTxt("Input 'block_size' must be a scalar.");
    const double block_size_dbl = mxGetScalar(BLOCKSIZE_IN);
    if ((int) block_size_dbl <= 0) /* make sure the fourth input argument is greater than zero */
        mexErrMsgTxt("Input 'block_size' must be positive.");
    const size_t block_size = (size_t) block_size_dbl;
    
    /* Additional error checking. */
    if (ROWS(data) < N)
        mexErrMsgTxt("Input 'N' must be less than or equal to the number of vectors in the 'data' array.");
    if (ROWS(data) < k)
        mexErrMsgTxt("Input 'k' must be less than or equal to the number of vectors in the 'data' array.");
    
    /* Convert the input to proper format. */
    const size_t num_vectors = ROWS(data);
    const size_t vector_dims = COLS(data);
    double_t * data_in = (double_t *) malloc(num_vectors * vector_dims * sizeof(double_t));
    
    if (data_in == NULL)
        mexErrMsgTxt("Unable to allocate memory for data array.");

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
    memset(outliers_out,       0, N * sizeof(index_t));
    memset(outlier_scores_out, 0, N * sizeof(double_t));
    
    /* Call the function. */
    top_n_outlier_pruning_block(num_vectors, vector_dims, (const double_t (* const)[num_vectors][vector_dims]) data_in, k, N, block_size, &outliers_out, &outlier_scores_out);
    
    /* Save input and output parameters. */
    save_variables_to_file(num_vectors, vector_dims, (const double_t (* const)[num_vectors][vector_dims]) data_in, k, N, block_size, &outliers_out, &outlier_scores_out);
    
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
    mexPrintf("Calls to distance function = %llu\n", num_calls);
    mexPrintf("Number of pruned vectors = %u\n", num_pruned);
#endif /* #ifdef STATS */
}
