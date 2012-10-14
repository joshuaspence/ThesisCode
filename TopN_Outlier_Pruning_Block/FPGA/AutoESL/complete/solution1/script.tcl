############################################################
## This file is generated automatically by AutoESL.
## Please DO NOT edit it.
## Copyright (C) 2012 Xilinx Inc. All rights reserved.
############################################################
open_project complete
set_top top_n_outlier_pruning_block
add_file ../../source/distance.cpp -cflags "-I../../include -I../../include/autoesl -D__AUTOESL__ -DINSERT=SORTED -DBLOCKING=DISABLED -DUSE_DYNAMIC_ARRAY_SIZE=DISABLED"
add_file ../../source/top_n_outlier_pruning_block.cpp -cflags "-I../../include -I../../include/autoesl -D__AUTOESL__ -DINSERT=SORTED -DBLOCKING=DISABLED -DUSE_DYNAMIC_ARRAY_SIZE=DISABLED"
add_file -tb ../../source/test.cpp -cflags "-I../../include -I../../include/autoesl -D__AUTOESL__ -DINSERT=SORTED -DBLOCKING=DISABLED -DUSE_DYNAMIC_ARRAY_SIZE=DISABLED -DTEST_TYPE=EMBEDDED"
add_file -tb ../../source/vardump.cpp -cflags "-I../../include -I../../include/autoesl -D__AUTOESL__ -DINSERT=SORTED -DBLOCKING=DISABLED -DUSE_DYNAMIC_ARRAY_SIZE=DISABLED -DTEST_TYPE=EMBEDDED"
add_file -tb ../../source/wrapper.cpp -cflags "-I../../include -I../../include/autoesl -D__AUTOESL__ -DINSERT=SORTED -DBLOCKING=DISABLED -DUSE_DYNAMIC_ARRAY_SIZE=DISABLED -DTEST_TYPE=EMBEDDED"
add_file -tb ../../data -cflags "-I../../include -I../../include/autoesl -D__AUTOESL__ -DINSERT=SORTED -DBLOCKING=DISABLED -DUSE_DYNAMIC_ARRAY_SIZE=DISABLED -DTEST_TYPE=EMBEDDED"
open_solution "solution1"
set_part  {xc7z020clg484-1}
create_clock -period 10

source "./complete/solution1/directives.tcl"
elaborate
autosyn
