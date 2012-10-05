############################################################
## This file is generated automatically by AutoESL.
## Please DO NOT edit it.
## Copyright (C) 2012 Xilinx Inc. All rights reserved.
############################################################
open_project NO_BLOCKING
set_top distance_squared
add_file ../source/top_n_outlier_pruning_block.cpp -cflags "-D__AUTOESL__ -DSORTED_INSERT -DNO_BLOCKING -DUSE_DYNAMIC_ARRAY_SIZE=0 -USE_INLINE=0 -I../include"
open_solution "solution1"
set_part  {xc6vlx240tff1156-1}
create_clock -period 10

source "./NO_BLOCKING/solution1/directives.tcl"
elaborate
autosyn
