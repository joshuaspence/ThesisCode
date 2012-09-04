#!/bin/bash

NO_BLOCKING_BLOCKSIZE=0
DATA_FILE=block_size2.csv

DATASETS=$(cat $DATA_FILE | awk --field-separator ',' "{ if (NR!=1) { print \$1 } }" | uniq)
BLOCKSIZES=$(cat $DATA_FILE | awk --field-separator ',' "{ if (NR!=1) { print \$2 } }" | sed -e "/^$NO_BLOCKING_BLOCKSIZE\$/d" | sort --numeric-sort | uniq)

# Line colours: -1=black 1=red 2=grn 3=blue 4=purple 5=aqua 6=brn 7=orange 8=light-brn
# Line type:    1=solid 2=dashed
COLOUR=1

gnuplot -persist <<- EOF
#set terminal png size 800,600
#set output "omar_vs_everyone-EVONLY.png"

set term wxt
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

plot \
    $(for DATASET in $DATASETS; do \
        NO_BLOCKING_VALUE=$(cat $DATA_FILE | awk --field-separator ','  "{ if (NR!=1 && \$1==\"$DATASET\" && \$2==$NO_BLOCKING_BLOCKSIZE) { print \$7 } }"); \
        echo "'$DATA_FILE' using (\$2 != 0 ? \$2 : 1/0):(stringcolumn(1) eq '$DATASET' ? \$7 : 1/0) title '$DATASET'               with linespoints lt 1 lc $COLOUR, \\"; \
        echo "$NO_BLOCKING_VALUE                                                                    title '$DATASET (no blocking)' with line        lt 0 lc $COLOUR, \\"; \
        COLOUR=$(expr $COLOUR + 1); \
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

plot \
    $(for DATASET in $DATASETS; do \
        NO_BLOCKING_VALUE=$(cat $DATA_FILE | awk --field-separator ','  "{ if (NR!=1 && \$1==\"$DATASET\" && \$2==$NO_BLOCKING_BLOCKSIZE) { print \$11 } }"); \
        echo "'$DATA_FILE' using (\$2 != 0 ? \$2 : 1/0):(stringcolumn(1) eq '$DATASET' ? \$11 : 1/0) title '$DATASET'               with linespoints lt 1 lc $COLOUR, \\"; \
        echo "$NO_BLOCKING_VALUE                                                                     title '$DATASET (no blocking)' with line        lt 0 lc $COLOUR, \\"; \
        COLOUR=$(expr $COLOUR + 1); \
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

plot \
    $(for DATASET in $DATASETS; do \
        NO_BLOCKING_VALUE=$(cat $DATA_FILE | awk --field-separator ','  "{ if (NR!=1 && \$1==\"$DATASET\" && \$2==$NO_BLOCKING_BLOCKSIZE) { print \$13 } }"); \
        echo "'$DATA_FILE' using (\$2 != 0 ? \$2 : 1/0):(stringcolumn(1) eq '$DATASET' ? \$13 : 1/0) title '$DATASET'               with linespoints lt 1 lc $COLOUR, \\"; \
        echo "$NO_BLOCKING_VALUE                                                                     title '$DATASET (no blocking)' with line        lt 0 lc $COLOUR, \\"; \
        COLOUR=$(expr $COLOUR + 1); \
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

plot \
    $(for DATASET in $DATASETS; do \
        NO_BLOCKING_VALUE=$(cat $DATA_FILE | awk --field-separator ','  "{ if (NR!=1 && \$1==\"$DATASET\" && \$2==$NO_BLOCKING_BLOCKSIZE) { print \$15 } }"); \
        echo "'$DATA_FILE' using (\$2 != 0 ? \$2 : 1/0):(stringcolumn(1) eq '$DATASET' ? \$15 : 1/0) title '$DATASET'               with linespoints lt 1 lc $COLOUR, \\"; \
        echo "$NO_BLOCKING_VALUE                                                                     title '$DATASET (no blocking)' with line        lt 0 lc $COLOUR, \\"; \
        COLOUR=$(expr $COLOUR + 1); \
    done)
    1/0
EOF
EOF
