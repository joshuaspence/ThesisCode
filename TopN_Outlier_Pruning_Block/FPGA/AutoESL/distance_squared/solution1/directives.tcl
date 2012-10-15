############################################################
## This file is generated automatically by AutoESL.
## Please DO NOT edit it.
## Copyright (C) 2012 Xilinx Inc. All rights reserved.
############################################################
set_directive_unroll "distance_squared/sum_loop"
set_directive_loop_tripcount -min 6 -max 6 -avg 6 "distance_squared/sum_loop"
set_directive_pipeline "distance_squared/dimension_loop"
set_directive_loop_tripcount -min 200 -max 200 -avg 200 "distance_squared/dimension_loop"
set_directive_top "distance_squared"
