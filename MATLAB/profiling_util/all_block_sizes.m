%==========================================================================
% This script is used to generate a list of all possible block sizes to 
% profile.
%==========================================================================

function [blocksizes, default] = all_block_sizes
    blocksizes = [1 10 15 30 40 45 60 90 100 1000 10000 100000 1000000];
    default = 0;
