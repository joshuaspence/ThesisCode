#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "No CSV file specified" >&2
    exit 1
elif [[ ! -f $1 ]]; then
    echo "File not found: '$1'" >&2
    exit 1
fi

#===============================================================================
# Configuration
#===============================================================================
NO_BLOCKING_BLOCKSIZE=0
DATA_FILE=$1

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

BLOCKSIZE_NAMES=( $(cat $DATA_FILE | awk --field-separator ',' "{ if (NR!=1) { print \$$COL_BLOCKSIZE } }" | sed -e "/^$NO_BLOCKING_BLOCKSIZE\$/d" | sort --numeric-sort | uniq) )
BLOCKSIZE_COLOURS=( $(for i in $(seq 0 ${#BLOCKSIZE_NAMES[*]}); do echo "$(expr 1 + $i)"; done) )
ALL_BLOCKSIZES=( $(seq 0 $(expr ${#BLOCKSIZE_NAMES[*]} - 1) ) )

gnuplot -persist <<- EOF
reset
set terminal tikz size 8.89cm,6.65cm color
set datafile separator ","

# Define axis
# Remove border on top and right and set color to gray
set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11

# Style definitions
set style line 1 lc rgb '#8b1a0e' pt 1 ps 1 lt 1 lw 2 # --- red
set style line 2 lc rgb '#5e9c36' pt 6 ps 1 lt 1 lw 2 # --- green

################################################################################
# TOTAL EXECUTION TIME
################################################################################
set log x
set xlabel "Block size"
set format x "\$10^{%L}\$"
set ylabel "Total execution time (normalised)"
set autoscale
unset key

set output "total_execution_time.tex"
plot \
    $(for i in ${ALL_DATASETS[*]}; do \
        DATASET=${DATASET_NAMES[$i]}; \
        COLOUR=${DATASET_COLOURS[$i]}; \
        NO_BLOCKING_VALUE=$(cat $DATA_FILE | awk --field-separator ','  "{ gsub(/\"/,\"\",\$$COL_DATASET); if (NR!=1 && \$$COL_DATASET==\"$DATASET\" && \$$COL_BLOCKSIZE==$NO_BLOCKING_BLOCKSIZE) { print \$$COL_TOTALTIME_NORM } }"); \
        \
        echo "'$DATA_FILE' using (\$$COL_BLOCKSIZE != 0 ? \$$COL_BLOCKSIZE : 1/0):(stringcolumn($COL_DATASET) eq '$DATASET' ? \$$COL_TOTALTIME_NORM : 1/0) smooth unique title '$DATASET' with linespoints lt 1 lc $COLOUR, \\"; \
        echo "$NO_BLOCKING_VALUE title '$DATASET (no blocking)' with line lt 0 lc $COLOUR, \\"; \
    done)
    1/0

################################################################################
# FUNCTION EXECUTION TIME
################################################################################
set log x
set xlabel "Block size"
set format x "\$10^{%L}\$"
set ylabel "Function execution time (normalised)"
set autoscale
unset key

set output "function_execution_time.tex"
plot \
    $(for i in ${ALL_DATASETS[*]}; do \
        DATASET=${DATASET_NAMES[$i]}; \
        COLOUR=${DATASET_COLOURS[$i]}; \
        NO_BLOCKING_VALUE=$(cat $DATA_FILE | awk --field-separator ','  "{ gsub(/\"/,\"\",\$$COL_DATASET); if (NR!=1 && \$$COL_DATASET==\"$DATASET\" && \$$COL_BLOCKSIZE==$NO_BLOCKING_BLOCKSIZE) { print \$$COL_FUNCTIME_NORM } }"); \
        \
        echo "'$DATA_FILE' using (\$$COL_BLOCKSIZE != 0 ? \$$COL_BLOCKSIZE : 1/0):(stringcolumn($COL_DATASET) eq '$DATASET' ? \$$COL_FUNCTIME_NORM : 1/0) smooth unique title '$DATASET' with linespoints lt 1 lc $COLOUR, \\"; \
        echo "$NO_BLOCKING_VALUE title '$DATASET (no blocking)' with line lt 0 lc $COLOUR, \\"; \
    done)
    1/0

################################################################################
# DISTANCE CALLS
################################################################################
set log x
set xlabel "Block size"
set format x "\$10^{%L}\$"
set ylabel "Calls to the distance function (normalised)"
set autoscale
set key right center
#unset key

set output "distance_calls.tex"
plot \
    $(for i in ${ALL_DATASETS[*]}; do \
        DATASET=${DATASET_NAMES[$i]}; \
        COLOUR=${DATASET_COLOURS[$i]}; \
        NO_BLOCKING_VALUE=$(cat $DATA_FILE | awk --field-separator ','  "{ gsub(/\"/,\"\",\$$COL_DATASET); if (NR!=1 && \$$COL_DATASET==\"$DATASET\" && \$$COL_BLOCKSIZE==$NO_BLOCKING_BLOCKSIZE) { print \$$COL_DISTCALLS_NORM } }"); \
        \
        echo "'$DATA_FILE' using (\$$COL_BLOCKSIZE != 0 ? \$$COL_BLOCKSIZE : 1/0):(stringcolumn($COL_DATASET) eq '$DATASET' ? \$$COL_DISTCALLS_NORM : 1/0) smooth unique title '$DATASET' with linespoints lt 1 lc $COLOUR, \\"; \
        echo "$NO_BLOCKING_VALUE title '$DATASET (no blocking)' with line lt 0 lc $COLOUR, \\"; \
    done)
    1/0

################################################################################
# NUMBER OF VECTORS PRUNED
################################################################################
set log x
set xlabel "Block size"
set format x "\$10^{%L}\$"
set ylabel "Number of vectors pruned (normalised)"
set autoscale
unset key

set output "vectors_pruned.tex"
plot \
    $(for i in ${ALL_DATASETS[*]}; do \
        DATASET=${DATASET_NAMES[$i]}; \
        COLOUR=${DATASET_COLOURS[$i]}; \
        NO_BLOCKING_VALUE=$(cat $DATA_FILE | awk --field-separator ','  "{ gsub(/\"/,\"\",\$$COL_DATASET); if (NR!=1 && \$$COL_DATASET==\"$DATASET\" && \$$COL_BLOCKSIZE==$NO_BLOCKING_BLOCKSIZE) { print \$$COL_PRUNED_NORM } }"); \
        \
        echo "'$DATA_FILE' using (\$$COL_BLOCKSIZE != 0 ? \$$COL_BLOCKSIZE : 1/0):(stringcolumn($COL_DATASET) eq '$DATASET' ? \$$COL_PRUNED_NORM : 1/0) smooth unique title '$DATASET' with linespoints lt 1 lc $COLOUR, \\"; \
        echo "$NO_BLOCKING_VALUE title '$DATASET (no blocking)' with line lt 0 lc $COLOUR, \\"; \
    done)
    1/0

################################################################################
# TOTAL RUN TIME COMPLEXITY
################################################################################
set log x
set xlabel "Problem size"
set format x "\$10^{%L}\$"
set ylabel "Execution time"
set autoscale
unset key

set output "total_run_time_complexity.tex"
plot \
    $(for i in ${ALL_BLOCKSIZES[*]}; do \
        BLOCKSIZE_VALUE=${BLOCKSIZE_NAMES[$i]}; \
        BLOCKSIZE_NAME="block_size=$BLOCKSIZE_VALUE"; \
        COLOUR=${BLOCKSIZE_COLOURS[$i]}; \
        \
        echo "'$DATA_FILE' using $COL_VECTORS:(\$$COL_BLOCKSIZE == $BLOCKSIZE_VALUE ? \$$COL_TOTALTIME : 1/0) smooth unique title '$BLOCKSIZE_NAME' with linespoints lt 1 lc $COLOUR, \\"; \
    done)
    1/0

################################################################################
# FUNCTION RUN TIME COMPLEXITY
################################################################################
set log x
set xlabel "Problem size"
set format x "\$10^{%L}\$"
set ylabel "Execution time"
set autoscale
unset key

set output "function_run_time_complexity.tex"
plot \
    $(for i in ${ALL_BLOCKSIZES[*]}; do \
        BLOCKSIZE_VALUE=${BLOCKSIZE_NAMES[$i]}; \
        BLOCKSIZE_NAME="block_size=$BLOCKSIZE_VALUE"; \
        COLOUR=${BLOCKSIZE_COLOURS[$i]}; \
        \
        echo "'$DATA_FILE' using $COL_VECTORS:(\$$COL_BLOCKSIZE == $BLOCKSIZE_VALUE ? \$$COL_FUNCTIME : 1/0) smooth unique title '$BLOCKSIZE_NAME' with linespoints lt 1 lc $COLOUR, \\"; \
    done)
    1/0
EOF
