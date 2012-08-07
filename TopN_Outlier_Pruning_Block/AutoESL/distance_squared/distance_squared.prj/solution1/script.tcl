############################################################
## This file is generated automatically by AutoESL.
## Please DO NOT edit it.
## Copyright (C) 2012 Xilinx Inc. All rights reserved.
############################################################
open_project distance_squared.prj
set_top top_n_outlier_pruning_block
add_file distance_squared.c
add_file distance_squared.h
add_file -tb distance_test.c
open_solution "solution1"
set_part  {xc6vlx240tff1156-3}
create_clock -period 10

source "./distance_squared.prj/solution1/directives.tcl"
elaborate
autosyn
