############################################################
## This file is generated automatically by AutoESL.
## Please DO NOT edit it.
## Copyright (C) 2012 Xilinx Inc. All rights reserved.
############################################################
open_project distance_squared
set_top distance_squared
add_file ../../source/distance.cpp -cflags "-D__AUTOESL__ -DINSERT=SORTED -DBLOCKING=ENABLED -DUSE_DYNAMIC_ARRAY_SIZE=0 -DTEST_TYPE=EMBEDDED"
add_file -tb ../../data -cflags "-D__AUTOESL__ -DINSERT=SORTED -DBLOCKING=ENABLED -DUSE_DYNAMIC_ARRAY_SIZE=0 -DTEST_TYPE=EMBEDDED"
add_file -tb ../../source/wrapper.cpp -cflags "-D__AUTOESL__ -DINSERT=SORTED -DBLOCKING=ENABLED -DUSE_DYNAMIC_ARRAY_SIZE=0 -DTEST_TYPE=EMBEDDED"
add_file -tb ../../source/vardump.cpp -cflags "-D__AUTOESL__ -DINSERT=SORTED -DBLOCKING=ENABLED -DUSE_DYNAMIC_ARRAY_SIZE=0 -DTEST_TYPE=EMBEDDED"
add_file -tb ../../source/top_n_outlier_pruning_block.cpp -cflags "-D__AUTOESL__ -DINSERT=SORTED -DBLOCKING=ENABLED -DUSE_DYNAMIC_ARRAY_SIZE=0 -DTEST_TYPE=EMBEDDED"
add_file -tb ../../source/test.cpp -cflags "-D__AUTOESL__ -DINSERT=SORTED -DBLOCKING=ENABLED -DUSE_DYNAMIC_ARRAY_SIZE=0 -DTEST_TYPE=EMBEDDED"
add_file -tb ../../source/parameters.cpp -cflags "-D__AUTOESL__ -DINSERT=SORTED -DBLOCKING=ENABLED -DUSE_DYNAMIC_ARRAY_SIZE=0 -DTEST_TYPE=EMBEDDED"
open_solution "solution1"
set_part  {xc7z020clg484-1}
create_clock -period 10

source "./distance_squared/solution1/directives.tcl"
elaborate
autosyn
