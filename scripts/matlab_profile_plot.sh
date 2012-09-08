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
DATA_FILE=$1
DATASET_AVG="average"
PI="4*a(1)"

COL_PROFILE=1
COL_DATASET=2
COL_FUNCTION=4
COL_CALLS=5
COL_CALLSREL=6
COL_TOTALTIME=7
COL_TOTALTIMEREL=8
COL_SELFTIME=9
COL_SELFTIMEREL=10

UNIQUE_FROM_CSV="$(dirname $0)/unique_from_csv.pl"
#-------------------------------------------------------------------------------

DATASET_NAMES=( $(cat $DATA_FILE | $UNIQUE_FROM_CSV $(expr $COL_DATASET - 1) | sed -e "/^$DATASET_AVG\$/d") )
DATASET_COLOURS=( $(for i in $(seq 0 ${#DATASET_NAMES[*]}); do echo "$(expr 1 + $i)"; done) )
ALL_DATASETS=( $(seq 0 $(expr ${#DATASET_NAMES[*]} - 1) ) )

FUNCTION_NAMES=( $(cat $DATA_FILE | $UNIQUE_FROM_CSV $(expr $COL_FUNCTION - 1) ) )
FUNCTION_COLOURS=( $(for i in $(seq 0 ${#FUNCTION_NAMES[*]}); do echo "$(expr 1 + $i)"; done) )
ALL_FUNCTIONS=( $(seq 0 $(expr ${#FUNCTION_NAMES[*]} - 1) ) )

gnuplot -persist <<-END_OF_GNUPLOT
reset
#set terminal tikz size 8.89cm,6.65cm color
set terminal wxt
set datafile separator ","

# Define axis
# Remove border on top and right and set color to gray
set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11

# Style definitions
set style line 1 lc rgb '#8b1a0e' pt 1 ps 1 lt 1 lw 2 # --- red
set style line 2 lc rgb '#5e9c36' pt 6 ps 1 lt 1 lw 2 # --- green

################################################################################
# 
################################################################################
set size square
set isosample 50,50
set parametric
set xrange [-1:1] # x,y,v range
set yrange [-1:1]
set vrange [0:1]
unset border
unset xtics
unset ytics
unset colorbox

set view map
set palette defined(\
    0 "red",\
    1 "green",\
    2 "blue",\
    3 "yellow",\
    4 "cyan",\
    5 "brown",\
    6 "greenyellow",\
    7 "gray",\
    8 "bisque",\
    9 "violet",\
    10 "black"\
    )
set cbrange [0:10] # the color palette
set multiplot # multiplot mode
#set output "test.png"
$(
    U_BEGIN="0";
    U_END="0";
    
    for i in ${ALL_FUNCTIONS[*]}; do
        FUNCTION=${FUNCTION_NAMES[$i]};
        COLOUR=${FUNCTION_COLOURS[$i]};
        PROPORTION=$(perl <<-END_OF_PERL
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
        if (\$columns[$(expr $COL_FUNCTION - 1)] =~ m/\Q$FUNCTION\E/) {
            print \$columns[$(expr $COL_TOTALTIMEREL - 1)];
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
        U_END=$(echo "$U_BEGIN + $PROPORTION" | bc | sed -e 's/^\./0./');
        ANGLE=$(echo "($U_BEGIN + $U_END) * $PI" | bc -l);
        
        X=0;
        Y=0;
        
        DATASET=${DATASET_NAMES[$i]};
        COLOUR=${DATASET_COLOURS[$i]};
        \
        echo "set urange [${U_BEGIN}*2*pi : ${U_END}*2*pi]";
        #echo "set label $(expr $i + 1) center \"$FUNCTION\" at $X,$Y rotate by $ANGLE*180/pi";
        echo "splot cos(u)*v,sin(u)*v,$i w pm3d notitle";
        
        U_BEGIN=$U_END
    done)
unset multiplot
END_OF_GNUPLOT
