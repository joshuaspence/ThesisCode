############################################################
## This file is generated automatically by AutoESL.
## Please DO NOT edit it.
## Copyright (C) 2012 Xilinx Inc. All rights reserved.
############################################################
set_directive_top "top_n_outlier_pruning_block"
set_directive_inline "init"
set_directive_inline "init_block"
set_directive_unroll "distance_squared/sum_loop"
set_directive_loop_tripcount -min 200 -max 200 -avg 200 "distance_squared/dimension_loop"
set_directive_loop_tripcount -max 67557 "init/vector_loop"
set_directive_loop_tripcount -min 200 -max 200 -avg 200 "init/dims_loop"
set_directive_loop_tripcount -min 1 -max 15 "add_neighbour/add_neighbour_loop2"
set_directive_loop_tripcount -min 1 -max 15 "add_neighbour/add_neighbour_loop1"
set_directive_loop_tripcount -min 1 -max 40 "sort_block_scores_descending/block_loop1"
set_directive_loop_tripcount -max 40 "update_best_outliers/merge_loop"
set_directive_loop_tripcount -min 1 -max 40 "sort_block_scores_descending/block_loop2"
set_directive_pipeline "distance_squared"
set_directive_pipeline "init/vector_loop"
set_directive_loop_tripcount -min 6 -max 6 -avg 6 "distance_squared/sum_loop"
