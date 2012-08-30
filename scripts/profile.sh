#!/bin/bash

#===============================================================================
# This script can be used to profile C execution.
#===============================================================================

#===============================================================================
# Configuration
#===============================================================================
DATA_DIR=../TopN_Outlier_Pruning_Block/data
DATA_EXT=dat
GPROF_OUT=gmon.out
MAKEFILE=../TopN_Outlier_Pruning_Block/Makefile
ROOT_OUTPUT_DIR=../../Profiling
#===============================================================================

SCRIPT_DIR=$(dirname $0)
DATA_DIR=$SCRIPT_DIR/$DATA_DIR
MAKEFILE=$SCRIPT_DIR/$MAKEFILE
ROOT_OUTPUT_DIR=$SCRIPT_DIR/$ROOT_OUTPUT_DIR

echo -n "Provide a description (defaults to date): "
read DESCRIPTION
if [[ -z "$DESCRIPTION" ]]; then
    DESCRIPTION=$(date '+%Y-%m-%d')
fi

# Make sure data directory exists
if [[ ! -d "$DATA_DIR" ]]; then
    echo "Data directory not found: '$DATA_DIR'"
    exit 1
fi

# Make sure Makefile exists
if [[ ! -f "$MAKEFILE" ]]; then
    echo "Makefile not found: '$MAKEFILE'"
    exit 1
fi

# All targets
BIN_DIR=$(dirname $MAKEFILE)/$(sed -n -e 's/\s*binary_OUTPUT_DIR\s*[:]\?=\s*\(.*\)$/\1/p' $MAKEFILE)
BIN_EXT=$(sed -n -e 's/\s*binary_EXT\s*[:]\?=\s*\(.*\)$/\1/p' $MAKEFILE)
ALL_TARGETS=$(find $BIN_DIR -name "*.$BIN_EXT")

# Make sure there are some targets
if [[ -z $ALL_TARGETS ]]; then
    echo "No targets found at '$BIN_DIR'" >&2
    exit 1
fi

# Make sure binary directory exists
if [[ ! -d "$BIN_DIR" ]]; then
    echo "Binary directory not found: '$BIN_DIR'" >&2
    exit 1
fi

# All data sets
ALL_DATASETS=$(du $DATA_DIR/*.$DATA_EXT | sort -n | awk '{print $2}')

# Output directory
OUTPUT_DIR=$ROOT_OUTPUT_DIR/$DESCRIPTION
LOGFILE=$ROOT_OUTPUT_DIR/$DESCRIPTION.log
mkdir --parents $(dirname $LOGFILE)

echo "Running profiling script..."
echo "Output directory is '$OUTPUT_DIR'"
echo "Logging to '$LOGFILE'"
echo "GIT commit hash: $(git rev-parse HEAD)" >> $LOGFILE
echo "" >> $LOGFILE

for DATASET in $ALL_DATASETS; do
    DATASET_NAME=$(basename $DATASET | sed -n -e 's/^\(.\+\)\..\+$/\1/p')
    DATASET_OUTPUT_DIR=$OUTPUT_DIR/$DATASET_NAME
    
    if [[ ! -d $DATASET_OUTPUT_DIR ]]; then
        echo "Creating directory: '$DATASET_OUTPUT_DIR'" >> $LOGFILE
        mkdir --parents $DATASET_OUTPUT_DIR
    fi
    
    for TARGET in $ALL_TARGETS; do
        TARGET_NAME=$(basename $TARGET | sed -n -e 's/^\(.\+\)\..\+$/\1/p')
        TARGET_OUTPUT_DIR=$DATASET_OUTPUT_DIR/$TARGET_NAME
        if [[ ! -d $TARGET_OUTPUT_DIR ]]; then
            echo "Creating directory: '$TARGET_OUTPUT_DIR'" >> $LOGFILE
            mkdir --parents $TARGET_OUTPUT_DIR
        fi
        
        echo "" >> $LOGFILE
        echo "Target: '$TARGET_NAME'" >> $LOGFILE
        echo "Dataset: '$DATASET_NAME'" >> $LOGFILE
        
        THIS_LOGFILE=$TARGET_OUTPUT_DIR/execution.log
        echo "Logging to '$THIS_LOGFILE'" >> $LOGFILE
        
        echo "Running '$TARGET $DATASET'" >> $LOGFILE
        $TARGET $DATASET 1>$THIS_LOGFILE 2>&1
        
        if [[ ! -f $GPROF_OUT ]]; then
            echo "$GPROF_OUT not found!" >> $LOGFILE
        else
            GPROF_LOG=$TARGET_OUTPUT_DIR/execution.gprof
            echo "Logging gprof output to '$GPROF_LOG'" >> $LOGFILE
            gprof $TARGET 1>$GPROF_LOG 2>>$LOGFILE
            
            echo "Moving '$GPROF_OUT' to '$TARGET_OUTPUT_DIR/'" >> $LOGFILE
            mv $GPROF_OUT $TARGET_OUTPUT_DIR/ 1>/dev/null 2>>$LOGFILE
        fi
    done
done

echo "Done"h
