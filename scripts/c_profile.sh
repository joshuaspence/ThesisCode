#!/bin/bash

#===============================================================================
# This script can be used to profile C execution. This script should be run with 
# "nohup" so that the profiling will continue even when the TTY session is 
# ended.
#===============================================================================

#===============================================================================
# Configuration
#===============================================================================
BIN_DIR=../TopN_Outlier_Pruning_Block/bin
BIN_EXT=bin
ROOT_OUTPUT_DIR=Profiling
DATA_DIR=../TopN_Outlier_Pruning_Block/data
DATA_EXT=dat
ITERATIONS=1
#===============================================================================

SCRIPT_DIR=$(dirname $0)
BIN_DIR=$SCRIPT_DIR/$BIN_DIR
DATASET_DIR=$SCRIPT_DIR/$DATA_DIR

ALL_PROFILES="
    TopN_Outlier_Pruning_Block_NO_BLOCKING
    TopN_Outlier_Pruning_Block_SORTED
    TopN_Outlier_Pruning_Block_UNSORTED
"
ALL_DATASETS=$(find $DATA_DIR -type f -name "*.$DATA_EXT")

echo -n "Provide a description (defaults to date): "
read DESCRIPTION
if [[ -z "$DESCRIPTION" ]]; then
    DESCRIPTION=$(date '+%Y-%m-%d')
fi

# Output directory
OUTPUT_DIR=$ROOT_OUTPUT_DIR/$DESCRIPTION
MAIN_LOGFILE=$ROOT_OUTPUT_DIR/$DESCRIPTION.log
mkdir --parents $(dirname $MAIN_LOGFILE)

for DATASET in $ALL_DATASETS; do
    DATASET_NAME=$(basename $DATASET .$DATA_EXT)
    
    for ITERATION in $(seq 1 $ITERATIONS); do
        for PROFILE_NAME in $ALL_PROFILES; do
            PROFILE_OUTPUT_DIR=$OUTPUT_DIR/$DATASET_NAME/$ITERATION/$PROFILE_NAME
            mkdir --parents $PROFILE_OUTPUT_DIR
            
            PROFILE_EXE=$BIN_DIR/$PROFILE_NAME.$BIN_EXT
            PROFILE_LOG=$PROFILE_OUTPUT_DIR/output.log
            
            echo "Date: $(date '+%d-%b-%Y %H:%M:%S')" | tee -a $MAIN_LOGFILE
            echo "Data set: $(basename $DATASET)" | tee -a $MAIN_LOGFILE
            echo "Iteration: $ITERATION" | tee -a $MAIN_LOGFILE
            echo "Profile: $PROFILE_NAME" | tee -a $MAIN_LOGFILE
            echo "Output directory: $PROFILE_OUTPUT_DIR" | tee -a $MAIN_LOGFILE
            echo "" | tee -a $MAIN_LOGFILE
            
            $PROFILE_EXE $DATASET >> $PROFILE_LOG
            if [ $? -ne 0 ]; then
                echo "Executable returned non-zero value" | tee -a $MAIN_LOGFILE
                exit 1
            fi
            
            if [ ! -f gmon.out ]; then
                echo "Cannot find gmon.out" | tee -a $MAIN_LOGFILE
                exit 2
            else
                cp gmon.out $PROFILE_OUTPUT_DIR/
                gprof $PROFILE_EXE > $PROFILE_OUTPUT_DIR/gprof.txt
                rm gmon.out
            fi
            
        done
    done
done

echo "Done"
