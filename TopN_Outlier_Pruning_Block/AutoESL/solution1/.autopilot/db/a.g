#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/joshua/Documents/University/Thesis/Code/TopN_Outlier_Pruning_Block/AutoESL/solution1/.autopilot/db/a.g.bc ${1+"$@"}
