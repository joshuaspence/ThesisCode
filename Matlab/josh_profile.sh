#!/bin/bash

if [ "$(pwd)" != "$(readlink -f `$0`)" ]; then
    echo "This script must be run from the directory '$(readlink -f `$0`)'." >&2
    exit 1
fi

echo "Unsetting DISPLAY environment variable."
OLD_DISPLAY=$DISPLAY
unset DISPLAY

echo "Running MATLAB..."
nohup matlab -nodesktop -nosplash -r josh_profile &

echo "Restoring DISPLAY environment variable."
DISPLAY=$OLD_DISPLAY
export DISPLAY
