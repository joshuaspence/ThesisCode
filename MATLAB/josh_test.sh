#!/bin/bash

#===============================================================================
# This script can be used to test MATLAB execution. MATLAB will be run with 
# "nohup" so that the profiling will continue even when the TTY session is 
# ended.
#===============================================================================

SCRIPT_NAME=$(basename $0)
if [[ "$(readlink -f $(pwd))" != "$(readlink -f $(dirname $0))" ]]; then
    echo "This script must be run from the directory '$(readlink -f $(dirname $0))'." >&2
    exit 1
fi

# Clean the MATLAB directory first
echo "Cleaning MATLAB directory."
./clean.sh

echo -n "Provide a description (defaults to date): "
read DESCRIPTION
if [[ -z "$DESCRIPTION" ]]; then
    DESCRIPTION=$(date '+%Y-%m-%d')
fi

# Unset the DISPLAY environment variable so that MATLAB does not attempt to 
# create any graphs
echo "Unsetting DISPLAY environment variable."
OLD_DISPLAY=$DISPLAY
unset DISPLAY

# MATLAB script
MATLAB_CMD=josh_test
MATLAB_CMD_ARGS=$DESCRIPTION
MATLAB_SCRIPT=$MATLAB_CMD.m

# Output directory
ROOT_DIR=$(sed -n "s/.*root_dir\s*=\s*'\(.*\)'\s*;.*$/\1/p" $MATLAB_SCRIPT)
OUTPUT_DIR=$ROOT_DIR/$DESCRIPTION
LOGFILE=$ROOT_DIR/$DESCRIPTION.log
mkdir --parents $(dirname $LOGFILE)

echo "Running MATLAB..."
echo "Output directory is '$OUTPUT_DIR'"
echo "Logging to '$LOGFILE'"
echo "GIT commit hash: $(git rev-parse HEAD)" >> $LOGFILE
echo "Running MATLAB command: '$MATLAB_CMD($MATLAB_CMD_ARGS)'"
nohup matlab -nodesktop -nosplash -r "addpath(genpath('.')); $MATLAB_CMD('$MATLAB_CMD_ARGS')" 1>>$LOGFILE 2>&1 &

echo "Restoring DISPLAY environment variable."
DISPLAY=$OLD_DISPLAY
export DISPLAY

echo "Done"
