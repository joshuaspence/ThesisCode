#include "mex.h"
#include "math.h"

/* Input and output arguments */
#define X_IN            prhs[0]
#define K_IN            prhs[1]
#define N_IN            prhs[2]
#define BLOCKSIZE_IN    prhs[3]
#define O_OUT           plhs[0]
#define OF_OUT          plhs[1]

/* Utility macros */
#define IS_REAL_2D_DOUBLE(P) \
    (!mxIsComplex(P) && mxGetNumberOfDimensions(P) == 2 && mxIsDouble(P))
#define IS_REAL_2D_FULL_DOUBLE(P) \
    (IS_REAL_2D_DOUBLE(P) && !mxIsSparse(P))
#define IS_REAL_SCALAR(P) \
    (IS_REAL_2D_FULL_DOUBLE(P) && mxGetNumberOfElements(P) == 1)
#define IS_REAL_2D_INTEGER(P) \
    (!mxIsComplex(P) && mxGetNumberOfDimensions(P) == 2 && !mxIsDouble(P))
#define IS_REAL_2D_FULL_INTEGER(P) \
    (IS_REAL_2D_INTEGER(P) && !mxIsSparse(P))
#define IS_REAL_INTEGER(P) \
    (IS_REAL_2D_FULL_INTEGER(P) && mxGetNumberOfElements(P) == 1)

/* Code-saving macros */
#define CREATE_REAL_DOUBLE_ARRAY(arrayname, rows, cols) \
    const mwSize arrayname##_rows = rows; \
    const mwSize arrayname##_cols = cols; \
    mxArray * arrayname##_matlab = mxCreateDoubleMatrix(arrayname##_rows, arrayname##_cols, mxREAL); \
    double * arrayname = mxGetData(arrayname##_matlab)
#define ARRAY_ELEMENT(array, row, column) \
    array[((row) - 1) + array##_rows * ((column) - 1)]
    
/* Boolean types */
typedef int boolean;
#ifndef true
	#define true 1
#endif
#ifndef false
	#define false 0
#endif

/*
 * Utility function to set the values of an array to an incremental range. The 
 * range will start at "val", and each element of the array will be "incr" 
 * larger than the previous element.
 *
 * Parameters:
 *     - array: The array to be set to an incremental range.
 *     - array_rows: The number of rows of the array.
 *     - array_cols: The number of columns of the array.
 *     - val: The value for the first element of the array.
 *     - incr: The increment for each cell in the array.
 */
static void array_range(double * array, const unsigned int array_rows, const unsigned int array_cols, int val, const int incr) {
    unsigned int row;
    unsigned int col;

    for (row = 1; row <= array_rows; row++) {
        for (col = 1; col <= array_cols; col++) {
            ARRAY_ELEMENT(array, row, col) = val;
            val += incr;
        }
    }
}

/*
 * Calculate the mean of all values within a single row of an array.
 *
 * Parameters:
 *     - array: The array of which to calculate the mean over a row.
 *     - array_rows: The number of rows of the array.
 *     - array_cols: The number of columns of the array.
 *     - row: The row number of the row to be averaged. Note that the row index 
 *            follows the MATLAB convention of beginning at 1.
 *
 * Return:
 *    The mean of all values within the single row of the array.
 */
static double mean_over_row(double * array, const unsigned int array_rows, const unsigned int array_cols, const unsigned int row) {
    double sum = 0;
    unsigned int count = 0;
    unsigned int col;

    for (col = 1; col <= array_cols; col++) {
        sum += ARRAY_ELEMENT(array, row, col);
        count++;
    }

    return sum / count;
}

/*
 * Calculate the distance between values from two rows of an array.
 *
 * Parameters:
 *     - array: The array of which to calculate the mean over a row.
 *     - array_rows: The number of rows of the array.
 *     - array_cols: The number of columns of the array.
 *     - row: The row number of one of the rows. Note that the row index follows
 *            follows the MATLAB convention of beginning at 1.
  *     - row: The row number of the other row. Note that the row index follows
 *            follows the MATLAB convention of beginning at 1.
 *
 * Return:
 *    The sum of the distance between values of the rows.
 */
static double dist_over_row(double * array, const unsigned int array_rows, const unsigned int array_cols, const unsigned int row1, const unsigned int row2) {
    double sum_of_squares = 0;
    unsigned int col;
    
    for (col = 1; col <= array_cols; col++)
        sum_of_squares += pow(ARRAY_ELEMENT(array, row1, col) - ARRAY_ELEMENT(array, row2, col), 2);
        
    return sqrt(sum_of_squares);
}

/*
 * Calculate the maximum value of all values within a single row of an array.
 *
 * Parameters:
 *     - array: The array of which to calculate the mean over a row.
 *     - array_rows: The number of rows of the array.
 *     - array_cols: The number of columns of the array.
 *     - row: The row number of the row to be averaged. Note that the row index 
 *            follows the MATLAB convention of beginning at 1.
 *     - maxd: A pointer to the return value storing the maximum value.
 *     - maxi: A pointer to the return value storing the index of the element 
 *             containing the maximum value.
 */
static void max_over_row(double * array, const unsigned int array_rows, const unsigned int array_cols, const unsigned int row, double * maxd, unsigned int * maxi) {
    unsigned int col;
	boolean found = false;    

    for (col = 1; col <= array_cols; col++) {
        const double val = ARRAY_ELEMENT(array, row, col);
        if (!found || val > *maxd) {
            *maxd = val;
            *maxi = col;
        }
    }
}

/*
 * ???
 *
 * Parameters:
 *     - X: An X_rows-by-X_cols array of doubles.
 *     - X_rows: Number of rows of X
 *     - X_cols: Number of columns of X
 *     - k: number of k-nearest neighbours for outlier detection
 *     - N: return the top N outliers
 *     - block_size:
 *     - O: A 1xN array of unsigned integers. This is an output of the function.
 *     - OF: A 1xN array of doubles. This is an output of the function.
 */
static void top_n_outlier_pruning_block(double * X, const unsigned int X_rows, const unsigned int X_cols, const unsigned int k, const unsigned int N, const unsigned int block_size, double * O, const unsigned int O_rows, const unsigned int O_cols, double *  OF, const unsigned int OF_rows, const unsigned int OF_cols) {
	unsigned int count = 0;
	double c;
    
    if (O_rows != 1 || O_cols != N)
    	mexErrMsgTxt("Input O must be a 1xN array.");
    if (OF_rows != 1 || OF_cols != N)
    	mexErrMsgTxt("Input OF must be a 1xN array.");

    while (X_rows - count > 0) { /* O(X_rows / block_size) */
        CREATE_REAL_DOUBLE_ARRAY(B, 1, block_size); /* MATLAB: `B = zeros(1,block_size);` */
        array_range(B, B_rows, B_cols, count + 1, 1); /* MATLAB: `B = (count+1 : count+block_size);` */
        count += block_size;

        unsigned int sizeB;
        if (count <= n)
            sizeB = block_size;
        else
            sizeB = n - (count - block_size);

        CREATE_REAL_DOUBLE_ARRAY(neighbours,      sizeB, k); /* MATLAB: `neighbours = zeros(sizeB,k);` */
        CREATE_REAL_DOUBLE_ARRAY(neighbours_dist, sizeB, k); /* MATLAB: `neighbours_dist = zeros(sizeB,k);` */
        CREATE_REAL_DOUBLE_ARRAY(score,           1,     sizeB); /* MATLAB: `score = zeros(1,sizeB);` */

        unsigned int l = 1;
        unsigned int i;
        unsigned int j;
        unsigned int col;
        for (i = 1; i <= n; i++) { /* MATLAB: `for i=1 : n` */
            for (j = 1; j <= sizeB; j++) { /* MATLAB: `for j=1 : sizeB` */
                const unsigned int B_j = (unsigned int) ARRAY_ELEMENT(B, 1, j);

                if (i != B_j && B_j != 0) { /* MATLAB: `if i~=B(j) && B(j)~=0` */
                    const double d = dist_over_row(X, X_rows, X_cols, i, B_j); /* MATLAB: `d = dist(X(i, :), X(B(j), :)) ^ 2;` */

                    if (l > 1 && l <= (k + 1) && ARRAY_ELEMENT(neighbours, j, l - 1) == 0)
                        l--;
                    else if (l < k && ARRAY_ELEMENT(neighbours, j, l) != 0)
                        l++;

                    if (l <= k) {
                        ARRAY_ELEMENT(neighbours,      j, l) = i;
                        ARRAY_ELEMENT(neighbours_dist, j, l) = d;
                        if (l == k)
                            ARRAY_ELEMENT(score, 1, j) = mean_over_row(neighbours_dist, neighbours_dist_rows, neighbours_dist_cols, j); /* MATLAB: `score(j) = mean(neighbours_dist(j, :), 2);` */
                    } else {
                        /* find the farthest point */
                        double maxd;
                        unsigned int maxi;
                        max_over_row(neighbours_dist, neighbours_dist_rows, neighbours_dist_cols, j, &maxd, &maxi); /* MATLAB: `[maxd, maxi] = max(neighbours_dist(j, :));` */

                        /* replace the farthest point */
                        if (d < maxd) {
                            ARRAY_ELEMENT(neighbours,      j, maxi) = i;
                            ARRAY_ELEMENT(neighbours_dist, j, maxi) = d;

                            /* update the score */
                            ARRAY_ELEMENT(score, 1, j) = (ARRAY_ELEMENT(score, 1, j) * k - maxd + d) / k;
                            if (ARRAY_ELEMENT(score, 1, j) <= 0) {
                                /* avoid round off error */
                                /* MATLAB: `score[j] = max(mean(neighbours_dist(j, :), 2), 0);` */
                                const double average = mean_over_row(neighbours_dist, j, neighbours_dist_rows, neighbours_dist_cols);
                                if (average > 0)
                                    ARRAY_ELEMENT(score, 1, j) = average;
                                else
                                    ARRAY_ELEMENT(score, 1, j) = 0;
                            }
                        }
                    }

                    if (l >= k && ARRAY_ELEMENT(score, 1, j) < c) {
                        ARRAY_ELEMENT(B,     1, j) = 0;
                        ARRAY_ELEMENT(score, 1, j) = 0;
                    }
                }
            }

            l++;
        }

        /* MATLAB: `BO = [B(1 : sizeB) O];` */
        CREATE_REAL_DOUBLE_ARRAY(BO, 1, sizeB + 1);
        for (col = 1; col <= BO_cols; col++)
            ARRAY_ELEMENT(BO, 1, col) = ARRAY_ELEMENT(B, 1, col);

        /* MATLAB: `BOF = [score OF];` */
        CREATE_REAL_DOUBLE_ARRAY(BOF, 1, score_cols + OF_cols);
        for (col = 1; col <= score_cols; col++)
            ARRAY_ELEMENT(BOF, 1, col) = ARRAY_ELEMENT(score, 1, col);
        for (col = 1; col <= OF_cols; col++)
            ARRAY_ELEMENT(BOF, 1, col + score_cols) = ARRAY_ELEMENT(OF, 1, col);
        
        /* Call the MATLAB sort function. */
        mxArray * sort_outputs[2];
        mxArray * sort_inputs[2] = { BOF_matlab, mxCreateString("descend") };
        mexCallMATLAB(2, sort_outputs, 2, sort_inputs, "sort"); /* MATLAB: `[BOF, index] = sort(BOF, 'descend');` */

        const mwSize newBOF_rows = mxGetM(sort_outputs[0]);
        const mwSize newBOF_cols = mxGetN(sort_outputs[0]);
        const double * const newBOF = mxGetData(sort_outputs[0]);

        const mwSize index_rows = mxGetM(sort_outputs[1]);
        const mwSize index_cols = mxGetN(sort_outputs[1]);
        const double * const index = mxGetPr(sort_outputs[1]);

        /* MATLAB: `BO = BO(index);` */
        CREATE_REAL_DOUBLE_ARRAY(newBO, BO_rows, BO_cols);
        for (col = 1; col <= BO_cols; col++) {
            const unsigned int mapped_index = (unsigned int) ARRAY_ELEMENT(index, 1, col);
            ARRAY_ELEMENT(newBO, 1, col) = ARRAY_ELEMENT(BO, 1, mapped_index);
        }

        /* MATLAB: O = `BO(1 : N);` */
        for (col = 1; col <= O_cols; col++)
            ARRAY_ELEMENT(O, 1, col) = ARRAY_ELEMENT(BO, 1, col);

        /* MATLAB: OF = BOF(1 : N);` */
        for (col = 1; col <= OF_cols; col++)
            ARRAY_ELEMENT(OF, 1, col) = ARRAY_ELEMENT(newBOF, 1, col);

        /* c = weakest outlier */
        c = ARRAY_ELEMENT(OF, 1, N); /* MATLAB: `c = OF(N);` */
    }
}
 
/*
 * Gateway function
 *
 * This is the entry point MATLAB uses to access the DLL.
 *
 * Parameters:
 *     - nlhs: The number of lhs (output) arguments.
 *     - plhs: Pointer to an array which will hold the output data, each element
 *             is type mxArray.
 *     - nrhs: The number of rhs (input) arguments.
 *     - prhs: Pointer to an array which holds the input data, each element is
 *             type const mxArray.
 *
 * Calling syntax:
 *     [O, OF] = top_n_outlier_pruning_block(X, k, N, block_size);
 *
 * NOTES
 *     - X is a real full 2D double array.
 *     - k is an integer-valued scalar.
 *     - N is an integer-valued scalar.
 *     - block_size is an integer-valued scalar.
 */
void mexFunction(int nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[]) {
    /* check for proper number of arguments */
    if (nrhs != 4)
        mexErrMsgTxt("Four inputs required.");
    if (nlhs != 2)
        mexErrMsgTxt("Two outputs required.");

    /* make sure the first input argument is a real 2D full (non-sparse) double array */
    if (!IS_REAL_2D_FULL_DOUBLE(X_IN))
        mexErrMsgTxt("Input X must be a real full 2D double array.");
    double * X = mxGetPr(X_IN);
    const mwSize X_rows = mxGetM(X_IN);
    const mwSize X_cols = mxGetN(X_IN);

    /* make sure the second input argument is an integer */
    if(!IS_REAL_SCALAR(K_IN))
        mexErrMsgTxt("Input k must be a scalar.");
    const unsigned int k = (unsigned int) mxGetScalar(K_IN);

    /* make sure the third input argument is an integer */
    if(!IS_REAL_SCALAR(N_IN))
        mexErrMsgTxt("Input N must be a scalar.");
    const unsigned int N = (unsigned int) mxGetScalar(N_IN);

    /* make sure the fourth input argument is an integer */
    if(!IS_REAL_SCALAR(BLOCKSIZE_IN))
        mexErrMsgTxt("Input block_size must be a scalar.");
    const unsigned int block_size = (unsigned int) mxGetScalar(BLOCKSIZE_IN);

    /* create the output matrixes */
    O_OUT  = mxCreateDoubleMatrix(1, N, mxREAL);
    OF_OUT = mxCreateDoubleMatrix(1, N, mxREAL);

    /* get pointers to the real data in the output matrixes */
    double * O  = mxGetData(O_OUT);
    double * OF = mxGetData(OF_OUT);

    /* call the function */
    top_n_outlier_pruning_block(X, X_rows, X_cols, k, N, block_size, O, 1, N, OF, 1, N);
}
