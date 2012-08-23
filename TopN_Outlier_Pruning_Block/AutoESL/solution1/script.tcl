############################################################
## This file is generated automatically by AutoESL.
## Please DO NOT edit it.
## Copyright (C) 2012 Xilinx Inc. All rights reserved.
############################################################
open_project AutoESL
set_top top_n_outlier_pruning_block
add_file source/top_n_outlier_pruning_block.c -cflags "-D__AUTOESL__ -DSORTED_INSERT"
add_file -tb source/test.c -cflags "-D__AUTOESL__ -DSORTED_INSERT"
add_file -tb source/vardump.c -cflags "-D__AUTOESL__ -DSORTED_INSERT"
add_file -tb source/wrapper.c -cflags "-D__AUTOESL__ -DSORTED_INSERT"
open_solution "solution1"
set_part  {xc6vlx240tff1156-1}
create_clock -period 10

source "./AutoESL/solution1/directives.tcl"
elaborate
autosyn
