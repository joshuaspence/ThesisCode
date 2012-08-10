#!/bin/bash

#===============================================================================
# This script can be used to profile MATLAB execution. MATLAB will be run with 
# "nohup" so that the profiling will continue even when the TTY session is 
# ended.
#===============================================================================

SCRIPT_NAME=$(basename $0)
if [[ "$(readlink -f $(pwd))" != "$(readlink -f $(dirname $0))" ]]; then
    echo "This script must be run from the directory '$(readlink -f $(dirname $0))'." >&2
    exit 1
fi

# Unset the DISPLAY environment variable so that MATLAB does not attempt to 
# create any graphs
echo "Unsetting DISPLAY environment variable."
OLD_DISPLAY=$DISPLAY
unset DISPLAY

# Generate a unique log file name
LOGFILE_NAME=${SCRIPT_NAME%.*}
LOGFILE_EXT=log
COUNTER=
COUNTER_TEXT=
while [[ -f "$LOGFILE_NAME$COUNTER_TEXT.$LOGFILE_EXT" ]]; do
    if [[ -z "$COUNTER" ]]; then
        COUNTER=0
        COUNTER_TEXT=.0
    else
        COUNTER=$(expr $COUNTER + 1)
        COUNTER_TEXT=.$COUNTER
    fi
done
LOGFILE=$LOGFILE_NAME$COUNTER_TEXT.$LOGFILE_EXT

echo "Running MATLAB..."
echo "Logging to $LOGFILE"
nohup matlab -nodesktop -nosplash -r "addpath(genpath('.')); josh_profile_block_size" 1>$LOGFILE 2>&1 &

echo "Restoring DISPLAY environment variable."
DISPLAY=$OLD_DISPLAY
export DISPLAY

echo "Done"
exit 0
