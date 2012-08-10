#!/bin/bash

echo "Cleaning..."
rm --force --verbose josh_profile{,.*}.log josh_profile_block_size{,.*}.log
rm --force --verbose --recursive Profiling{,.*}/
echo "DONE!"
exit 0
