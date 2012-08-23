; ModuleID = '/home/joshua/Documents/University/Thesis/Code/TopN_Outlier_Pruning_Block/AutoESL/solution1/.autopilot/db/a.g.1.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@null_index = internal constant i64 0             ; <i64*> [#uses=0]
@start_index = internal constant i64 1            ; <i64*> [#uses=0]
@stderr = external global %struct._IO_FILE*       ; <%struct._IO_FILE**> [#uses=1]
@.str = private constant [12 x i8] c"member_name\00", align 1 ; <[12 x i8]*> [#uses=1]
@.str1 = private constant [14 x i8] c"stderr._flags\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str2 = private constant [20 x i8] c"stderr._IO_read_ptr\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str3 = private constant [20 x i8] c"stderr._IO_read_end\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str4 = private constant [21 x i8] c"stderr._IO_read_base\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str5 = private constant [22 x i8] c"stderr._IO_write_base\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str6 = private constant [21 x i8] c"stderr._IO_write_ptr\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str7 = private constant [21 x i8] c"stderr._IO_write_end\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str8 = private constant [20 x i8] c"stderr._IO_buf_base\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str9 = private constant [19 x i8] c"stderr._IO_buf_end\00", align 1 ; <[19 x i8]*> [#uses=1]
@.str10 = private constant [21 x i8] c"stderr._IO_save_base\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str11 = private constant [23 x i8] c"stderr._IO_backup_base\00", align 1 ; <[23 x i8]*> [#uses=1]
@.str12 = private constant [20 x i8] c"stderr._IO_save_end\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str13 = private constant [22 x i8] c"stderr._markers._next\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str14 = private constant [22 x i8] c"stderr._markers._sbuf\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str15 = private constant [21 x i8] c"stderr._markers._pos\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str16 = private constant [14 x i8] c"stderr._chain\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str17 = private constant [15 x i8] c"stderr._fileno\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str18 = private constant [15 x i8] c"stderr._flags2\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str19 = private constant [19 x i8] c"stderr._old_offset\00", align 1 ; <[19 x i8]*> [#uses=1]
@.str20 = private constant [19 x i8] c"stderr._cur_column\00", align 1 ; <[19 x i8]*> [#uses=1]
@.str21 = private constant [22 x i8] c"stderr._vtable_offset\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str22 = private constant [17 x i8] c"stderr._shortbuf\00", align 1 ; <[17 x i8]*> [#uses=1]
@.str23 = private constant [13 x i8] c"stderr._lock\00", align 1 ; <[13 x i8]*> [#uses=1]
@.str24 = private constant [15 x i8] c"stderr._offset\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str25 = private constant [14 x i8] c"stderr.__pad1\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str26 = private constant [14 x i8] c"stderr.__pad2\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str27 = private constant [14 x i8] c"stderr.__pad3\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str28 = private constant [14 x i8] c"stderr.__pad4\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str29 = private constant [14 x i8] c"stderr.__pad5\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str30 = private constant [13 x i8] c"stderr._mode\00", align 1 ; <[13 x i8]*> [#uses=1]
@.str31 = private constant [16 x i8] c"stderr._unused2\00", align 1 ; <[16 x i8]*> [#uses=1]
@stdout = external global %struct._IO_FILE*       ; <%struct._IO_FILE**> [#uses=1]
@.str32 = private constant [14 x i8] c"stdout._flags\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str33 = private constant [20 x i8] c"stdout._IO_read_ptr\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str34 = private constant [20 x i8] c"stdout._IO_read_end\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str35 = private constant [21 x i8] c"stdout._IO_read_base\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str36 = private constant [22 x i8] c"stdout._IO_write_base\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str37 = private constant [21 x i8] c"stdout._IO_write_ptr\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str38 = private constant [21 x i8] c"stdout._IO_write_end\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str39 = private constant [20 x i8] c"stdout._IO_buf_base\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str40 = private constant [19 x i8] c"stdout._IO_buf_end\00", align 1 ; <[19 x i8]*> [#uses=1]
@.str41 = private constant [21 x i8] c"stdout._IO_save_base\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str42 = private constant [23 x i8] c"stdout._IO_backup_base\00", align 1 ; <[23 x i8]*> [#uses=1]
@.str43 = private constant [20 x i8] c"stdout._IO_save_end\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str44 = private constant [22 x i8] c"stdout._markers._next\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str45 = private constant [22 x i8] c"stdout._markers._sbuf\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str46 = private constant [21 x i8] c"stdout._markers._pos\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str47 = private constant [14 x i8] c"stdout._chain\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str48 = private constant [15 x i8] c"stdout._fileno\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str49 = private constant [15 x i8] c"stdout._flags2\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str50 = private constant [19 x i8] c"stdout._old_offset\00", align 1 ; <[19 x i8]*> [#uses=1]
@.str51 = private constant [19 x i8] c"stdout._cur_column\00", align 1 ; <[19 x i8]*> [#uses=1]
@.str52 = private constant [22 x i8] c"stdout._vtable_offset\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str53 = private constant [17 x i8] c"stdout._shortbuf\00", align 1 ; <[17 x i8]*> [#uses=1]
@.str54 = private constant [13 x i8] c"stdout._lock\00", align 1 ; <[13 x i8]*> [#uses=1]
@.str55 = private constant [15 x i8] c"stdout._offset\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str56 = private constant [14 x i8] c"stdout.__pad1\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str57 = private constant [14 x i8] c"stdout.__pad2\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str58 = private constant [14 x i8] c"stdout.__pad3\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str59 = private constant [14 x i8] c"stdout.__pad4\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str60 = private constant [14 x i8] c"stdout.__pad5\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str61 = private constant [13 x i8] c"stdout._mode\00", align 1 ; <[13 x i8]*> [#uses=1]
@.str62 = private constant [16 x i8] c"stdout._unused2\00", align 1 ; <[16 x i8]*> [#uses=1]
@stdin = external global %struct._IO_FILE*        ; <%struct._IO_FILE**> [#uses=1]
@.str63 = private constant [13 x i8] c"stdin._flags\00", align 1 ; <[13 x i8]*> [#uses=1]
@.str64 = private constant [19 x i8] c"stdin._IO_read_ptr\00", align 1 ; <[19 x i8]*> [#uses=1]
@.str65 = private constant [19 x i8] c"stdin._IO_read_end\00", align 1 ; <[19 x i8]*> [#uses=1]
@.str66 = private constant [20 x i8] c"stdin._IO_read_base\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str67 = private constant [21 x i8] c"stdin._IO_write_base\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str68 = private constant [20 x i8] c"stdin._IO_write_ptr\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str69 = private constant [20 x i8] c"stdin._IO_write_end\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str70 = private constant [19 x i8] c"stdin._IO_buf_base\00", align 1 ; <[19 x i8]*> [#uses=1]
@.str71 = private constant [18 x i8] c"stdin._IO_buf_end\00", align 1 ; <[18 x i8]*> [#uses=1]
@.str72 = private constant [20 x i8] c"stdin._IO_save_base\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str73 = private constant [22 x i8] c"stdin._IO_backup_base\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str74 = private constant [19 x i8] c"stdin._IO_save_end\00", align 1 ; <[19 x i8]*> [#uses=1]
@.str75 = private constant [21 x i8] c"stdin._markers._next\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str76 = private constant [21 x i8] c"stdin._markers._sbuf\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str77 = private constant [20 x i8] c"stdin._markers._pos\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str78 = private constant [13 x i8] c"stdin._chain\00", align 1 ; <[13 x i8]*> [#uses=1]
@.str79 = private constant [14 x i8] c"stdin._fileno\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str80 = private constant [14 x i8] c"stdin._flags2\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str81 = private constant [18 x i8] c"stdin._old_offset\00", align 1 ; <[18 x i8]*> [#uses=1]
@.str82 = private constant [18 x i8] c"stdin._cur_column\00", align 1 ; <[18 x i8]*> [#uses=1]
@.str83 = private constant [21 x i8] c"stdin._vtable_offset\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str84 = private constant [16 x i8] c"stdin._shortbuf\00", align 1 ; <[16 x i8]*> [#uses=1]
@.str85 = private constant [12 x i8] c"stdin._lock\00", align 1 ; <[12 x i8]*> [#uses=1]
@.str86 = private constant [14 x i8] c"stdin._offset\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str87 = private constant [13 x i8] c"stdin.__pad1\00", align 1 ; <[13 x i8]*> [#uses=1]
@.str88 = private constant [13 x i8] c"stdin.__pad2\00", align 1 ; <[13 x i8]*> [#uses=1]
@.str89 = private constant [13 x i8] c"stdin.__pad3\00", align 1 ; <[13 x i8]*> [#uses=1]
@.str90 = private constant [13 x i8] c"stdin.__pad4\00", align 1 ; <[13 x i8]*> [#uses=1]
@.str91 = private constant [13 x i8] c"stdin.__pad5\00", align 1 ; <[13 x i8]*> [#uses=1]
@.str92 = private constant [12 x i8] c"stdin._mode\00", align 1 ; <[12 x i8]*> [#uses=1]
@.str93 = private constant [15 x i8] c"stdin._unused2\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str94 = private constant [16 x i8] c"vector_dims > 0\00", align 1 ; <[16 x i8]*> [#uses=1]
@.str95 = private constant [37 x i8] c"source/top_n_outlier_pruning_block.c\00", align 8 ; <[37 x i8]*> [#uses=1]
@__PRETTY_FUNCTION__ = internal constant [28 x i8] c"top_n_outlier_pruning_block\00" ; <[28 x i8]*> [#uses=1]
@.str96 = private constant [6 x i8] c"k > 0\00", align 1 ; <[6 x i8]*> [#uses=1]
@.str97 = private constant [6 x i8] c"N > 0\00", align 1 ; <[6 x i8]*> [#uses=1]
@.str98 = private constant [23 x i8] c"default_block_size > 0\00", align 1 ; <[23 x i8]*> [#uses=1]
@.str99 = private constant [33 x i8] c"block_size <= default_block_size\00", align 8 ; <[33 x i8]*> [#uses=1]
@__PRETTY_FUNCTION__.1 = internal constant [17 x i8] c"distance_squared\00" ; <[17 x i8]*> [#uses=1]
@__PRETTY_FUNCTION__.2 = internal constant [7 x i8] c"insert\00" ; <[7 x i8]*> [#uses=1]
@.str100 = private constant [12 x i8] c"*found <= k\00", align 1 ; <[12 x i8]*> [#uses=1]
@.str101 = private constant [29 x i8] c"new_neighbour >= start_index\00", align 1 ; <[29 x i8]*> [#uses=1]
@.str102 = private constant [20 x i8] c"*outliers_size <= N\00", align 1 ; <[20 x i8]*> [#uses=1]
@__PRETTY_FUNCTION__.3 = internal constant [14 x i8] c"best_outliers\00" ; <[14 x i8]*> [#uses=1]
@.str103 = private constant [15 x i8] c"block_size > 0\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str104 = private constant [9 x i8] c"size > 0\00", align 1 ; <[9 x i8]*> [#uses=1]
@__PRETTY_FUNCTION__.4 = internal constant [24 x i8] c"sort_vectors_descending\00" ; <[24 x i8]*> [#uses=1]
@.str105 = private constant [26 x i8] c"global_outliers_size <= N\00", align 1 ; <[26 x i8]*> [#uses=1]
@__PRETTY_FUNCTION__.5 = internal constant [6 x i8] c"merge\00" ; <[6 x i8]*> [#uses=1]

define void @top_n_outlier_pruning_block(i64 %num_vectors, i64 %vector_dims, [0 x i8]* %data, i64 %k, i64 %N, i64 %default_block_size, [0 x i64]* %outliers, [0 x double]* %outlier_scores) nounwind {
entry:
  %outliers_found = alloca i64, align 8           ; <i64*> [#uses=2]
  call void @llvm.dbg.value(metadata !{i64 %num_vectors}, i64 0, metadata !6)
  call void @llvm.dbg.value(metadata !{i64 %vector_dims}, i64 0, metadata !27)
  call void @llvm.dbg.value(metadata !{[0 x i8]* %data}, i64 0, metadata !28)
  call void @llvm.dbg.value(metadata !{i64 %k}, i64 0, metadata !29)
  call void @llvm.dbg.value(metadata !{i64 %N}, i64 0, metadata !30)
  call void @llvm.dbg.value(metadata !{i64 %default_block_size}, i64 0, metadata !31)
  call void @llvm.dbg.value(metadata !{[0 x i64]* %outliers}, i64 0, metadata !32)
  call void @llvm.dbg.value(metadata !{[0 x double]* %outlier_scores}, i64 0, metadata !33)
  call void @llvm.dbg.declare(metadata !{i64* %outliers_found}, metadata !34), !dbg !36
  %0 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x double]* %outlier_scores, i64 %N) nounwind, !dbg !37 ; <i32> [#uses=0]
  %1 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x i64]* %outliers, i64 %N) nounwind, !dbg !37 ; <i32> [#uses=0]
  %2 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x i8]* %data, i64 %num_vectors) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load = load %struct._IO_FILE** @stderr, align 8, !dbg !37 ; <%struct._IO_FILE*> [#uses=29]
  %stderr.load.addr = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 0, !dbg !37 ; <i32*> [#uses=1]
  %3 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i64 0, i64 0), i32* %stderr.load.addr) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.1 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 1, !dbg !37 ; <i8**> [#uses=1]
  %4 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i8** %stderr.load.addr.1) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.2 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 2, !dbg !37 ; <i8**> [#uses=1]
  %5 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @.str3, i64 0, i64 0), i8** %stderr.load.addr.2) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.3 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 3, !dbg !37 ; <i8**> [#uses=1]
  %6 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str4, i64 0, i64 0), i8** %stderr.load.addr.3) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.4 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 4, !dbg !37 ; <i8**> [#uses=1]
  %7 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i8** %stderr.load.addr.4) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.5 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 5, !dbg !37 ; <i8**> [#uses=1]
  %8 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str6, i64 0, i64 0), i8** %stderr.load.addr.5) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.6 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 6, !dbg !37 ; <i8**> [#uses=1]
  %9 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str7, i64 0, i64 0), i8** %stderr.load.addr.6) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.7 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 7, !dbg !37 ; <i8**> [#uses=1]
  %10 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @.str8, i64 0, i64 0), i8** %stderr.load.addr.7) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.8 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 8, !dbg !37 ; <i8**> [#uses=1]
  %11 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([19 x i8]* @.str9, i64 0, i64 0), i8** %stderr.load.addr.8) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.9 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 9, !dbg !37 ; <i8**> [#uses=1]
  %12 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str10, i64 0, i64 0), i8** %stderr.load.addr.9) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.10 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 10, !dbg !37 ; <i8**> [#uses=1]
  %13 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8]* @.str11, i64 0, i64 0), i8** %stderr.load.addr.10) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.11 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 11, !dbg !37 ; <i8**> [#uses=1]
  %14 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @.str12, i64 0, i64 0), i8** %stderr.load.addr.11) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.12 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 12, !dbg !37 ; <%struct._IO_marker**> [#uses=1]
  %stderr.load.1 = load %struct._IO_marker** %stderr.load.addr.12, align 8, !dbg !37 ; <%struct._IO_marker*> [#uses=3]
  %stderr.load.1.addr = getelementptr inbounds %struct._IO_marker* %stderr.load.1, i64 0, i32 0, !dbg !37 ; <%struct._IO_marker**> [#uses=1]
  %15 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8]* @.str13, i64 0, i64 0), %struct._IO_marker** %stderr.load.1.addr) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.1.addr.1 = getelementptr inbounds %struct._IO_marker* %stderr.load.1, i64 0, i32 1, !dbg !37 ; <%struct._IO_FILE**> [#uses=1]
  %16 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8]* @.str14, i64 0, i64 0), %struct._IO_FILE** %stderr.load.1.addr.1) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.1.addr.2 = getelementptr inbounds %struct._IO_marker* %stderr.load.1, i64 0, i32 2, !dbg !37 ; <i32*> [#uses=1]
  %17 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str15, i64 0, i64 0), i32* %stderr.load.1.addr.2) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.13 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 13, !dbg !37 ; <%struct._IO_FILE**> [#uses=1]
  %18 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str16, i64 0, i64 0), %struct._IO_FILE** %stderr.load.addr.13) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.14 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 14, !dbg !37 ; <i32*> [#uses=1]
  %19 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8]* @.str17, i64 0, i64 0), i32* %stderr.load.addr.14) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.15 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 15, !dbg !37 ; <i32*> [#uses=1]
  %20 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8]* @.str18, i64 0, i64 0), i32* %stderr.load.addr.15) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.16 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 16, !dbg !37 ; <i64*> [#uses=1]
  %21 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([19 x i8]* @.str19, i64 0, i64 0), i64* %stderr.load.addr.16) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.17 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 17, !dbg !37 ; <i16*> [#uses=1]
  %22 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([19 x i8]* @.str20, i64 0, i64 0), i16* %stderr.load.addr.17) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.18 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 18, !dbg !37 ; <i8*> [#uses=1]
  %23 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8]* @.str21, i64 0, i64 0), i8* %stderr.load.addr.18) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.19 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 19, !dbg !37 ; <[1 x i8]*> [#uses=1]
  %24 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8]* @.str22, i64 0, i64 0), [1 x i8]* %stderr.load.addr.19) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.20 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 20, !dbg !37 ; <i8**> [#uses=1]
  %25 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str23, i64 0, i64 0), i8** %stderr.load.addr.20) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.21 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 21, !dbg !37 ; <i64*> [#uses=1]
  %26 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8]* @.str24, i64 0, i64 0), i64* %stderr.load.addr.21) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.22 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 22, !dbg !37 ; <i8**> [#uses=1]
  %27 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0), i8** %stderr.load.addr.22) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.23 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 23, !dbg !37 ; <i8**> [#uses=1]
  %28 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str26, i64 0, i64 0), i8** %stderr.load.addr.23) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.24 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 24, !dbg !37 ; <i8**> [#uses=1]
  %29 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str27, i64 0, i64 0), i8** %stderr.load.addr.24) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.25 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 25, !dbg !37 ; <i8**> [#uses=1]
  %30 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str28, i64 0, i64 0), i8** %stderr.load.addr.25) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.26 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 26, !dbg !37 ; <i64*> [#uses=1]
  %31 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str29, i64 0, i64 0), i64* %stderr.load.addr.26) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.27 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 27, !dbg !37 ; <i32*> [#uses=1]
  %32 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str30, i64 0, i64 0), i32* %stderr.load.addr.27) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stderr.load.addr.28 = getelementptr inbounds %struct._IO_FILE* %stderr.load, i64 0, i32 28, !dbg !37 ; <[20 x i8]*> [#uses=1]
  %33 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8]* @.str31, i64 0, i64 0), [20 x i8]* %stderr.load.addr.28) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load = load %struct._IO_FILE** @stdout, align 8, !dbg !37 ; <%struct._IO_FILE*> [#uses=29]
  %stdout.load.addr = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 0, !dbg !37 ; <i32*> [#uses=1]
  %34 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str32, i64 0, i64 0), i32* %stdout.load.addr) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.1 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 1, !dbg !37 ; <i8**> [#uses=1]
  %35 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @.str33, i64 0, i64 0), i8** %stdout.load.addr.1) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.2 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 2, !dbg !37 ; <i8**> [#uses=1]
  %36 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @.str34, i64 0, i64 0), i8** %stdout.load.addr.2) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.3 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 3, !dbg !37 ; <i8**> [#uses=1]
  %37 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str35, i64 0, i64 0), i8** %stdout.load.addr.3) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.4 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 4, !dbg !37 ; <i8**> [#uses=1]
  %38 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8]* @.str36, i64 0, i64 0), i8** %stdout.load.addr.4) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.5 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 5, !dbg !37 ; <i8**> [#uses=1]
  %39 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str37, i64 0, i64 0), i8** %stdout.load.addr.5) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.6 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 6, !dbg !37 ; <i8**> [#uses=1]
  %40 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str38, i64 0, i64 0), i8** %stdout.load.addr.6) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.7 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 7, !dbg !37 ; <i8**> [#uses=1]
  %41 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @.str39, i64 0, i64 0), i8** %stdout.load.addr.7) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.8 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 8, !dbg !37 ; <i8**> [#uses=1]
  %42 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([19 x i8]* @.str40, i64 0, i64 0), i8** %stdout.load.addr.8) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.9 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 9, !dbg !37 ; <i8**> [#uses=1]
  %43 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str41, i64 0, i64 0), i8** %stdout.load.addr.9) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.10 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 10, !dbg !37 ; <i8**> [#uses=1]
  %44 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8]* @.str42, i64 0, i64 0), i8** %stdout.load.addr.10) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.11 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 11, !dbg !37 ; <i8**> [#uses=1]
  %45 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @.str43, i64 0, i64 0), i8** %stdout.load.addr.11) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.12 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 12, !dbg !37 ; <%struct._IO_marker**> [#uses=1]
  %stdout.load.1 = load %struct._IO_marker** %stdout.load.addr.12, align 8, !dbg !37 ; <%struct._IO_marker*> [#uses=3]
  %stdout.load.1.addr = getelementptr inbounds %struct._IO_marker* %stdout.load.1, i64 0, i32 0, !dbg !37 ; <%struct._IO_marker**> [#uses=1]
  %46 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8]* @.str44, i64 0, i64 0), %struct._IO_marker** %stdout.load.1.addr) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.1.addr.1 = getelementptr inbounds %struct._IO_marker* %stdout.load.1, i64 0, i32 1, !dbg !37 ; <%struct._IO_FILE**> [#uses=1]
  %47 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8]* @.str45, i64 0, i64 0), %struct._IO_FILE** %stdout.load.1.addr.1) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.1.addr.2 = getelementptr inbounds %struct._IO_marker* %stdout.load.1, i64 0, i32 2, !dbg !37 ; <i32*> [#uses=1]
  %48 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str46, i64 0, i64 0), i32* %stdout.load.1.addr.2) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.13 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 13, !dbg !37 ; <%struct._IO_FILE**> [#uses=1]
  %49 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str47, i64 0, i64 0), %struct._IO_FILE** %stdout.load.addr.13) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.14 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 14, !dbg !37 ; <i32*> [#uses=1]
  %50 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8]* @.str48, i64 0, i64 0), i32* %stdout.load.addr.14) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.15 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 15, !dbg !37 ; <i32*> [#uses=1]
  %51 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8]* @.str49, i64 0, i64 0), i32* %stdout.load.addr.15) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.16 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 16, !dbg !37 ; <i64*> [#uses=1]
  %52 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([19 x i8]* @.str50, i64 0, i64 0), i64* %stdout.load.addr.16) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.17 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 17, !dbg !37 ; <i16*> [#uses=1]
  %53 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([19 x i8]* @.str51, i64 0, i64 0), i16* %stdout.load.addr.17) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.18 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 18, !dbg !37 ; <i8*> [#uses=1]
  %54 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8]* @.str52, i64 0, i64 0), i8* %stdout.load.addr.18) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.19 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 19, !dbg !37 ; <[1 x i8]*> [#uses=1]
  %55 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8]* @.str53, i64 0, i64 0), [1 x i8]* %stdout.load.addr.19) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.20 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 20, !dbg !37 ; <i8**> [#uses=1]
  %56 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str54, i64 0, i64 0), i8** %stdout.load.addr.20) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.21 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 21, !dbg !37 ; <i64*> [#uses=1]
  %57 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8]* @.str55, i64 0, i64 0), i64* %stdout.load.addr.21) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.22 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 22, !dbg !37 ; <i8**> [#uses=1]
  %58 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str56, i64 0, i64 0), i8** %stdout.load.addr.22) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.23 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 23, !dbg !37 ; <i8**> [#uses=1]
  %59 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str57, i64 0, i64 0), i8** %stdout.load.addr.23) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.24 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 24, !dbg !37 ; <i8**> [#uses=1]
  %60 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str58, i64 0, i64 0), i8** %stdout.load.addr.24) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.25 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 25, !dbg !37 ; <i8**> [#uses=1]
  %61 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str59, i64 0, i64 0), i8** %stdout.load.addr.25) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.26 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 26, !dbg !37 ; <i64*> [#uses=1]
  %62 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str60, i64 0, i64 0), i64* %stdout.load.addr.26) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.27 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 27, !dbg !37 ; <i32*> [#uses=1]
  %63 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str61, i64 0, i64 0), i32* %stdout.load.addr.27) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdout.load.addr.28 = getelementptr inbounds %struct._IO_FILE* %stdout.load, i64 0, i32 28, !dbg !37 ; <[20 x i8]*> [#uses=1]
  %64 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8]* @.str62, i64 0, i64 0), [20 x i8]* %stdout.load.addr.28) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load = load %struct._IO_FILE** @stdin, align 8, !dbg !37 ; <%struct._IO_FILE*> [#uses=29]
  %stdin.load.addr = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 0, !dbg !37 ; <i32*> [#uses=1]
  %65 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str63, i64 0, i64 0), i32* %stdin.load.addr) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.1 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 1, !dbg !37 ; <i8**> [#uses=1]
  %66 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([19 x i8]* @.str64, i64 0, i64 0), i8** %stdin.load.addr.1) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.2 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 2, !dbg !37 ; <i8**> [#uses=1]
  %67 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([19 x i8]* @.str65, i64 0, i64 0), i8** %stdin.load.addr.2) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.3 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 3, !dbg !37 ; <i8**> [#uses=1]
  %68 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @.str66, i64 0, i64 0), i8** %stdin.load.addr.3) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.4 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 4, !dbg !37 ; <i8**> [#uses=1]
  %69 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str67, i64 0, i64 0), i8** %stdin.load.addr.4) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.5 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 5, !dbg !37 ; <i8**> [#uses=1]
  %70 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @.str68, i64 0, i64 0), i8** %stdin.load.addr.5) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.6 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 6, !dbg !37 ; <i8**> [#uses=1]
  %71 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @.str69, i64 0, i64 0), i8** %stdin.load.addr.6) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.7 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 7, !dbg !37 ; <i8**> [#uses=1]
  %72 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([19 x i8]* @.str70, i64 0, i64 0), i8** %stdin.load.addr.7) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.8 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 8, !dbg !37 ; <i8**> [#uses=1]
  %73 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8]* @.str71, i64 0, i64 0), i8** %stdin.load.addr.8) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.9 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 9, !dbg !37 ; <i8**> [#uses=1]
  %74 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @.str72, i64 0, i64 0), i8** %stdin.load.addr.9) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.10 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 10, !dbg !37 ; <i8**> [#uses=1]
  %75 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8]* @.str73, i64 0, i64 0), i8** %stdin.load.addr.10) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.11 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 11, !dbg !37 ; <i8**> [#uses=1]
  %76 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([19 x i8]* @.str74, i64 0, i64 0), i8** %stdin.load.addr.11) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.12 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 12, !dbg !37 ; <%struct._IO_marker**> [#uses=1]
  %stdin.load.1 = load %struct._IO_marker** %stdin.load.addr.12, align 8, !dbg !37 ; <%struct._IO_marker*> [#uses=3]
  %stdin.load.1.addr = getelementptr inbounds %struct._IO_marker* %stdin.load.1, i64 0, i32 0, !dbg !37 ; <%struct._IO_marker**> [#uses=1]
  %77 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str75, i64 0, i64 0), %struct._IO_marker** %stdin.load.1.addr) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.1.addr.1 = getelementptr inbounds %struct._IO_marker* %stdin.load.1, i64 0, i32 1, !dbg !37 ; <%struct._IO_FILE**> [#uses=1]
  %78 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str76, i64 0, i64 0), %struct._IO_FILE** %stdin.load.1.addr.1) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.1.addr.2 = getelementptr inbounds %struct._IO_marker* %stdin.load.1, i64 0, i32 2, !dbg !37 ; <i32*> [#uses=1]
  %79 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @.str77, i64 0, i64 0), i32* %stdin.load.1.addr.2) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.13 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 13, !dbg !37 ; <%struct._IO_FILE**> [#uses=1]
  %80 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str78, i64 0, i64 0), %struct._IO_FILE** %stdin.load.addr.13) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.14 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 14, !dbg !37 ; <i32*> [#uses=1]
  %81 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str79, i64 0, i64 0), i32* %stdin.load.addr.14) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.15 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 15, !dbg !37 ; <i32*> [#uses=1]
  %82 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str80, i64 0, i64 0), i32* %stdin.load.addr.15) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.16 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 16, !dbg !37 ; <i64*> [#uses=1]
  %83 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8]* @.str81, i64 0, i64 0), i64* %stdin.load.addr.16) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.17 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 17, !dbg !37 ; <i16*> [#uses=1]
  %84 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8]* @.str82, i64 0, i64 0), i16* %stdin.load.addr.17) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.18 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 18, !dbg !37 ; <i8*> [#uses=1]
  %85 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str83, i64 0, i64 0), i8* %stdin.load.addr.18) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.19 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 19, !dbg !37 ; <[1 x i8]*> [#uses=1]
  %86 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8]* @.str84, i64 0, i64 0), [1 x i8]* %stdin.load.addr.19) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.20 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 20, !dbg !37 ; <i8**> [#uses=1]
  %87 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8]* @.str85, i64 0, i64 0), i8** %stdin.load.addr.20) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.21 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 21, !dbg !37 ; <i64*> [#uses=1]
  %88 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str86, i64 0, i64 0), i64* %stdin.load.addr.21) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.22 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 22, !dbg !37 ; <i8**> [#uses=1]
  %89 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str87, i64 0, i64 0), i8** %stdin.load.addr.22) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.23 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 23, !dbg !37 ; <i8**> [#uses=1]
  %90 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str88, i64 0, i64 0), i8** %stdin.load.addr.23) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.24 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 24, !dbg !37 ; <i8**> [#uses=1]
  %91 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str89, i64 0, i64 0), i8** %stdin.load.addr.24) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.25 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 25, !dbg !37 ; <i8**> [#uses=1]
  %92 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str90, i64 0, i64 0), i8** %stdin.load.addr.25) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.26 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 26, !dbg !37 ; <i64*> [#uses=1]
  %93 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str91, i64 0, i64 0), i64* %stdin.load.addr.26) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.27 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 27, !dbg !37 ; <i32*> [#uses=1]
  %94 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8]* @.str92, i64 0, i64 0), i32* %stdin.load.addr.27) nounwind, !dbg !37 ; <i32> [#uses=0]
  %stdin.load.addr.28 = getelementptr inbounds %struct._IO_FILE* %stdin.load, i64 0, i32 28, !dbg !37 ; <[20 x i8]*> [#uses=1]
  %95 = call i32 (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8]* @.str93, i64 0, i64 0), [20 x i8]* %stdin.load.addr.28) nounwind, !dbg !37 ; <i32> [#uses=0]
  %tmp.1 = icmp eq i64 %vector_dims, 0, !dbg !38  ; <i1> [#uses=1]
  br i1 %tmp.1, label %bb, label %bb30, !dbg !38

bb:                                               ; preds = %entry
  call void @_ssdm_AssertFail(i8* getelementptr inbounds ([16 x i8]* @.str94, i64 0, i64 0), i8* getelementptr inbounds ([37 x i8]* @.str95, i64 0, i64 0), i32 407, i8* getelementptr inbounds ([28 x i8]* @__PRETTY_FUNCTION__, i64 0, i64 0)) nounwind
  unreachable, !dbg !38

bb30:                                             ; preds = %entry
  %tmp.2 = icmp eq i64 %k, 0, !dbg !39            ; <i1> [#uses=1]
  br i1 %tmp.2, label %bb31, label %bb32, !dbg !39

bb31:                                             ; preds = %bb30
  call void @_ssdm_AssertFail(i8* getelementptr inbounds ([6 x i8]* @.str96, i64 0, i64 0), i8* getelementptr inbounds ([37 x i8]* @.str95, i64 0, i64 0), i32 408, i8* getelementptr inbounds ([28 x i8]* @__PRETTY_FUNCTION__, i64 0, i64 0)) nounwind
  unreachable, !dbg !39

bb32:                                             ; preds = %bb30
  %tmp.3 = icmp eq i64 %N, 0, !dbg !40            ; <i1> [#uses=1]
  br i1 %tmp.3, label %bb33, label %bb34, !dbg !40

bb33:                                             ; preds = %bb32
  call void @_ssdm_AssertFail(i8* getelementptr inbounds ([6 x i8]* @.str97, i64 0, i64 0), i8* getelementptr inbounds ([37 x i8]* @.str95, i64 0, i64 0), i32 409, i8* getelementptr inbounds ([28 x i8]* @__PRETTY_FUNCTION__, i64 0, i64 0)) nounwind
  unreachable, !dbg !40

bb34:                                             ; preds = %bb32
  %tmp.4 = icmp eq i64 %default_block_size, 0, !dbg !41 ; <i1> [#uses=1]
  br i1 %tmp.4, label %bb35, label %bb36, !dbg !41

bb35:                                             ; preds = %bb34
  call void @_ssdm_AssertFail(i8* getelementptr inbounds ([23 x i8]* @.str98, i64 0, i64 0), i8* getelementptr inbounds ([37 x i8]* @.str95, i64 0, i64 0), i32 410, i8* getelementptr inbounds ([28 x i8]* @__PRETTY_FUNCTION__, i64 0, i64 0)) nounwind
  unreachable, !dbg !41

bb36:                                             ; preds = %bb34
  %tmp.5 = shl i64 %N, 3, !dbg !42                ; <i64> [#uses=2]
  %tmp.6 = bitcast [0 x i64]* %outliers to i8*, !dbg !42 ; <i8*> [#uses=1]
  call void @llvm.memset.i64(i8* %tmp.6, i8 0, i64 %tmp.5, i32 1), !dbg !42
  %tmp.7 = bitcast [0 x double]* %outlier_scores to i8*, !dbg !43 ; <i8*> [#uses=1]
  call void @llvm.memset.i64(i8* %tmp.7, i8 0, i64 %tmp.5, i32 1), !dbg !43
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !45), !dbg !46
  store i64 0, i64* %outliers_found, align 8, !dbg !47
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !49), !dbg !50
  %tmp.8 = shl i64 %k, 3, !dbg !51                ; <i64> [#uses=2]
  %tmp.9 = shl i64 %vector_dims, 3, !dbg !53      ; <i64> [#uses=2]
  %tmp.10 = uitofp i64 %k to double, !dbg !57     ; <double> [#uses=2]
  %tmp.11 = add i64 %N, -1, !dbg !58              ; <i64> [#uses=1]
  %outlier_scores.addr = getelementptr inbounds [0 x double]* %outlier_scores, i64 0, i64 %tmp.11, !dbg !58 ; <double*> [#uses=1]
  %tmp = add i64 %num_vectors, 1                  ; <i64> [#uses=1]
  %tmp1 = icmp ugt i64 %tmp, 1                    ; <i1> [#uses=1]
  %tmp2 = select i1 %tmp1, i64 %num_vectors, i64 0 ; <i64> [#uses=1]
  br label %bb57, !dbg !50

bb37:                                             ; preds = %bb57
  %saved_stack.202 = call i8* @llvm.stacksave(), !dbg !50 ; <i8*> [#uses=1]
  %tmp.13 = add i64 %block_begin, %default_block_size, !dbg !59 ; <i64> [#uses=2]
  %tmp.14 = icmp ule i64 %tmp.13, %num_vectors, !dbg !59 ; <i1> [#uses=1]
  %block_begin.1 = select i1 %tmp.14, i64 %tmp.13, i64 %num_vectors, !dbg !59 ; <i64> [#uses=2]
  %block_size = sub i64 %block_begin.1, %block_begin, !dbg !59 ; <i64> [#uses=9]
  call void @llvm.dbg.value(metadata !{i64 %block_size}, i64 0, metadata !60), !dbg !59
  %tmp.15 = icmp ugt i64 %block_size, %default_block_size, !dbg !61 ; <i1> [#uses=1]
  br i1 %tmp.15, label %bb39, label %bb40, !dbg !61

bb39:                                             ; preds = %bb37
  call void @_ssdm_AssertFail(i8* getelementptr inbounds ([33 x i8]* @.str99, i64 0, i64 0), i8* getelementptr inbounds ([37 x i8]* @.str95, i64 0, i64 0), i32 427, i8* getelementptr inbounds ([28 x i8]* @__PRETTY_FUNCTION__, i64 0, i64 0)) nounwind
  unreachable, !dbg !61

bb40:                                             ; preds = %bb37
  %tmp.16 = trunc i64 %block_size to i32          ; <i32> [#uses=2]
  %tmp.17 = shl i32 %tmp.16, 3, !dbg !62          ; <i32> [#uses=2]
  %96 = alloca i8, i32 %tmp.17, align 1, !dbg !62 ; <i8*> [#uses=1]
  %current_block.169 = bitcast i8* %96 to [0 x i64]*, !dbg !62 ; <[0 x i64]*> [#uses=3]
  call void @llvm.dbg.value(metadata !{[0 x i64]* %current_block.169}, i64 0, metadata !63), !dbg !62
  %tmp.18 = mul i64 %block_size, %k, !dbg !65     ; <i64> [#uses=1]
  %tmp.19 = trunc i64 %tmp.18 to i32              ; <i32> [#uses=1]
  %tmp.20 = shl i32 %tmp.19, 3, !dbg !65          ; <i32> [#uses=2]
  %97 = alloca i8, i32 %tmp.20, align 1, !dbg !65 ; <i8*> [#uses=2]
  %98 = alloca i8, i32 %tmp.20, align 1, !dbg !66 ; <i8*> [#uses=2]
  %99 = alloca i8, i32 %tmp.17, align 1, !dbg !67 ; <i8*> [#uses=2]
  %score.180 = bitcast i8* %99 to [0 x double]*, !dbg !67 ; <[0 x double]*> [#uses=3]
  call void @llvm.dbg.value(metadata !{[0 x double]* %score.180}, i64 0, metadata !68), !dbg !67
  %tmp.21 = shl i32 %tmp.16, 2, !dbg !70          ; <i32> [#uses=1]
  %100 = alloca i8, i32 %tmp.21, align 1, !dbg !70 ; <i8*> [#uses=2]
  %found.183 = bitcast i8* %100 to [0 x i32]*, !dbg !70 ; <[0 x i32]*> [#uses=1]
  call void @llvm.dbg.value(metadata !{[0 x i32]* %found.183}, i64 0, metadata !71), !dbg !70
  call void @llvm.dbg.value(metadata !76, i64 0, metadata !77), !dbg !79
  %tmp.22 = add i64 %block_begin, 1, !dbg !80     ; <i64> [#uses=1]
  br label %bb42, !dbg !79

bb41:                                             ; preds = %bb42
  %tmp.25 = add i64 %tmp.22, %tmp.23, !dbg !80    ; <i64> [#uses=1]
  %current_block.169.addr = getelementptr inbounds [0 x i64]* %current_block.169, i64 0, i64 %tmp.23, !dbg !80 ; <i64*> [#uses=1]
  store i64 %tmp.25, i64* %current_block.169.addr, align 8, !dbg !80
  %i.1 = add i32 %i, 1, !dbg !79                  ; <i32> [#uses=1]
  call void @llvm.dbg.value(metadata !{i32 %i.1}, i64 0, metadata !77), !dbg !79
  br label %bb42, !dbg !79

bb42:                                             ; preds = %bb41, %bb40
  %i = phi i32 [ 0, %bb40 ], [ %i.1, %bb41 ]      ; <i32> [#uses=2]
  call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !77)
  %tmp.23 = zext i32 %i to i64, !dbg !79          ; <i64> [#uses=3]
  %tmp.24 = icmp ult i64 %tmp.23, %block_size, !dbg !79 ; <i1> [#uses=1]
  br i1 %tmp.24, label %bb41, label %bb43, !dbg !79

bb43:                                             ; preds = %bb42
  %tmp.27 = mul i64 %tmp.8, %block_size, !dbg !51 ; <i64> [#uses=2]
  call void @llvm.memset.i64(i8* %97, i8 0, i64 %tmp.27, i32 1), !dbg !51
  call void @llvm.memset.i64(i8* %98, i8 0, i64 %tmp.27, i32 1), !dbg !81
  %tmp.28 = shl i64 %block_size, 3, !dbg !82      ; <i64> [#uses=1]
  call void @llvm.memset.i64(i8* %99, i8 0, i64 %tmp.28, i32 1), !dbg !82
  %tmp.29 = shl i64 %block_size, 2, !dbg !83      ; <i64> [#uses=1]
  call void @llvm.memset.i64(i8* %100, i8 0, i64 %tmp.29, i32 1), !dbg !83
  call void @llvm.dbg.value(metadata !{i64 1}, i64 0, metadata !84), !dbg !85
  br label %bb55, !dbg !85

bb45:                                             ; preds = %bb53
  %current_block.169.addr.1 = getelementptr inbounds [0 x i64]* %current_block.169, i64 0, i64 %tmp.31, !dbg !86 ; <i64*> [#uses=2]
  %vector2 = load i64* %current_block.169.addr.1, align 8, !dbg !86 ; <i64> [#uses=4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i64 %vector2) nounwind
  call void @llvm.dbg.value(metadata !{i64 %vector2}, i64 0, metadata !87), !dbg !86
  %tmp.33 = icmp eq i64 %vector1, %vector2, !dbg !88 ; <i1> [#uses=1]
  %tmp.34 = icmp eq i64 %vector2, 0, !dbg !88     ; <i1> [#uses=1]
  %or.cond = or i1 %tmp.33, %tmp.34, !dbg !88     ; <i1> [#uses=1]
  br i1 %or.cond, label %bb52, label %bb47, !dbg !88

bb47:                                             ; preds = %bb45
  %tmp.35 = add i64 %vector2, -1, !dbg !53        ; <i64> [#uses=1]
  %tmp.36 = mul i64 %tmp.9, %tmp.35, !dbg !53     ; <i64> [#uses=1]
  %data.addr.1 = getelementptr inbounds [0 x i8]* %data, i64 0, i64 %tmp.36, !dbg !53 ; <i8*> [#uses=1]
  %tmp.37 = bitcast i8* %data.addr.1 to [0 x double]*, !dbg !53 ; <[0 x double]*> [#uses=1]
  %dist_squared = call fastcc double @distance_squared(i64 %vector_dims, [0 x double]* %tmp.30, [0 x double]* %tmp.37) nounwind, !dbg !53 ; <double> [#uses=2]
  call void @llvm.dbg.value(metadata !{double %dist_squared}, i64 0, metadata !89), !dbg !53
  %found.183.addr = getelementptr inbounds [0 x i32]* %found.183, i64 0, i64 %tmp.31, !dbg !90 ; <i32*> [#uses=2]
  %tmp.38 = mul i64 %tmp.8, %tmp.31, !dbg !90     ; <i64> [#uses=2]
  %.addr = getelementptr inbounds i8* %98, i64 %tmp.38, !dbg !90 ; <i8*> [#uses=1]
  %tmp.39 = bitcast i8* %.addr to [0 x double]*, !dbg !90 ; <[0 x double]*> [#uses=1]
  %.addr.1 = getelementptr inbounds i8* %97, i64 %tmp.38, !dbg !90 ; <i8*> [#uses=1]
  %tmp.40 = bitcast i8* %.addr.1 to [0 x i64]*, !dbg !90 ; <[0 x i64]*> [#uses=1]
  %removed_distance = call fastcc double @insert(i64 %k, [0 x i64]* %tmp.40, [0 x double]* %tmp.39, i32* %found.183.addr, i64 %vector1, double %dist_squared) nounwind, !dbg !90 ; <double> [#uses=2]
  call void @llvm.dbg.value(metadata !{double %removed_distance}, i64 0, metadata !91), !dbg !90
  %tmp.41 = fcmp ult double %removed_distance, 0.000000e+00, !dbg !92 ; <i1> [#uses=1]
  br i1 %tmp.41, label %bb49, label %bb48, !dbg !92

bb48:                                             ; preds = %bb47
  %score.180.addr = getelementptr inbounds [0 x double]* %score.180, i64 0, i64 %tmp.31, !dbg !57 ; <double*> [#uses=2]
  %score.180.load = load double* %score.180.addr, align 8, !dbg !57 ; <double> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %score.180.load) nounwind
  %tmp.42 = fmul double %score.180.load, %tmp.10, !dbg !57 ; <double> [#uses=1]
  %tmp.43 = fsub double %tmp.42, %removed_distance, !dbg !57 ; <double> [#uses=1]
  %tmp.44 = fadd double %tmp.43, %dist_squared, !dbg !57 ; <double> [#uses=1]
  %tmp.45 = fdiv double %tmp.44, %tmp.10, !dbg !57 ; <double> [#uses=1]
  store double %tmp.45, double* %score.180.addr, align 8, !dbg !57
  br label %bb49, !dbg !57

bb49:                                             ; preds = %bb48, %bb47
  %found.183.load = load i32* %found.183.addr, align 4, !dbg !93 ; <i32> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %found.183.load) nounwind
  %tmp.46 = zext i32 %found.183.load to i64, !dbg !93 ; <i64> [#uses=1]
  %tmp.47 = icmp ult i64 %tmp.46, %k, !dbg !93    ; <i1> [#uses=1]
  br i1 %tmp.47, label %bb52, label %bb50, !dbg !93

bb50:                                             ; preds = %bb49
  %score.180.addr.1 = getelementptr inbounds [0 x double]* %score.180, i64 0, i64 %tmp.31, !dbg !93 ; <double*> [#uses=2]
  %score.180.load.1 = load double* %score.180.addr.1, align 8, !dbg !93 ; <double> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %score.180.load.1) nounwind
  %tmp.48 = fcmp olt double %score.180.load.1, %cutoff, !dbg !93 ; <i1> [#uses=1]
  br i1 %tmp.48, label %bb51, label %bb52, !dbg !93

bb51:                                             ; preds = %bb50
  store i64 0, i64* %current_block.169.addr.1, align 8, !dbg !94
  store double 0.000000e+00, double* %score.180.addr.1, align 8, !dbg !95
  br label %bb52, !dbg !95

bb52:                                             ; preds = %bb51, %bb50, %bb49, %bb45
  %block_index.1 = add i32 %block_index, 1, !dbg !96 ; <i32> [#uses=1]
  call void @llvm.dbg.value(metadata !{i32 %block_index.1}, i64 0, metadata !97), !dbg !96
  br label %bb53, !dbg !96

bb53:                                             ; preds = %bb53.preheader, %bb52
  %block_index = phi i32 [ %block_index.1, %bb52 ], [ 0, %bb53.preheader ] ; <i32> [#uses=2]
  call void @llvm.dbg.value(metadata !{i32 %block_index}, i64 0, metadata !97)
  %tmp.31 = zext i32 %block_index to i64, !dbg !96 ; <i64> [#uses=6]
  %tmp.32 = icmp ult i64 %tmp.31, %block_size, !dbg !96 ; <i1> [#uses=1]
  br i1 %tmp.32, label %bb45, label %bb55.loopexit, !dbg !96

bb55.loopexit:                                    ; preds = %bb53
  br label %bb55

bb55:                                             ; preds = %bb55.loopexit, %bb43
  %indvar = phi i64 [ 0, %bb43 ], [ %vector1, %bb55.loopexit ] ; <i64> [#uses=3]
  call void @llvm.dbg.value(metadata !{i64 undef}, i64 0, metadata !84)
  %tmp4 = mul i64 %tmp.9, %indvar, !dbg !53       ; <i64> [#uses=1]
  %vector1 = add i64 %indvar, 1, !dbg !85         ; <i64> [#uses=3]
  call void @llvm.dbg.value(metadata !{i64 %vector1}, i64 0, metadata !84), !dbg !85
  %exitcond6 = icmp eq i64 %indvar, %tmp2, !dbg !85 ; <i1> [#uses=1]
  br i1 %exitcond6, label %bb56, label %bb53.preheader, !dbg !85

bb53.preheader:                                   ; preds = %bb55
  %data.addr = getelementptr inbounds [0 x i8]* %data, i64 0, i64 %tmp4, !dbg !53 ; <i8*> [#uses=1]
  %tmp.30 = bitcast i8* %data.addr to [0 x double]*, !dbg !53 ; <[0 x double]*> [#uses=1]
  br label %bb53

bb56:                                             ; preds = %bb55
  call fastcc void @best_outliers(i64 %N, i64* %outliers_found, [0 x i64]* %outliers, [0 x double]* %outlier_scores, i64 %block_size, [0 x i64]* %current_block.169, [0 x double]* %score.180) nounwind, !dbg !98
  %cutoff.1 = load double* %outlier_scores.addr, align 8, !dbg !58 ; <double> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %cutoff.1) nounwind
  call void @llvm.dbg.value(metadata !{double %cutoff.1}, i64 0, metadata !45), !dbg !58
  call void @llvm.stackrestore(i8* %saved_stack.202), !dbg !58
  call void @llvm.dbg.value(metadata !{i64 %block_begin.1}, i64 0, metadata !49), !dbg !50
  br label %bb57, !dbg !50

bb57:                                             ; preds = %bb56, %bb36
  %cutoff = phi double [ 0.000000e+00, %bb36 ], [ %cutoff.1, %bb56 ] ; <double> [#uses=1]
  %block_begin = phi i64 [ 0, %bb36 ], [ %block_begin.1, %bb56 ] ; <i64> [#uses=4]
  call void @llvm.dbg.value(metadata !{double %cutoff}, i64 0, metadata !45)
  call void @llvm.dbg.value(metadata !{i64 %block_begin}, i64 0, metadata !49)
  %tmp.12 = icmp ult i64 %block_begin, %num_vectors, !dbg !50 ; <i1> [#uses=1]
  br i1 %tmp.12, label %bb37, label %return, !dbg !50

return:                                           ; preds = %bb57
  ret void, !dbg !99
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @_ssdm_SpecArrayDimSize(...)

declare i32 @_ssdm_op_SpecExt(...)

declare void @__assert_fail(i8*, i8*, i32, i8*) noreturn nounwind

declare void @llvm.memset.i64(i8* nocapture, i8, i64, i32) nounwind

declare i8* @llvm.stacksave() nounwind

define internal fastcc double @distance_squared(i64 %vector_dims, [0 x double]* %vector1, [0 x double]* %vector2) nounwind inlinehint {
entry:
  call void @llvm.dbg.value(metadata !{i64 %vector_dims}, i64 0, metadata !100)
  call void @llvm.dbg.value(metadata !{[0 x double]* %vector1}, i64 0, metadata !104)
  call void @llvm.dbg.value(metadata !{[0 x double]* %vector2}, i64 0, metadata !105)
  %0 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x double]* %vector1, i64 %vector_dims) nounwind, !dbg !106 ; <i32> [#uses=0]
  %1 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x double]* %vector2, i64 %vector_dims) nounwind, !dbg !106 ; <i32> [#uses=0]
  %tmp = icmp eq i64 %vector_dims, 0, !dbg !107   ; <i1> [#uses=1]
  br i1 %tmp, label %bb, label %bb3.preheader, !dbg !107

bb3.preheader:                                    ; preds = %entry
  br label %bb3

bb:                                               ; preds = %entry
  call void @_ssdm_AssertFail(i8* getelementptr inbounds ([16 x i8]* @.str94, i64 0, i64 0), i8* getelementptr inbounds ([37 x i8]* @.str95, i64 0, i64 0), i32 80, i8* getelementptr inbounds ([17 x i8]* @__PRETTY_FUNCTION__.1, i64 0, i64 0)) nounwind
  unreachable, !dbg !107

bb2:                                              ; preds = %bb3
  %vector1.addr = getelementptr inbounds [0 x double]* %vector1, i64 0, i64 %tmp.50, !dbg !109 ; <double*> [#uses=1]
  %vector1.load = load double* %vector1.addr, align 8, !dbg !109 ; <double> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %vector1.load) nounwind
  %vector2.addr = getelementptr inbounds [0 x double]* %vector2, i64 0, i64 %tmp.50, !dbg !109 ; <double*> [#uses=1]
  %vector2.load = load double* %vector2.addr, align 8, !dbg !109 ; <double> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %vector2.load) nounwind
  %val = fsub double %vector1.load, %vector2.load, !dbg !109 ; <double> [#uses=2]
  call void @llvm.dbg.value(metadata !{double %val}, i64 0, metadata !111), !dbg !109
  %val_squared = fmul double %val, %val, !dbg !112 ; <double> [#uses=1]
  call void @llvm.dbg.value(metadata !{double %val_squared}, i64 0, metadata !113), !dbg !112
  %sum_of_squares.1 = fadd double %sum_of_squares, %val_squared, !dbg !114 ; <double> [#uses=1]
  call void @llvm.dbg.value(metadata !{double %sum_of_squares.1}, i64 0, metadata !115), !dbg !114
  %dim.1 = add i32 %dim, 1, !dbg !116             ; <i32> [#uses=1]
  call void @llvm.dbg.value(metadata !{i32 %dim.1}, i64 0, metadata !117), !dbg !116
  br label %bb3, !dbg !116

bb3:                                              ; preds = %bb2, %bb3.preheader
  %sum_of_squares = phi double [ %sum_of_squares.1, %bb2 ], [ 0.000000e+00, %bb3.preheader ] ; <double> [#uses=2]
  %dim = phi i32 [ %dim.1, %bb2 ], [ 0, %bb3.preheader ] ; <i32> [#uses=2]
  call void @llvm.dbg.value(metadata !{double %sum_of_squares}, i64 0, metadata !115)
  call void @llvm.dbg.value(metadata !{i32 %dim}, i64 0, metadata !117)
  %tmp.50 = zext i32 %dim to i64, !dbg !116       ; <i64> [#uses=3]
  %tmp.51 = icmp ult i64 %tmp.50, %vector_dims, !dbg !116 ; <i1> [#uses=1]
  br i1 %tmp.51, label %bb2, label %return, !dbg !116

return:                                           ; preds = %bb3
  %sum_of_squares.0.lcssa = phi double [ %sum_of_squares, %bb3 ] ; <double> [#uses=1]
  ret double %sum_of_squares.0.lcssa, !dbg !118
}

define internal fastcc double @insert(i64 %k, [0 x i64]* %neighbours, [0 x double]* %neighbours_dist, i32* %found, i64 %new_neighbour, double %new_neighbour_dist) nounwind inlinehint {
entry:
  call void @llvm.dbg.value(metadata !{i64 %k}, i64 0, metadata !119)
  call void @llvm.dbg.value(metadata !{[0 x i64]* %neighbours}, i64 0, metadata !125)
  call void @llvm.dbg.value(metadata !{[0 x double]* %neighbours_dist}, i64 0, metadata !126)
  call void @llvm.dbg.value(metadata !{i32* %found}, i64 0, metadata !127)
  call void @llvm.dbg.value(metadata !{i64 %new_neighbour}, i64 0, metadata !128)
  call void @llvm.dbg.value(metadata !{double %new_neighbour_dist}, i64 0, metadata !129)
  %0 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x i64]* %neighbours, i64 %k) nounwind, !dbg !130 ; <i32> [#uses=0]
  %1 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x double]* %neighbours_dist, i64 %k) nounwind, !dbg !130 ; <i32> [#uses=0]
  %tmp = icmp eq i64 %k, 0, !dbg !131             ; <i1> [#uses=1]
  br i1 %tmp, label %bb, label %bb1, !dbg !131

bb:                                               ; preds = %entry
  call void @_ssdm_AssertFail(i8* getelementptr inbounds ([6 x i8]* @.str96, i64 0, i64 0), i8* getelementptr inbounds ([37 x i8]* @.str95, i64 0, i64 0), i32 121, i8* getelementptr inbounds ([7 x i8]* @__PRETTY_FUNCTION__.2, i64 0, i64 0)) nounwind
  unreachable, !dbg !131

bb1:                                              ; preds = %entry
  %found.load = load i32* %found, align 4, !dbg !133 ; <i32> [#uses=3]
  %tmp.54 = zext i32 %found.load to i64, !dbg !133 ; <i64> [#uses=2]
  %tmp.55 = icmp ugt i64 %tmp.54, %k, !dbg !133   ; <i1> [#uses=1]
  br i1 %tmp.55, label %bb2, label %bb3, !dbg !133

bb2:                                              ; preds = %bb1
  call void @_ssdm_AssertFail(i8* getelementptr inbounds ([12 x i8]* @.str100, i64 0, i64 0), i8* getelementptr inbounds ([37 x i8]* @.str95, i64 0, i64 0), i32 123, i8* getelementptr inbounds ([7 x i8]* @__PRETTY_FUNCTION__.2, i64 0, i64 0)) nounwind
  unreachable, !dbg !133

bb3:                                              ; preds = %bb1
  %tmp.56 = icmp eq i64 %new_neighbour, 0, !dbg !134 ; <i1> [#uses=1]
  br i1 %tmp.56, label %bb4, label %bb5, !dbg !134

bb4:                                              ; preds = %bb3
  call void @_ssdm_AssertFail(i8* getelementptr inbounds ([29 x i8]* @.str101, i64 0, i64 0), i8* getelementptr inbounds ([37 x i8]* @.str95, i64 0, i64 0), i32 124, i8* getelementptr inbounds ([7 x i8]* @__PRETTY_FUNCTION__.2, i64 0, i64 0)) nounwind
  unreachable, !dbg !134

bb5:                                              ; preds = %bb3
  call void @llvm.dbg.value(metadata !135, i64 0, metadata !136), !dbg !139
  call void @llvm.dbg.value(metadata !140, i64 0, metadata !141), !dbg !142
  %tmp.57 = icmp ult i64 %tmp.54, %k, !dbg !143   ; <i1> [#uses=1]
  %tmp.58 = trunc i64 %k to i32, !dbg !144        ; <i32> [#uses=5]
  br i1 %tmp.57, label %bb6, label %bb22.preheader, !dbg !143

bb22.preheader:                                   ; preds = %bb5
  %tmp.62 = add i64 %k, -1, !dbg !146             ; <i64> [#uses=1]
  %tmp5 = add i32 %tmp.58, -1                     ; <i32> [#uses=1]
  %tmp7 = add i32 %tmp.58, -2                     ; <i32> [#uses=1]
  br label %bb22

bb6:                                              ; preds = %bb5
  %tmp.59 = add i32 %tmp.58, -1, !dbg !144        ; <i32> [#uses=1]
  %tmp.60 = sub i32 %tmp.59, %found.load, !dbg !144 ; <i32> [#uses=2]
  %tmp.61 = add i64 %k, -1, !dbg !148             ; <i64> [#uses=1]
  %tmp12 = add i32 %tmp.58, -2                    ; <i32> [#uses=1]
  %tmp13 = sub i32 %tmp12, %found.load            ; <i32> [#uses=1]
  br label %bb12, !dbg !144

bb7:                                              ; preds = %bb12
  %neighbours_dist.addr = getelementptr inbounds [0 x double]* %neighbours_dist, i64 0, i64 %tmp.64, !dbg !148 ; <double*> [#uses=2]
  %neighbours_dist.load = load double* %neighbours_dist.addr, align 8, !dbg !148 ; <double> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %neighbours_dist.load) nounwind
  %tmp.68 = fcmp olt double %neighbours_dist.load, %new_neighbour_dist, !dbg !148 ; <i1> [#uses=1]
  br i1 %tmp.68, label %bb9, label %bb8, !dbg !148

bb8:                                              ; preds = %bb7
  %found.load.1 = load i32* %found, align 4, !dbg !148 ; <i32> [#uses=1]
  %tmp.71 = zext i32 %found.load.1 to i64, !dbg !148 ; <i64> [#uses=1]
  %tmp.72 = sub i64 %tmp.61, %tmp.71, !dbg !148   ; <i64> [#uses=1]
  %tmp.73 = icmp eq i64 %tmp.64, %tmp.72, !dbg !148 ; <i1> [#uses=1]
  br i1 %tmp.73, label %bb9, label %bb23.loopexit20, !dbg !148

bb9:                                              ; preds = %bb8, %bb7
  %tmp.76 = icmp eq i32 %i.3, 0, !dbg !149        ; <i1> [#uses=1]
  br i1 %tmp.76, label %bb11, label %bb10, !dbg !149

bb10:                                             ; preds = %bb9
  %neighbours.addr = getelementptr inbounds [0 x i64]* %neighbours, i64 0, i64 %tmp.64, !dbg !150 ; <i64*> [#uses=1]
  %neighbours.load = load i64* %neighbours.addr, align 8, !dbg !150 ; <i64> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i64 %neighbours.load) nounwind
  %tmp.78 = zext i32 %tmp14 to i64, !dbg !150     ; <i64> [#uses=2]
  %neighbours.addr.1 = getelementptr inbounds [0 x i64]* %neighbours, i64 0, i64 %tmp.78, !dbg !150 ; <i64*> [#uses=1]
  store i64 %neighbours.load, i64* %neighbours.addr.1, align 8, !dbg !150
  %neighbours_dist.load.2 = load double* %neighbours_dist.addr, align 8, !dbg !151 ; <double> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %neighbours_dist.load.2) nounwind
  %neighbours_dist.addr.2 = getelementptr inbounds [0 x double]* %neighbours_dist, i64 0, i64 %tmp.78, !dbg !151 ; <double*> [#uses=1]
  store double %neighbours_dist.load.2, double* %neighbours_dist.addr.2, align 8, !dbg !151
  br label %bb11, !dbg !151

bb11:                                             ; preds = %bb10, %bb9
  call void @llvm.dbg.value(metadata !{i32 %insert_index.4}, i64 0, metadata !136), !dbg !152
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !141), !dbg !153
  %tmp.81 = add i32 %insert_index.4, 1, !dbg !144 ; <i32> [#uses=1]
  %indvar.next1 = add i32 %indvar9, 1, !dbg !144  ; <i32> [#uses=1]
  br label %bb12, !dbg !144

bb12:                                             ; preds = %bb11, %bb6
  %indvar9 = phi i32 [ %indvar.next1, %bb11 ], [ 0, %bb6 ] ; <i32> [#uses=3]
  %insert_index = phi i32 [ %insert_index.4, %bb11 ], [ -1, %bb6 ] ; <i32> [#uses=2]
  %removed_value = phi double [ 0.000000e+00, %bb11 ], [ -1.000000e+00, %bb6 ] ; <double> [#uses=2]
  %insert_index.4 = phi i32 [ %tmp.81, %bb11 ], [ %tmp.60, %bb6 ] ; <i32> [#uses=2]
  call void @llvm.dbg.value(metadata !{i32 %insert_index}, i64 0, metadata !136)
  call void @llvm.dbg.value(metadata !{double %removed_value}, i64 0, metadata !141)
  call void @llvm.dbg.value(metadata !{i32 %insert_index.4}, i64 0, metadata !154)
  %tmp14 = add i32 %tmp13, %indvar9, !dbg !150    ; <i32> [#uses=1]
  %i.3 = add i32 %tmp.60, %indvar9, !dbg !144     ; <i32> [#uses=2]
  call void @llvm.dbg.value(metadata !{i32 %i.3}, i64 0, metadata !154), !dbg !144
  call void @llvm.dbg.value(metadata !{i32 %i.3}, i64 0, metadata !154), !dbg !144
  %tmp.64 = zext i32 %i.3 to i64, !dbg !144       ; <i64> [#uses=4]
  %tmp.65 = icmp ult i64 %tmp.64, %k, !dbg !144   ; <i1> [#uses=1]
  br i1 %tmp.65, label %bb7, label %bb23.loopexit20, !dbg !144

bb16:                                             ; preds = %bb22
  %tmp.69 = sext i32 %i to i64, !dbg !155         ; <i64> [#uses=2]
  %neighbours_dist.addr.1 = getelementptr inbounds [0 x double]* %neighbours_dist, i64 0, i64 %tmp.69, !dbg !155 ; <double*> [#uses=2]
  %removed_value.4 = load double* %neighbours_dist.addr.1, align 8, !dbg !155 ; <double> [#uses=4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %removed_value.4) nounwind
  %tmp.70 = fcmp ogt double %removed_value.4, %new_neighbour_dist, !dbg !155 ; <i1> [#uses=1]
  br i1 %tmp.70, label %bb17, label %bb23.loopexit, !dbg !155

bb17:                                             ; preds = %bb16
  %tmp.74 = zext i32 %i to i64, !dbg !146         ; <i64> [#uses=1]
  %tmp.75 = icmp eq i64 %tmp.74, %tmp.62, !dbg !146 ; <i1> [#uses=1]
  br i1 %tmp.75, label %bb18, label %bb19, !dbg !146

bb18:                                             ; preds = %bb17
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %removed_value.4) nounwind
  call void @llvm.dbg.value(metadata !{double %removed_value.4}, i64 0, metadata !141), !dbg !156
  br label %bb19, !dbg !156

bb19:                                             ; preds = %bb18, %bb17
  %removed_value.2 = phi double [ %removed_value.4, %bb18 ], [ %removed_value.3, %bb17 ] ; <double> [#uses=1]
  call void @llvm.dbg.value(metadata !{double %removed_value.2}, i64 0, metadata !141)
  %tmp.77 = icmp sgt i32 %i, 0, !dbg !157         ; <i1> [#uses=1]
  br i1 %tmp.77, label %bb20, label %bb22.backedge, !dbg !157

bb20:                                             ; preds = %bb19
  %tmp.80 = sext i32 %tmp8 to i64, !dbg !158      ; <i64> [#uses=2]
  %neighbours.addr.2 = getelementptr inbounds [0 x i64]* %neighbours, i64 0, i64 %tmp.80, !dbg !158 ; <i64*> [#uses=1]
  %neighbours.load.1 = load i64* %neighbours.addr.2, align 8, !dbg !158 ; <i64> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i64 %neighbours.load.1) nounwind
  %neighbours.addr.3 = getelementptr inbounds [0 x i64]* %neighbours, i64 0, i64 %tmp.69, !dbg !158 ; <i64*> [#uses=1]
  store i64 %neighbours.load.1, i64* %neighbours.addr.3, align 8, !dbg !158
  %neighbours_dist.addr.3 = getelementptr inbounds [0 x double]* %neighbours_dist, i64 0, i64 %tmp.80, !dbg !159 ; <double*> [#uses=1]
  %neighbours_dist.load.3 = load double* %neighbours_dist.addr.3, align 8, !dbg !159 ; <double> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %neighbours_dist.load.3) nounwind
  store double %neighbours_dist.load.3, double* %neighbours_dist.addr.1, align 8, !dbg !159
  br label %bb22.backedge, !dbg !159

bb22.backedge:                                    ; preds = %bb20, %bb19
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb22

bb22:                                             ; preds = %bb22.backedge, %bb22.preheader
  %indvar = phi i32 [ %indvar.next, %bb22.backedge ], [ 0, %bb22.preheader ] ; <i32> [#uses=3]
  %insert_index.2 = phi i32 [ %tmp.66, %bb22.backedge ], [ -1, %bb22.preheader ] ; <i32> [#uses=2]
  %removed_value.3 = phi double [ %removed_value.2, %bb22.backedge ], [ -1.000000e+00, %bb22.preheader ] ; <double> [#uses=3]
  %i15.0.in = phi i32 [ %tmp.66, %bb22.backedge ], [ %tmp.58, %bb22.preheader ] ; <i32> [#uses=1]
  %i = sub i32 %tmp5, %indvar, !dbg !160          ; <i32> [#uses=4]
  call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !161)
  call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !161), !dbg !160
  call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !136), !dbg !162
  %tmp8 = sub i32 %tmp7, %indvar, !dbg !158       ; <i32> [#uses=1]
  %tmp.66 = add i32 %i15.0.in, -1, !dbg !160      ; <i32> [#uses=2]
  call void @llvm.dbg.value(metadata !{i32 %insert_index.2}, i64 0, metadata !136)
  call void @llvm.dbg.value(metadata !{double %removed_value.3}, i64 0, metadata !141)
  %tmp.67 = icmp sgt i32 %i, -1, !dbg !160        ; <i1> [#uses=1]
  br i1 %tmp.67, label %bb16, label %bb23.loopexit, !dbg !160

bb23.loopexit:                                    ; preds = %bb22, %bb16
  %removed_value.3.lcssa = phi double [ %removed_value.3, %bb22 ], [ %removed_value.3, %bb16 ] ; <double> [#uses=1]
  %insert_index.2.lcssa = phi i32 [ %insert_index.2, %bb22 ], [ %insert_index.2, %bb16 ] ; <i32> [#uses=1]
  br label %bb23

bb23.loopexit20:                                  ; preds = %bb12, %bb8
  %removed_value.0.lcssa = phi double [ %removed_value, %bb12 ], [ %removed_value, %bb8 ] ; <double> [#uses=1]
  %insert_index.0.lcssa = phi i32 [ %insert_index, %bb12 ], [ %insert_index, %bb8 ] ; <i32> [#uses=1]
  br label %bb23

bb23:                                             ; preds = %bb23.loopexit20, %bb23.loopexit
  %insert_index.1 = phi i32 [ %insert_index.2.lcssa, %bb23.loopexit ], [ %insert_index.0.lcssa, %bb23.loopexit20 ] ; <i32> [#uses=2]
  %removed_value.1 = phi double [ %removed_value.3.lcssa, %bb23.loopexit ], [ %removed_value.0.lcssa, %bb23.loopexit20 ] ; <double> [#uses=2]
  call void @llvm.dbg.value(metadata !{i32 %insert_index.1}, i64 0, metadata !136)
  call void @llvm.dbg.value(metadata !{double %removed_value.1}, i64 0, metadata !141)
  %tmp.79 = icmp sgt i32 %insert_index.1, -1, !dbg !163 ; <i1> [#uses=1]
  br i1 %tmp.79, label %bb24, label %return, !dbg !163

bb24:                                             ; preds = %bb23
  %tmp.82 = sext i32 %insert_index.1 to i64, !dbg !164 ; <i64> [#uses=2]
  %neighbours.addr.4 = getelementptr inbounds [0 x i64]* %neighbours, i64 0, i64 %tmp.82, !dbg !164 ; <i64*> [#uses=1]
  store i64 %new_neighbour, i64* %neighbours.addr.4, align 8, !dbg !164
  %neighbours_dist.addr.4 = getelementptr inbounds [0 x double]* %neighbours_dist, i64 0, i64 %tmp.82, !dbg !165 ; <double*> [#uses=1]
  store double %new_neighbour_dist, double* %neighbours_dist.addr.4, align 8, !dbg !165
  %found.load.2 = load i32* %found, align 4, !dbg !166 ; <i32> [#uses=2]
  %tmp.83 = zext i32 %found.load.2 to i64, !dbg !166 ; <i64> [#uses=1]
  %tmp.84 = icmp ult i64 %tmp.83, %k, !dbg !166   ; <i1> [#uses=1]
  br i1 %tmp.84, label %bb25, label %return, !dbg !166

bb25:                                             ; preds = %bb24
  %tmp.85 = add i32 %found.load.2, 1, !dbg !167   ; <i32> [#uses=1]
  store i32 %tmp.85, i32* %found, align 4, !dbg !167
  ret double %removed_value.1, !dbg !168

return:                                           ; preds = %bb24, %bb23
  ret double %removed_value.1, !dbg !168
}

define internal fastcc void @best_outliers(i64 %N, i64* %outliers_size, [0 x i64]* %outliers, [0 x double]* %outlier_scores, i64 %block_size, [0 x i64]* %current_block, [0 x double]* %scores) nounwind inlinehint {
entry:
  %new_outliers_size = alloca i64, align 8        ; <i64*> [#uses=3]
  call void @llvm.dbg.value(metadata !{i64 %N}, i64 0, metadata !169)
  call void @llvm.dbg.value(metadata !{i64* %outliers_size}, i64 0, metadata !175)
  call void @llvm.dbg.value(metadata !{[0 x i64]* %outliers}, i64 0, metadata !176)
  call void @llvm.dbg.value(metadata !{[0 x double]* %outlier_scores}, i64 0, metadata !177)
  call void @llvm.dbg.value(metadata !{i64 %block_size}, i64 0, metadata !178)
  call void @llvm.dbg.value(metadata !{[0 x i64]* %current_block}, i64 0, metadata !179)
  call void @llvm.dbg.value(metadata !{[0 x double]* %scores}, i64 0, metadata !180)
  call void @llvm.dbg.declare(metadata !{i64* %new_outliers_size}, metadata !181), !dbg !183
  %0 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x double]* %outlier_scores, i64 %N) nounwind, !dbg !184 ; <i32> [#uses=0]
  %1 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x i64]* %outliers, i64 %N) nounwind, !dbg !184 ; <i32> [#uses=0]
  %2 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x double]* %scores, i64 %block_size) nounwind, !dbg !184 ; <i32> [#uses=0]
  %3 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x i64]* %current_block, i64 %block_size) nounwind, !dbg !184 ; <i32> [#uses=0]
  %outliers_size.load = load i64* %outliers_size, align 8, !dbg !185 ; <i64> [#uses=1]
  %tmp = icmp ugt i64 %outliers_size.load, %N, !dbg !185 ; <i1> [#uses=1]
  br i1 %tmp, label %bb, label %bb1, !dbg !185

bb:                                               ; preds = %entry
  call void @_ssdm_AssertFail(i8* getelementptr inbounds ([20 x i8]* @.str102, i64 0, i64 0), i8* getelementptr inbounds ([37 x i8]* @.str95, i64 0, i64 0), i32 250, i8* getelementptr inbounds ([14 x i8]* @__PRETTY_FUNCTION__.3, i64 0, i64 0)) nounwind
  unreachable, !dbg !185

bb1:                                              ; preds = %entry
  %tmp.86 = icmp eq i64 %N, 0, !dbg !186          ; <i1> [#uses=1]
  br i1 %tmp.86, label %bb2, label %bb3, !dbg !186

bb2:                                              ; preds = %bb1
  call void @_ssdm_AssertFail(i8* getelementptr inbounds ([6 x i8]* @.str97, i64 0, i64 0), i8* getelementptr inbounds ([37 x i8]* @.str95, i64 0, i64 0), i32 251, i8* getelementptr inbounds ([14 x i8]* @__PRETTY_FUNCTION__.3, i64 0, i64 0)) nounwind
  unreachable, !dbg !186

bb3:                                              ; preds = %bb1
  %tmp.87 = icmp eq i64 %block_size, 0, !dbg !187 ; <i1> [#uses=1]
  br i1 %tmp.87, label %bb4, label %bb5, !dbg !187

bb4:                                              ; preds = %bb3
  call void @_ssdm_AssertFail(i8* getelementptr inbounds ([15 x i8]* @.str103, i64 0, i64 0), i8* getelementptr inbounds ([37 x i8]* @.str95, i64 0, i64 0), i32 254, i8* getelementptr inbounds ([14 x i8]* @__PRETTY_FUNCTION__.3, i64 0, i64 0)) nounwind
  unreachable, !dbg !187

bb5:                                              ; preds = %bb3
  call fastcc void @sort_vectors_descending(i64 %block_size, [0 x i64]* %current_block, [0 x double]* %scores) nounwind, !dbg !188
  %tmp.88 = trunc i64 %N to i32                   ; <i32> [#uses=1]
  %tmp.89 = shl i32 %tmp.88, 3, !dbg !189         ; <i32> [#uses=2]
  %4 = alloca i8, i32 %tmp.89, align 1, !dbg !189 ; <i8*> [#uses=2]
  %new_outliers.22 = bitcast i8* %4 to [0 x i64]*, !dbg !189 ; <[0 x i64]*> [#uses=2]
  call void @llvm.dbg.value(metadata !{[0 x i64]* %new_outliers.22}, i64 0, metadata !190), !dbg !189
  %5 = alloca i8, i32 %tmp.89, align 1, !dbg !191 ; <i8*> [#uses=2]
  %new_outlier_scores.24 = bitcast i8* %5 to [0 x double]*, !dbg !191 ; <[0 x double]*> [#uses=2]
  call void @llvm.dbg.value(metadata !{[0 x double]* %new_outlier_scores.24}, i64 0, metadata !192), !dbg !191
  store i64 0, i64* %new_outliers_size, align 8, !dbg !193
  %tmp.90 = shl i64 %N, 3, !dbg !194              ; <i64> [#uses=4]
  call void @llvm.memset.i64(i8* %4, i8 0, i64 %tmp.90, i32 1), !dbg !194
  call void @llvm.memset.i64(i8* %5, i8 0, i64 %tmp.90, i32 1), !dbg !195
  %outliers_size.load.1 = load i64* %outliers_size, align 8, !dbg !196 ; <i64> [#uses=1]
  call fastcc void @merge(i64 %N, i64 %outliers_size.load.1, [0 x i64]* %outliers, [0 x double]* %outlier_scores, i64 %block_size, [0 x i64]* %current_block, [0 x double]* %scores, i64* %new_outliers_size, [0 x i64]* %new_outliers.22, [0 x double]* %new_outlier_scores.24) nounwind, !dbg !196
  call void @"memcpy.[0 x i64]P.[0 x i64]P"([0 x i64]* %outliers, [0 x i64]* %new_outliers.22, i64 %tmp.90, i32 1) nounwind, !dbg !197
  call void @"memcpy.[0 x double]P.[0 x double]P"([0 x double]* %outlier_scores, [0 x double]* %new_outlier_scores.24, i64 %tmp.90, i32 1) nounwind, !dbg !198
  %new_outliers_size.load = load i64* %new_outliers_size, align 8, !dbg !199 ; <i64> [#uses=1]
  store i64 %new_outliers_size.load, i64* %outliers_size, align 8, !dbg !199
  ret void, !dbg !200
}

declare void @llvm.stackrestore(i8*) nounwind

define internal fastcc void @sort_vectors_descending(i64 %size, [0 x i64]* %indexes, [0 x double]* %values) nounwind inlinehint {
entry:
  call void @llvm.dbg.value(metadata !{i64 %size}, i64 0, metadata !201)
  call void @llvm.dbg.value(metadata !{[0 x i64]* %indexes}, i64 0, metadata !205)
  call void @llvm.dbg.value(metadata !{[0 x double]* %values}, i64 0, metadata !206)
  %0 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x double]* %values, i64 %size) nounwind, !dbg !207 ; <i32> [#uses=0]
  %1 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x i64]* %indexes, i64 %size) nounwind, !dbg !207 ; <i32> [#uses=0]
  %tmp = icmp eq i64 %size, 0, !dbg !208          ; <i1> [#uses=1]
  br i1 %tmp, label %bb, label %bb7.preheader, !dbg !208

bb7.preheader:                                    ; preds = %entry
  br label %bb7

bb:                                               ; preds = %entry
  call void @_ssdm_AssertFail(i8* getelementptr inbounds ([9 x i8]* @.str104, i64 0, i64 0), i8* getelementptr inbounds ([37 x i8]* @.str95, i64 0, i64 0), i32 290, i8* getelementptr inbounds ([24 x i8]* @__PRETTY_FUNCTION__.4, i64 0, i64 0)) nounwind
  unreachable, !dbg !208

bb2:                                              ; preds = %bb7
  %indexes.addr = getelementptr inbounds [0 x i64]* %indexes, i64 0, i64 %tmp.91, !dbg !210 ; <i64*> [#uses=1]
  %ind = load i64* %indexes.addr, align 8, !dbg !210 ; <i64> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i64 %ind) nounwind
  call void @llvm.dbg.value(metadata !{i64 %ind}, i64 0, metadata !212), !dbg !210
  %values.addr = getelementptr inbounds [0 x double]* %values, i64 0, i64 %tmp.91, !dbg !213 ; <double*> [#uses=1]
  %val = load double* %values.addr, align 8, !dbg !213 ; <double> [#uses=3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %val) nounwind
  call void @llvm.dbg.value(metadata !{double %val}, i64 0, metadata !214), !dbg !213
  br label %bb5, !dbg !215

bb3:                                              ; preds = %bb5
  %tmp.94 = sext i32 %j to i64, !dbg !216         ; <i64> [#uses=2]
  %values.addr.1 = getelementptr inbounds [0 x double]* %values, i64 0, i64 %tmp.94, !dbg !216 ; <double*> [#uses=2]
  %values.load = load double* %values.addr.1, align 8, !dbg !216 ; <double> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %values.load) nounwind
  %tmp.95 = fcmp ult double %values.load, %val, !dbg !216 ; <i1> [#uses=1]
  br i1 %tmp.95, label %bb4, label %bb6, !dbg !216

bb4:                                              ; preds = %bb3
  %indexes.addr.2 = getelementptr inbounds [0 x i64]* %indexes, i64 0, i64 %tmp.94, !dbg !217 ; <i64*> [#uses=1]
  %indexes.load = load i64* %indexes.addr.2, align 8, !dbg !217 ; <i64> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i64 %indexes.load) nounwind
  %tmp.98 = sext i32 %i.5 to i64, !dbg !217       ; <i64> [#uses=2]
  %indexes.addr.3 = getelementptr inbounds [0 x i64]* %indexes, i64 0, i64 %tmp.98, !dbg !217 ; <i64*> [#uses=1]
  store i64 %indexes.load, i64* %indexes.addr.3, align 8, !dbg !217
  %values.load.1 = load double* %values.addr.1, align 8, !dbg !218 ; <double> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %values.load.1) nounwind
  %values.addr.3 = getelementptr inbounds [0 x double]* %values, i64 0, i64 %tmp.98, !dbg !218 ; <double*> [#uses=1]
  store double %values.load.1, double* %values.addr.3, align 8, !dbg !218
  %indvar.next = add i32 %indvar, 1, !dbg !215    ; <i32> [#uses=1]
  br label %bb5, !dbg !215

bb5:                                              ; preds = %bb4, %bb2
  %indvar = phi i32 [ %indvar.next, %bb4 ], [ 0, %bb2 ] ; <i32> [#uses=3]
  %i.5 = sub i32 %i, %indvar, !dbg !215           ; <i32> [#uses=3]
  call void @llvm.dbg.value(metadata !{i32 %i.5}, i64 0, metadata !219), !dbg !220
  %j = sub i32 %tmp2, %indvar, !dbg !215          ; <i32> [#uses=2]
  call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !221)
  call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !221), !dbg !215
  %tmp.93 = icmp sgt i32 %j, -1, !dbg !215        ; <i1> [#uses=1]
  br i1 %tmp.93, label %bb3, label %bb6, !dbg !215

bb6:                                              ; preds = %bb5, %bb3
  %j.0.in.lcssa = phi i32 [ %i.5, %bb5 ], [ %i.5, %bb3 ] ; <i32> [#uses=1]
  %tmp.96 = sext i32 %j.0.in.lcssa to i64, !dbg !222 ; <i64> [#uses=2]
  %indexes.addr.1 = getelementptr inbounds [0 x i64]* %indexes, i64 0, i64 %tmp.96, !dbg !222 ; <i64*> [#uses=1]
  store i64 %ind, i64* %indexes.addr.1, align 8, !dbg !222
  %values.addr.2 = getelementptr inbounds [0 x double]* %values, i64 0, i64 %tmp.96, !dbg !223 ; <double*> [#uses=1]
  store double %val, double* %values.addr.2, align 8, !dbg !223
  %tmp.97 = add i32 %i, 1, !dbg !220              ; <i32> [#uses=1]
  br label %bb7, !dbg !220

bb7:                                              ; preds = %bb6, %bb7.preheader
  %i = phi i32 [ %tmp.97, %bb6 ], [ 0, %bb7.preheader ] ; <i32> [#uses=4]
  call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !219)
  %tmp2 = add i32 %i, -1                          ; <i32> [#uses=1]
  %tmp.91 = zext i32 %i to i64, !dbg !220         ; <i64> [#uses=3]
  %tmp.92 = icmp ult i64 %tmp.91, %size, !dbg !220 ; <i1> [#uses=1]
  br i1 %tmp.92, label %bb2, label %return, !dbg !220

return:                                           ; preds = %bb7
  ret void, !dbg !224
}

define internal fastcc void @merge(i64 %N, i64 %global_outliers_size, [0 x i64]* %global_outliers, [0 x double]* %global_outlier_scores, i64 %block_size, [0 x i64]* %local_outliers, [0 x double]* %local_outlier_scores, i64* %new_outliers_size, [0 x i64]* %new_outliers, [0 x double]* %new_outlier_scores) nounwind inlinehint {
entry:
  call void @llvm.dbg.value(metadata !{i64 %N}, i64 0, metadata !225)
  call void @llvm.dbg.value(metadata !{i64 %global_outliers_size}, i64 0, metadata !229)
  call void @llvm.dbg.value(metadata !{[0 x i64]* %global_outliers}, i64 0, metadata !230)
  call void @llvm.dbg.value(metadata !{[0 x double]* %global_outlier_scores}, i64 0, metadata !231)
  call void @llvm.dbg.value(metadata !{i64 %block_size}, i64 0, metadata !232)
  call void @llvm.dbg.value(metadata !{[0 x i64]* %local_outliers}, i64 0, metadata !233)
  call void @llvm.dbg.value(metadata !{[0 x double]* %local_outlier_scores}, i64 0, metadata !234)
  call void @llvm.dbg.value(metadata !{i64* %new_outliers_size}, i64 0, metadata !235)
  call void @llvm.dbg.value(metadata !{[0 x i64]* %new_outliers}, i64 0, metadata !236)
  call void @llvm.dbg.value(metadata !{[0 x double]* %new_outlier_scores}, i64 0, metadata !237)
  %0 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x i64]* %local_outliers, i64 %block_size) nounwind, !dbg !238 ; <i32> [#uses=0]
  %1 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x i64]* %new_outliers, i64 %N) nounwind, !dbg !238 ; <i32> [#uses=0]
  %2 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x double]* %global_outlier_scores, i64 %N) nounwind, !dbg !238 ; <i32> [#uses=0]
  %3 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x i64]* %global_outliers, i64 %N) nounwind, !dbg !238 ; <i32> [#uses=0]
  %4 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x double]* %new_outlier_scores, i64 %N) nounwind, !dbg !238 ; <i32> [#uses=0]
  %5 = call i32 (...)* @_ssdm_SpecArrayDimSize([0 x double]* %local_outlier_scores, i64 %block_size) nounwind, !dbg !238 ; <i32> [#uses=0]
  %tmp = icmp ugt i64 %global_outliers_size, %N, !dbg !239 ; <i1> [#uses=1]
  br i1 %tmp, label %bb, label %bb1, !dbg !239

bb:                                               ; preds = %entry
  call void @_ssdm_AssertFail(i8* getelementptr inbounds ([26 x i8]* @.str105, i64 0, i64 0), i8* getelementptr inbounds ([37 x i8]* @.str95, i64 0, i64 0), i32 335, i8* getelementptr inbounds ([6 x i8]* @__PRETTY_FUNCTION__.5, i64 0, i64 0)) nounwind
  unreachable, !dbg !239

bb1:                                              ; preds = %entry
  %tmp.99 = icmp eq i64 %N, 0, !dbg !241          ; <i1> [#uses=1]
  br i1 %tmp.99, label %bb2, label %bb3, !dbg !241

bb2:                                              ; preds = %bb1
  call void @_ssdm_AssertFail(i8* getelementptr inbounds ([6 x i8]* @.str97, i64 0, i64 0), i8* getelementptr inbounds ([37 x i8]* @.str95, i64 0, i64 0), i32 336, i8* getelementptr inbounds ([6 x i8]* @__PRETTY_FUNCTION__.5, i64 0, i64 0)) nounwind
  unreachable, !dbg !241

bb3:                                              ; preds = %bb1
  %tmp.100 = icmp eq i64 %block_size, 0, !dbg !242 ; <i1> [#uses=1]
  br i1 %tmp.100, label %bb4, label %bb19.preheader, !dbg !242

bb19.preheader:                                   ; preds = %bb3
  br label %bb19

bb4:                                              ; preds = %bb3
  call void @_ssdm_AssertFail(i8* getelementptr inbounds ([15 x i8]* @.str103, i64 0, i64 0), i8* getelementptr inbounds ([37 x i8]* @.str95, i64 0, i64 0), i32 339, i8* getelementptr inbounds ([6 x i8]* @__PRETTY_FUNCTION__.5, i64 0, i64 0)) nounwind
  unreachable, !dbg !242

bb6:                                              ; preds = %bb21
  br i1 %tmp.104, label %bb10, label %bb7, !dbg !243

bb7:                                              ; preds = %bb6
  %tmp.107 = zext i32 %local to i64, !dbg !243    ; <i64> [#uses=3]
  %tmp.108 = icmp ult i64 %tmp.107, %block_size, !dbg !243 ; <i1> [#uses=1]
  br i1 %tmp.108, label %bb8, label %bb9, !dbg !243

bb8:                                              ; preds = %bb7
  %local_outliers.addr = getelementptr inbounds [0 x i64]* %local_outliers, i64 0, i64 %tmp.107, !dbg !244 ; <i64*> [#uses=1]
  %local_outliers.load = load i64* %local_outliers.addr, align 8, !dbg !244 ; <i64> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i64 %local_outliers.load) nounwind
  %new_outliers.addr = getelementptr inbounds [0 x i64]* %new_outliers, i64 0, i64 %tmp.101, !dbg !244 ; <i64*> [#uses=1]
  store i64 %local_outliers.load, i64* %new_outliers.addr, align 8, !dbg !244
  %local_outlier_scores.addr = getelementptr inbounds [0 x double]* %local_outlier_scores, i64 0, i64 %tmp.107, !dbg !245 ; <double*> [#uses=1]
  %local_outlier_scores.load = load double* %local_outlier_scores.addr, align 8, !dbg !245 ; <double> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %local_outlier_scores.load) nounwind
  %new_outlier_scores.addr = getelementptr inbounds [0 x double]* %new_outlier_scores, i64 0, i64 %tmp.101, !dbg !245 ; <double*> [#uses=1]
  store double %local_outlier_scores.load, double* %new_outlier_scores.addr, align 8, !dbg !245
  %local.1 = add i32 %local, 1, !dbg !246         ; <i32> [#uses=1]
  call void @llvm.dbg.value(metadata !{i32 %local.1}, i64 0, metadata !247), !dbg !246
  %global.1 = add i32 %global, 1, !dbg !248       ; <i32> [#uses=1]
  call void @llvm.dbg.value(metadata !{i32 %global.1}, i64 0, metadata !249), !dbg !248
  br label %bb18, !dbg !248

bb9:                                              ; preds = %bb7
  br i1 %tmp.104, label %bb10, label %bb13, !dbg !250

bb10:                                             ; preds = %bb20, %bb9, %bb6
  %tmp.111 = zext i32 %local to i64, !dbg !250    ; <i64> [#uses=1]
  %tmp.112 = icmp ult i64 %tmp.111, %block_size, !dbg !250 ; <i1> [#uses=1]
  br i1 %tmp.112, label %bb12, label %bb11, !dbg !250

bb11:                                             ; preds = %bb10
  %global_outliers.addr = getelementptr inbounds [0 x i64]* %global_outliers, i64 0, i64 %tmp.103, !dbg !251 ; <i64*> [#uses=1]
  %global_outliers.load = load i64* %global_outliers.addr, align 8, !dbg !251 ; <i64> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i64 %global_outliers.load) nounwind
  %new_outliers.addr.1 = getelementptr inbounds [0 x i64]* %new_outliers, i64 0, i64 %tmp.101, !dbg !251 ; <i64*> [#uses=1]
  store i64 %global_outliers.load, i64* %new_outliers.addr.1, align 8, !dbg !251
  %global_outlier_scores.addr = getelementptr inbounds [0 x double]* %global_outlier_scores, i64 0, i64 %tmp.103, !dbg !252 ; <double*> [#uses=1]
  %global_outlier_scores.load = load double* %global_outlier_scores.addr, align 8, !dbg !252 ; <double> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %global_outlier_scores.load) nounwind
  %new_outlier_scores.addr.1 = getelementptr inbounds [0 x double]* %new_outlier_scores, i64 0, i64 %tmp.101, !dbg !252 ; <double*> [#uses=1]
  store double %global_outlier_scores.load, double* %new_outlier_scores.addr.1, align 8, !dbg !252
  %local.2 = add i32 %local, 1, !dbg !253         ; <i32> [#uses=1]
  call void @llvm.dbg.value(metadata !{i32 %local.2}, i64 0, metadata !247), !dbg !253
  %global.2 = add i32 %global, 1, !dbg !254       ; <i32> [#uses=1]
  call void @llvm.dbg.value(metadata !{i32 %global.2}, i64 0, metadata !249), !dbg !254
  br label %bb18, !dbg !254

bb12:                                             ; preds = %bb10
  br i1 %tmp.104, label %bb14, label %bb13, !dbg !255

bb13:                                             ; preds = %bb12, %bb9
  %tmp.115 = zext i32 %local to i64, !dbg !255    ; <i64> [#uses=1]
  %tmp.116 = icmp ult i64 %tmp.115, %block_size, !dbg !255 ; <i1> [#uses=1]
  br i1 %tmp.116, label %bb14, label %return, !dbg !255

bb14:                                             ; preds = %bb13, %bb12
  %global_outlier_scores.addr.1 = getelementptr inbounds [0 x double]* %global_outlier_scores, i64 0, i64 %tmp.103, !dbg !256 ; <double*> [#uses=2]
  %global_outlier_scores.load.1 = load double* %global_outlier_scores.addr.1, align 8, !dbg !256 ; <double> [#uses=4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %global_outlier_scores.load.1) nounwind
  %tmp.117 = zext i32 %local to i64, !dbg !256    ; <i64> [#uses=2]
  %local_outlier_scores.addr.1 = getelementptr inbounds [0 x double]* %local_outlier_scores, i64 0, i64 %tmp.117, !dbg !256 ; <double*> [#uses=2]
  %local_outlier_scores.load.1 = load double* %local_outlier_scores.addr.1, align 8, !dbg !256 ; <double> [#uses=4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %local_outlier_scores.load.1) nounwind
  %tmp.118 = fcmp ult double %global_outlier_scores.load.1, %local_outlier_scores.load.1, !dbg !256 ; <i1> [#uses=1]
  br i1 %tmp.118, label %bb16, label %bb15, !dbg !256

bb15:                                             ; preds = %bb14
  %global_outliers.addr.1 = getelementptr inbounds [0 x i64]* %global_outliers, i64 0, i64 %tmp.103, !dbg !257 ; <i64*> [#uses=1]
  %global_outliers.load.1 = load i64* %global_outliers.addr.1, align 8, !dbg !257 ; <i64> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i64 %global_outliers.load.1) nounwind
  %new_outliers.addr.2 = getelementptr inbounds [0 x i64]* %new_outliers, i64 0, i64 %tmp.101, !dbg !257 ; <i64*> [#uses=1]
  store i64 %global_outliers.load.1, i64* %new_outliers.addr.2, align 8, !dbg !257
  %global_outlier_scores.load.2 = load double* %global_outlier_scores.addr.1, align 8, !dbg !258 ; <double> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %global_outlier_scores.load.2) nounwind
  %new_outlier_scores.addr.2 = getelementptr inbounds [0 x double]* %new_outlier_scores, i64 0, i64 %tmp.101, !dbg !258 ; <double*> [#uses=1]
  store double %global_outlier_scores.load.2, double* %new_outlier_scores.addr.2, align 8, !dbg !258
  %global.3 = add i32 %global, 1, !dbg !259       ; <i32> [#uses=1]
  call void @llvm.dbg.value(metadata !{i32 %global.3}, i64 0, metadata !249), !dbg !259
  br label %bb18, !dbg !259

bb16:                                             ; preds = %bb14
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %global_outlier_scores.load.1) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %local_outlier_scores.load.1) nounwind
  %tmp.119 = fcmp ugt double %global_outlier_scores.load.1, %local_outlier_scores.load.1, !dbg !260 ; <i1> [#uses=1]
  br i1 %tmp.119, label %bb18, label %bb17, !dbg !260

bb17:                                             ; preds = %bb16
  %local_outliers.addr.1 = getelementptr inbounds [0 x i64]* %local_outliers, i64 0, i64 %tmp.117, !dbg !261 ; <i64*> [#uses=1]
  %local_outliers.load.1 = load i64* %local_outliers.addr.1, align 8, !dbg !261 ; <i64> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i64 %local_outliers.load.1) nounwind
  %new_outliers.addr.3 = getelementptr inbounds [0 x i64]* %new_outliers, i64 0, i64 %tmp.101, !dbg !261 ; <i64*> [#uses=1]
  store i64 %local_outliers.load.1, i64* %new_outliers.addr.3, align 8, !dbg !261
  %local_outlier_scores.load.2 = load double* %local_outlier_scores.addr.1, align 8, !dbg !262 ; <double> [#uses=2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(double %local_outlier_scores.load.2) nounwind
  %new_outlier_scores.addr.3 = getelementptr inbounds [0 x double]* %new_outlier_scores, i64 0, i64 %tmp.101, !dbg !262 ; <double*> [#uses=1]
  store double %local_outlier_scores.load.2, double* %new_outlier_scores.addr.3, align 8, !dbg !262
  %local.3 = add i32 %local, 1, !dbg !263         ; <i32> [#uses=1]
  call void @llvm.dbg.value(metadata !{i32 %local.3}, i64 0, metadata !247), !dbg !263
  br label %bb18, !dbg !263

bb18:                                             ; preds = %bb17, %bb16, %bb15, %bb11, %bb8
  %global.5 = phi i32 [ %global.3, %bb15 ], [ %global, %bb17 ], [ %global.2, %bb11 ], [ %global.1, %bb8 ], [ %global, %bb16 ] ; <i32> [#uses=1]
  %local.5 = phi i32 [ %local, %bb15 ], [ %local.3, %bb17 ], [ %local.2, %bb11 ], [ %local.1, %bb8 ], [ %local, %bb16 ] ; <i32> [#uses=1]
  call void @llvm.dbg.value(metadata !{i32 %global.5}, i64 0, metadata !249)
  call void @llvm.dbg.value(metadata !{i32 %local.5}, i64 0, metadata !247)
  %iter.1 = add i32 %iter, 1, !dbg !264           ; <i32> [#uses=1]
  call void @llvm.dbg.value(metadata !{i32 %iter.1}, i64 0, metadata !265), !dbg !264
  %new_outliers_size.load = load i64* %new_outliers_size, align 8, !dbg !266 ; <i64> [#uses=1]
  %tmp.123 = add i64 %new_outliers_size.load, 1, !dbg !266 ; <i64> [#uses=1]
  br label %bb19, !dbg !266

bb19:                                             ; preds = %bb18, %bb19.preheader
  %storemerge = phi i64 [ %tmp.123, %bb18 ], [ 0, %bb19.preheader ] ; <i64> [#uses=1]
  %iter = phi i32 [ %iter.1, %bb18 ], [ 0, %bb19.preheader ] ; <i32> [#uses=2]
  %global = phi i32 [ %global.5, %bb18 ], [ 0, %bb19.preheader ] ; <i32> [#uses=6]
  %local = phi i32 [ %local.5, %bb18 ], [ 0, %bb19.preheader ] ; <i32> [#uses=10]
  store i64 %storemerge, i64* %new_outliers_size, align 8, !dbg !267
  call void @llvm.dbg.value(metadata !{i32 %iter}, i64 0, metadata !265)
  call void @llvm.dbg.value(metadata !{i32 %global}, i64 0, metadata !249)
  call void @llvm.dbg.value(metadata !{i32 %local}, i64 0, metadata !247)
  %tmp.101 = zext i32 %iter to i64, !dbg !268     ; <i64> [#uses=9]
  %tmp.102 = icmp ult i64 %tmp.101, %N, !dbg !268 ; <i1> [#uses=1]
  br i1 %tmp.102, label %bb20, label %return, !dbg !268

bb20:                                             ; preds = %bb19
  %tmp.103 = zext i32 %global to i64, !dbg !268   ; <i64> [#uses=5]
  %tmp.104 = icmp ult i64 %tmp.103, %global_outliers_size, !dbg !268 ; <i1> [#uses=4]
  br i1 %tmp.104, label %bb10, label %bb21, !dbg !268

bb21:                                             ; preds = %bb20
  %tmp.105 = zext i32 %local to i64, !dbg !268    ; <i64> [#uses=1]
  %tmp.106 = icmp ult i64 %tmp.105, %block_size, !dbg !268 ; <i1> [#uses=1]
  br i1 %tmp.106, label %bb6, label %return, !dbg !268

return:                                           ; preds = %bb21, %bb19, %bb13
  ret void, !dbg !269
}

declare void @"memcpy.[0 x double]P.[0 x double]P"([0 x double]*, [0 x double]*, i64, i32)

declare void @"memcpy.[0 x i64]P.[0 x i64]P"([0 x i64]*, [0 x i64]*, i64, i32)

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @_ssdm_SpecKeepArrayLoad(...)

declare i32 @_ssdm_op_SpecLoopBegin(...)

declare void @_ssdm_AssertFail(i8*, i8*, i32, i8*)

declare i32 @_ssdm_op_SpecRegionBegin(...)

declare i32 @_ssdm_op_SpecRegionEnd(...)

declare i32 @_ssdm_op_SpecRegionEnd.restore(...)

!llvm.dbg.gv = !{!0, !5}

!0 = metadata !{i32 458804, i32 0, metadata !1, metadata !"null_index", metadata !"null_index", metadata !"", metadata !2, i32 72, metadata !3, i1 true, i1 true, i64* @null_index} ; [ DW_TAG_variable ]
!1 = metadata !{i32 458769, i32 0, i32 1, metadata !"top_n_outlier_pruning_block.pragma.2.c", metadata !"/home/joshua/Documents/University/Thesis/Code/TopN_Outlier_Pruning_Block/AutoESL/solution1/.autopilot/db", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!2 = metadata !{i32 458769, i32 0, i32 1, metadata !"utility.h", metadata !"/home/joshua/Documents/University/Thesis/Code/TopN_Outlier_Pruning_Block/source", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 458774, metadata !1, metadata !"index_t", metadata !2, i32 68, i64 0, i64 0, i64 0, i32 0, metadata !4} ; [ DW_TAG_typedef ]
!4 = metadata !{i32 458788, metadata !1, metadata !"long unsigned int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!5 = metadata !{i32 458804, i32 0, metadata !1, metadata !"start_index", metadata !"start_index", metadata !"", metadata !2, i32 73, metadata !3, i1 true, i1 true, i64* @start_index} ; [ DW_TAG_variable ]
!6 = metadata !{i32 459009, metadata !7, metadata !"num_vectors", metadata !8, i32 401, metadata !11} ; [ DW_TAG_arg_variable ]
!7 = metadata !{i32 458798, i32 0, metadata !1, metadata !"top_n_outlier_pruning_block", metadata !"top_n_outlier_pruning_block", metadata !"top_n_outlier_pruning_block", metadata !8, i32 404, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!8 = metadata !{i32 458769, i32 0, i32 1, metadata !"top_n_outlier_pruning_block.c", metadata !"/home/joshua/Documents/University/Thesis/Code/TopN_Outlier_Pruning_Block/source", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!9 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null} ; [ DW_TAG_subroutine_type ]
!10 = metadata !{null, metadata !11, metadata !11, metadata !13, metadata !11, metadata !11, metadata !11, metadata !20, metadata !24}
!11 = metadata !{i32 458774, metadata !1, metadata !"size_t", metadata !12, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !4} ; [ DW_TAG_typedef ]
!12 = metadata !{i32 458769, i32 0, i32 1, metadata !"stddef.h", metadata !"/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!13 = metadata !{i32 458790, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_const_type ]
!14 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ]
!15 = metadata !{i32 458753, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16, metadata !18, i32 0, null} ; [ DW_TAG_array_type ]
!16 = metadata !{i32 458774, metadata !1, metadata !"double_t", metadata !2, i32 69, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ]
!17 = metadata !{i32 458788, metadata !1, metadata !"double", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!18 = metadata !{metadata !19, metadata !19}
!19 = metadata !{i32 458785, i64 0, i64 0}        ; [ DW_TAG_subrange_type ]
!20 = metadata !{i32 458790, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_const_type ]
!21 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ]
!22 = metadata !{i32 458753, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !3, metadata !23, i32 0, null} ; [ DW_TAG_array_type ]
!23 = metadata !{metadata !19}
!24 = metadata !{i32 458790, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !25} ; [ DW_TAG_const_type ]
!25 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !26} ; [ DW_TAG_pointer_type ]
!26 = metadata !{i32 458753, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16, metadata !23, i32 0, null} ; [ DW_TAG_array_type ]
!27 = metadata !{i32 459009, metadata !7, metadata !"vector_dims", metadata !8, i32 401, metadata !11} ; [ DW_TAG_arg_variable ]
!28 = metadata !{i32 459009, metadata !7, metadata !"data", metadata !8, i32 402, metadata !13} ; [ DW_TAG_arg_variable ]
!29 = metadata !{i32 459009, metadata !7, metadata !"k", metadata !8, i32 403, metadata !11} ; [ DW_TAG_arg_variable ]
!30 = metadata !{i32 459009, metadata !7, metadata !"N", metadata !8, i32 403, metadata !11} ; [ DW_TAG_arg_variable ]
!31 = metadata !{i32 459009, metadata !7, metadata !"default_block_size", metadata !8, i32 403, metadata !11} ; [ DW_TAG_arg_variable ]
!32 = metadata !{i32 459009, metadata !7, metadata !"outliers", metadata !8, i32 404, metadata !20} ; [ DW_TAG_arg_variable ]
!33 = metadata !{i32 459009, metadata !7, metadata !"outlier_scores", metadata !8, i32 404, metadata !24} ; [ DW_TAG_arg_variable ]
!34 = metadata !{i32 459008, metadata !35, metadata !"outliers_found", metadata !8, i32 419, metadata !11} ; [ DW_TAG_auto_variable ]
!35 = metadata !{i32 458763, metadata !7, i32 404, i32 0} ; [ DW_TAG_lexical_block ]
!36 = metadata !{i32 404, i32 0, metadata !35, null}
!37 = metadata !{i32 404, i32 0, metadata !7, null}
!38 = metadata !{i32 407, i32 0, metadata !35, null}
!39 = metadata !{i32 408, i32 0, metadata !35, null}
!40 = metadata !{i32 409, i32 0, metadata !35, null}
!41 = metadata !{i32 410, i32 0, metadata !35, null}
!42 = metadata !{i32 415, i32 0, metadata !35, null}
!43 = metadata !{i32 416, i32 0, metadata !35, null}
!44 = metadata !{double 0.000000e+00}
!45 = metadata !{i32 459008, metadata !35, metadata !"cutoff", metadata !8, i32 418, metadata !16} ; [ DW_TAG_auto_variable ]
!46 = metadata !{i32 418, i32 0, metadata !35, null}
!47 = metadata !{i32 419, i32 0, metadata !35, null}
!48 = metadata !{i64 0}
!49 = metadata !{i32 459008, metadata !35, metadata !"block_begin", metadata !8, i32 422, metadata !3} ; [ DW_TAG_auto_variable ]
!50 = metadata !{i32 425, i32 0, metadata !35, null}
!51 = metadata !{i32 441, i32 0, metadata !52, null}
!52 = metadata !{i32 458763, metadata !35, i32 425, i32 0} ; [ DW_TAG_lexical_block ]
!53 = metadata !{i32 457, i32 0, metadata !54, null}
!54 = metadata !{i32 458763, metadata !55, i32 452, i32 0} ; [ DW_TAG_lexical_block ]
!55 = metadata !{i32 458763, metadata !56, i32 449, i32 0} ; [ DW_TAG_lexical_block ]
!56 = metadata !{i32 458763, metadata !52, i32 447, i32 0} ; [ DW_TAG_lexical_block ]
!57 = metadata !{i32 470, i32 0, metadata !54, null}
!58 = metadata !{i32 493, i32 0, metadata !52, null}
!59 = metadata !{i32 426, i32 0, metadata !52, null}
!60 = metadata !{i32 459008, metadata !35, metadata !"block_size", metadata !8, i32 423, metadata !11} ; [ DW_TAG_auto_variable ]
!61 = metadata !{i32 427, i32 0, metadata !52, null}
!62 = metadata !{i32 429, i32 0, metadata !52, null}
!63 = metadata !{i32 459008, metadata !7, metadata !"current_block.169", metadata !8, i32 429, metadata !64} ; [ DW_TAG_auto_variable ]
!64 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !22} ; [ DW_TAG_pointer_type ]
!65 = metadata !{i32 430, i32 0, metadata !52, null}
!66 = metadata !{i32 431, i32 0, metadata !52, null}
!67 = metadata !{i32 432, i32 0, metadata !52, null}
!68 = metadata !{i32 459008, metadata !7, metadata !"score.180", metadata !8, i32 432, metadata !69} ; [ DW_TAG_auto_variable ]
!69 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !26} ; [ DW_TAG_pointer_type ]
!70 = metadata !{i32 433, i32 0, metadata !52, null}
!71 = metadata !{i32 459008, metadata !7, metadata !"found.183", metadata !8, i32 433, metadata !72} ; [ DW_TAG_auto_variable ]
!72 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !73} ; [ DW_TAG_pointer_type ]
!73 = metadata !{i32 458753, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !74, metadata !23, i32 0, null} ; [ DW_TAG_array_type ]
!74 = metadata !{i32 458774, metadata !1, metadata !"uint_t", metadata !2, i32 67, i64 0, i64 0, i64 0, i32 0, metadata !75} ; [ DW_TAG_typedef ]
!75 = metadata !{i32 458788, metadata !1, metadata !"unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!76 = metadata !{i32 0}
!77 = metadata !{i32 459008, metadata !78, metadata !"i", metadata !8, i32 437, metadata !74} ; [ DW_TAG_auto_variable ]
!78 = metadata !{i32 458763, metadata !52, i32 433, i32 0} ; [ DW_TAG_lexical_block ]
!79 = metadata !{i32 438, i32 0, metadata !78, null}
!80 = metadata !{i32 439, i32 0, metadata !78, null}
!81 = metadata !{i32 442, i32 0, metadata !52, null}
!82 = metadata !{i32 443, i32 0, metadata !52, null}
!83 = metadata !{i32 444, i32 0, metadata !52, null}
!84 = metadata !{i32 459008, metadata !52, metadata !"vector1", metadata !8, i32 446, metadata !3} ; [ DW_TAG_auto_variable ]
!85 = metadata !{i32 447, i32 0, metadata !52, null}
!86 = metadata !{i32 450, i32 0, metadata !55, null}
!87 = metadata !{i32 459008, metadata !55, metadata !"vector2", metadata !8, i32 450, metadata !3} ; [ DW_TAG_auto_variable ]
!88 = metadata !{i32 452, i32 0, metadata !55, null}
!89 = metadata !{i32 459008, metadata !54, metadata !"dist_squared", metadata !8, i32 457, metadata !16} ; [ DW_TAG_auto_variable ]
!90 = metadata !{i32 464, i32 0, metadata !54, null}
!91 = metadata !{i32 459008, metadata !54, metadata !"removed_distance", metadata !8, i32 464, metadata !16} ; [ DW_TAG_auto_variable ]
!92 = metadata !{i32 469, i32 0, metadata !54, null}
!93 = metadata !{i32 476, i32 0, metadata !54, null}
!94 = metadata !{i32 477, i32 0, metadata !54, null}
!95 = metadata !{i32 478, i32 0, metadata !54, null}
!96 = metadata !{i32 449, i32 0, metadata !56, null}
!97 = metadata !{i32 459008, metadata !56, metadata !"block_index", metadata !8, i32 448, metadata !74} ; [ DW_TAG_auto_variable ]
!98 = metadata !{i32 486, i32 0, metadata !52, null}
!99 = metadata !{i32 554, i32 0, metadata !35, null}
!100 = metadata !{i32 459009, metadata !101, metadata !"vector_dims", metadata !8, i32 75, metadata !11} ; [ DW_TAG_arg_variable ]
!101 = metadata !{i32 458798, i32 0, metadata !1, metadata !"distance_squared", metadata !"distance_squared", metadata !"distance_squared", metadata !8, i32 77, metadata !102, i1 true, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!102 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !103, i32 0, null} ; [ DW_TAG_subroutine_type ]
!103 = metadata !{metadata !16, metadata !11, metadata !24, metadata !24}
!104 = metadata !{i32 459009, metadata !101, metadata !"vector1", metadata !8, i32 76, metadata !24} ; [ DW_TAG_arg_variable ]
!105 = metadata !{i32 459009, metadata !101, metadata !"vector2", metadata !8, i32 77, metadata !24} ; [ DW_TAG_arg_variable ]
!106 = metadata !{i32 77, i32 0, metadata !101, null}
!107 = metadata !{i32 80, i32 0, metadata !108, null}
!108 = metadata !{i32 458763, metadata !101, i32 77, i32 0} ; [ DW_TAG_lexical_block ]
!109 = metadata !{i32 88, i32 0, metadata !110, null}
!110 = metadata !{i32 458763, metadata !108, i32 87, i32 0} ; [ DW_TAG_lexical_block ]
!111 = metadata !{i32 459008, metadata !110, metadata !"val", metadata !8, i32 88, metadata !16} ; [ DW_TAG_auto_variable ]
!112 = metadata !{i32 89, i32 0, metadata !110, null}
!113 = metadata !{i32 459008, metadata !110, metadata !"val_squared", metadata !8, i32 89, metadata !16} ; [ DW_TAG_auto_variable ]
!114 = metadata !{i32 90, i32 0, metadata !110, null}
!115 = metadata !{i32 459008, metadata !108, metadata !"sum_of_squares", metadata !8, i32 84, metadata !16} ; [ DW_TAG_auto_variable ]
!116 = metadata !{i32 87, i32 0, metadata !108, null}
!117 = metadata !{i32 459008, metadata !108, metadata !"dim", metadata !8, i32 86, metadata !74} ; [ DW_TAG_auto_variable ]
!118 = metadata !{i32 93, i32 0, metadata !108, null}
!119 = metadata !{i32 459009, metadata !120, metadata !"k", metadata !8, i32 112, metadata !11} ; [ DW_TAG_arg_variable ]
!120 = metadata !{i32 458798, i32 0, metadata !1, metadata !"insert", metadata !"insert", metadata !"insert", metadata !8, i32 117, metadata !121, i1 true, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!121 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !122, i32 0, null} ; [ DW_TAG_subroutine_type ]
!122 = metadata !{metadata !16, metadata !11, metadata !20, metadata !24, metadata !123, metadata !3, metadata !16}
!123 = metadata !{i32 458790, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !124} ; [ DW_TAG_const_type ]
!124 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !74} ; [ DW_TAG_pointer_type ]
!125 = metadata !{i32 459009, metadata !120, metadata !"neighbours", metadata !8, i32 113, metadata !20} ; [ DW_TAG_arg_variable ]
!126 = metadata !{i32 459009, metadata !120, metadata !"neighbours_dist", metadata !8, i32 114, metadata !24} ; [ DW_TAG_arg_variable ]
!127 = metadata !{i32 459009, metadata !120, metadata !"found", metadata !8, i32 115, metadata !123} ; [ DW_TAG_arg_variable ]
!128 = metadata !{i32 459009, metadata !120, metadata !"new_neighbour", metadata !8, i32 116, metadata !3} ; [ DW_TAG_arg_variable ]
!129 = metadata !{i32 459009, metadata !120, metadata !"new_neighbour_dist", metadata !8, i32 117, metadata !16} ; [ DW_TAG_arg_variable ]
!130 = metadata !{i32 117, i32 0, metadata !120, null}
!131 = metadata !{i32 121, i32 0, metadata !132, null}
!132 = metadata !{i32 458763, metadata !120, i32 117, i32 0} ; [ DW_TAG_lexical_block ]
!133 = metadata !{i32 123, i32 0, metadata !132, null}
!134 = metadata !{i32 124, i32 0, metadata !132, null}
!135 = metadata !{i32 -1}                         ; [ DW_TAG_hi_user ]
!136 = metadata !{i32 459008, metadata !132, metadata !"insert_index", metadata !8, i32 126, metadata !137} ; [ DW_TAG_auto_variable ]
!137 = metadata !{i32 458774, metadata !1, metadata !"int_t", metadata !2, i32 66, i64 0, i64 0, i64 0, i32 0, metadata !138} ; [ DW_TAG_typedef ]
!138 = metadata !{i32 458788, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!139 = metadata !{i32 126, i32 0, metadata !132, null}
!140 = metadata !{double -1.000000e+00}
!141 = metadata !{i32 459008, metadata !132, metadata !"removed_value", metadata !8, i32 127, metadata !16} ; [ DW_TAG_auto_variable ]
!142 = metadata !{i32 127, i32 0, metadata !132, null}
!143 = metadata !{i32 139, i32 0, metadata !132, null}
!144 = metadata !{i32 143, i32 0, metadata !145, null}
!145 = metadata !{i32 458763, metadata !132, i32 139, i32 0} ; [ DW_TAG_lexical_block ]
!146 = metadata !{i32 161, i32 0, metadata !147, null}
!147 = metadata !{i32 458763, metadata !132, i32 143, i32 0} ; [ DW_TAG_lexical_block ]
!148 = metadata !{i32 144, i32 0, metadata !145, null}
!149 = metadata !{i32 146, i32 0, metadata !145, null}
!150 = metadata !{i32 147, i32 0, metadata !145, null}
!151 = metadata !{i32 148, i32 0, metadata !145, null}
!152 = metadata !{i32 150, i32 0, metadata !145, null}
!153 = metadata !{i32 151, i32 0, metadata !145, null}
!154 = metadata !{i32 459008, metadata !145, metadata !"i", metadata !8, i32 142, metadata !74} ; [ DW_TAG_auto_variable ]
!155 = metadata !{i32 160, i32 0, metadata !147, null}
!156 = metadata !{i32 166, i32 0, metadata !147, null}
!157 = metadata !{i32 168, i32 0, metadata !147, null}
!158 = metadata !{i32 169, i32 0, metadata !147, null}
!159 = metadata !{i32 170, i32 0, metadata !147, null}
!160 = metadata !{i32 159, i32 0, metadata !147, null}
!161 = metadata !{i32 459008, metadata !147, metadata !"i", metadata !8, i32 158, metadata !137} ; [ DW_TAG_auto_variable ]
!162 = metadata !{i32 172, i32 0, metadata !147, null}
!163 = metadata !{i32 206, i32 0, metadata !132, null}
!164 = metadata !{i32 207, i32 0, metadata !132, null}
!165 = metadata !{i32 208, i32 0, metadata !132, null}
!166 = metadata !{i32 210, i32 0, metadata !132, null}
!167 = metadata !{i32 211, i32 0, metadata !132, null}
!168 = metadata !{i32 214, i32 0, metadata !132, null}
!169 = metadata !{i32 459009, metadata !170, metadata !"N", metadata !8, i32 239, metadata !11} ; [ DW_TAG_arg_variable ]
!170 = metadata !{i32 458798, i32 0, metadata !1, metadata !"best_outliers", metadata !"best_outliers", metadata !"best_outliers", metadata !8, i32 245, metadata !171, i1 true, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!171 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !172, i32 0, null} ; [ DW_TAG_subroutine_type ]
!172 = metadata !{null, metadata !11, metadata !173, metadata !20, metadata !24, metadata !11, metadata !20, metadata !24}
!173 = metadata !{i32 458790, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !174} ; [ DW_TAG_const_type ]
!174 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ]
!175 = metadata !{i32 459009, metadata !170, metadata !"outliers_size", metadata !8, i32 239, metadata !174} ; [ DW_TAG_arg_variable ]
!176 = metadata !{i32 459009, metadata !170, metadata !"outliers", metadata !8, i32 240, metadata !20} ; [ DW_TAG_arg_variable ]
!177 = metadata !{i32 459009, metadata !170, metadata !"outlier_scores", metadata !8, i32 241, metadata !24} ; [ DW_TAG_arg_variable ]
!178 = metadata !{i32 459009, metadata !170, metadata !"block_size", metadata !8, i32 242, metadata !11} ; [ DW_TAG_arg_variable ]
!179 = metadata !{i32 459009, metadata !170, metadata !"current_block", metadata !8, i32 243, metadata !20} ; [ DW_TAG_arg_variable ]
!180 = metadata !{i32 459009, metadata !170, metadata !"scores", metadata !8, i32 245, metadata !24} ; [ DW_TAG_arg_variable ]
!181 = metadata !{i32 459008, metadata !182, metadata !"new_outliers_size", metadata !8, i32 262, metadata !11} ; [ DW_TAG_auto_variable ]
!182 = metadata !{i32 458763, metadata !170, i32 245, i32 0} ; [ DW_TAG_lexical_block ]
!183 = metadata !{i32 245, i32 0, metadata !182, null}
!184 = metadata !{i32 245, i32 0, metadata !170, null}
!185 = metadata !{i32 250, i32 0, metadata !182, null}
!186 = metadata !{i32 251, i32 0, metadata !182, null}
!187 = metadata !{i32 254, i32 0, metadata !182, null}
!188 = metadata !{i32 257, i32 0, metadata !182, null}
!189 = metadata !{i32 260, i32 0, metadata !182, null}
!190 = metadata !{i32 459008, metadata !170, metadata !"new_outliers.22", metadata !8, i32 260, metadata !64} ; [ DW_TAG_auto_variable ]
!191 = metadata !{i32 261, i32 0, metadata !182, null}
!192 = metadata !{i32 459008, metadata !170, metadata !"new_outlier_scores.24", metadata !8, i32 261, metadata !69} ; [ DW_TAG_auto_variable ]
!193 = metadata !{i32 262, i32 0, metadata !182, null}
!194 = metadata !{i32 264, i32 0, metadata !182, null}
!195 = metadata !{i32 265, i32 0, metadata !182, null}
!196 = metadata !{i32 268, i32 0, metadata !182, null}
!197 = metadata !{i32 271, i32 0, metadata !182, null}
!198 = metadata !{i32 272, i32 0, metadata !182, null}
!199 = metadata !{i32 273, i32 0, metadata !182, null}
!200 = metadata !{i32 274, i32 0, metadata !182, null}
!201 = metadata !{i32 459009, metadata !202, metadata !"size", metadata !8, i32 284, metadata !11} ; [ DW_TAG_arg_variable ]
!202 = metadata !{i32 458798, i32 0, metadata !1, metadata !"sort_vectors_descending", metadata !"sort_vectors_descending", metadata !"sort_vectors_descending", metadata !8, i32 286, metadata !203, i1 true, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!203 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !204, i32 0, null} ; [ DW_TAG_subroutine_type ]
!204 = metadata !{null, metadata !11, metadata !20, metadata !24}
!205 = metadata !{i32 459009, metadata !202, metadata !"indexes", metadata !8, i32 285, metadata !20} ; [ DW_TAG_arg_variable ]
!206 = metadata !{i32 459009, metadata !202, metadata !"values", metadata !8, i32 286, metadata !24} ; [ DW_TAG_arg_variable ]
!207 = metadata !{i32 286, i32 0, metadata !202, null}
!208 = metadata !{i32 290, i32 0, metadata !209, null}
!209 = metadata !{i32 458763, metadata !202, i32 286, i32 0} ; [ DW_TAG_lexical_block ]
!210 = metadata !{i32 295, i32 0, metadata !211, null}
!211 = metadata !{i32 458763, metadata !209, i32 293, i32 0} ; [ DW_TAG_lexical_block ]
!212 = metadata !{i32 459008, metadata !211, metadata !"ind", metadata !8, i32 295, metadata !3} ; [ DW_TAG_auto_variable ]
!213 = metadata !{i32 296, i32 0, metadata !211, null}
!214 = metadata !{i32 459008, metadata !211, metadata !"val", metadata !8, i32 296, metadata !16} ; [ DW_TAG_auto_variable ]
!215 = metadata !{i32 297, i32 0, metadata !211, null}
!216 = metadata !{i32 298, i32 0, metadata !211, null}
!217 = metadata !{i32 300, i32 0, metadata !211, null}
!218 = metadata !{i32 301, i32 0, metadata !211, null}
!219 = metadata !{i32 459008, metadata !209, metadata !"i", metadata !8, i32 292, metadata !74} ; [ DW_TAG_auto_variable ]
!220 = metadata !{i32 293, i32 0, metadata !209, null}
!221 = metadata !{i32 459008, metadata !211, metadata !"j", metadata !8, i32 294, metadata !137} ; [ DW_TAG_auto_variable ]
!222 = metadata !{i32 303, i32 0, metadata !211, null}
!223 = metadata !{i32 304, i32 0, metadata !211, null}
!224 = metadata !{i32 306, i32 0, metadata !209, null}
!225 = metadata !{i32 459009, metadata !226, metadata !"N", metadata !8, i32 328, metadata !11} ; [ DW_TAG_arg_variable ]
!226 = metadata !{i32 458798, i32 0, metadata !1, metadata !"merge", metadata !"merge", metadata !"merge", metadata !8, i32 331, metadata !227, i1 true, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!227 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !228, i32 0, null} ; [ DW_TAG_subroutine_type ]
!228 = metadata !{null, metadata !11, metadata !11, metadata !20, metadata !24, metadata !11, metadata !20, metadata !24, metadata !173, metadata !20, metadata !24}
!229 = metadata !{i32 459009, metadata !226, metadata !"global_outliers_size", metadata !8, i32 329, metadata !11} ; [ DW_TAG_arg_variable ]
!230 = metadata !{i32 459009, metadata !226, metadata !"global_outliers", metadata !8, i32 329, metadata !20} ; [ DW_TAG_arg_variable ]
!231 = metadata !{i32 459009, metadata !226, metadata !"global_outlier_scores", metadata !8, i32 329, metadata !24} ; [ DW_TAG_arg_variable ]
!232 = metadata !{i32 459009, metadata !226, metadata !"block_size", metadata !8, i32 330, metadata !11} ; [ DW_TAG_arg_variable ]
!233 = metadata !{i32 459009, metadata !226, metadata !"local_outliers", metadata !8, i32 330, metadata !20} ; [ DW_TAG_arg_variable ]
!234 = metadata !{i32 459009, metadata !226, metadata !"local_outlier_scores", metadata !8, i32 330, metadata !24} ; [ DW_TAG_arg_variable ]
!235 = metadata !{i32 459009, metadata !226, metadata !"new_outliers_size", metadata !8, i32 331, metadata !173} ; [ DW_TAG_arg_variable ]
!236 = metadata !{i32 459009, metadata !226, metadata !"new_outliers", metadata !8, i32 331, metadata !20} ; [ DW_TAG_arg_variable ]
!237 = metadata !{i32 459009, metadata !226, metadata !"new_outlier_scores", metadata !8, i32 331, metadata !24} ; [ DW_TAG_arg_variable ]
!238 = metadata !{i32 331, i32 0, metadata !226, null}
!239 = metadata !{i32 335, i32 0, metadata !240, null}
!240 = metadata !{i32 458763, metadata !226, i32 331, i32 0} ; [ DW_TAG_lexical_block ]
!241 = metadata !{i32 336, i32 0, metadata !240, null}
!242 = metadata !{i32 339, i32 0, metadata !240, null}
!243 = metadata !{i32 349, i32 0, metadata !240, null}
!244 = metadata !{i32 351, i32 0, metadata !240, null}
!245 = metadata !{i32 352, i32 0, metadata !240, null}
!246 = metadata !{i32 353, i32 0, metadata !240, null}
!247 = metadata !{i32 459008, metadata !240, metadata !"local", metadata !8, i32 347, metadata !74} ; [ DW_TAG_auto_variable ]
!248 = metadata !{i32 354, i32 0, metadata !240, null}
!249 = metadata !{i32 459008, metadata !240, metadata !"global", metadata !8, i32 346, metadata !74} ; [ DW_TAG_auto_variable ]
!250 = metadata !{i32 355, i32 0, metadata !240, null}
!251 = metadata !{i32 357, i32 0, metadata !240, null}
!252 = metadata !{i32 358, i32 0, metadata !240, null}
!253 = metadata !{i32 359, i32 0, metadata !240, null}
!254 = metadata !{i32 360, i32 0, metadata !240, null}
!255 = metadata !{i32 361, i32 0, metadata !240, null}
!256 = metadata !{i32 367, i32 0, metadata !240, null}
!257 = metadata !{i32 368, i32 0, metadata !240, null}
!258 = metadata !{i32 369, i32 0, metadata !240, null}
!259 = metadata !{i32 370, i32 0, metadata !240, null}
!260 = metadata !{i32 371, i32 0, metadata !240, null}
!261 = metadata !{i32 372, i32 0, metadata !240, null}
!262 = metadata !{i32 373, i32 0, metadata !240, null}
!263 = metadata !{i32 374, i32 0, metadata !240, null}
!264 = metadata !{i32 377, i32 0, metadata !240, null}
!265 = metadata !{i32 459008, metadata !240, metadata !"iter", metadata !8, i32 345, metadata !74} ; [ DW_TAG_auto_variable ]
!266 = metadata !{i32 378, i32 0, metadata !240, null}
!267 = metadata !{i32 344, i32 0, metadata !240, null}
!268 = metadata !{i32 348, i32 0, metadata !240, null}
!269 = metadata !{i32 380, i32 0, metadata !240, null}
