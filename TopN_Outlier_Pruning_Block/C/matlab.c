/* Includes */
#include <mex.h>
#include "matlab.h"

/* Input and output arguments. */
#define DATA_IN             prhs[0]
#define K_IN                prhs[1]
#define N_IN                prhs[2]
#define BLOCKSIZE_IN        prhs[3]
#define OUTLIERS_OUT        plhs[0]
#define OUTLIERSCORES_OUT   plhs[1]

extern void top_n_outlier_pruning_block(const double * const ARRAY_SIGNATURE(data),
                                        const unsigned int k, const unsigned int N, const unsigned int block_size, 
                                        unsigned int * ARRAY_SIGNATURE(outliers), 
                                        double * ARRAY_SIGNATURE(outlier_scores));

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
 *     [Outliers, OutlierScores] = top_n_outlier_pruning_block(data, k, N, block_size);
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
    if (!IS_REAL_2D_FULL_DOUBLE(DATA_IN))
        mexErrMsgTxt("Input 'data' must be a real full 2D double array.");
    MATLAB_RETRIEVE_REAL_DOUBLE_ARRAY(data, DATA_IN);

    /* Make sure the second input argument is an integer. */
    if (!IS_REAL_SCALAR(K_IN))
        mexErrMsgTxt("Input 'k' must be a scalar.");
    const unsigned int k = (unsigned int) mxGetScalar(K_IN);

    /* Make sure the third input argument is an integer. */
    if (!IS_REAL_SCALAR(N_IN))
        mexErrMsgTxt("Input 'N' must be a scalar.");
    const unsigned int N = (unsigned int) mxGetScalar(N_IN);

    /* Make sure the fourth input argument is an integer. */
    if (!IS_REAL_SCALAR(BLOCKSIZE_IN))
        mexErrMsgTxt("Input 'block_size' must be a scalar.");
    const unsigned int block_size = (unsigned int) mxGetScalar(BLOCKSIZE_IN);

    /* Create the output matrixes. */
    CREATE_REAL_UINT_ARRAY  (outliers,       1, N);
    CREATE_REAL_DOUBLE_ARRAY(outlier_scores, 1, N);
    OUTLIERS_OUT            = MATLAB_ARRAY(outliers);
    OUTLIERSCORES_OUT       = MATLAB_ARRAY(outlier_scores);

    /* Call the function. */
    top_n_outlier_pruning_block(ARRAY_ARGUMENTS(data), k, N, block_size, ARRAY_ARGUMENTS(outliers), ARRAY_ARGUMENTS(outlier_scores));
}
