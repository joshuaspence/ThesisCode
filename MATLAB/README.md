This directory contains `MATLAB` code and scripts used during the completion of 
the Thesis project.

# SUBDIRECTORIES
***Datasets:** Contains data sets that can be used for testing the algorithms.
**Lib:** Contains external libraries required for algorithm execution. Consists 
    mostly of `MEX` files.
**profiling_util:** Contains various `MATLAB` scripts that were used to profile
    the algorithm.
**TopN_Outlier_Pruning_Block:** This directory contains various implementations
    of the `TopN_Outlier_Pruning_Block` function.

# SCRIPTS
**clean.sh:** Removes any leftover files produced by the `MATLAB` code. Only
    removes files from the base MATLAB directory.
**clean-profiling.sh:** Removes any files produce by running the `josh_profile`
    test scripts.
**josh_profile.sh:** Profiles the execution of all `TopN_Outlier_Pruning_Block`
    implementations over all data sets.
**josh_profile.sh:** Profiles the execution `TopN_Outlier_Pruning_Block` with
    a varying block size.
**josh_test.sh:** Compares the results produced by each 
    `TopN_Outlier_Pruning_Block` implementation over all data sets.

# Usage
To execute the anomaly distance algorithm, execute the following command.
`FUNCTION_NAME` is the name of the `TopN_Outlier_Pruning_Block` function be to
be used.
```matlab
commute_distance_anomaly_detection DATASET FUNCTION_NAME
```

## Algorithm implementations
The following `TopN_Outlier_Pruning_Block` implementations exist:
* `TopN_Outlier_Pruning_Block_MATLAB_SORTED`
* `TopN_Outlier_Pruning_Block_MATLAB_SORTED_INLINE`
* `TopN_Outlier_Pruning_Block_MATLAB_UNSORTED`
* `TopN_Outlier_Pruning_Block_MATLAB_UNSORTED_INLINE`
* `TopN_Outlier_Pruning_Block_SORTED`
* `TopN_Outlier_Pruning_Block_UNSORTED`
* `TopN_Outlier_Pruning_Block_NO_BLOCKING`
