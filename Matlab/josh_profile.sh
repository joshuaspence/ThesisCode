#!/bin/bash

if [ "$(readlink -f $(pwd))" != "$(readlink -f $(dirname $0))" ]; then
    echo "This script must be run from the directory '$(readlink -f $(dirname $0))'." >&2
    exit 1
fi

echo "Unsetting DISPLAY environment variable."
OLD_DISPLAY=$DISPLAY
unset DISPLAY

echo "Running MATLAB..."
LOGFILE="josh_profile.$(date +%Y-%m-%d).$$.log"
nohup matlab -nodesktop -nosplash -r "addpath(genpath('.')); josh_profile" 1>$LOGFILE 2>&1 &

echo "Restoring DISPLAY environment variable."
DISPLAY=$OLD_DISPLAY
export DISPLAY

echo "Done"
exit 0
