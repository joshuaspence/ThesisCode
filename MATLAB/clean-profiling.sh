#!/bin/bash

echo "Cleaning..."
rm --force --verbose josh_profile{,.*}.log josh_profile_block_size{,.*}.log top_n_outlier_pruning_block.log
rm --force --verbose --recursive Profiling{,.*}/
echo "DONE!"
