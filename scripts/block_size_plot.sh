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

UNIQUE_FROM_CSV="$(dirname $0)/unique_from_csv.pl"
#-------------------------------------------------------------------------------

DATASET_NAMES=( $(cat $DATA_FILE | $UNIQUE_FROM_CSV $(expr $COL_DATASET - 1)) )
DATASET_COLOURS=( $(for i in $(seq 0 ${#DATASET_NAMES[*]}); do echo "$(expr 1 + $i)"; done) )
ALL_DATASETS=( $(seq 0 $(expr ${#DATASET_NAMES[*]} - 1) ) )

BLOCKSIZE_NAMES=( $(cat $DATA_FILE | $UNIQUE_FROM_CSV $(expr $COL_BLOCKSIZE - 1) | sed -e "/^$NO_BLOCKING_BLOCKSIZE\$/d") )
BLOCKSIZE_COLOURS=( $(for i in $(seq 0 ${#BLOCKSIZE_NAMES[*]}); do echo "$(expr 1 + $i)"; done) )
ALL_BLOCKSIZES=( $(seq 0 $(expr ${#BLOCKSIZE_NAMES[*]} - 1) ) )

gnuplot -persist <<END_OF_GNUPLOT
reset
set terminal tikz solid color size 10cm, 20.88cm
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
set key below

set output "total_execution_time.tex"
plot \
    $(for i in ${ALL_DATASETS[*]}; do
        DATASET=${DATASET_NAMES[$i]};
        COLOUR=${DATASET_COLOURS[$i]};
        NO_BLOCKING_VALUE=$(perl <<END_OF_PERL
use strict;
use warnings;
use Text::CSV;

my \$csv = Text::CSV->new();
open(FILE, "< $DATA_FILE") || die "Can't open file: $DATA_FILE";
my \$in_header = 1;
while (<FILE>) {
    if (\$in_header) {
        \$in_header = 0;
        next;
    }
    
    if (\$csv->parse(\$_)) {
        my @columns = \$csv->fields();
        if (\$columns[$(expr $COL_DATASET - 1)] eq "$DATASET" && \$columns[$(expr $COL_BLOCKSIZE - 1)] eq $NO_BLOCKING_BLOCKSIZE) {
            print \$columns[$(expr $COL_TOTALTIME_NORM - 1)];
            exit;
        }
    } else {
        my \$err = \$csv->error_input;
        die("Failed to parse line: \$err");
    }
}
close FILE;
END_OF_PERL
);
        
        echo "'$DATA_FILE' using (\$$COL_BLOCKSIZE != 0 ? \$$COL_BLOCKSIZE : 1/0):(stringcolumn($COL_DATASET) eq '$DATASET' ? \$$COL_TOTALTIME_NORM : 1/0) smooth unique title '$(echo $DATASET | sed -e 's/_/\\_/g')' with linespoints lt 1 lc $COLOUR, \\";
        echo "$NO_BLOCKING_VALUE title '$(echo $DATASET | sed -e 's/_/\\_/g')*' with line lt 0 lc $COLOUR, \\";
    done)
    1/0 notitle

################################################################################
# FUNCTION EXECUTION TIME
################################################################################
set log x
set xlabel "Block size"
set format x "\$10^{%L}\$"
set ylabel "Function execution time (normalised)"
set autoscale
set key below

set output "function_execution_time.tex"
plot \
    $(for i in ${ALL_DATASETS[*]}; do
        DATASET=${DATASET_NAMES[$i]};
        COLOUR=${DATASET_COLOURS[$i]};
        NO_BLOCKING_VALUE=$(perl <<END_OF_PERL
use strict;
use warnings;
use Text::CSV;

my \$csv = Text::CSV->new();
open(FILE, "< $DATA_FILE") || die "Can't open file: $DATA_FILE";
my \$in_header = 1;
while (<FILE>) {
    if (\$in_header) {
        \$in_header = 0;
        next;
    }
    
    if (\$csv->parse(\$_)) {
        my @columns = \$csv->fields();
        if (\$columns[$(expr $COL_DATASET - 1)] eq "$DATASET" && \$columns[$(expr $COL_BLOCKSIZE - 1)] eq $NO_BLOCKING_BLOCKSIZE) {
            print \$columns[$(expr $COL_FUNCTIME_NORM - 1)];
            exit;
        }
    } else {
        my \$err = \$csv->error_input;
        die("Failed to parse line: \$err");
    }
}
close FILE;
END_OF_PERL
);
        
        echo "'$DATA_FILE' using (\$$COL_BLOCKSIZE != 0 ? \$$COL_BLOCKSIZE : 1/0):(stringcolumn($COL_DATASET) eq '$DATASET' ? \$$COL_FUNCTIME_NORM : 1/0) smooth unique title '$(echo $DATASET | sed -e 's/_/\\_/g')' with linespoints lt 1 lc $COLOUR, \\";
        echo "$NO_BLOCKING_VALUE title '$(echo $DATASET | sed -e 's/_/\\_/g')*' with line lt 0 lc $COLOUR, \\";
    done)
    1/0 notitle

################################################################################
# DISTANCE CALLS
################################################################################
set log x
set xlabel "Block size"
set format x "\$10^{%L}\$"
set ylabel "Calls to the distance function (normalised)"
set autoscale
set key below

set output "distance_calls.tex"
plot \
    $(for i in ${ALL_DATASETS[*]}; do
        DATASET=${DATASET_NAMES[$i]};
        COLOUR=${DATASET_COLOURS[$i]};
        NO_BLOCKING_VALUE=$(perl <<END_OF_PERL
use strict;
use warnings;
use Text::CSV;

my \$csv = Text::CSV->new();
open(FILE, "< $DATA_FILE") || die "Can't open file: $DATA_FILE";
my \$in_header = 1;
while (<FILE>) {
    if (\$in_header) {
        \$in_header = 0;
        next;
    }
    
    if (\$csv->parse(\$_)) {
        my @columns = \$csv->fields();
        if (\$columns[$(expr $COL_DATASET - 1)] eq "$DATASET" && \$columns[$(expr $COL_BLOCKSIZE - 1)] eq $NO_BLOCKING_BLOCKSIZE) {
            print \$columns[$(expr $COL_DISTCALLS_NORM - 1)];
            exit;
        }
    } else {
        my \$err = \$csv->error_input;
        die("Failed to parse line: \$err");
    }
}
close FILE;
END_OF_PERL
);
        
        echo "'$DATA_FILE' using (\$$COL_BLOCKSIZE != 0 ? \$$COL_BLOCKSIZE : 1/0):(stringcolumn($COL_DATASET) eq '$DATASET' ? \$$COL_DISTCALLS_NORM : 1/0) smooth unique title '$(echo $DATASET | sed -e 's/_/\\_/g')' with linespoints lt 1 lc $COLOUR, \\";
        echo "$NO_BLOCKING_VALUE title '$(echo $DATASET | sed -e 's/_/\\_/g')*' with line lt 0 lc $COLOUR, \\";
    done)
    1/0 notitle

################################################################################
# NUMBER OF VECTORS PRUNED
################################################################################
set log x
set xlabel "Block size"
set format x "\$10^{%L}\$"
set ylabel "Number of vectors pruned (normalised)"
set autoscale
set key below

set output "vectors_pruned.tex"
plot \
    $(for i in ${ALL_DATASETS[*]}; do
        DATASET=${DATASET_NAMES[$i]};
        COLOUR=${DATASET_COLOURS[$i]};
        NO_BLOCKING_VALUE=$(perl <<END_OF_PERL
use strict;
use warnings;
use Text::CSV;

my \$csv = Text::CSV->new();
open(FILE, "< $DATA_FILE") || die "Can't open file: $DATA_FILE";
my \$in_header = 1;
while (<FILE>) {
    if (\$in_header) {
        \$in_header = 0;
        next;
    }
    
    if (\$csv->parse(\$_)) {
        my @columns = \$csv->fields();
        if (\$columns[$(expr $COL_DATASET - 1)] eq "$DATASET" && \$columns[$(expr $COL_BLOCKSIZE - 1)] eq $NO_BLOCKING_BLOCKSIZE) {
            print \$columns[$(expr $COL_PRUNED_NORM - 1)];
            exit;
        }
    } else {
        my \$err = \$csv->error_input;
        die("Failed to parse line: \$err");
    }
}
close FILE;
END_OF_PERL
);
        
        echo "'$DATA_FILE' using (\$$COL_BLOCKSIZE != 0 ? \$$COL_BLOCKSIZE : 1/0):(stringcolumn($COL_DATASET) eq '$DATASET' ? \$$COL_PRUNED_NORM : 1/0) smooth unique title '$(echo $DATASET | sed -e 's/_/\\_/g')' with linespoints lt 1 lc $COLOUR, \\";
        echo "$NO_BLOCKING_VALUE title '$(echo $DATASET | sed -e 's/_/\\_/g')*' with line lt 0 lc $COLOUR, \\";
    done)
    1/0 notitle

################################################################################
# TOTAL RUN TIME COMPLEXITY
################################################################################
set log x
set xlabel "Problem size"
set format x "\$10^{%L}\$"
set ylabel "Execution time"
set autoscale
set key below

set output "total_run_time_complexity.tex"
plot \
    $(for i in ${ALL_BLOCKSIZES[*]}; do
        BLOCKSIZE_VALUE=${BLOCKSIZE_NAMES[$i]};
        BLOCKSIZE_NAME="block_size=$BLOCKSIZE_VALUE";
        COLOUR=${BLOCKSIZE_COLOURS[$i]};
        
        echo "'$DATA_FILE' using $COL_VECTORS:(\$$COL_BLOCKSIZE == $BLOCKSIZE_VALUE ? \$$COL_TOTALTIME : 1/0) smooth unique title '$(echo $BLOCKSIZE_NAME | sed -e 's/_/\\_/g')' with linespoints lt 1 lc $COLOUR, \\";
    done)
    1/0 notitle

################################################################################
# FUNCTION RUN TIME COMPLEXITY
################################################################################
set log x
set xlabel "Problem size"
set format x "\$10^{%L}\$"
set ylabel "Execution time"
set autoscale
set key below

set output "function_run_time_complexity.tex"
plot \
    $(for i in ${ALL_BLOCKSIZES[*]}; do
        BLOCKSIZE_VALUE=${BLOCKSIZE_NAMES[$i]};
        BLOCKSIZE_NAME="block_size=$BLOCKSIZE_VALUE";
        COLOUR=${BLOCKSIZE_COLOURS[$i]};
        
        echo "'$DATA_FILE' using $COL_VECTORS:(\$$COL_BLOCKSIZE == $BLOCKSIZE_VALUE ? \$$COL_FUNCTIME : 1/0) smooth unique title '$(echo $BLOCKSIZE_NAME | sed -e 's/_/\\_/g')' with linespoints lt 1 lc $COLOUR, \\";
    done)
    1/0 notitle
END_OF_GNUPLOT
