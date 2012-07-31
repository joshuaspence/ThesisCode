/* Includes */
#include <mex.h>
#include <stdlib.h>
#include "macros.h"
#include "matlab.h"
#include "TopN_Outlier_Pruning_Block.h"

/* Input and output arguments. */
#define DATA_IN             prhs[0]
#define K_IN                prhs[1]
#define N_IN                prhs[2]
#define BLOCKSIZE_IN        prhs[3]
#define OUTLIERS_OUT        plhs[0]
#define OUTLIERSCORES_OUT   plhs[1]

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
 *     [Outliers, Outlier_Scores] = top_n_outlier_pruning_block(data, k, N, block_size);
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
    if (nlhs != 2)
        mexErrMsgTxt("Two outputs required.");

    /*
     * Make sure the first input argument is a real 2D full (non-sparse) double
     * array.
     */
    if (!IS_REAL_2D_FULL_DOUBLE(DATA_IN)) {
        mexErrMsgTxt("Input 'data' must be a real full 2D double array.");
    }
    MATLAB_RETRIEVE_REAL_DOUBLE_ARRAY(data, DATA_IN);

    /* Make sure the second input argument is an integer. */
    if (!IS_REAL_SCALAR(K_IN)) {
        mexErrMsgTxt("Input 'k' must be a scalar.");
    }
    const double k_dbl = mxGetScalar(K_IN);
    if ((int) k_dbl <= 0) {
        mexErrMsgTxt("Input 'k' must be positive.");
    }
    const size_t k = (size_t) k_dbl;

    /* Make sure the third input argument is an integer. */
    if (!IS_REAL_SCALAR(N_IN)) {
        mexErrMsgTxt("Input 'N' must be a scalar.");
    }
    const double N_dbl = mxGetScalar(N_IN);
    if ((int) N_dbl <= 0) {
        mexErrMsgTxt("Input 'N' must be positive.");
    }
    const size_t N = (size_t) N_dbl;

    /* Make sure the fourth input argument is an integer. */
    if (!IS_REAL_SCALAR(BLOCKSIZE_IN)) {
        mexErrMsgTxt("Input 'block_size' must be a scalar.");
    }
    const double block_size_dbl = mxGetScalar(BLOCKSIZE_IN);
    if ((int) block_size_dbl <= 0) {
        mexErrMsgTxt("Input 'block_size' must be positive.");
    }
    const size_t block_size = (size_t) block_size_dbl;

    /* Additional error checking. */
    if (MATLAB_ROWS(data) < N) {
        mexErrMsgTxt("Input 'N' must be less than or equal to the number of vectors in the 'data' array.");
    }
    if (MATLAB_ROWS(data) < k) {
        mexErrMsgTxt("Input 'k' must be less than or equal to the number of vectors in the 'data' array.");
    }

    /* Convert the input to proper format. */
    CREATE_REAL_DOUBLE_ARRAY(data_in, MATLAB_ROWS(data), MATLAB_COLS(data));
    do {
        index_t row;
        for (row = 1; row <= ROWS(data_in); row++) {
            index_t col;
            for (col = 1; col <= COLS(data_in); col++) {
                ARRAY_ELEMENT(data_in, row, col) = (double_t) MATLAB_ARRAY_ELEMENT(data, row, col);
            }
        }
    } while (0);


    /* Create the output arrays. */
    CREATE_REAL_UINT_VECTOR  (outliers_out,       N);
    CREATE_REAL_DOUBLE_VECTOR(outlier_scores_out, N);
    do {
        index_t element;
        for (element = 1; element <= ELEMENTS(outliers_out); element++) {
            VECTOR_ELEMENT(outliers_out,       element) = (uint_t)   0;
            VECTOR_ELEMENT(outlier_scores_out, element) = (double_t) 0;
        }
    } while (0);

    /* Call the function. */
    top_n_outlier_pruning_block(ARRAY_ARGUMENTS(data_in), k, N, block_size, VECTOR_ARGUMENTS(outliers_out), VECTOR_ARGUMENTS(outlier_scores_out));

    /* Convert the output to MATLAB format. */
    MATLAB_CREATE_REAL_DOUBLE_VECTOR   (outliers,       N);
    MATLAB_CREATE_REAL_DOUBLE_VECTOR (outlier_scores, N);
    OUTLIERS_OUT      = MATLAB_VECTOR(outliers);
    OUTLIERSCORES_OUT = MATLAB_VECTOR(outlier_scores);

    do {
        index_t element;
        for (element = 1; element <= MATLAB_ELEMENTS(outliers); element++) {
            MATLAB_VECTOR_ELEMENT(outliers,       element) = (m_uint_t)   VECTOR_ELEMENT(outliers_out,       element);
            MATLAB_VECTOR_ELEMENT(outlier_scores, element) = (m_double_t) VECTOR_ELEMENT(outlier_scores_out, element);
        }
    } while (0);

    /* Free memory. */
    FREE_ARRAY(outliers_out);
    FREE_ARRAY(outlier_scores_out);
}
