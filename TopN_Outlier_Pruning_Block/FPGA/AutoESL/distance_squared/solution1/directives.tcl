############################################################
## This file is generated automatically by AutoESL.
## Please DO NOT edit it.
## Copyright (C) 2012 Xilinx Inc. All rights reserved.
############################################################
set_directive_interface -mode ap_none "distance_squared" sum
set_directive_resource -core AXI4LiteS -port_map {{ap_start START} {ap_done DONE} {ap_idle IDLE} {ap_return RETURN}} -metadata {-bus_bundle CONTROL_BUS} "distance_squared" return
set_directive_resource -core AXI4LiteS -metadata {-bus_bundle CONTROL_BUS} "distance_squared" sum
set_directive_interface -mode ap_fifo "distance_squared" vector1
set_directive_resource -core AXI4Stream -port_map {{vector1_keep_V TKEEP} {vector1_data_V TDATA} {vector1_strb_V TSTRB} {vector1_user_V TUSER} {vector1_last_V TLAST} {vector1_tdest_V TDEST}} -metadata {-bus_bundle INPUT_STREAM_A} "distance_squared" vector1
set_directive_interface -mode ap_fifo "distance_squared" vector2
set_directive_resource -core AXI4LiteS -port_map {{vector2_keep_V TKEEP} {vector2_data_V TDATA} {vector2_strb_V TSTRB} {vector2_user_V TUSER} {vector2_last_V TLAST} {vector2_tdest_V TDEST}} -metadata {-bus_bundle INPUT_STREAM_B} "distance_squared" vector2
set_directive_pipeline -II 1 "distance_squared/dimension_loop"
set_directive_expression_balance "distance_squared/dimension_loop"
set_directive_unroll "distance_squared/sum_loop"
