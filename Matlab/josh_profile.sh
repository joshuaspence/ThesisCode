#!/bin/bash

echo "Unsetting DISPLAY environment variable."
OLD_DISPLAY=$DISPLAY
unset DISPLAY

echo "Running MATLAB..."
nohup matlab -nodesktop -nosplash -r josh_profile &

echo "Restoring DISPLAY environment variable."
DISPLAY=$OLD_DISPLAY
export DISPLAY
