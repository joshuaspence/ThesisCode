#!/bin/bash

#===============================================================================
# Configuration
#===============================================================================
NO_BLOCKING_BLOCKSIZE=0
DATA_FILE=block_size.csv

COL_DATASET=1
COL_BLOCKSIZE=2
COL_DIMENSIONS=4
COL_VECTORS=5
COL_TOTALTIME=6
COL_TOTALTIME_NORM=7
COL_FUNCTIME=10
COL_FUNCTIME_NORM=11
COL_DISTCALLS=12
COL_DISTCALLS_NORM=13
COL_PRUNED=14
COL_PRUNED_NORM=15
#-------------------------------------------------------------------------------

DATASET_NAMES=( $(cat $DATA_FILE | awk --field-separator ',' "{ if (NR!=1) { print \$$COL_DATASET } }" | sed -e 's/"\(.\+\)"/\1/' | uniq) )
DATASET_COLOURS=( $(for i in $(seq 0 ${#DATASET_NAMES[*]}); do echo "$(expr 1 + $i)"; done) )
ALL_DATASETS=( $(seq 0 $(expr ${#DATASET_NAMES[*]} - 1) ) )
BLOCKSIZES=$(cat $DATA_FILE | awk --field-separator ',' "{ if (NR!=1) { print \$$COL_BLOCKSIZE } }" | sed -e "/^$NO_BLOCKING_BLOCKSIZE\$/d" | sort --numeric-sort | uniq)

gnuplot -persist <<- EOF
set term png

set datafile separator ","

################################################################################
# TOTAL EXECUTION TIME
################################################################################
set title "Total execution time"
set log x
set xtics
set xlabel "Block size"
set ytics
set ylabel "Total execution time (normalised)"
set autoscale
set key right center
unset key

set output "total_execution_time.png"
plot \
    $(for i in ${ALL_DATASETS[*]}; do \
        DATASET=${DATASET_NAMES[$i]}; \
        COLOUR=${DATASET_COLOURS[$i]}; \
        NO_BLOCKING_VALUE=$(cat $DATA_FILE | awk --field-separator ','  "{ gsub(/\"/,\"\",\$$COL_DATASET); if (NR!=1 && \$$COL_DATASET==\"$DATASET\" && \$$COL_BLOCKSIZE==$NO_BLOCKING_BLOCKSIZE) { print \$$COL_TOTALTIME_NORM } }"); \
        \
        echo "'$DATA_FILE' using (\$$COL_BLOCKSIZE != 0 ? \$$COL_BLOCKSIZE : 1/0):(stringcolumn($COL_DATASET) eq '$DATASET' ? \$$COL_TOTALTIME_NORM : 1/0) title '$DATASET' with linespoints lt 1 lc $COLOUR, \\"; \
        echo "$NO_BLOCKING_VALUE title '$DATASET (no blocking)' with line lt 0 lc $COLOUR, \\"; \
    done)
    1/0

################################################################################
# FUNCTION EXECUTION TIME
################################################################################
set title "Function execution time"
set log x
set xtics
set xlabel "Block size"
set ytics
set ylabel "Function execution time (normalised)"
set autoscale
set key right center
unset key

set output "function_execution_time.png"
plot \
    $(for i in ${ALL_DATASETS[*]}; do \
        DATASET=${DATASET_NAMES[$i]}; \
        COLOUR=${DATASET_COLOURS[$i]}; \
        NO_BLOCKING_VALUE=$(cat $DATA_FILE | awk --field-separator ','  "{ gsub(/\"/,\"\",\$$COL_DATASET); if (NR!=1 && \$$COL_DATASET==\"$DATASET\" && \$$COL_BLOCKSIZE==$NO_BLOCKING_BLOCKSIZE) { print \$$COL_FUNCTIME_NORM } }"); \
        \
        echo "'$DATA_FILE' using (\$$COL_BLOCKSIZE != 0 ? \$$COL_BLOCKSIZE : 1/0):(stringcolumn($COL_DATASET) eq '$DATASET' ? \$$COL_FUNCTIME_NORM : 1/0) title '$DATASET' with linespoints lt 1 lc $COLOUR, \\"; \
        echo "$NO_BLOCKING_VALUE title '$DATASET (no blocking)' with line lt 0 lc $COLOUR, \\"; \
    done)
    1/0

################################################################################
# DISTANCE CALLS
################################################################################
set title "Distance calls"
set log x
set xtics
set xlabel "Block size"
set ytics
set ylabel "Calls to the distance function (normalised)"
set autoscale
set key right center
unset key

set output "distance_calls.png"
plot \
    $(for i in ${ALL_DATASETS[*]}; do \
        DATASET=${DATASET_NAMES[$i]}; \
        COLOUR=${DATASET_COLOURS[$i]}; \
        NO_BLOCKING_VALUE=$(cat $DATA_FILE | awk --field-separator ','  "{ gsub(/\"/,\"\",\$$COL_DATASET); if (NR!=1 && \$$COL_DATASET==\"$DATASET\" && \$$COL_BLOCKSIZE==$NO_BLOCKING_BLOCKSIZE) { print \$$COL_DISTCALLS_NORM } }"); \
        \
        echo "'$DATA_FILE' using (\$$COL_BLOCKSIZE != 0 ? \$$COL_BLOCKSIZE : 1/0):(stringcolumn($COL_DATASET) eq '$DATASET' ? \$$COL_DISTCALLS_NORM : 1/0) title '$DATASET' with linespoints lt 1 lc $COLOUR, \\"; \
        echo "$NO_BLOCKING_VALUE title '$DATASET (no blocking)' with line lt 0 lc $COLOUR, \\"; \
    done)
    1/0

################################################################################
# NUMBER OF VECTORS PRUNED
################################################################################
set title "Number of vectors pruned"
set log x
set xtics
set xlabel "Block size"
set ytics
set ylabel "Number of vectors pruned (normalised)"
set autoscale
set key right center
unset key

set output "vectors_pruned.png"
plot \
    $(for i in ${ALL_DATASETS[*]}; do \
        DATASET=${DATASET_NAMES[$i]}; \
        COLOUR=${DATASET_COLOURS[$i]}; \
        NO_BLOCKING_VALUE=$(cat $DATA_FILE | awk --field-separator ','  "{ gsub(/\"/,\"\",\$$COL_DATASET); if (NR!=1 && \$$COL_DATASET==\"$DATASET\" && \$$COL_BLOCKSIZE==$NO_BLOCKING_BLOCKSIZE) { print \$$COL_PRUNED_NORM } }"); \
        \
        echo "'$DATA_FILE' using (\$$COL_BLOCKSIZE != 0 ? \$$COL_BLOCKSIZE : 1/0):(stringcolumn($COL_DATASET) eq '$DATASET' ? \$$COL_PRUNED_NORM : 1/0) title '$DATASET' with linespoints lt 1 lc $COLOUR, \\"; \
        echo "$NO_BLOCKING_VALUE title '$DATASET (no blocking)' with line lt 0 lc $COLOUR, \\"; \
    done)
    1/0
EOF
