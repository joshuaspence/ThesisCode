#!/bin/bash

OUTPUT_DIRECTORY=specs
MATLAB_DIR=$(matlab -e 2>/dev/null | sed -n 's/MATLAB=\(.\+\)/\1/p')

function echo_and_execute {
    echo "$1 > $2"
    $1 > $2
}

echo "Creating output directory..."
rm -rf $OUTPUT_DIRECTORY
mkdir --parents $OUTPUT_DIRECTORY

echo "Running lshw..."
echo_and_execute "sudo lshw -html" "$OUTPUT_DIRECTORY/specs.html"
echo

echo "Getting gcc version..."
echo_and_execute "gcc --version" "$OUTPUT_DIRECTORY/gcc.txt"
echo

echo "Getting MATLAB version..."
echo_and_execute "matlab -nosplash -nodesktop -r \"ver\"" "matlab.txt"
echo

echo "Getting mex version..."
echo_and_execute "$MATLAB_DIR/mex -v" "mex.txt"
echo

echo "Getting ld version..."
echo_and_execute "ld -v" "ld.txt"
echo
