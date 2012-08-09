; ModuleID = 'C:/Users/Joshua/Desktop/AutoESL/distance_squared/distance_squared.prj/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-pc-mingw32"

define i32 @top_n_outlier_pruning_block(i8* nocapture %dummy) nounwind readnone {
entry:
  call void @llvm.dbg.value(metadata !{i8* %dummy}, i64 0, metadata !0)
  ret i32 0, !dbg !8
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!0 = metadata !{i32 459009, metadata !1, metadata !"dummy", metadata !3, i32 17, metadata !7} ; [ DW_TAG_arg_variable ]
!1 = metadata !{i32 458798, i32 0, metadata !2, metadata !"top_n_outlier_pruning_block", metadata !"top_n_outlier_pruning_block", metadata !"top_n_outlier_pruning_block", metadata !3, i32 17, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!2 = metadata !{i32 458769, i32 0, i32 1, metadata !"distance_squared.pragma.2.c", metadata !"C:\5CUsers\5CJoshua\5CDesktop\5CAutoESL\5Cdistance_squared/C:/Users/Joshua/Desktop/AutoESL/distance_squared/distance_squared.prj/solution1/.autopilot/db", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"distance_squared.c", metadata !"C:\5CUsers\5CJoshua\5CDesktop\5CAutoESL\5Cdistance_squared/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !7}
!6 = metadata !{i32 458788, metadata !2, metadata !"int", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!7 = metadata !{i32 458767, metadata !2, metadata !"", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!8 = metadata !{i32 18, i32 0, metadata !9, null}
!9 = metadata !{i32 458763, metadata !1, i32 17, i32 0} ; [ DW_TAG_lexical_block ]
