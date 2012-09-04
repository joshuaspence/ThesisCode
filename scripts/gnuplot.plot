#set terminal png size 800,600
#set output "omar_vs_everyone-EVONLY.png"

set term wxt
set datafile separator ","

################################################################################
# FUNCTION TIME
################################################################################
set title "Total execution time"

set log x
set xtics
set xlabel "Block size"
set ytics
set ylabel "Total execution time (normalised)"
set autoscale

# Line colours: -1=black 1=red 2=grn 3=blue 4=purple 5=aqua 6=brn 7=orange 8=light-brn
# Line type:    1=solid 2=dashed
plot \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "testoutrank"        ? $7 : 1/0) title 'testoutrank'                      with linespoints lt 1 lc 1, \
     'block_size2.csv' using ($2 == 0 && stringcolumn(1) eq "testoutrank"                  ? $7 : 1/0) title 'testoutrank (no blocking)'        with line        lt 2 lc 1, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "ball1"              ? $7 : 1/0) title 'ball1'                            with linespoints lt 1 lc 2, \
     'block_size2.csv' using ($2 == 0 && stringcolumn(1) eq "ball1"                        ? $7 : 1/0) title 'ball1 (no blocking)'              with line        lt 2 lc 2, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "testCD"             ? $7 : 1/0) title 'testCD'                           with linespoints lt 1 lc 3, \
     'block_size2.csv' using ($2 == 0 && stringcolumn(1) eq "testCD"                       ? $7 : 1/0) title 'testCD (no blocking)'             with line        lt 2 lc 3, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "runningex1k"        ? $7 : 1/0) title 'runningex1k'                      with linespoints lt 1 lc 4, \
     'block_size2.csv' using ($2 == 0 && stringcolumn(1) eq "runningex1k"                  ? $7 : 1/0) title 'runningex1k (no blocking)'        with line        lt 2 lc 4, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "testCDST2"          ? $7 : 1/0) title 'testCDST2'                        with linespoints lt 1 lc 5, \
     'block_size2.csv' using ($2 == 0 && stringcolumn(1) eq "testCDST2"                    ? $7 : 1/0) title 'testCDST2 (no blocking)'          with line        lt 2 lc 5, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "testCDST3"          ? $7 : 1/0) title 'testCDST3'                        with linespoints lt 1 lc 6, \
     'block_size2.csv' using ($2 == 0 && stringcolumn(1) eq "testCDST3"                    ? $7 : 1/0) title 'testCDST3 (no blocking)'          with line        lt 2 lc 6, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "testCDST"           ? $7 : 1/0) title 'testCDST'                         with linespoints lt 1 lc 7, \
     'block_size2.csv' using ($2 == && stringcolumn(1) eq "testCDST"                       ? $7 : 1/0) title 'testCDST (no blocking)'           with line        lt 2 lc 7, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "runningex10k"       ? $7 : 1/0) title 'runningex10k'                     with linespoints lt 1 lc 8, \
     'block_size2.csv' using ($2 == 0 && stringcolumn(1) eq "runningex10k"                 ? $7 : 1/0) title 'runningex10k (no blocking)'       with line        lt 2 lc 8, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "runningex20k"       ? $7 : 1/0) title 'runningex20k'                     with linespoints lt 1 lc 9, \
     'block_size2.csv' using ($2 == 0 && stringcolumn(1) eq "runningex20k"                 ? $7 : 1/0) title 'runningex20k (no blocking)'       with line        lt 1 lc 9, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "segmentation"       ? $7 : 1/0) title 'segmentation'                     with linespoints lt 1 lc 10, \
     'block_size2.csv' using ($2 == 0 && stringcolumn(1) eq "segmentation"                 ? $7 : 1/0) title 'segmentation (no blocking)'       with line        lt 2 lc 10, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "runningex30k"       ? $7 : 1/0) title 'runningex30k'                     with linespoints lt 1 lc 11, \
     'block_size2.csv' using ($2 == 0 && stringcolumn(1) eq "runningex30k"                 ? $7 : 1/0) title 'runningex30k (no blocking)'       with line        lt 2 lc 11, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "pendigits"          ? $7 : 1/0) title 'pendigits'                        with linespoints lt 1 lc 12, \
     'block_size2.csv' using ($2 == 0 ? $2 && stringcolumn(1) eq "pendigits"               ? $7 : 1/0) title 'pendigits (no blocking)'          with line        lt 2 lc 12, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "runningex40k"       ? $7 : 1/0) title 'runningex40k'                     with linespoints lt 1 lc 13, \
     'block_size2.csv' using ($2 ==0 && stringcolumn(1) eq "runningex40k"                  ? $7 : 1/0) title 'runningex40k (no blocking)'       with linespoints lt 2 lc 13, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "spam_train"         ? $7 : 1/0) title 'spam_train'                       with linespoints lt 1 lc 14, \
     'block_size2.csv' using ($2 == 0 && stringcolumn(1) eq "spam_train"                   ? $7 : 1/0) title 'spam_train (no blocking)'         with line        lt 2 lc 14, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "runningex50k"       ? $7 : 1/0) title 'runningex50k'                     with linespoints lt 1 lc 15, \
     'block_size2.csv' using ($2 == 0 && stringcolumn(1) eq "runningex50k"                 ? $7 : 1/0) title 'runningex50k (no blocking)'       with line        lt 2 lc 15, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "spam"               ? $7 : 1/0) title 'spam'                             with linespoints lt 1 lc 16, \
     'block_size2.csv' using ($2 == 0 && stringcolumn(1) eq "spam"                         ? $7 : 1/0) title 'spam (no blocking)'               with line        lt 2 lc 16, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "letter-recognition" ? $7 : 1/0) title 'letter-recognition'               with linespoints lt 1 lc 17, \
     'block_size2.csv' using ($2 == 0 && stringcolumn(1) eq "letter-recognition"           ? $7 : 1/0) title 'letter-recognition (no blocking)' with line        lt 2 lc 17, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "mesh_network"       ? $7 : 1/0) title 'mesh_network'                     with linespoints lt 1 lc 18, \
     'block_size2.csv' using ($2 == 0 && stringcolumn(1) eq "mesh_network"                 ? $7 : 1/0) title 'mesh_network (no blocking)'       with line        lt 2 lc 18, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "magicgamma"         ? $7 : 1/0) title 'magicgamma'                       with linespoints lt 1 lc 19, \
     'block_size2.csv' using ($2 == 0 && stringcolumn(1) eq "magicgamma"                   ? $7 : 1/0) title 'magicgamma (no blocking)'         with line        lt 2 lc 19, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "musk"               ? $7 : 1/0) title 'musk'                             with linespoints lt 1 lc 20, \
     'block_size2.csv' using ($2 ==0 && stringcolumn(1) eq "musk"                          ? $7 : 1/0) title 'musk (no blocking)'               with line        lt 2 lc 20, \
     \
     'block_size2.csv' using ($2 != 0 ? $2 : 1/0):(stringcolumn(1) eq "connect4"           ? $7 : 1/0) title 'connect4'                         with linespoints lt 1 lc 21, \
     'block_size2.csv' using ($2 == 0 &&  stringcolumn(1) eq "connect4"                    ? $7 : 1/0) title 'connect4 (no blocking)'           with linespoints lt 2 lc 21
