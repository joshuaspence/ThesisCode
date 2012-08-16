#!/bin/bash

echo "Cleaning profiling data..."
rm --force --verbose josh_profile{,.*}.log josh_profile_block_size{,.*}.log top_n_outlier_pruning_block.log
rm --force --verbose --recursive Profiling{,.*}/
