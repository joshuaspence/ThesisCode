############################################################
## This file is generated automatically by AutoESL.
## Please DO NOT edit it.
## Copyright (C) 2012 Xilinx Inc. All rights reserved.
############################################################
open_project NO_BLOCKING
set_top distance_squared
add_file ../../source/top_n_outlier_pruning_block.cpp -cflags "-D__AUTOESL__ -DSORTED_INSERT -DNO_BLOCKING -DUSE_DYNAMIC_ARRAY_SIZE=0 -USE_INLINE=0 -I../../include"
add_file -tb ../../source/test.cpp -cflags " -I../../../../include -D__AUTOESL__ -DSORTED_INSERT -DNO_BLOCKING -DUSE_DYNAMIC_ARRAY_SIZE=0 -USE_INLINE=0 "
add_file -tb ../../source/vardump.c -cflags " -I../../../../include -D__AUTOESL__ -DSORTED_INSERT -DNO_BLOCKING -DUSE_DYNAMIC_ARRAY_SIZE=0 -USE_INLINE=0 "
add_file -tb ../../source/wrapper.c -cflags " -I../../../../include -D__AUTOESL__ -DSORTED_INSERT -DNO_BLOCKING -DUSE_DYNAMIC_ARRAY_SIZE=0 -USE_INLINE=0 "
add_file -tb ../../data
open_solution "solution1"
set_part  {xc7z020clg484-1}
create_clock -period 10

source "./NO_BLOCKING/solution1/directives.tcl"
elaborate
autosyn
