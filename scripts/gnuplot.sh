#!/bin/bash

NO_BLOCKING_BLOCKSIZE=0
DATA_FILE=block_size.csv

DATASET_NAMES=( $(cat $DATA_FILE | awk --field-separator ',' "{ if (NR!=1) { print \$1 } }" | sed -e 's/"\(.\+\)"/\1/' | uniq) )
DATASET_COLOURS=( $(for i in $(seq 0 ${#DATASET_NAMES[*]}); do echo "$(expr 1 + $i)"; done) )
ALL_DATASETS=( $(seq 0 $(expr ${#DATASET_NAMES[*]} - 1) ) )

BLOCKSIZES=$(cat $DATA_FILE | awk --field-separator ',' "{ if (NR!=1) { print \$2 } }" | sed -e "/^$NO_BLOCKING_BLOCKSIZE\$/d" | sort --numeric-sort | uniq)

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
        NO_BLOCKING_VALUE=$(cat $DATA_FILE | awk --field-separator ','  "{ gsub(/\"/,\"\",\$1); if (NR!=1 && \$1==\"$DATASET\" && \$2==$NO_BLOCKING_BLOCKSIZE) { print \$7 } }"); \
        \
        echo "'$DATA_FILE' using (\$2 != 0 ? \$2 : 1/0):(stringcolumn(1) eq '$DATASET' ? \$7 : 1/0) title '$DATASET'               with linespoints lt 1 lc $COLOUR, \\"; \
        echo "$NO_BLOCKING_VALUE                                                                    title '$DATASET (no blocking)' with line        lt 0 lc $COLOUR, \\"; \
    done)
    1/0
EOF
