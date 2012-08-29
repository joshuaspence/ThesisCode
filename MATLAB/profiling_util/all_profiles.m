%==========================================================================
% This script is used to generate a list of all profiles.
%==========================================================================

function profiles = all_profiles
    profiles = [
        struct('name', 'matlab_unsorted_inline',    'func', 'TopN_Outlier_Pruning_Block_MATLAB_UNSORTED_INLINE'), ...
        struct('name', 'matlab_sorted_inline',      'func', 'TopN_Outlier_Pruning_Block_MATLAB_SORTED_INLINE'), ...
        struct('name', 'C_unsorted',                'func', 'TopN_Outlier_Pruning_Block_UNSORTED'), ...
        struct('name', 'C_sorted',                  'func', 'TopN_Outlier_Pruning_Block_SORTED'), ...
        struct('name', 'C_no_blocking',             'func', 'TopN_Outlier_Pruning_Block_NO_BLOCKING'), ...
    ];
    
    unused_profiles = [
        struct('name', 'matlab_unsorted',           'func', 'TopN_Outlier_Pruning_Block_MATLAB_UNSORTED'), ...
        struct('name', 'matlab_sorted',             'func', 'TopN_Outlier_Pruning_Block_MATLAB_SORTED'), ...
    ];
