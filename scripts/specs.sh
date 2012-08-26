#!/bin/bash

OUTPUT_DIRECTORY=specs
MATLAB_DIR=$(matlab -e 2>/dev/null | sed -n 's/MATLAB=\(.\+\)/\1/p')

echo "Creating output directory..."
rm -rf $OUTPUT_DIRECTORY
mkdir --parents $OUTPUT_DIRECTORY

echo "Running lshw..."
sudo lshw -html > $OUTPUT_DIRECTORY/specs.html
echo

echo "Getting gcc version..."
gcc --version > $OUTPUT_DIRECTORY/gcc.txt
echo

echo "Getting MATLAB version..."
matlab -nosplash -nodesktop -r "ver; quit" > $OUTPUT_DIRECTORY/matlab.txt
echo

echo "Getting mex info..."
$MATLAB_DIR/bin/mex -v 2>/dev/null > $OUTPUT_DIRECTORY/mex.txt
echo

echo "Getting ld version..."
ld -v > $OUTPUT_DIRECTORY/ld.txt
echo

echo "Getting OS info..."
uname -a > $OUTPUT_DIRECTORY/uname.txt
echo
