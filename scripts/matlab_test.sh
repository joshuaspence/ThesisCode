#!/bin/bash

#===============================================================================
# This script can be used to test MATLAB execution. MATLAB will be run with 
# "nohup" so that the profiling will continue even when the TTY session is 
# ended.
#
# Usage:
#     `./matlab_test.sh'
#===============================================================================

#===============================================================================
# Configuration
#===============================================================================
MATLAB_CMD=josh_test
MATLAB_DIR=../MATLAB
ROOT_OUTPUT_DIR=Testing
DATASET_DIR=$MATLAB_DIR/Datasets
#===============================================================================

SCRIPT_DIR=$(readlink -f $(dirname $0))
MATLAB_DIR=$(readlink -f $SCRIPT_DIR/$MATLAB_DIR)
DATASET_DIR=$(readlink -f $SCRIPT_DIR/$DATASET_DIR)

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
MATLAB_CMD_ARGS="'$DESCRIPTION', '$DATASET_DIR'"
MATLAB_SCRIPT=$MATLAB_CMD.m

# Output directory
OUTPUT_DIR=$ROOT_OUTPUT_DIR/$DESCRIPTION
LOGFILE=$ROOT_OUTPUT_DIR/$DESCRIPTION.log
mkdir --parents $(dirname $LOGFILE)

echo "Running MATLAB..."
echo "Output directory is '$OUTPUT_DIR'"
echo "Logging to '$LOGFILE'"
echo "GIT commit hash: $(git rev-parse HEAD)" >> $LOGFILE
echo "Running MATLAB command: '$MATLAB_CMD($MATLAB_CMD_ARGS)'"
nohup matlab -nodesktop -nosplash -r "addpath(genpath('$MATLAB_DIR')); $MATLAB_CMD($MATLAB_CMD_ARGS)" 1>>$LOGFILE 2>&1 &

echo "Restoring DISPLAY environment variable."
DISPLAY=$OLD_DISPLAY
export DISPLAY

echo "Running in background..."
