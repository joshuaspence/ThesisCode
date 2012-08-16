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
echo_and_execute "matlab -nosplash -nodesktop -r \"ver; quit\"" "$OUTPUT_DIRECTORY/matlab.txt"
echo

echo "Getting mex info..."
echo_and_execute "$MATLAB_DIR/bin/mex -v" "$OUTPUT_DIRECTORY/mex.txt"
echo

echo "Getting ld version..."
echo_and_execute "ld -v" "$OUTPUT_DIRECTORY/ld.txt"
echo

echo "Getting OS info..."
echo_and_execute "uname -a" "$OUTPUT_DIRECTORY/uname.txt"
echo
