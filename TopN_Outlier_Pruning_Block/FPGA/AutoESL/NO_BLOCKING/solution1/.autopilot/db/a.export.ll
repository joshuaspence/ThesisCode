; ModuleID = '/home/joshua/Documents/University/Thesis/Code/TopN_Outlier_Pruning_Block/AutoESL/NO_BLOCKING/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%"struct.ap_int<64>" = type { %"struct.ap_int_base<64,true>" }
%"struct.ap_int_base<1,false>" = type { %"struct.conv_cint<1,false,true>" }
%"struct.ap_int_base<64,true>" = type { %"struct.conv_cint<64,true,true>" }
%"struct.ap_int_base<8,false>" = type { %"struct.conv_cint<8,false,true>" }
%"struct.ap_mm2s_double<64>" = type { %"struct.ap_int<64>", %"struct.ap_uint<8>", %"struct.ap_uint<1>" }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1,false>" }
%"struct.ap_uint<8>" = type { %"struct.ap_int_base<8,false>" }
%"struct.conv_cint<1,false,true>" = type { %"struct.ssdm_int<1,false>" }
%"struct.conv_cint<64,true,true>" = type { %"struct.ssdm_int<64,true>" }
%"struct.conv_cint<8,false,true>" = type { %"struct.ssdm_int<8,false>" }
%"struct.ssdm_int<1,false>" = type { i1 }
%"struct.ssdm_int<64,true>" = type { i64 }
%"struct.ssdm_int<8,false>" = type { i8 }
%"struct.std::ios_base::Init" = type <{ i8 }>

@num_vectors_value = global i64 0                 ; <i64*> [#uses=0]
@p_str7 = private constant [11 x i8] c"ap_ctrl_hs\00", align 1 ; <[11 x i8]*> [#uses=1]
@p_str8 = private constant [1 x i8] zeroinitializer, align 1 ; <[1 x i8]*> [#uses=28]
@p_str9 = private constant [13 x i8] c"aesl_label_0\00", align 1 ; <[13 x i8]*> [#uses=2]
@p_str10 = private constant [8 x i8] c"ap_none\00", align 1 ; <[8 x i8]*> [#uses=1]
@p_str11 = private constant [13 x i8] c"aesl_label_1\00", align 1 ; <[13 x i8]*> [#uses=2]
@p_str12 = private constant [10 x i8] c"AXI_SLAVE\00", align 1 ; <[10 x i8]*> [#uses=2]
@p_str13 = private constant [66 x i8] c"{ap_start START} {ap_done DONE} {ap_idle IDLE} {ap_return RETURN}\00", align 8 ; <[66 x i8]*> [#uses=1]
@p_str14 = private constant [24 x i8] c"-bus_bundle CONTROL_BUS\00", align 1 ; <[24 x i8]*> [#uses=2]
@p_str15 = private constant [13 x i8] c"aesl_label_2\00", align 1 ; <[13 x i8]*> [#uses=2]
@p_str16 = private constant [13 x i8] c"aesl_label_4\00", align 1 ; <[13 x i8]*> [#uses=2]
@p_str17 = private constant [13 x i8] c"aesl_label_3\00", align 1 ; <[13 x i8]*> [#uses=2]
@p_str18 = private constant [8 x i8] c"ap_fifo\00", align 1 ; <[8 x i8]*> [#uses=2]
@p_str19 = private constant [5 x i8] c"AXIS\00", align 1 ; <[5 x i8]*> [#uses=4]
@p_str20 = private constant [27 x i8] c"-bus_bundle INPUT_STREAM_A\00", align 1 ; <[27 x i8]*> [#uses=1]
@p_str21 = private constant [139 x i8] c"{vector1_keep_V TKEEP} {vector1_data_V TDATA} {vector1_strb_V TSTRB} {vector1_user_V TUSER} {vector1_last_V TLAST} {vector1_tdest_V TDEST}\00", align 8 ; <[139 x i8]*> [#uses=1]
@p_str22 = private constant [13 x i8] c"aesl_label_6\00", align 1 ; <[13 x i8]*> [#uses=2]
@p_str23 = private constant [13 x i8] c"aesl_label_5\00", align 1 ; <[13 x i8]*> [#uses=2]
@p_str24 = private constant [27 x i8] c"-bus_bundle INPUT_STREAM_B\00", align 1 ; <[27 x i8]*> [#uses=1]
@p_str25 = private constant [139 x i8] c"{vector2_keep_V TKEEP} {vector2_data_V TDATA} {vector2_strb_V TSTRB} {vector2_user_V TUSER} {vector2_last_V TLAST} {vector2_tdest_V TDEST}\00", align 8 ; <[139 x i8]*> [#uses=1]
@p_str26 = private constant [15 x i8] c"dimension_loop\00", align 1 ; <[15 x i8]*> [#uses=3]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535] ; <[1 x i32]*> [#uses=0]
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_num_vectors_value] ; <[1 x void ()*]*> [#uses=0]
@llvm_global_dtors_0 = appending global [1 x i32] [i32 65535] ; <[1 x i32]*> [#uses=0]
@llvm_global_dtors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__D_num_vectors_value] ; <[1 x void ()*]*> [#uses=0]

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define weak void @_ssdm_op_SpecWire(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecFifo(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @_GLOBAL__I_num_vectors_value() nounwind

declare void @_GLOBAL__D_num_vectors_value() nounwind

define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecIFCore(...) {
entry:
  ret void
}

define void @distance_squared(i64* %vector1_data_V, i8* %vector1_keep_V, i1* %vector1_last_V, i64* %vector2_data_V, i8* %vector2_keep_V, i1* %vector2_last_V, double* %sum) nounwind {
entry:
  %sum_of_squares_split = alloca [8 x double], align 8 ; <[8 x double]*> [#uses=9]
  call void (...)* @_ssdm_op_SpecWire(i32 0, [11 x i8]* @p_str7, [1 x i8]* @p_str8) nounwind
  %tmp = call i32 (...)* @_ssdm_op_SpecRegionBegin([13 x i8]* @p_str9) nounwind ; <i32> [#uses=1]
  call void (...)* @_ssdm_op_SpecWire(double* %sum, [8 x i8]* @p_str10, [1 x i8]* @p_str8) nounwind
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([13 x i8]* @p_str9, i32 %tmp) nounwind ; <i32> [#uses=0]
  %tmp_4 = call i32 (...)* @_ssdm_op_SpecRegionBegin([13 x i8]* @p_str11) nounwind ; <i32> [#uses=1]
  call void (...)* @_ssdm_op_SpecIFCore(i32 0, [1 x i8]* @p_str8, [10 x i8]* @p_str12, [1 x i8]* @p_str8, [1 x i8]* @p_str8, [66 x i8]* @p_str13, [24 x i8]* @p_str14) nounwind
  %empty_3 = call i32 (...)* @_ssdm_op_SpecRegionEnd([13 x i8]* @p_str11, i32 %tmp_4) nounwind ; <i32> [#uses=0]
  %tmp_5 = call i32 (...)* @_ssdm_op_SpecRegionBegin([13 x i8]* @p_str15) nounwind ; <i32> [#uses=1]
  call void (...)* @_ssdm_op_SpecIFCore(double* %sum, [1 x i8]* @p_str8, [10 x i8]* @p_str12, [1 x i8]* @p_str8, [1 x i8]* @p_str8, [1 x i8]* @p_str8, [24 x i8]* @p_str14) nounwind
  %empty_4 = call i32 (...)* @_ssdm_op_SpecRegionEnd([13 x i8]* @p_str15, i32 %tmp_5) nounwind ; <i32> [#uses=0]
  %tmp_6 = call i32 (...)* @_ssdm_op_SpecRegionBegin([13 x i8]* @p_str16) nounwind ; <i32> [#uses=1]
  %tmp_7 = call i32 (...)* @_ssdm_op_SpecRegionBegin([13 x i8]* @p_str17) nounwind ; <i32> [#uses=1]
  call void (...)* @_ssdm_op_SpecFifo(i64* %vector1_data_V, i8* %vector1_keep_V, i1* %vector1_last_V, [8 x i8]* @p_str18, [1 x i8]* @p_str8)
  %empty_5 = call i32 (...)* @_ssdm_op_SpecRegionEnd([13 x i8]* @p_str17, i32 %tmp_7) nounwind ; <i32> [#uses=0]
  call void (...)* @_ssdm_op_SpecIFCore(i64* %vector1_data_V, i8* %vector1_keep_V, i1* %vector1_last_V, [1 x i8]* @p_str8, [5 x i8]* @p_str19, [1 x i8]* @p_str8, [1 x i8]* @p_str8, [1 x i8]* @p_str8, [27 x i8]* @p_str20) nounwind
  call void (...)* @_ssdm_op_SpecIFCore(i64* %vector1_data_V, i8* %vector1_keep_V, i1* %vector1_last_V, [1 x i8]* @p_str8, [5 x i8]* @p_str19, [1 x i8]* @p_str8, [1 x i8]* @p_str8, [139 x i8]* @p_str21, [1 x i8]* @p_str8) nounwind
  %empty_6 = call i32 (...)* @_ssdm_op_SpecRegionEnd([13 x i8]* @p_str16, i32 %tmp_6) nounwind ; <i32> [#uses=0]
  %tmp_8 = call i32 (...)* @_ssdm_op_SpecRegionBegin([13 x i8]* @p_str22) nounwind ; <i32> [#uses=1]
  %tmp_9 = call i32 (...)* @_ssdm_op_SpecRegionBegin([13 x i8]* @p_str23) nounwind ; <i32> [#uses=1]
  call void (...)* @_ssdm_op_SpecFifo(i64* %vector2_data_V, i8* %vector2_keep_V, i1* %vector2_last_V, [8 x i8]* @p_str18, [1 x i8]* @p_str8)
  %empty_7 = call i32 (...)* @_ssdm_op_SpecRegionEnd([13 x i8]* @p_str23, i32 %tmp_9) nounwind ; <i32> [#uses=0]
  call void (...)* @_ssdm_op_SpecIFCore(i64* %vector2_data_V, i8* %vector2_keep_V, i1* %vector2_last_V, [1 x i8]* @p_str8, [5 x i8]* @p_str19, [1 x i8]* @p_str8, [1 x i8]* @p_str8, [1 x i8]* @p_str8, [27 x i8]* @p_str24) nounwind
  call void (...)* @_ssdm_op_SpecIFCore(i64* %vector2_data_V, i8* %vector2_keep_V, i1* %vector2_last_V, [1 x i8]* @p_str8, [5 x i8]* @p_str19, [1 x i8]* @p_str8, [1 x i8]* @p_str8, [139 x i8]* @p_str25, [1 x i8]* @p_str8) nounwind
  %empty_8 = call i32 (...)* @_ssdm_op_SpecRegionEnd([13 x i8]* @p_str22, i32 %tmp_8) nounwind ; <i32> [#uses=0]
  %sum_of_squares_split_addr = getelementptr inbounds [8 x double]* %sum_of_squares_split, i64 0, i64 0 ; <double*> [#uses=2]
  store double 0.000000e+00, double* %sum_of_squares_split_addr, align 8
  %sum_of_squares_split_addr_1 = getelementptr inbounds [8 x double]* %sum_of_squares_split, i64 0, i64 1 ; <double*> [#uses=2]
  store double 0.000000e+00, double* %sum_of_squares_split_addr_1, align 8
  %sum_of_squares_split_addr_2 = getelementptr inbounds [8 x double]* %sum_of_squares_split, i64 0, i64 2 ; <double*> [#uses=2]
  store double 0.000000e+00, double* %sum_of_squares_split_addr_2, align 8
  %sum_of_squares_split_addr_3 = getelementptr inbounds [8 x double]* %sum_of_squares_split, i64 0, i64 3 ; <double*> [#uses=2]
  store double 0.000000e+00, double* %sum_of_squares_split_addr_3, align 8
  %sum_of_squares_split_addr_4 = getelementptr inbounds [8 x double]* %sum_of_squares_split, i64 0, i64 4 ; <double*> [#uses=2]
  store double 0.000000e+00, double* %sum_of_squares_split_addr_4, align 8
  %sum_of_squares_split_addr_5 = getelementptr inbounds [8 x double]* %sum_of_squares_split, i64 0, i64 5 ; <double*> [#uses=2]
  store double 0.000000e+00, double* %sum_of_squares_split_addr_5, align 8
  %sum_of_squares_split_addr_6 = getelementptr inbounds [8 x double]* %sum_of_squares_split, i64 0, i64 6 ; <double*> [#uses=2]
  store double 0.000000e+00, double* %sum_of_squares_split_addr_6, align 8
  %sum_of_squares_split_addr_7 = getelementptr inbounds [8 x double]* %sum_of_squares_split, i64 0, i64 7 ; <double*> [#uses=2]
  store double 0.000000e+00, double* %sum_of_squares_split_addr_7, align 8
  br label %bb1

bb:                                               ; preds = %bb1
  %dim_cast2 = trunc i8 %dim to i3                ; <i3> [#uses=1]
  call void (...)* @_ssdm_op_SpecLoopName([15 x i8]* @p_str26) nounwind
  %tmp_s = call i32 (...)* @_ssdm_op_SpecRegionBegin([15 x i8]* @p_str26) nounwind ; <i32> [#uses=1]
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, [1 x i8]* @p_str8) nounwind
  %vector1_data_V_read = call i64 @_ssdm_op_FifoRead.volatile.i64P(i64* %vector1_data_V) nounwind ; <i64> [#uses=1]
  %vector1_data = sitofp i64 %vector1_data_V_read to double ; <double> [#uses=1]
  %vector2_data_V_read = call i64 @_ssdm_op_FifoRead.volatile.i64P(i64* %vector2_data_V) nounwind ; <i64> [#uses=1]
  %vector2_data = sitofp i64 %vector2_data_V_read to double ; <double> [#uses=1]
  %diff = fsub double %vector1_data, %vector2_data ; <double> [#uses=2]
  %diff_squared = fmul double %diff, %diff        ; <double> [#uses=1]
  %tmp_2 = zext i3 %dim_cast2 to i64              ; <i64> [#uses=1]
  %sum_of_squares_split_addr_8 = getelementptr inbounds [8 x double]* %sum_of_squares_split, i64 0, i64 %tmp_2 ; <double*> [#uses=2]
  %sum_of_squares_split_load = load double* %sum_of_squares_split_addr_8, align 8 ; <double> [#uses=1]
  %tmp_3 = fadd double %sum_of_squares_split_load, %diff_squared ; <double> [#uses=1]
  store double %tmp_3, double* %sum_of_squares_split_addr_8, align 8
  %empty_9 = call i32 (...)* @_ssdm_op_SpecRegionEnd([15 x i8]* @p_str26, i32 %tmp_s) nounwind ; <i32> [#uses=0]
  br label %bb1

bb1:                                              ; preds = %bb, %entry
  %dim = phi i8 [ %dim_1, %bb ], [ 0, %entry ]    ; <i8> [#uses=3]
  %exitcond1 = icmp eq i8 %dim, -56               ; <i1> [#uses=1]
  %dim_1 = add i8 %dim, 1                         ; <i8> [#uses=1]
  br i1 %exitcond1, label %bb4.0, label %bb

bb4.0:                                            ; preds = %bb1
  %sum_of_squares_split_load_1 = load double* %sum_of_squares_split_addr, align 8 ; <double> [#uses=2]
  %sum_of_squares_1_0_to_fcmp = fcmp oeq double %sum_of_squares_split_load_1, -0.000000e+00 ; <i1> [#uses=1]
  %sum_of_squares = select i1 %sum_of_squares_1_0_to_fcmp, double 0.000000e+00, double %sum_of_squares_split_load_1 ; <double> [#uses=1]
  %sum_of_squares_split_load_2 = load double* %sum_of_squares_split_addr_1, align 8 ; <double> [#uses=1]
  %sum_of_squares_1 = fadd double %sum_of_squares_split_load_2, %sum_of_squares ; <double> [#uses=1]
  %sum_of_squares_split_load_3 = load double* %sum_of_squares_split_addr_2, align 8 ; <double> [#uses=1]
  %sum_of_squares_2 = fadd double %sum_of_squares_split_load_3, %sum_of_squares_1 ; <double> [#uses=1]
  %sum_of_squares_split_load_4 = load double* %sum_of_squares_split_addr_3, align 8 ; <double> [#uses=1]
  %sum_of_squares_3 = fadd double %sum_of_squares_split_load_4, %sum_of_squares_2 ; <double> [#uses=1]
  %sum_of_squares_split_load_5 = load double* %sum_of_squares_split_addr_4, align 8 ; <double> [#uses=1]
  %sum_of_squares_4 = fadd double %sum_of_squares_split_load_5, %sum_of_squares_3 ; <double> [#uses=1]
  %sum_of_squares_split_load_6 = load double* %sum_of_squares_split_addr_5, align 8 ; <double> [#uses=1]
  %sum_of_squares_5 = fadd double %sum_of_squares_split_load_6, %sum_of_squares_4 ; <double> [#uses=1]
  %sum_of_squares_split_load_7 = load double* %sum_of_squares_split_addr_6, align 8 ; <double> [#uses=1]
  %sum_of_squares_6 = fadd double %sum_of_squares_split_load_7, %sum_of_squares_5 ; <double> [#uses=1]
  %sum_of_squares_split_load_8 = load double* %sum_of_squares_split_addr_7, align 8 ; <double> [#uses=1]
  %sum_of_squares_7 = fadd double %sum_of_squares_split_load_8, %sum_of_squares_6 ; <double> [#uses=1]
  call void @_ssdm_op_WireWrite.doubleP(double* %sum, double %sum_of_squares_7) nounwind
  ret void
}

define weak i64 @_ssdm_op_FifoRead.volatile.i64P(i64*) {
entry:
  %empty = call i64 @_autotb_FifoRead_i64(i64* %0) ; <i64> [#uses=1]
  ret i64 %empty
}

define weak void @_ssdm_op_WireWrite.doubleP(double*, double) {
entry:
  store double %1, double* %0
  ret void
}

declare i64 @_autotb_FifoRead_i64(i64*)

!llvm.dbg.gv = !{!0}

!0 = metadata !{i32 458804, i32 0, metadata !1, metadata !"num_vectors_value", metadata !"num_vectors_value", metadata !"", metadata !2, i32 18, metadata !3, i1 false, i1 true, i64* @num_vectors_value} ; [ DW_TAG_variable ]
!1 = metadata !{i32 458769, i32 0, i32 4, metadata !"top_n_outlier_pruning_block.pragma.2.cpp", metadata !"/home/joshua/Documents/University/Thesis/Code/TopN_Outlier_Pruning_Block/AutoESL/NO_BLOCKING/solution1/.autopilot/db", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!2 = metadata !{i32 458769, i32 0, i32 4, metadata !"top_n_outlier_pruning_block.cpp", metadata !"/home/joshua/Documents/University/Thesis/Code/TopN_Outlier_Pruning_Block/AutoESL/../source", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 458774, metadata !1, metadata !"size_t", metadata !4, i32 217, i64 0, i64 0, i64 0, i32 0, metadata !5} ; [ DW_TAG_typedef ]
!4 = metadata !{i32 458769, i32 0, i32 4, metadata !"autopilot_ssdm_op.h", metadata !"/opt/Xilinx/2012.1/AutoESL/common/technology/autopilot/etc", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!5 = metadata !{i32 458788, metadata !1, metadata !"long unsigned int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
