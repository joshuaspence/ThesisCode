############################################################
## This file is generated automatically by AutoESL.
## Please DO NOT edit it.
## Copyright (C) 2012 Xilinx Inc. All rights reserved.
############################################################
open_project basic
set_top basic
add_file basic.cpp
add_file -tb basic_test.cpp
add_file -tb result.golden.dat
open_solution "solution1"
set_part  {xc6slx4csg225-2}
create_clock -period 2
config_interface -expose_global

source "./basic/solution1/directives.tcl"
elaborate
autosyn
