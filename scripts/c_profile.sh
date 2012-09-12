#!/bin/bash

#===============================================================================
# This script can be used to profile C execution. This script should be run with 
# "nohup" so that the profiling will continue even when the TTY session is 
# ended.
#===============================================================================

#===============================================================================
# Configuration
#===============================================================================
ALGORITHM_DIR=../TopN_Outlier_Pruning_Block
BIN_EXT=bin
ROOT_OUTPUT_DIR=Profiling
DATA_DIR=../TopN_Outlier_Pruning_Block/data
DATA_EXT=dat
ITERATIONS=1
#===============================================================================

SCRIPT_DIR=$(dirname $0)
ALGORITHM_DIR=$(readlink -f $SCRIPT_DIR/$ALGORITHM_DIR)
BIN_DIR=$(readlink -f $ALGORITHM_DIR/bin)
DATASET_DIR=$(readlink -f $SCRIPT_DIR/$DATA_DIR)

ALL_PROFILES="
    TopN_Outlier_Pruning_Block_NO_BLOCKING
    TopN_Outlier_Pruning_Block_SORTED
    TopN_Outlier_Pruning_Block_UNSORTED
"
ALL_DATASETS="
    testoutrank
    ball1
    testCD
    runningex1k
    testCDST2
    testCDST3
    testCDST
    runningex10k
    runningex20k
    segmentation
    runningex30k
    pendigits
    runningex40k
    spam_train
    runningex50k
    spam
    letter-recognition
    mesh_network
    magicgamma
    musk
    connect4
"

echo -n "Provide a description (defaults to date): "
read DESCRIPTION
if [[ -z "$DESCRIPTION" ]]; then
    DESCRIPTION=$(date '+%Y-%m-%d')
fi

# Output directory
OUTPUT_DIR=$ROOT_OUTPUT_DIR/$DESCRIPTION
mkdir --parents $OUTPUT_DIR

# Start profiling
for DATASET_NAME in $ALL_DATASETS; do
    DATASET_FILE=$DATASET_DIR/$DATASET_NAME.$DATA_EXT
    
    if [ ! -f "$DATASET_FILE" ]; then
        echo "Data set file not found: $DATASET_FILE" >&2
        exit 1
    fi
    
    for ITERATION in $(seq 1 $ITERATIONS); do
        for PROFILE_NAME in $ALL_PROFILES; do
            PROFILE_OUTPUT_DIR=$OUTPUT_DIR/$DATASET_NAME/$ITERATION/$PROFILE_NAME
            mkdir --parents $PROFILE_OUTPUT_DIR
            
            PROFILE_EXE=$BIN_DIR/$PROFILE_NAME.$BIN_EXT
            PROFILE_LOG=$PROFILE_OUTPUT_DIR/output.log
            
            if [ ! -f $PROFILE_EXE ]; then
                echo "Profile not found: $PROFILE_EXE" >&2
                exit 2
            elif [ ! -x $PROFILE_EXE ]; then
                echo "Profile not executable: $PROFILE_EXE" >&2
                exit 3
            fi
            
            # Output summary information
            echo ""
            echo "Date: $(date '+%d-%b-%Y %H:%M:%S')"
            echo "Data set: $DATASET_NAME"
            echo "Iteration: $ITERATION"
            echo "Profile: $PROFILE_NAME"
            echo "Output directory: $PROFILE_OUTPUT_DIR"
            
            # Execute the command
            $PROFILE_EXE $DATASET_FILE >> $PROFILE_LOG
            if [ $? -ne 0 ]; then
                echo "Executable returned non-zero value!" >&2
                exit 4
            fi
            
            # gprof files
            if [ ! -f gmon.out ]; then
                echo "Cannot find gmon.out!" >&2
                echo "Make sure that the '-pg' flags were used for compilation" >&2
                exit 5
            else
                GPROF_OUTPUT_DIR=$PROFILE_OUTPUT_DIR/gprof
                mkdir --parents $GPROF_OUTPUT_DIR
                
                cp gmon.out $GPROF_OUTPUT_DIR/
                gprof $PROFILE_EXE > $GPROF_OUTPUT_DIR/gprof.txt
                gprof --brief $PROFILE_EXE > $GPROF_OUTPUT_DIR/gprof_brief.txt
                rm gmon.out
            fi
            
            # gcov files
            GCDA_FILES=$(find $ALGORITHM_DIR -maxdepth 1 -type f -name "*.gcda" -exec basename {} .gcda \;)
            GCNO_FILES=$(find $ALGORITHM_DIR -maxdepth 1 -type f -name "*.gcno" -exec basename {} .gcno \;)
            if [ -z "$GCNO_FILES" ]; then
                echo "Cannot find any *.gcno files!" >&2
                echo "Make sure that the '-fprofile-arcs' and '-ftest-coverage' flags were used for compilation" >&2
                exit 6
            fi
            if [ -z "$GCDA_FILES" ]; then
                echo "Cannot find any *.gcda files!" >&2
                echo "Make sure that the '-fprofile-arcs' and '-ftest-coverage' flags were used for compilation" >&2
                exit 7
            else
                for GCDA in $GCDA_FILES; do
                    GCOV_OUTPUT_DIR=$PROFILE_OUTPUT_DIR/gcov/$GCDA
                    mkdir --parents $GCOV_OUTPUT_DIR
                    
                    gcov --object-directory $ALGORITHM_DIR $GCDA >$PROFILE_OUTPUT_DIR/gcov/$GCDA.log 2>&1
                    mv *.gcov $GCOV_OUTPUT_DIR/
                    rm $ALGORITHM_DIR/$GCDA.gcda
                done
            fi
        done
    done
done

echo ""
echo "Done"
