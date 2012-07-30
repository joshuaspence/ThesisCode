/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
/* for mxArray, mexErrMsgTxt, mxGetScalar */
#include <mex.h>

/* 
 * For CREATE_REAL_DOUBLE_ARRAY, CREATE_REAL_UINT_VECTOR, 
 * CREATE_REAL_DOUBLE_VECTOR, ROWS, COLS, ELEMENTS, ARRAY_ELEMENT, 
 * VECTOR_ELEMENT, ARRAY_ARGUMENTS, VECTOR_ARGUMENTS
 */
#include "macros.h"

/*
 * For IS_REAL_2D_FULL_DOUBLE, IS_REAL_SCALAR, 
 * MATLAB_RETRIEVE_REAL_DOUBLE_ARRAY, MATLAB_CREATE_REAL_DOUBLE_VECTOR, 
 * MATLAB_ROWS, MATLAB_COLS, MATLAB_VECTOR, MATLAB_ARRAY, MATLAB_ELEMENTS,
 * MATLAB_ARRAY_ELEMENT, MATLAB_VECTOR_ELEMENT
 */
#include "matlab.h"

/* for top_n_outlier_pruning_block */
#include "TopN_Outlier_Pruning_Block.h"
/*----------------------------------------------------------------------------*/

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
    if (!IS_REAL_2D_FULL_DOUBLE(DATA_IN))
        mexErrMsgTxt("Input 'data' must be a real full 2D double array.");
    MATLAB_RETRIEVE_REAL_DOUBLE_ARRAY(data, DATA_IN);

    /* Make sure the second input argument is an integer. */
    if (!IS_REAL_SCALAR(K_IN))
        mexErrMsgTxt("Input 'k' must be a scalar.");
    /* TODO: check k is non-negative and an integer */
    const unsigned int k = (unsigned int) mxGetScalar(K_IN);

    /* Make sure the third input argument is an integer. */
    if (!IS_REAL_SCALAR(N_IN))
        mexErrMsgTxt("Input 'N' must be a scalar.");
    /* TODO: check N is non-negative and an integer */
    const unsigned int N = (unsigned int) mxGetScalar(N_IN);

    /* Make sure the fourth input argument is an integer. */
    if (!IS_REAL_SCALAR(BLOCKSIZE_IN))
        mexErrMsgTxt("Input 'block_size' must be a scalar.");
    /* TODO: check block_size is non-negative and an integer */
    const unsigned int block_size = (unsigned int) mxGetScalar(BLOCKSIZE_IN);
    
    /* Additional error checking. */
    if (MATLAB_ROWS(data) < N)
        mexErrMsgTxt("Input 'N' must be less than or equal to the number of vectors in the 'data' array.");
    if (MATLAB_ROWS(data) < k)
        mexErrMsgTxt("Input 'k' must be less than or equal to the number of vectors in the 'data' array.");
    
    /* Convert the input to proper format. */
    CREATE_REAL_DOUBLE_ARRAY (data_in, MATLAB_ROWS(data), MATLAB_COLS(data));
    do {
        index_t row;
        for (row = 1; row <= ROWS(data_in); row++) {
            index_t col;
            for (col = 1; col <= COLS(data_in); col++) {
                ARRAY_ELEMENT(data_in, row, col) = MATLAB_ARRAY_ELEMENT(data, row, col);
            }
        }
    } while (0);
    
    /* Create the output arrays. */
    CREATE_REAL_UINT_VECTOR  (outliers,       N);
    CREATE_REAL_DOUBLE_VECTOR(outlier_scores, N);

    /* Call the function. */
    top_n_outlier_pruning_block(ARRAY_ARGUMENTS(data_in), k, N, block_size, VECTOR_ARGUMENTS(outliers), VECTOR_ARGUMENTS(outlier_scores));
    
    /* Convert the output to MATLAB format. */
    MATLAB_CREATE_REAL_DOUBLE_VECTOR (outliers_out,       N);
    MATLAB_CREATE_REAL_DOUBLE_VECTOR (outlier_scores_out, N);
    OUTLIERS_OUT      = MATLAB_VECTOR(outliers_out);
    OUTLIERSCORES_OUT = MATLAB_VECTOR(outlier_scores_out);
    do {
        index_t element;
        for (element = 1; element <= ELEMENTS(outliers); element++) {
            MATLAB_VECTOR_ELEMENT(outliers_out, element)       = VECTOR_ELEMENT(outliers, element);
            MATLAB_VECTOR_ELEMENT(outlier_scores_out, element) = VECTOR_ELEMENT(outlier_scores, element);
        }
    } while (0);
}
