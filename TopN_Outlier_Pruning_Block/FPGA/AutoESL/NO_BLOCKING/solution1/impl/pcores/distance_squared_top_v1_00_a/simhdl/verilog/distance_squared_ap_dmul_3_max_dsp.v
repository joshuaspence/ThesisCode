////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.28xd
//  \   \         Application: netgen
//  /   /         Filename: distance_squared_ap_dmul_3_max_dsp.v
// /___/   /\     Timestamp: Fri Oct 05 14:38:21 2012
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog D:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/FPGA/AutoESL/NO_BLOCKING/solution1/impl/pcores/distance_squared_top_v1_00_a/data/__coregen_tmp__/tmp/_cg/distance_squared_ap_dmul_3_max_dsp.ngc D:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/FPGA/AutoESL/NO_BLOCKING/solution1/impl/pcores/distance_squared_top_v1_00_a/data/__coregen_tmp__/tmp/_cg/distance_squared_ap_dmul_3_max_dsp.v 
// Device	: 7z020clg484-1
// Input file	: D:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/FPGA/AutoESL/NO_BLOCKING/solution1/impl/pcores/distance_squared_top_v1_00_a/data/__coregen_tmp__/tmp/_cg/distance_squared_ap_dmul_3_max_dsp.ngc
// Output file	: D:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/FPGA/AutoESL/NO_BLOCKING/solution1/impl/pcores/distance_squared_top_v1_00_a/data/__coregen_tmp__/tmp/_cg/distance_squared_ap_dmul_3_max_dsp.v
// # of Modules	: 1
// Design Name	: distance_squared_ap_dmul_3_max_dsp
// Xilinx        : C:\Xilinx\14.2\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module distance_squared_ap_dmul_3_max_dsp (
  aclk, aclken, s_axis_a_tvalid, s_axis_b_tvalid, m_axis_result_tvalid, s_axis_a_tdata, s_axis_b_tdata, m_axis_result_tdata
)/* synthesis syn_black_box syn_noprune=1 */;
  input aclk;
  input aclken;
  input s_axis_a_tvalid;
  input s_axis_b_tvalid;
  output m_axis_result_tvalid;
  input [63 : 0] s_axis_a_tdata;
  input [63 : 0] s_axis_b_tdata;
  output [63 : 0] m_axis_result_tdata;
  
  // synthesis translate_off
  
  wire \U0/i_synth/i_nd_to_rdy/opt_has_pipe.pipe_3 ;
  wire sig00000001;
  wire sig00000002;
  wire sig00000003;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_50 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_49 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_48 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_47 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_46 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_45 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_44 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_43 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_42 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_41 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_40 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_39 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_38 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_37 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_36 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_35 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_34 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_33 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_32 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_31 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_30 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_29 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_28 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_27 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_26 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_25 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_24 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_23 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_22 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_21 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_20 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_19 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_18 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_17 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_16 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_15 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_14 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_13 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_12 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_11 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_10 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_9 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_8 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_7 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_6 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_5 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_4 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_3 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_2 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_1 ;
  wire \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_0 ;
  wire \U0/i_synth/MULT.OP/OP/sign_op ;
  wire sig00000004;
  wire sig00000005;
  wire sig00000006;
  wire sig00000007;
  wire sig00000008;
  wire sig00000009;
  wire sig0000000a;
  wire sig0000000b;
  wire sig0000000c;
  wire sig0000000d;
  wire sig0000000e;
  wire sig0000000f;
  wire sig00000010;
  wire sig00000011;
  wire sig00000012;
  wire sig00000013;
  wire sig00000014;
  wire sig00000015;
  wire sig00000016;
  wire sig00000017;
  wire sig00000018;
  wire sig00000019;
  wire sig0000001a;
  wire sig0000001b;
  wire sig0000001c;
  wire sig0000001d;
  wire sig0000001e;
  wire sig0000001f;
  wire sig00000020;
  wire sig00000021;
  wire sig00000022;
  wire sig00000023;
  wire sig00000024;
  wire sig00000025;
  wire sig00000026;
  wire sig00000027;
  wire sig00000028;
  wire sig00000029;
  wire sig0000002a;
  wire sig0000002b;
  wire sig0000002c;
  wire sig0000002d;
  wire sig0000002e;
  wire sig0000002f;
  wire sig00000030;
  wire sig00000031;
  wire sig00000032;
  wire sig00000033;
  wire sig00000034;
  wire sig00000035;
  wire sig00000036;
  wire sig00000037;
  wire sig00000038;
  wire sig00000039;
  wire sig0000003a;
  wire sig0000003b;
  wire sig0000003c;
  wire sig0000003d;
  wire sig0000003e;
  wire sig0000003f;
  wire sig00000040;
  wire sig00000041;
  wire sig00000042;
  wire sig00000043;
  wire sig00000044;
  wire sig00000045;
  wire sig00000046;
  wire sig00000047;
  wire sig00000048;
  wire sig00000049;
  wire sig0000004a;
  wire sig0000004b;
  wire sig0000004c;
  wire sig0000004d;
  wire sig0000004e;
  wire sig0000004f;
  wire sig00000050;
  wire sig00000051;
  wire sig00000052;
  wire sig00000053;
  wire sig00000054;
  wire sig00000055;
  wire sig00000056;
  wire sig00000057;
  wire sig00000058;
  wire sig00000059;
  wire sig0000005a;
  wire sig0000005b;
  wire sig0000005c;
  wire sig0000005d;
  wire sig0000005e;
  wire sig0000005f;
  wire sig00000060;
  wire sig00000061;
  wire sig00000062;
  wire sig00000063;
  wire sig00000064;
  wire sig00000065;
  wire sig00000066;
  wire sig00000067;
  wire sig00000068;
  wire sig00000069;
  wire sig0000006a;
  wire sig0000006b;
  wire sig0000006c;
  wire sig0000006d;
  wire sig0000006e;
  wire sig0000006f;
  wire sig00000070;
  wire sig00000071;
  wire sig00000072;
  wire sig00000073;
  wire sig00000074;
  wire sig00000075;
  wire sig00000076;
  wire sig00000077;
  wire sig00000078;
  wire sig00000079;
  wire sig0000007a;
  wire sig0000007b;
  wire sig0000007c;
  wire sig0000007d;
  wire sig0000007e;
  wire sig0000007f;
  wire sig00000080;
  wire sig00000081;
  wire sig00000082;
  wire sig00000083;
  wire sig00000084;
  wire sig00000085;
  wire sig00000086;
  wire sig00000087;
  wire sig00000088;
  wire sig00000089;
  wire sig0000008a;
  wire sig0000008b;
  wire sig0000008c;
  wire sig0000008d;
  wire sig0000008e;
  wire sig0000008f;
  wire sig00000090;
  wire sig00000091;
  wire sig00000092;
  wire sig00000093;
  wire sig00000094;
  wire sig00000095;
  wire sig00000096;
  wire sig00000097;
  wire sig00000098;
  wire sig00000099;
  wire sig0000009a;
  wire sig0000009b;
  wire sig0000009c;
  wire sig0000009d;
  wire sig0000009e;
  wire sig0000009f;
  wire sig000000a0;
  wire sig000000a1;
  wire sig000000a2;
  wire sig000000a3;
  wire sig000000a4;
  wire sig000000a5;
  wire sig000000a6;
  wire sig000000a7;
  wire sig000000a8;
  wire sig000000a9;
  wire sig000000aa;
  wire sig000000ab;
  wire sig000000ac;
  wire sig000000ad;
  wire sig000000ae;
  wire sig000000af;
  wire sig000000b0;
  wire sig000000b1;
  wire sig000000b2;
  wire sig000000b3;
  wire sig000000b4;
  wire sig000000b5;
  wire sig000000b6;
  wire sig000000b7;
  wire sig000000b8;
  wire sig000000b9;
  wire sig000000ba;
  wire sig000000bb;
  wire sig000000bc;
  wire sig000000bd;
  wire sig000000be;
  wire sig000000bf;
  wire sig000000c0;
  wire sig000000c1;
  wire sig000000c2;
  wire sig000000c3;
  wire sig000000c4;
  wire sig000000c5;
  wire sig000000c6;
  wire sig000000c7;
  wire sig000000c8;
  wire sig000000c9;
  wire sig000000ca;
  wire sig000000cb;
  wire sig000000cc;
  wire sig000000cd;
  wire sig000000ce;
  wire sig000000cf;
  wire sig000000d0;
  wire sig000000d1;
  wire sig000000d2;
  wire sig000000d3;
  wire sig000000d4;
  wire sig000000d5;
  wire sig000000d6;
  wire sig000000d7;
  wire sig000000d8;
  wire sig000000d9;
  wire sig000000da;
  wire sig000000db;
  wire sig000000dc;
  wire sig000000dd;
  wire sig000000de;
  wire sig000000df;
  wire sig000000e0;
  wire sig000000e1;
  wire sig000000e2;
  wire sig000000e3;
  wire sig000000e4;
  wire sig000000e5;
  wire sig000000e6;
  wire sig000000e7;
  wire sig000000e8;
  wire sig000000e9;
  wire sig000000ea;
  wire sig000000eb;
  wire sig000000ec;
  wire sig000000ed;
  wire sig000000ee;
  wire sig000000ef;
  wire sig000000f0;
  wire sig000000f1;
  wire sig000000f2;
  wire sig000000f3;
  wire sig000000f4;
  wire sig000000f5;
  wire sig000000f6;
  wire sig000000f7;
  wire sig000000f8;
  wire sig000000f9;
  wire sig000000fa;
  wire sig000000fb;
  wire sig000000fc;
  wire sig000000fd;
  wire sig000000fe;
  wire sig000000ff;
  wire sig00000100;
  wire sig00000101;
  wire sig00000102;
  wire sig00000103;
  wire sig00000104;
  wire sig00000105;
  wire sig00000106;
  wire sig00000107;
  wire sig00000108;
  wire sig00000109;
  wire sig0000010a;
  wire sig0000010b;
  wire sig0000010c;
  wire sig0000010d;
  wire sig0000010e;
  wire sig0000010f;
  wire sig00000110;
  wire sig00000111;
  wire sig00000112;
  wire sig00000113;
  wire sig00000114;
  wire sig00000115;
  wire sig00000116;
  wire sig00000117;
  wire sig00000118;
  wire sig00000119;
  wire sig0000011a;
  wire sig0000011b;
  wire sig0000011c;
  wire sig0000011d;
  wire sig0000011e;
  wire sig0000011f;
  wire sig00000120;
  wire sig00000121;
  wire sig00000122;
  wire sig00000123;
  wire sig00000124;
  wire sig00000125;
  wire sig00000126;
  wire sig00000127;
  wire sig00000128;
  wire sig00000129;
  wire sig0000012a;
  wire sig0000012b;
  wire sig0000012c;
  wire sig0000012d;
  wire sig0000012e;
  wire sig0000012f;
  wire sig00000130;
  wire sig00000131;
  wire sig00000132;
  wire sig00000133;
  wire sig00000134;
  wire sig00000135;
  wire sig00000136;
  wire sig00000137;
  wire sig00000138;
  wire sig00000139;
  wire sig0000013a;
  wire sig0000013b;
  wire sig0000013c;
  wire sig0000013d;
  wire sig0000013e;
  wire sig0000013f;
  wire sig00000140;
  wire sig00000141;
  wire sig00000142;
  wire sig00000143;
  wire sig00000144;
  wire sig00000145;
  wire sig00000146;
  wire sig00000147;
  wire sig00000148;
  wire sig00000149;
  wire sig0000014a;
  wire sig0000014b;
  wire sig0000014c;
  wire sig0000014d;
  wire sig0000014e;
  wire sig0000014f;
  wire sig00000150;
  wire sig00000151;
  wire sig00000152;
  wire sig00000153;
  wire sig00000154;
  wire sig00000155;
  wire sig00000156;
  wire sig00000157;
  wire sig00000158;
  wire sig00000159;
  wire sig0000015a;
  wire sig0000015b;
  wire sig0000015c;
  wire sig0000015d;
  wire sig0000015e;
  wire sig0000015f;
  wire sig00000160;
  wire sig00000161;
  wire sig00000162;
  wire sig00000163;
  wire sig00000164;
  wire sig00000165;
  wire sig00000166;
  wire sig00000167;
  wire sig00000168;
  wire sig00000169;
  wire sig0000016a;
  wire sig0000016b;
  wire sig0000016c;
  wire sig0000016d;
  wire sig0000016e;
  wire sig0000016f;
  wire sig00000170;
  wire sig00000171;
  wire sig00000172;
  wire sig00000173;
  wire sig00000174;
  wire sig00000175;
  wire sig00000176;
  wire sig00000177;
  wire sig00000178;
  wire sig00000179;
  wire sig0000017a;
  wire sig0000017b;
  wire sig0000017c;
  wire sig0000017d;
  wire sig0000017e;
  wire sig0000017f;
  wire sig00000180;
  wire sig00000181;
  wire sig00000182;
  wire sig00000183;
  wire sig00000184;
  wire sig00000185;
  wire sig00000186;
  wire sig00000187;
  wire sig00000188;
  wire sig00000189;
  wire sig0000018a;
  wire sig0000018b;
  wire sig0000018c;
  wire sig0000018d;
  wire sig0000018e;
  wire sig0000018f;
  wire sig00000190;
  wire sig00000191;
  wire sig00000192;
  wire sig00000193;
  wire sig00000194;
  wire sig00000195;
  wire sig00000196;
  wire sig00000197;
  wire sig00000198;
  wire sig00000199;
  wire sig0000019a;
  wire sig0000019b;
  wire sig0000019c;
  wire sig0000019d;
  wire sig0000019e;
  wire sig0000019f;
  wire sig000001a0;
  wire sig000001a1;
  wire sig000001a2;
  wire sig000001a3;
  wire sig000001a4;
  wire sig000001a5;
  wire sig000001a6;
  wire sig000001a7;
  wire sig000001a8;
  wire sig000001a9;
  wire sig000001aa;
  wire sig000001ab;
  wire sig000001ac;
  wire sig000001ad;
  wire sig000001ae;
  wire sig000001af;
  wire sig000001b0;
  wire sig000001b1;
  wire sig000001b2;
  wire sig000001b3;
  wire sig000001b4;
  wire sig000001b5;
  wire sig000001b6;
  wire sig000001b7;
  wire sig000001b8;
  wire sig000001b9;
  wire sig000001ba;
  wire sig000001bb;
  wire sig000001bc;
  wire sig000001bd;
  wire sig000001be;
  wire sig000001bf;
  wire sig000001c0;
  wire sig000001c1;
  wire sig000001c2;
  wire sig000001c3;
  wire sig000001c4;
  wire sig000001c5;
  wire sig000001c6;
  wire sig000001c7;
  wire sig000001c8;
  wire sig000001c9;
  wire sig000001ca;
  wire sig000001cb;
  wire sig000001cc;
  wire sig000001cd;
  wire sig000001ce;
  wire sig000001cf;
  wire sig000001d0;
  wire sig000001d1;
  wire sig000001d2;
  wire sig000001d3;
  wire sig000001d4;
  wire sig000001d5;
  wire sig000001d6;
  wire sig000001d7;
  wire sig000001d8;
  wire sig000001d9;
  wire sig000001da;
  wire sig000001db;
  wire sig000001dc;
  wire sig000001dd;
  wire sig000001de;
  wire sig000001df;
  wire sig000001e0;
  wire sig000001e1;
  wire sig000001e2;
  wire sig000001e3;
  wire sig000001e4;
  wire sig000001e5;
  wire sig000001e6;
  wire sig000001e7;
  wire sig000001e8;
  wire sig000001e9;
  wire sig000001ea;
  wire sig000001eb;
  wire sig000001ec;
  wire sig000001ed;
  wire sig000001ee;
  wire sig000001ef;
  wire sig000001f0;
  wire sig000001f1;
  wire sig000001f2;
  wire sig000001f3;
  wire sig000001f4;
  wire sig000001f5;
  wire sig000001f6;
  wire sig000001f7;
  wire sig000001f8;
  wire sig000001f9;
  wire sig000001fa;
  wire sig000001fb;
  wire sig000001fc;
  wire sig000001fd;
  wire sig000001fe;
  wire sig000001ff;
  wire sig00000200;
  wire sig00000201;
  wire sig00000202;
  wire sig00000203;
  wire sig00000204;
  wire sig00000205;
  wire sig00000206;
  wire sig00000207;
  wire sig00000208;
  wire sig00000209;
  wire sig0000020a;
  wire sig0000020b;
  wire sig0000020c;
  wire sig0000020d;
  wire sig0000020e;
  wire sig0000020f;
  wire sig00000210;
  wire sig00000211;
  wire sig00000212;
  wire sig00000213;
  wire sig00000214;
  wire sig00000215;
  wire sig00000216;
  wire sig00000217;
  wire sig00000218;
  wire sig00000219;
  wire sig0000021a;
  wire sig0000021b;
  wire sig0000021c;
  wire sig0000021d;
  wire sig0000021e;
  wire sig0000021f;
  wire sig00000220;
  wire sig00000221;
  wire sig00000222;
  wire sig00000223;
  wire sig00000224;
  wire sig00000225;
  wire sig00000226;
  wire sig00000227;
  wire sig00000228;
  wire sig00000229;
  wire sig0000022a;
  wire sig0000022b;
  wire sig0000022c;
  wire sig0000022d;
  wire sig0000022e;
  wire sig0000022f;
  wire sig00000230;
  wire sig00000231;
  wire sig00000232;
  wire sig00000233;
  wire sig00000234;
  wire sig00000235;
  wire sig00000236;
  wire sig00000237;
  wire sig00000238;
  wire sig00000239;
  wire sig0000023a;
  wire sig0000023b;
  wire sig0000023c;
  wire sig0000023d;
  wire sig0000023e;
  wire sig0000023f;
  wire sig00000240;
  wire sig00000241;
  wire sig00000242;
  wire sig00000243;
  wire sig00000244;
  wire sig00000245;
  wire sig00000246;
  wire sig00000247;
  wire sig00000248;
  wire sig00000249;
  wire sig0000024a;
  wire sig0000024b;
  wire sig0000024c;
  wire sig0000024d;
  wire sig0000024e;
  wire sig0000024f;
  wire sig00000250;
  wire sig00000251;
  wire sig00000252;
  wire sig00000253;
  wire sig00000254;
  wire sig00000255;
  wire sig00000256;
  wire sig00000257;
  wire sig00000258;
  wire sig00000259;
  wire sig0000025a;
  wire sig0000025b;
  wire sig0000025c;
  wire sig0000025d;
  wire sig0000025e;
  wire sig0000025f;
  wire sig00000260;
  wire sig00000261;
  wire sig00000262;
  wire sig00000263;
  wire sig00000264;
  wire sig00000265;
  wire sig00000266;
  wire sig00000267;
  wire sig00000268;
  wire sig00000269;
  wire sig0000026a;
  wire sig0000026b;
  wire sig0000026c;
  wire sig0000026d;
  wire sig0000026e;
  wire sig0000026f;
  wire sig00000270;
  wire sig00000271;
  wire sig00000272;
  wire sig00000273;
  wire sig00000274;
  wire sig00000275;
  wire sig00000276;
  wire sig00000277;
  wire sig00000278;
  wire sig00000279;
  wire sig0000027a;
  wire sig0000027b;
  wire sig0000027c;
  wire sig0000027d;
  wire sig0000027e;
  wire sig0000027f;
  wire sig00000280;
  wire sig00000281;
  wire sig00000282;
  wire sig00000283;
  wire sig00000284;
  wire sig00000285;
  wire sig00000286;
  wire sig00000287;
  wire sig00000288;
  wire sig00000289;
  wire sig0000028a;
  wire sig0000028b;
  wire sig0000028c;
  wire sig0000028d;
  wire sig0000028e;
  wire sig0000028f;
  wire sig00000290;
  wire sig00000291;
  wire sig00000292;
  wire sig00000293;
  wire sig00000294;
  wire sig00000295;
  wire sig00000296;
  wire sig00000297;
  wire sig00000298;
  wire sig00000299;
  wire sig0000029a;
  wire sig0000029b;
  wire sig0000029c;
  wire sig0000029d;
  wire sig0000029e;
  wire sig0000029f;
  wire sig000002a0;
  wire sig000002a1;
  wire sig000002a2;
  wire sig000002a3;
  wire sig000002a4;
  wire sig000002a5;
  wire sig000002a6;
  wire sig000002a7;
  wire sig000002a8;
  wire sig000002a9;
  wire sig000002aa;
  wire sig000002ab;
  wire sig000002ac;
  wire sig000002ad;
  wire sig000002ae;
  wire sig000002af;
  wire sig000002b0;
  wire sig000002b1;
  wire sig000002b2;
  wire sig000002b3;
  wire sig000002b4;
  wire sig000002b5;
  wire sig000002b6;
  wire sig000002b7;
  wire sig000002b8;
  wire sig000002b9;
  wire sig000002ba;
  wire sig000002bb;
  wire sig000002bc;
  wire sig000002bd;
  wire sig000002be;
  wire sig000002bf;
  wire sig000002c0;
  wire sig000002c1;
  wire sig000002c2;
  wire sig000002c3;
  wire sig000002c4;
  wire sig000002c5;
  wire sig000002c6;
  wire sig000002c7;
  wire sig000002c8;
  wire sig000002c9;
  wire sig000002ca;
  wire sig000002cb;
  wire sig000002cc;
  wire sig000002cd;
  wire sig000002ce;
  wire sig000002cf;
  wire sig000002d0;
  wire sig000002d1;
  wire sig000002d2;
  wire sig000002d3;
  wire sig000002d4;
  wire sig000002d5;
  wire sig000002d6;
  wire sig000002d7;
  wire sig000002d8;
  wire sig000002d9;
  wire sig000002da;
  wire sig000002db;
  wire sig000002dc;
  wire sig000002dd;
  wire sig000002de;
  wire sig000002df;
  wire sig000002e0;
  wire sig000002e1;
  wire sig000002e2;
  wire sig000002e3;
  wire sig000002e4;
  wire sig000002e5;
  wire sig000002e6;
  wire sig000002e7;
  wire sig000002e8;
  wire sig000002e9;
  wire sig000002ea;
  wire sig000002eb;
  wire sig000002ec;
  wire sig000002ed;
  wire sig000002ee;
  wire sig000002ef;
  wire sig000002f0;
  wire sig000002f1;
  wire sig000002f2;
  wire sig000002f3;
  wire sig000002f4;
  wire sig000002f5;
  wire sig000002f6;
  wire sig000002f7;
  wire sig000002f8;
  wire sig000002f9;
  wire sig000002fa;
  wire sig000002fb;
  wire sig000002fc;
  wire sig000002fd;
  wire sig000002fe;
  wire sig000002ff;
  wire sig00000300;
  wire sig00000301;
  wire sig00000302;
  wire sig00000303;
  wire sig00000304;
  wire sig00000305;
  wire sig00000306;
  wire sig00000307;
  wire sig00000308;
  wire sig00000309;
  wire sig0000030a;
  wire sig0000030b;
  wire sig0000030c;
  wire sig0000030d;
  wire sig0000030e;
  wire sig0000030f;
  wire sig00000310;
  wire sig00000311;
  wire sig00000312;
  wire sig00000313;
  wire sig00000314;
  wire sig00000315;
  wire sig00000316;
  wire sig00000317;
  wire sig00000318;
  wire sig00000319;
  wire sig0000031a;
  wire sig0000031b;
  wire sig0000031c;
  wire sig0000031d;
  wire sig0000031e;
  wire sig0000031f;
  wire sig00000320;
  wire sig00000321;
  wire sig00000322;
  wire sig00000323;
  wire sig00000324;
  wire sig00000325;
  wire sig00000326;
  wire sig00000327;
  wire sig00000328;
  wire sig00000329;
  wire sig0000032a;
  wire sig0000032b;
  wire sig0000032c;
  wire sig0000032d;
  wire sig0000032e;
  wire sig0000032f;
  wire sig00000330;
  wire sig00000331;
  wire sig00000332;
  wire sig00000333;
  wire sig00000334;
  wire sig00000335;
  wire sig00000336;
  wire sig00000337;
  wire sig00000338;
  wire sig00000339;
  wire sig0000033a;
  wire sig0000033b;
  wire sig0000033c;
  wire sig0000033d;
  wire sig0000033e;
  wire sig0000033f;
  wire sig00000340;
  wire sig00000341;
  wire sig00000342;
  wire sig00000343;
  wire sig00000344;
  wire sig00000345;
  wire sig00000346;
  wire sig00000347;
  wire sig00000348;
  wire sig00000349;
  wire sig0000034a;
  wire sig0000034b;
  wire sig0000034c;
  wire sig0000034d;
  wire sig0000034e;
  wire sig0000034f;
  wire sig00000350;
  wire sig00000351;
  wire sig00000352;
  wire sig00000353;
  wire sig00000354;
  wire sig00000355;
  wire sig00000356;
  wire sig00000357;
  wire sig00000358;
  wire sig00000359;
  wire sig0000035a;
  wire sig0000035b;
  wire sig0000035c;
  wire sig0000035d;
  wire sig0000035e;
  wire sig0000035f;
  wire sig00000360;
  wire sig00000361;
  wire sig00000362;
  wire sig00000363;
  wire sig00000364;
  wire sig00000365;
  wire sig00000366;
  wire sig00000367;
  wire sig00000368;
  wire sig00000369;
  wire sig0000036a;
  wire sig0000036b;
  wire sig0000036c;
  wire sig0000036d;
  wire sig0000036e;
  wire sig0000036f;
  wire sig00000370;
  wire sig00000371;
  wire sig00000372;
  wire sig00000373;
  wire sig00000374;
  wire sig00000375;
  wire sig00000376;
  wire sig00000377;
  wire sig00000378;
  wire sig00000379;
  wire sig0000037a;
  wire sig0000037b;
  wire sig0000037c;
  wire sig0000037d;
  wire sig0000037e;
  wire sig0000037f;
  wire sig00000380;
  wire sig00000381;
  wire sig00000382;
  wire sig00000383;
  wire sig00000384;
  wire sig00000385;
  wire sig00000386;
  wire sig00000387;
  wire sig00000388;
  wire sig00000389;
  wire sig0000038a;
  wire sig0000038b;
  wire sig0000038c;
  wire sig0000038d;
  wire sig0000038e;
  wire sig0000038f;
  wire sig00000390;
  wire sig00000391;
  wire sig00000392;
  wire sig00000393;
  wire sig00000394;
  wire sig00000395;
  wire sig00000396;
  wire sig00000397;
  wire sig00000398;
  wire sig00000399;
  wire sig0000039a;
  wire sig0000039b;
  wire sig0000039c;
  wire sig0000039d;
  wire sig0000039e;
  wire sig0000039f;
  wire sig000003a0;
  wire sig000003a1;
  wire sig000003a2;
  wire sig000003a3;
  wire sig000003a4;
  wire sig000003a5;
  wire sig000003a6;
  wire sig000003a7;
  wire sig000003a8;
  wire sig000003a9;
  wire sig000003aa;
  wire sig000003ab;
  wire sig000003ac;
  wire sig000003ad;
  wire sig000003ae;
  wire sig000003af;
  wire sig000003b0;
  wire sig000003b1;
  wire sig000003b2;
  wire sig000003b3;
  wire sig000003b4;
  wire sig000003b5;
  wire sig000003b6;
  wire sig000003b7;
  wire sig000003b8;
  wire sig000003b9;
  wire sig000003ba;
  wire sig000003bb;
  wire sig000003bc;
  wire sig000003bd;
  wire sig000003be;
  wire sig000003bf;
  wire sig000003c0;
  wire sig000003c1;
  wire sig000003c2;
  wire sig000003c3;
  wire sig000003c4;
  wire sig000003c5;
  wire sig000003c6;
  wire sig000003c7;
  wire sig000003c8;
  wire sig000003c9;
  wire sig000003ca;
  wire sig000003cb;
  wire sig000003cc;
  wire sig000003cd;
  wire sig000003ce;
  wire sig000003cf;
  wire sig000003d0;
  wire sig000003d1;
  wire sig000003d2;
  wire sig000003d3;
  wire sig000003d4;
  wire sig000003d5;
  wire sig000003d6;
  wire sig000003d7;
  wire sig000003d8;
  wire sig000003d9;
  wire sig000003da;
  wire sig000003db;
  wire sig000003dc;
  wire sig000003dd;
  wire sig000003de;
  wire sig000003df;
  wire sig000003e0;
  wire sig000003e1;
  wire sig000003e2;
  wire sig000003e3;
  wire sig000003e4;
  wire sig000003e5;
  wire sig000003e6;
  wire sig000003e7;
  wire sig000003e8;
  wire sig000003e9;
  wire sig000003ea;
  wire sig000003eb;
  wire sig000003ec;
  wire sig000003ed;
  wire sig000003ee;
  wire sig000003ef;
  wire sig000003f0;
  wire sig000003f1;
  wire sig000003f2;
  wire sig000003f3;
  wire sig000003f4;
  wire NLW_blk0000003a_PATTERNBDETECT_UNCONNECTED;
  wire NLW_blk0000003a_MULTSIGNOUT_UNCONNECTED;
  wire NLW_blk0000003a_CARRYCASCOUT_UNCONNECTED;
  wire NLW_blk0000003a_UNDERFLOW_UNCONNECTED;
  wire NLW_blk0000003a_OVERFLOW_UNCONNECTED;
  wire \NLW_blk0000003a_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003a_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003a_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003a_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003a_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003a_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<47>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<46>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<45>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<44>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<43>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<42>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<41>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<40>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<39>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<38>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<37>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<36>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<35>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<34>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<33>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<32>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<31>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<30>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<29>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<28>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<27>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<26>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<25>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<24>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<23>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<22>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<21>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<20>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<19>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<18>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<17>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<16>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<15>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<14>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<13>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<12>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<11>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<10>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<9>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<8>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<7>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<6>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<5>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<4>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<3>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<2>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<1>_UNCONNECTED ;
  wire \NLW_blk0000003a_P<0>_UNCONNECTED ;
  wire NLW_blk0000003b_PATTERNBDETECT_UNCONNECTED;
  wire NLW_blk0000003b_MULTSIGNOUT_UNCONNECTED;
  wire NLW_blk0000003b_CARRYCASCOUT_UNCONNECTED;
  wire NLW_blk0000003b_UNDERFLOW_UNCONNECTED;
  wire NLW_blk0000003b_OVERFLOW_UNCONNECTED;
  wire \NLW_blk0000003b_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003b_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003b_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003b_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003b_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<47>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<46>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<45>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<44>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<43>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<42>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<41>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<40>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<39>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<38>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<37>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<36>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<35>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<34>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<33>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<32>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<31>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<30>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<29>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<28>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<27>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<26>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<25>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<24>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<23>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<22>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<21>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<20>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<19>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<18>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<17>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<16>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<15>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<14>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<13>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<12>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<11>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<10>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<9>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<8>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<7>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<6>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<5>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<4>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<3>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<2>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<1>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<0>_UNCONNECTED ;
  wire NLW_blk0000003c_PATTERNBDETECT_UNCONNECTED;
  wire NLW_blk0000003c_MULTSIGNOUT_UNCONNECTED;
  wire NLW_blk0000003c_CARRYCASCOUT_UNCONNECTED;
  wire NLW_blk0000003c_UNDERFLOW_UNCONNECTED;
  wire NLW_blk0000003c_PATTERNDETECT_UNCONNECTED;
  wire NLW_blk0000003c_OVERFLOW_UNCONNECTED;
  wire \NLW_blk0000003c_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003c_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003c_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003c_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003c_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003c_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<47>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<46>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<45>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<44>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<43>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<42>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<41>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<40>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<39>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<38>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<37>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<36>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<35>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<34>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<33>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<32>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<31>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<30>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<29>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<28>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<27>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<26>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<25>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<24>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<23>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<22>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<21>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<47>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<46>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<45>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<44>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<43>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<42>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<41>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<40>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<39>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<38>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<37>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<36>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<35>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<34>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<33>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<32>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<31>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<30>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<29>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<28>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<27>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<26>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<25>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<24>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<23>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<22>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<21>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<20>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<19>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<18>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<17>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<16>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<15>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<14>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<13>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<12>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<11>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<10>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<9>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<8>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<7>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<6>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<5>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<4>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<0>_UNCONNECTED ;
  wire NLW_blk0000003d_PATTERNBDETECT_UNCONNECTED;
  wire NLW_blk0000003d_MULTSIGNOUT_UNCONNECTED;
  wire NLW_blk0000003d_CARRYCASCOUT_UNCONNECTED;
  wire NLW_blk0000003d_UNDERFLOW_UNCONNECTED;
  wire NLW_blk0000003d_PATTERNDETECT_UNCONNECTED;
  wire NLW_blk0000003d_OVERFLOW_UNCONNECTED;
  wire \NLW_blk0000003d_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003d_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003d_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003d_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<47>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<46>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<45>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<44>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<43>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<42>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<41>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<40>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<39>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<38>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<37>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<36>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<35>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<34>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<33>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<32>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<31>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<30>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<29>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<28>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<27>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<26>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<25>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<24>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<23>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<22>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<21>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<20>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<19>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<18>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<17>_UNCONNECTED ;
  wire NLW_blk0000003e_PATTERNBDETECT_UNCONNECTED;
  wire NLW_blk0000003e_MULTSIGNOUT_UNCONNECTED;
  wire NLW_blk0000003e_CARRYCASCOUT_UNCONNECTED;
  wire NLW_blk0000003e_UNDERFLOW_UNCONNECTED;
  wire NLW_blk0000003e_PATTERNDETECT_UNCONNECTED;
  wire NLW_blk0000003e_OVERFLOW_UNCONNECTED;
  wire \NLW_blk0000003e_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003e_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003e_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003e_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003e_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk0000003e_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk0000003e_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk0000003e_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk0000003e_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk0000003e_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk0000003e_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk0000003e_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk0000003e_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk0000003e_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk0000003e_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk0000003e_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk0000003e_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk0000003e_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk0000003e_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003e_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003e_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003e_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<47>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<46>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<45>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<44>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<43>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<42>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<41>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<40>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<39>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<38>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<37>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<36>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<35>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<34>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<33>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<32>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<31>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<30>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<29>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<28>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<27>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<26>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<25>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<24>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<23>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<22>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<21>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<20>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<19>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<18>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<17>_UNCONNECTED ;
  wire NLW_blk0000003f_PATTERNBDETECT_UNCONNECTED;
  wire NLW_blk0000003f_MULTSIGNOUT_UNCONNECTED;
  wire NLW_blk0000003f_CARRYCASCOUT_UNCONNECTED;
  wire NLW_blk0000003f_UNDERFLOW_UNCONNECTED;
  wire NLW_blk0000003f_PATTERNDETECT_UNCONNECTED;
  wire NLW_blk0000003f_OVERFLOW_UNCONNECTED;
  wire \NLW_blk0000003f_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003f_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003f_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003f_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003f_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003f_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003f_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk0000003f_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk0000003f_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk0000003f_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk0000003f_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk0000003f_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk0000003f_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk0000003f_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk0000003f_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk0000003f_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk0000003f_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk0000003f_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk0000003f_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk0000003f_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk0000003f_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003f_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003f_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003f_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<47>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<46>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<45>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<44>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<43>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<42>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<41>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<40>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<39>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<38>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<37>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<36>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<35>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<34>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<33>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<32>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<31>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<30>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<29>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<28>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<27>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<26>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<25>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<24>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<23>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<22>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<21>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<20>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<19>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<18>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<17>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<16>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<15>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<14>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<13>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<12>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<11>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<10>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<9>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<8>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<7>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<6>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<5>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<4>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<3>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<2>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<1>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<0>_UNCONNECTED ;
  wire NLW_blk00000040_PATTERNBDETECT_UNCONNECTED;
  wire NLW_blk00000040_MULTSIGNOUT_UNCONNECTED;
  wire NLW_blk00000040_CARRYCASCOUT_UNCONNECTED;
  wire NLW_blk00000040_UNDERFLOW_UNCONNECTED;
  wire NLW_blk00000040_OVERFLOW_UNCONNECTED;
  wire \NLW_blk00000040_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000040_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000040_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000040_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000040_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000040_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000040_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000040_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000040_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000040_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000040_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000040_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000040_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000040_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000040_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000040_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000040_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000040_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000040_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000040_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000040_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000040_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000040_P<47>_UNCONNECTED ;
  wire \NLW_blk00000040_P<46>_UNCONNECTED ;
  wire \NLW_blk00000040_P<45>_UNCONNECTED ;
  wire \NLW_blk00000040_P<44>_UNCONNECTED ;
  wire \NLW_blk00000040_P<43>_UNCONNECTED ;
  wire \NLW_blk00000040_P<42>_UNCONNECTED ;
  wire \NLW_blk00000040_P<41>_UNCONNECTED ;
  wire \NLW_blk00000040_P<40>_UNCONNECTED ;
  wire \NLW_blk00000040_P<39>_UNCONNECTED ;
  wire \NLW_blk00000040_P<38>_UNCONNECTED ;
  wire \NLW_blk00000040_P<37>_UNCONNECTED ;
  wire \NLW_blk00000040_P<36>_UNCONNECTED ;
  wire \NLW_blk00000040_P<35>_UNCONNECTED ;
  wire \NLW_blk00000040_P<34>_UNCONNECTED ;
  wire \NLW_blk00000040_P<33>_UNCONNECTED ;
  wire \NLW_blk00000040_P<32>_UNCONNECTED ;
  wire \NLW_blk00000040_P<31>_UNCONNECTED ;
  wire \NLW_blk00000040_P<30>_UNCONNECTED ;
  wire \NLW_blk00000040_P<29>_UNCONNECTED ;
  wire \NLW_blk00000040_P<28>_UNCONNECTED ;
  wire \NLW_blk00000040_P<27>_UNCONNECTED ;
  wire \NLW_blk00000040_P<26>_UNCONNECTED ;
  wire \NLW_blk00000040_P<25>_UNCONNECTED ;
  wire \NLW_blk00000040_P<24>_UNCONNECTED ;
  wire \NLW_blk00000040_P<23>_UNCONNECTED ;
  wire \NLW_blk00000040_P<22>_UNCONNECTED ;
  wire \NLW_blk00000040_P<21>_UNCONNECTED ;
  wire \NLW_blk00000040_P<20>_UNCONNECTED ;
  wire \NLW_blk00000040_P<19>_UNCONNECTED ;
  wire \NLW_blk00000040_P<18>_UNCONNECTED ;
  wire \NLW_blk00000040_P<17>_UNCONNECTED ;
  wire \NLW_blk00000040_P<16>_UNCONNECTED ;
  wire \NLW_blk00000040_P<15>_UNCONNECTED ;
  wire \NLW_blk00000040_P<14>_UNCONNECTED ;
  wire \NLW_blk00000040_P<13>_UNCONNECTED ;
  wire \NLW_blk00000040_P<12>_UNCONNECTED ;
  wire \NLW_blk00000040_P<11>_UNCONNECTED ;
  wire \NLW_blk00000040_P<10>_UNCONNECTED ;
  wire \NLW_blk00000040_P<9>_UNCONNECTED ;
  wire \NLW_blk00000040_P<8>_UNCONNECTED ;
  wire \NLW_blk00000040_P<7>_UNCONNECTED ;
  wire \NLW_blk00000040_P<6>_UNCONNECTED ;
  wire \NLW_blk00000040_P<5>_UNCONNECTED ;
  wire \NLW_blk00000040_P<4>_UNCONNECTED ;
  wire \NLW_blk00000040_P<3>_UNCONNECTED ;
  wire \NLW_blk00000040_P<2>_UNCONNECTED ;
  wire \NLW_blk00000040_P<1>_UNCONNECTED ;
  wire \NLW_blk00000040_P<0>_UNCONNECTED ;
  wire NLW_blk00000041_PATTERNBDETECT_UNCONNECTED;
  wire NLW_blk00000041_MULTSIGNOUT_UNCONNECTED;
  wire NLW_blk00000041_CARRYCASCOUT_UNCONNECTED;
  wire NLW_blk00000041_UNDERFLOW_UNCONNECTED;
  wire NLW_blk00000041_PATTERNDETECT_UNCONNECTED;
  wire NLW_blk00000041_OVERFLOW_UNCONNECTED;
  wire \NLW_blk00000041_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000041_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000041_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000041_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000041_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000041_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000041_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000041_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000041_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000041_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000041_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000041_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000041_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000041_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000041_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000041_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000041_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000041_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000041_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000041_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000041_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000041_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000041_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000041_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000041_P<47>_UNCONNECTED ;
  wire \NLW_blk00000041_P<46>_UNCONNECTED ;
  wire \NLW_blk00000041_P<45>_UNCONNECTED ;
  wire \NLW_blk00000041_P<44>_UNCONNECTED ;
  wire \NLW_blk00000041_P<43>_UNCONNECTED ;
  wire \NLW_blk00000041_P<42>_UNCONNECTED ;
  wire \NLW_blk00000041_P<41>_UNCONNECTED ;
  wire \NLW_blk00000041_P<40>_UNCONNECTED ;
  wire \NLW_blk00000041_P<39>_UNCONNECTED ;
  wire \NLW_blk00000041_P<38>_UNCONNECTED ;
  wire \NLW_blk00000041_P<37>_UNCONNECTED ;
  wire \NLW_blk00000041_P<36>_UNCONNECTED ;
  wire \NLW_blk00000041_P<35>_UNCONNECTED ;
  wire \NLW_blk00000041_P<34>_UNCONNECTED ;
  wire \NLW_blk00000041_P<33>_UNCONNECTED ;
  wire \NLW_blk00000041_P<32>_UNCONNECTED ;
  wire \NLW_blk00000041_P<31>_UNCONNECTED ;
  wire \NLW_blk00000041_P<30>_UNCONNECTED ;
  wire \NLW_blk00000041_P<29>_UNCONNECTED ;
  wire \NLW_blk00000041_P<28>_UNCONNECTED ;
  wire \NLW_blk00000041_P<27>_UNCONNECTED ;
  wire \NLW_blk00000041_P<26>_UNCONNECTED ;
  wire \NLW_blk00000041_P<25>_UNCONNECTED ;
  wire \NLW_blk00000041_P<24>_UNCONNECTED ;
  wire \NLW_blk00000041_P<23>_UNCONNECTED ;
  wire \NLW_blk00000041_P<22>_UNCONNECTED ;
  wire \NLW_blk00000041_P<21>_UNCONNECTED ;
  wire \NLW_blk00000041_P<20>_UNCONNECTED ;
  wire \NLW_blk00000041_P<19>_UNCONNECTED ;
  wire \NLW_blk00000041_P<18>_UNCONNECTED ;
  wire \NLW_blk00000041_P<17>_UNCONNECTED ;
  wire \NLW_blk00000041_P<16>_UNCONNECTED ;
  wire \NLW_blk00000041_P<15>_UNCONNECTED ;
  wire \NLW_blk00000041_P<14>_UNCONNECTED ;
  wire \NLW_blk00000041_P<13>_UNCONNECTED ;
  wire \NLW_blk00000041_P<12>_UNCONNECTED ;
  wire \NLW_blk00000041_P<11>_UNCONNECTED ;
  wire \NLW_blk00000041_P<10>_UNCONNECTED ;
  wire \NLW_blk00000041_P<9>_UNCONNECTED ;
  wire \NLW_blk00000041_P<8>_UNCONNECTED ;
  wire \NLW_blk00000041_P<7>_UNCONNECTED ;
  wire \NLW_blk00000041_P<6>_UNCONNECTED ;
  wire \NLW_blk00000041_P<5>_UNCONNECTED ;
  wire \NLW_blk00000041_P<4>_UNCONNECTED ;
  wire \NLW_blk00000041_P<3>_UNCONNECTED ;
  wire \NLW_blk00000041_P<2>_UNCONNECTED ;
  wire \NLW_blk00000041_P<1>_UNCONNECTED ;
  wire \NLW_blk00000041_P<0>_UNCONNECTED ;
  wire NLW_blk00000042_PATTERNBDETECT_UNCONNECTED;
  wire NLW_blk00000042_MULTSIGNOUT_UNCONNECTED;
  wire NLW_blk00000042_CARRYCASCOUT_UNCONNECTED;
  wire NLW_blk00000042_UNDERFLOW_UNCONNECTED;
  wire NLW_blk00000042_PATTERNDETECT_UNCONNECTED;
  wire NLW_blk00000042_OVERFLOW_UNCONNECTED;
  wire \NLW_blk00000042_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000042_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000042_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000042_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000042_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000042_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000042_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000042_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000042_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000042_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000042_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000042_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000042_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000042_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000042_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000042_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000042_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000042_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000042_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000042_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000042_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000042_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000042_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000042_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000042_P<47>_UNCONNECTED ;
  wire \NLW_blk00000042_P<46>_UNCONNECTED ;
  wire \NLW_blk00000042_P<45>_UNCONNECTED ;
  wire \NLW_blk00000042_P<44>_UNCONNECTED ;
  wire \NLW_blk00000042_P<43>_UNCONNECTED ;
  wire \NLW_blk00000042_P<42>_UNCONNECTED ;
  wire \NLW_blk00000042_P<41>_UNCONNECTED ;
  wire \NLW_blk00000042_P<40>_UNCONNECTED ;
  wire \NLW_blk00000042_P<39>_UNCONNECTED ;
  wire \NLW_blk00000042_P<38>_UNCONNECTED ;
  wire \NLW_blk00000042_P<37>_UNCONNECTED ;
  wire \NLW_blk00000042_P<36>_UNCONNECTED ;
  wire \NLW_blk00000042_P<35>_UNCONNECTED ;
  wire \NLW_blk00000042_P<34>_UNCONNECTED ;
  wire \NLW_blk00000042_P<33>_UNCONNECTED ;
  wire \NLW_blk00000042_P<32>_UNCONNECTED ;
  wire \NLW_blk00000042_P<31>_UNCONNECTED ;
  wire \NLW_blk00000042_P<30>_UNCONNECTED ;
  wire \NLW_blk00000042_P<29>_UNCONNECTED ;
  wire \NLW_blk00000042_P<28>_UNCONNECTED ;
  wire \NLW_blk00000042_P<27>_UNCONNECTED ;
  wire \NLW_blk00000042_P<26>_UNCONNECTED ;
  wire \NLW_blk00000042_P<25>_UNCONNECTED ;
  wire \NLW_blk00000042_P<24>_UNCONNECTED ;
  wire \NLW_blk00000042_P<23>_UNCONNECTED ;
  wire \NLW_blk00000042_P<22>_UNCONNECTED ;
  wire \NLW_blk00000042_P<21>_UNCONNECTED ;
  wire \NLW_blk00000042_P<20>_UNCONNECTED ;
  wire \NLW_blk00000042_P<19>_UNCONNECTED ;
  wire \NLW_blk00000042_P<18>_UNCONNECTED ;
  wire \NLW_blk00000042_P<17>_UNCONNECTED ;
  wire \NLW_blk00000042_P<16>_UNCONNECTED ;
  wire \NLW_blk00000042_P<15>_UNCONNECTED ;
  wire \NLW_blk00000042_P<14>_UNCONNECTED ;
  wire \NLW_blk00000042_P<13>_UNCONNECTED ;
  wire \NLW_blk00000042_P<12>_UNCONNECTED ;
  wire \NLW_blk00000042_P<11>_UNCONNECTED ;
  wire \NLW_blk00000042_P<10>_UNCONNECTED ;
  wire \NLW_blk00000042_P<9>_UNCONNECTED ;
  wire \NLW_blk00000042_P<8>_UNCONNECTED ;
  wire \NLW_blk00000042_P<7>_UNCONNECTED ;
  wire \NLW_blk00000042_P<6>_UNCONNECTED ;
  wire \NLW_blk00000042_P<5>_UNCONNECTED ;
  wire \NLW_blk00000042_P<4>_UNCONNECTED ;
  wire \NLW_blk00000042_P<3>_UNCONNECTED ;
  wire \NLW_blk00000042_P<2>_UNCONNECTED ;
  wire \NLW_blk00000042_P<1>_UNCONNECTED ;
  wire \NLW_blk00000042_P<0>_UNCONNECTED ;
  wire NLW_blk00000043_PATTERNBDETECT_UNCONNECTED;
  wire NLW_blk00000043_MULTSIGNOUT_UNCONNECTED;
  wire NLW_blk00000043_CARRYCASCOUT_UNCONNECTED;
  wire NLW_blk00000043_UNDERFLOW_UNCONNECTED;
  wire NLW_blk00000043_PATTERNDETECT_UNCONNECTED;
  wire NLW_blk00000043_OVERFLOW_UNCONNECTED;
  wire \NLW_blk00000043_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000043_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000043_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000043_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000043_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000043_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000043_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000043_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000043_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000043_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000043_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000043_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000043_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000043_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000043_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000043_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000043_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000043_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000043_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000043_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000043_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000043_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000043_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000043_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000043_P<47>_UNCONNECTED ;
  wire \NLW_blk00000043_P<46>_UNCONNECTED ;
  wire \NLW_blk00000043_P<45>_UNCONNECTED ;
  wire \NLW_blk00000043_P<44>_UNCONNECTED ;
  wire \NLW_blk00000043_P<43>_UNCONNECTED ;
  wire \NLW_blk00000043_P<42>_UNCONNECTED ;
  wire \NLW_blk00000043_P<41>_UNCONNECTED ;
  wire \NLW_blk00000043_P<40>_UNCONNECTED ;
  wire \NLW_blk00000043_P<39>_UNCONNECTED ;
  wire \NLW_blk00000043_P<38>_UNCONNECTED ;
  wire \NLW_blk00000043_P<37>_UNCONNECTED ;
  wire \NLW_blk00000043_P<36>_UNCONNECTED ;
  wire \NLW_blk00000043_P<35>_UNCONNECTED ;
  wire \NLW_blk00000043_P<34>_UNCONNECTED ;
  wire \NLW_blk00000043_P<33>_UNCONNECTED ;
  wire \NLW_blk00000043_P<32>_UNCONNECTED ;
  wire \NLW_blk00000043_P<31>_UNCONNECTED ;
  wire \NLW_blk00000043_P<30>_UNCONNECTED ;
  wire \NLW_blk00000043_P<29>_UNCONNECTED ;
  wire \NLW_blk00000043_P<28>_UNCONNECTED ;
  wire \NLW_blk00000043_P<27>_UNCONNECTED ;
  wire \NLW_blk00000043_P<26>_UNCONNECTED ;
  wire \NLW_blk00000043_P<25>_UNCONNECTED ;
  wire \NLW_blk00000043_P<24>_UNCONNECTED ;
  wire \NLW_blk00000043_P<23>_UNCONNECTED ;
  wire \NLW_blk00000043_P<22>_UNCONNECTED ;
  wire \NLW_blk00000043_P<21>_UNCONNECTED ;
  wire \NLW_blk00000043_P<20>_UNCONNECTED ;
  wire \NLW_blk00000043_P<19>_UNCONNECTED ;
  wire \NLW_blk00000043_P<18>_UNCONNECTED ;
  wire \NLW_blk00000043_P<17>_UNCONNECTED ;
  wire \NLW_blk00000043_P<16>_UNCONNECTED ;
  wire \NLW_blk00000043_P<15>_UNCONNECTED ;
  wire \NLW_blk00000043_P<14>_UNCONNECTED ;
  wire \NLW_blk00000043_P<13>_UNCONNECTED ;
  wire \NLW_blk00000043_P<12>_UNCONNECTED ;
  wire \NLW_blk00000043_P<11>_UNCONNECTED ;
  wire \NLW_blk00000043_P<10>_UNCONNECTED ;
  wire \NLW_blk00000043_P<9>_UNCONNECTED ;
  wire \NLW_blk00000043_P<8>_UNCONNECTED ;
  wire \NLW_blk00000043_P<7>_UNCONNECTED ;
  wire \NLW_blk00000043_P<6>_UNCONNECTED ;
  wire \NLW_blk00000043_P<5>_UNCONNECTED ;
  wire \NLW_blk00000043_P<4>_UNCONNECTED ;
  wire \NLW_blk00000043_P<3>_UNCONNECTED ;
  wire \NLW_blk00000043_P<2>_UNCONNECTED ;
  wire \NLW_blk00000043_P<1>_UNCONNECTED ;
  wire \NLW_blk00000043_P<0>_UNCONNECTED ;
  wire NLW_blk00000064_O_UNCONNECTED;
  wire NLW_blk00000066_O_UNCONNECTED;
  wire NLW_blk00000089_O_UNCONNECTED;
  wire NLW_blk0000008b_O_UNCONNECTED;
  wire NLW_blk000000a1_PATTERNBDETECT_UNCONNECTED;
  wire NLW_blk000000a1_MULTSIGNOUT_UNCONNECTED;
  wire NLW_blk000000a1_CARRYCASCOUT_UNCONNECTED;
  wire NLW_blk000000a1_UNDERFLOW_UNCONNECTED;
  wire NLW_blk000000a1_PATTERNDETECT_UNCONNECTED;
  wire NLW_blk000000a1_OVERFLOW_UNCONNECTED;
  wire \NLW_blk000000a1_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk000000a1_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk000000a1_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk000000a1_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk000000a1_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk000000a1_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk000000a1_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk000000a1_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk000000a1_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk000000a1_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk000000a1_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk000000a1_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk000000a1_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk000000a1_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk000000a1_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk000000a1_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk000000a1_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk000000a1_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk000000a1_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk000000a1_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk000000a1_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk000000a1_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk000000a1_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk000000a1_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk000000a1_P<0>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<47>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<46>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<45>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<44>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<43>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<42>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<41>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<40>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<39>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<38>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<37>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<36>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<35>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<34>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<33>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<32>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<31>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<30>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<29>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<28>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<27>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<26>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<25>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<24>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<23>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<22>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<21>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<20>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<19>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<18>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<17>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<16>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<15>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<14>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<13>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<12>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<11>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<10>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<9>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<8>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<7>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<6>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<5>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<4>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<3>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<2>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<1>_UNCONNECTED ;
  wire \NLW_blk000000a1_PCOUT<0>_UNCONNECTED ;
  wire NLW_blk00000194_Q15_UNCONNECTED;
  wire NLW_blk00000196_Q15_UNCONNECTED;
  wire NLW_blk00000198_Q15_UNCONNECTED;
  wire NLW_blk0000019a_Q15_UNCONNECTED;
  wire NLW_blk0000019c_Q15_UNCONNECTED;
  wire NLW_blk0000019e_Q15_UNCONNECTED;
  wire NLW_blk000001a0_Q15_UNCONNECTED;
  wire NLW_blk000001a2_Q15_UNCONNECTED;
  wire NLW_blk000001a4_Q15_UNCONNECTED;
  wire NLW_blk000001a6_Q15_UNCONNECTED;
  wire NLW_blk000001a8_Q15_UNCONNECTED;
  wire NLW_blk000001aa_Q15_UNCONNECTED;
  wire NLW_blk000001ac_Q15_UNCONNECTED;
  wire [51 : 51] \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op ;
  wire [10 : 0] \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op ;
  assign
    m_axis_result_tdata[63] = \U0/i_synth/MULT.OP/OP/sign_op ,
    m_axis_result_tdata[62] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [10],
    m_axis_result_tdata[61] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [9],
    m_axis_result_tdata[60] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [8],
    m_axis_result_tdata[59] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [7],
    m_axis_result_tdata[58] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [6],
    m_axis_result_tdata[57] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [5],
    m_axis_result_tdata[56] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [4],
    m_axis_result_tdata[55] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [3],
    m_axis_result_tdata[54] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [2],
    m_axis_result_tdata[53] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [1],
    m_axis_result_tdata[52] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [0],
    m_axis_result_tdata[51] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op [51],
    m_axis_result_tdata[50] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_0 ,
    m_axis_result_tdata[49] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_1 ,
    m_axis_result_tdata[48] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_2 ,
    m_axis_result_tdata[47] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_3 ,
    m_axis_result_tdata[46] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_4 ,
    m_axis_result_tdata[45] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_5 ,
    m_axis_result_tdata[44] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_6 ,
    m_axis_result_tdata[43] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_7 ,
    m_axis_result_tdata[42] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_8 ,
    m_axis_result_tdata[41] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_9 ,
    m_axis_result_tdata[40] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_10 ,
    m_axis_result_tdata[39] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_11 ,
    m_axis_result_tdata[38] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_12 ,
    m_axis_result_tdata[37] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_13 ,
    m_axis_result_tdata[36] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_14 ,
    m_axis_result_tdata[35] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_15 ,
    m_axis_result_tdata[34] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_16 ,
    m_axis_result_tdata[33] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_17 ,
    m_axis_result_tdata[32] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_18 ,
    m_axis_result_tdata[31] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_19 ,
    m_axis_result_tdata[30] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_20 ,
    m_axis_result_tdata[29] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_21 ,
    m_axis_result_tdata[28] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_22 ,
    m_axis_result_tdata[27] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_23 ,
    m_axis_result_tdata[26] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_24 ,
    m_axis_result_tdata[25] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_25 ,
    m_axis_result_tdata[24] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_26 ,
    m_axis_result_tdata[23] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_27 ,
    m_axis_result_tdata[22] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_28 ,
    m_axis_result_tdata[21] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_29 ,
    m_axis_result_tdata[20] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_30 ,
    m_axis_result_tdata[19] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_31 ,
    m_axis_result_tdata[18] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_32 ,
    m_axis_result_tdata[17] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_33 ,
    m_axis_result_tdata[16] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_34 ,
    m_axis_result_tdata[15] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_35 ,
    m_axis_result_tdata[14] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_36 ,
    m_axis_result_tdata[13] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_37 ,
    m_axis_result_tdata[12] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_38 ,
    m_axis_result_tdata[11] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_39 ,
    m_axis_result_tdata[10] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_40 ,
    m_axis_result_tdata[9] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_41 ,
    m_axis_result_tdata[8] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_42 ,
    m_axis_result_tdata[7] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_43 ,
    m_axis_result_tdata[6] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_44 ,
    m_axis_result_tdata[5] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_45 ,
    m_axis_result_tdata[4] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_46 ,
    m_axis_result_tdata[3] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_47 ,
    m_axis_result_tdata[2] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_48 ,
    m_axis_result_tdata[1] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_49 ,
    m_axis_result_tdata[0] = \NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_50 ,
    m_axis_result_tvalid = \U0/i_synth/i_nd_to_rdy/opt_has_pipe.pipe_3 ;
  VCC   blk00000001 (
    .P(sig00000001)
  );
  GND   blk00000002 (
    .G(sig00000002)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000003 (
    .C(aclk),
    .CE(aclken),
    .D(sig00000003),
    .Q(sig00000079)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000004 (
    .C(aclk),
    .CE(aclken),
    .D(sig00000092),
    .Q(sig0000007c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000005 (
    .C(aclk),
    .CE(aclken),
    .D(sig00000095),
    .Q(sig0000007d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000006 (
    .C(aclk),
    .CE(aclken),
    .D(sig00000093),
    .Q(sig0000007f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000007 (
    .C(aclk),
    .CE(aclken),
    .D(sig00000094),
    .Q(sig0000007e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000008 (
    .C(aclk),
    .CE(aclken),
    .D(sig0000007f),
    .Q(sig0000009b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000009 (
    .C(aclk),
    .CE(aclken),
    .D(sig0000007e),
    .Q(sig0000009c)
  );
  XORCY   blk0000000a (
    .CI(sig000000ab),
    .LI(sig0000008e),
    .O(sig000000aa)
  );
  MUXCY   blk0000000b (
    .CI(sig000000ab),
    .DI(s_axis_b_tdata[62]),
    .S(sig0000008e),
    .O(sig0000009f)
  );
  XORCY   blk0000000c (
    .CI(sig000000ac),
    .LI(sig0000008d),
    .O(sig000000a9)
  );
  MUXCY   blk0000000d (
    .CI(sig000000ac),
    .DI(s_axis_b_tdata[61]),
    .S(sig0000008d),
    .O(sig000000ab)
  );
  XORCY   blk0000000e (
    .CI(sig000000ad),
    .LI(sig0000008c),
    .O(sig000000a8)
  );
  MUXCY   blk0000000f (
    .CI(sig000000ad),
    .DI(s_axis_b_tdata[60]),
    .S(sig0000008c),
    .O(sig000000ac)
  );
  XORCY   blk00000010 (
    .CI(sig000000ae),
    .LI(sig0000008b),
    .O(sig000000a7)
  );
  MUXCY   blk00000011 (
    .CI(sig000000ae),
    .DI(s_axis_b_tdata[59]),
    .S(sig0000008b),
    .O(sig000000ad)
  );
  XORCY   blk00000012 (
    .CI(sig000000af),
    .LI(sig0000008a),
    .O(sig000000a6)
  );
  MUXCY   blk00000013 (
    .CI(sig000000af),
    .DI(s_axis_b_tdata[58]),
    .S(sig0000008a),
    .O(sig000000ae)
  );
  XORCY   blk00000014 (
    .CI(sig000000b0),
    .LI(sig00000089),
    .O(sig000000a5)
  );
  MUXCY   blk00000015 (
    .CI(sig000000b0),
    .DI(s_axis_b_tdata[57]),
    .S(sig00000089),
    .O(sig000000af)
  );
  XORCY   blk00000016 (
    .CI(sig000000b1),
    .LI(sig00000088),
    .O(sig000000a4)
  );
  MUXCY   blk00000017 (
    .CI(sig000000b1),
    .DI(s_axis_b_tdata[56]),
    .S(sig00000088),
    .O(sig000000b0)
  );
  XORCY   blk00000018 (
    .CI(sig000000b2),
    .LI(sig00000087),
    .O(sig000000a3)
  );
  MUXCY   blk00000019 (
    .CI(sig000000b2),
    .DI(s_axis_b_tdata[55]),
    .S(sig00000087),
    .O(sig000000b1)
  );
  XORCY   blk0000001a (
    .CI(sig000000b3),
    .LI(sig00000086),
    .O(sig000000a2)
  );
  MUXCY   blk0000001b (
    .CI(sig000000b3),
    .DI(s_axis_b_tdata[54]),
    .S(sig00000086),
    .O(sig000000b2)
  );
  XORCY   blk0000001c (
    .CI(sig000000b4),
    .LI(sig00000085),
    .O(sig000000a1)
  );
  MUXCY   blk0000001d (
    .CI(sig000000b4),
    .DI(s_axis_b_tdata[53]),
    .S(sig00000085),
    .O(sig000000b3)
  );
  XORCY   blk0000001e (
    .CI(sig00000001),
    .LI(sig00000084),
    .O(sig000000a0)
  );
  MUXCY   blk0000001f (
    .CI(sig00000001),
    .DI(s_axis_b_tdata[52]),
    .S(sig00000084),
    .O(sig000000b4)
  );
  MUXCY   blk00000020 (
    .CI(sig000000c7),
    .DI(sig00000002),
    .S(sig000000c6),
    .O(sig0000009d)
  );
  MUXCY   blk00000021 (
    .CI(sig000000c8),
    .DI(sig00000002),
    .S(sig000000be),
    .O(sig000000c7)
  );
  MUXCY   blk00000022 (
    .CI(sig000000c9),
    .DI(sig00000002),
    .S(sig000000bf),
    .O(sig000000c8)
  );
  MUXCY   blk00000023 (
    .CI(sig000000ca),
    .DI(sig00000002),
    .S(sig000000c0),
    .O(sig000000c9)
  );
  MUXCY   blk00000024 (
    .CI(sig000000cb),
    .DI(sig00000002),
    .S(sig000000c1),
    .O(sig000000ca)
  );
  MUXCY   blk00000025 (
    .CI(sig000000cc),
    .DI(sig00000002),
    .S(sig000000c2),
    .O(sig000000cb)
  );
  MUXCY   blk00000026 (
    .CI(sig000000cd),
    .DI(sig00000002),
    .S(sig000000c3),
    .O(sig000000cc)
  );
  MUXCY   blk00000027 (
    .CI(sig000000ce),
    .DI(sig00000002),
    .S(sig000000c4),
    .O(sig000000cd)
  );
  MUXCY   blk00000028 (
    .CI(sig00000001),
    .DI(sig00000002),
    .S(sig000000c5),
    .O(sig000000ce)
  );
  MUXCY   blk00000029 (
    .CI(sig000000cf),
    .DI(sig00000002),
    .S(sig000000bd),
    .O(sig0000009e)
  );
  MUXCY   blk0000002a (
    .CI(sig000000d0),
    .DI(sig00000002),
    .S(sig000000b5),
    .O(sig000000cf)
  );
  MUXCY   blk0000002b (
    .CI(sig000000d1),
    .DI(sig00000002),
    .S(sig000000b6),
    .O(sig000000d0)
  );
  MUXCY   blk0000002c (
    .CI(sig000000d2),
    .DI(sig00000002),
    .S(sig000000b7),
    .O(sig000000d1)
  );
  MUXCY   blk0000002d (
    .CI(sig000000d3),
    .DI(sig00000002),
    .S(sig000000b8),
    .O(sig000000d2)
  );
  MUXCY   blk0000002e (
    .CI(sig000000d4),
    .DI(sig00000002),
    .S(sig000000b9),
    .O(sig000000d3)
  );
  MUXCY   blk0000002f (
    .CI(sig000000d5),
    .DI(sig00000002),
    .S(sig000000ba),
    .O(sig000000d4)
  );
  MUXCY   blk00000030 (
    .CI(sig000000d6),
    .DI(sig00000002),
    .S(sig000000bb),
    .O(sig000000d5)
  );
  MUXCY   blk00000031 (
    .CI(sig00000001),
    .DI(sig00000002),
    .S(sig000000bc),
    .O(sig000000d6)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000032 (
    .C(aclk),
    .CE(aclken),
    .D(sig000000da),
    .Q(sig00000099)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000033 (
    .C(aclk),
    .CE(aclken),
    .D(sig000000d9),
    .Q(sig0000009a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000034 (
    .C(aclk),
    .CE(aclken),
    .D(sig000000d8),
    .Q(sig00000097)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000035 (
    .C(aclk),
    .CE(aclken),
    .D(sig000000d7),
    .Q(sig00000098)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000036 (
    .C(aclk),
    .CE(aclken),
    .D(sig00000091),
    .Q(sig000000da)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000037 (
    .C(aclk),
    .CE(aclken),
    .D(sig00000096),
    .Q(sig000000d9)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000038 (
    .C(aclk),
    .CE(aclken),
    .D(sig0000008f),
    .Q(sig000000d8)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000039 (
    .C(aclk),
    .CE(aclken),
    .D(sig00000090),
    .Q(sig000000d7)
  );
  DSP48E1 #(
    .ACASCREG ( 0 ),
    .ADREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 0 ),
    .AUTORESET_PATDET ( "NO_RESET" ),
    .A_INPUT ( "DIRECT" ),
    .BCASCREG ( 0 ),
    .BREG ( 0 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .DREG ( 0 ),
    .INMODEREG ( 0 ),
    .MASK ( 48'hFFFFFFFE0000 ),
    .MREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 0 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .USE_DPORT ( "FALSE" ),
    .USE_MULT ( "MULTIPLY" ),
    .USE_PATTERN_DETECT ( "PATDET" ),
    .USE_SIMD ( "ONE48" ))
  blk0000003a (
    .PATTERNBDETECT(NLW_blk0000003a_PATTERNBDETECT_UNCONNECTED),
    .RSTC(sig00000002),
    .CEB1(sig00000002),
    .CEAD(sig00000002),
    .MULTSIGNOUT(NLW_blk0000003a_MULTSIGNOUT_UNCONNECTED),
    .CEC(sig00000002),
    .RSTM(sig00000002),
    .MULTSIGNIN(sig00000002),
    .CEB2(sig00000002),
    .RSTCTRL(sig00000002),
    .CEP(sig00000002),
    .CARRYCASCOUT(NLW_blk0000003a_CARRYCASCOUT_UNCONNECTED),
    .RSTA(sig00000002),
    .CECARRYIN(sig00000002),
    .UNDERFLOW(NLW_blk0000003a_UNDERFLOW_UNCONNECTED),
    .PATTERNDETECT(sig000002dd),
    .RSTALUMODE(sig00000002),
    .RSTALLCARRYIN(sig00000002),
    .CED(sig00000002),
    .RSTD(sig00000002),
    .CEALUMODE(sig00000002),
    .CEA2(sig00000002),
    .CLK(aclk),
    .CEA1(sig00000002),
    .RSTB(sig00000002),
    .OVERFLOW(NLW_blk0000003a_OVERFLOW_UNCONNECTED),
    .CECTRL(sig00000002),
    .CEM(sig00000002),
    .CARRYIN(sig00000002),
    .CARRYCASCIN(sig00000002),
    .RSTINMODE(sig00000002),
    .CEINMODE(sig00000002),
    .RSTP(sig00000002),
    .ACOUT({\NLW_blk0000003a_ACOUT<29>_UNCONNECTED , \NLW_blk0000003a_ACOUT<28>_UNCONNECTED , \NLW_blk0000003a_ACOUT<27>_UNCONNECTED , 
\NLW_blk0000003a_ACOUT<26>_UNCONNECTED , \NLW_blk0000003a_ACOUT<25>_UNCONNECTED , \NLW_blk0000003a_ACOUT<24>_UNCONNECTED , 
\NLW_blk0000003a_ACOUT<23>_UNCONNECTED , \NLW_blk0000003a_ACOUT<22>_UNCONNECTED , \NLW_blk0000003a_ACOUT<21>_UNCONNECTED , 
\NLW_blk0000003a_ACOUT<20>_UNCONNECTED , \NLW_blk0000003a_ACOUT<19>_UNCONNECTED , \NLW_blk0000003a_ACOUT<18>_UNCONNECTED , 
\NLW_blk0000003a_ACOUT<17>_UNCONNECTED , \NLW_blk0000003a_ACOUT<16>_UNCONNECTED , \NLW_blk0000003a_ACOUT<15>_UNCONNECTED , 
\NLW_blk0000003a_ACOUT<14>_UNCONNECTED , \NLW_blk0000003a_ACOUT<13>_UNCONNECTED , \NLW_blk0000003a_ACOUT<12>_UNCONNECTED , 
\NLW_blk0000003a_ACOUT<11>_UNCONNECTED , \NLW_blk0000003a_ACOUT<10>_UNCONNECTED , \NLW_blk0000003a_ACOUT<9>_UNCONNECTED , 
\NLW_blk0000003a_ACOUT<8>_UNCONNECTED , \NLW_blk0000003a_ACOUT<7>_UNCONNECTED , \NLW_blk0000003a_ACOUT<6>_UNCONNECTED , 
\NLW_blk0000003a_ACOUT<5>_UNCONNECTED , \NLW_blk0000003a_ACOUT<4>_UNCONNECTED , \NLW_blk0000003a_ACOUT<3>_UNCONNECTED , 
\NLW_blk0000003a_ACOUT<2>_UNCONNECTED , \NLW_blk0000003a_ACOUT<1>_UNCONNECTED , \NLW_blk0000003a_ACOUT<0>_UNCONNECTED }),
    .OPMODE({sig00000002, sig00000002, sig00000002, sig00000002, sig00000001, sig00000002, sig00000001}),
    .PCIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .ALUMODE({sig00000002, sig00000002, sig00000002, sig00000002}),
    .C({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYOUT({\NLW_blk0000003a_CARRYOUT<3>_UNCONNECTED , \NLW_blk0000003a_CARRYOUT<2>_UNCONNECTED , \NLW_blk0000003a_CARRYOUT<1>_UNCONNECTED , 
\NLW_blk0000003a_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .BCIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .B({sig00000002, s_axis_b_tdata[16], s_axis_b_tdata[15], s_axis_b_tdata[14], s_axis_b_tdata[13], s_axis_b_tdata[12], s_axis_b_tdata[11], 
s_axis_b_tdata[10], s_axis_b_tdata[9], s_axis_b_tdata[8], s_axis_b_tdata[7], s_axis_b_tdata[6], s_axis_b_tdata[5], s_axis_b_tdata[4], 
s_axis_b_tdata[3], s_axis_b_tdata[2], s_axis_b_tdata[1], s_axis_b_tdata[0]}),
    .BCOUT({sig0000031f, sig0000031e, sig0000031d, sig0000031c, sig0000031b, sig0000031a, sig00000319, sig00000318, sig00000317, sig00000316, 
sig00000315, sig00000314, sig00000313, sig00000312, sig00000311, sig00000310, sig0000030f, sig0000030e}),
    .D({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002}),
    .P({\NLW_blk0000003a_P<47>_UNCONNECTED , \NLW_blk0000003a_P<46>_UNCONNECTED , \NLW_blk0000003a_P<45>_UNCONNECTED , 
\NLW_blk0000003a_P<44>_UNCONNECTED , \NLW_blk0000003a_P<43>_UNCONNECTED , \NLW_blk0000003a_P<42>_UNCONNECTED , \NLW_blk0000003a_P<41>_UNCONNECTED , 
\NLW_blk0000003a_P<40>_UNCONNECTED , \NLW_blk0000003a_P<39>_UNCONNECTED , \NLW_blk0000003a_P<38>_UNCONNECTED , \NLW_blk0000003a_P<37>_UNCONNECTED , 
\NLW_blk0000003a_P<36>_UNCONNECTED , \NLW_blk0000003a_P<35>_UNCONNECTED , \NLW_blk0000003a_P<34>_UNCONNECTED , \NLW_blk0000003a_P<33>_UNCONNECTED , 
\NLW_blk0000003a_P<32>_UNCONNECTED , \NLW_blk0000003a_P<31>_UNCONNECTED , \NLW_blk0000003a_P<30>_UNCONNECTED , \NLW_blk0000003a_P<29>_UNCONNECTED , 
\NLW_blk0000003a_P<28>_UNCONNECTED , \NLW_blk0000003a_P<27>_UNCONNECTED , \NLW_blk0000003a_P<26>_UNCONNECTED , \NLW_blk0000003a_P<25>_UNCONNECTED , 
\NLW_blk0000003a_P<24>_UNCONNECTED , \NLW_blk0000003a_P<23>_UNCONNECTED , \NLW_blk0000003a_P<22>_UNCONNECTED , \NLW_blk0000003a_P<21>_UNCONNECTED , 
\NLW_blk0000003a_P<20>_UNCONNECTED , \NLW_blk0000003a_P<19>_UNCONNECTED , \NLW_blk0000003a_P<18>_UNCONNECTED , \NLW_blk0000003a_P<17>_UNCONNECTED , 
\NLW_blk0000003a_P<16>_UNCONNECTED , \NLW_blk0000003a_P<15>_UNCONNECTED , \NLW_blk0000003a_P<14>_UNCONNECTED , \NLW_blk0000003a_P<13>_UNCONNECTED , 
\NLW_blk0000003a_P<12>_UNCONNECTED , \NLW_blk0000003a_P<11>_UNCONNECTED , \NLW_blk0000003a_P<10>_UNCONNECTED , \NLW_blk0000003a_P<9>_UNCONNECTED , 
\NLW_blk0000003a_P<8>_UNCONNECTED , \NLW_blk0000003a_P<7>_UNCONNECTED , \NLW_blk0000003a_P<6>_UNCONNECTED , \NLW_blk0000003a_P<5>_UNCONNECTED , 
\NLW_blk0000003a_P<4>_UNCONNECTED , \NLW_blk0000003a_P<3>_UNCONNECTED , \NLW_blk0000003a_P<2>_UNCONNECTED , \NLW_blk0000003a_P<1>_UNCONNECTED , 
\NLW_blk0000003a_P<0>_UNCONNECTED }),
    .A({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, s_axis_a_tdata[16], s_axis_a_tdata[15], s_axis_a_tdata[14], s_axis_a_tdata[13], s_axis_a_tdata[12], s_axis_a_tdata[11], 
s_axis_a_tdata[10], s_axis_a_tdata[9], s_axis_a_tdata[8], s_axis_a_tdata[7], s_axis_a_tdata[6], s_axis_a_tdata[5], s_axis_a_tdata[4], 
s_axis_a_tdata[3], s_axis_a_tdata[2], s_axis_a_tdata[1], s_axis_a_tdata[0]}),
    .PCOUT({sig0000030d, sig0000030c, sig0000030b, sig0000030a, sig00000309, sig00000308, sig00000307, sig00000306, sig00000305, sig00000304, 
sig00000303, sig00000302, sig00000301, sig00000300, sig000002ff, sig000002fe, sig000002fd, sig000002fc, sig000002fb, sig000002fa, sig000002f9, 
sig000002f8, sig000002f7, sig000002f6, sig000002f5, sig000002f4, sig000002f3, sig000002f2, sig000002f1, sig000002f0, sig000002ef, sig000002ee, 
sig000002ed, sig000002ec, sig000002eb, sig000002ea, sig000002e9, sig000002e8, sig000002e7, sig000002e6, sig000002e5, sig000002e4, sig000002e3, 
sig000002e2, sig000002e1, sig000002e0, sig000002df, sig000002de}),
    .ACIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYINSEL({sig00000002, sig00000002, sig00000002})
  );
  DSP48E1 #(
    .ACASCREG ( 0 ),
    .ADREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 0 ),
    .AUTORESET_PATDET ( "NO_RESET" ),
    .A_INPUT ( "DIRECT" ),
    .BCASCREG ( 0 ),
    .BREG ( 0 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .DREG ( 0 ),
    .INMODEREG ( 0 ),
    .MASK ( 48'hFFFFFFFE0000 ),
    .MREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 0 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .USE_DPORT ( "FALSE" ),
    .USE_MULT ( "MULTIPLY" ),
    .USE_PATTERN_DETECT ( "PATDET" ),
    .USE_SIMD ( "ONE48" ))
  blk0000003b (
    .PATTERNBDETECT(NLW_blk0000003b_PATTERNBDETECT_UNCONNECTED),
    .RSTC(sig00000002),
    .CEB1(sig00000002),
    .CEAD(sig00000002),
    .MULTSIGNOUT(NLW_blk0000003b_MULTSIGNOUT_UNCONNECTED),
    .CEC(sig00000002),
    .RSTM(sig00000002),
    .MULTSIGNIN(sig00000002),
    .CEB2(sig00000002),
    .RSTCTRL(sig00000002),
    .CEP(sig00000002),
    .CARRYCASCOUT(NLW_blk0000003b_CARRYCASCOUT_UNCONNECTED),
    .RSTA(sig00000002),
    .CECARRYIN(sig00000002),
    .UNDERFLOW(NLW_blk0000003b_UNDERFLOW_UNCONNECTED),
    .PATTERNDETECT(sig0000026a),
    .RSTALUMODE(sig00000002),
    .RSTALLCARRYIN(sig00000002),
    .CED(sig00000002),
    .RSTD(sig00000002),
    .CEALUMODE(sig00000002),
    .CEA2(sig00000002),
    .CLK(aclk),
    .CEA1(sig00000002),
    .RSTB(sig00000002),
    .OVERFLOW(NLW_blk0000003b_OVERFLOW_UNCONNECTED),
    .CECTRL(sig00000002),
    .CEM(sig00000002),
    .CARRYIN(sig00000002),
    .CARRYCASCIN(sig00000002),
    .RSTINMODE(sig00000002),
    .CEINMODE(sig00000002),
    .RSTP(sig00000002),
    .ACOUT({\NLW_blk0000003b_ACOUT<29>_UNCONNECTED , \NLW_blk0000003b_ACOUT<28>_UNCONNECTED , \NLW_blk0000003b_ACOUT<27>_UNCONNECTED , 
\NLW_blk0000003b_ACOUT<26>_UNCONNECTED , \NLW_blk0000003b_ACOUT<25>_UNCONNECTED , \NLW_blk0000003b_ACOUT<24>_UNCONNECTED , 
\NLW_blk0000003b_ACOUT<23>_UNCONNECTED , \NLW_blk0000003b_ACOUT<22>_UNCONNECTED , \NLW_blk0000003b_ACOUT<21>_UNCONNECTED , 
\NLW_blk0000003b_ACOUT<20>_UNCONNECTED , \NLW_blk0000003b_ACOUT<19>_UNCONNECTED , \NLW_blk0000003b_ACOUT<18>_UNCONNECTED , 
\NLW_blk0000003b_ACOUT<17>_UNCONNECTED , \NLW_blk0000003b_ACOUT<16>_UNCONNECTED , \NLW_blk0000003b_ACOUT<15>_UNCONNECTED , 
\NLW_blk0000003b_ACOUT<14>_UNCONNECTED , \NLW_blk0000003b_ACOUT<13>_UNCONNECTED , \NLW_blk0000003b_ACOUT<12>_UNCONNECTED , 
\NLW_blk0000003b_ACOUT<11>_UNCONNECTED , \NLW_blk0000003b_ACOUT<10>_UNCONNECTED , \NLW_blk0000003b_ACOUT<9>_UNCONNECTED , 
\NLW_blk0000003b_ACOUT<8>_UNCONNECTED , \NLW_blk0000003b_ACOUT<7>_UNCONNECTED , \NLW_blk0000003b_ACOUT<6>_UNCONNECTED , 
\NLW_blk0000003b_ACOUT<5>_UNCONNECTED , \NLW_blk0000003b_ACOUT<4>_UNCONNECTED , \NLW_blk0000003b_ACOUT<3>_UNCONNECTED , 
\NLW_blk0000003b_ACOUT<2>_UNCONNECTED , \NLW_blk0000003b_ACOUT<1>_UNCONNECTED , \NLW_blk0000003b_ACOUT<0>_UNCONNECTED }),
    .OPMODE({sig00000002, sig00000002, sig00000001, sig00000002, sig00000001, sig00000002, sig00000001}),
    .PCIN({sig000002dc, sig000002db, sig000002da, sig000002d9, sig000002d8, sig000002d7, sig000002d6, sig000002d5, sig000002d4, sig000002d3, 
sig000002d2, sig000002d1, sig000002d0, sig000002cf, sig000002ce, sig000002cd, sig000002cc, sig000002cb, sig000002ca, sig000002c9, sig000002c8, 
sig000002c7, sig000002c6, sig000002c5, sig000002c4, sig000002c3, sig000002c2, sig000002c1, sig000002c0, sig000002bf, sig000002be, sig000002bd, 
sig000002bc, sig000002bb, sig000002ba, sig000002b9, sig000002b8, sig000002b7, sig000002b6, sig000002b5, sig000002b4, sig000002b3, sig000002b2, 
sig000002b1, sig000002b0, sig000002af, sig000002ae, sig000002ad}),
    .ALUMODE({sig00000002, sig00000002, sig00000002, sig00000002}),
    .C({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYOUT({\NLW_blk0000003b_CARRYOUT<3>_UNCONNECTED , \NLW_blk0000003b_CARRYOUT<2>_UNCONNECTED , \NLW_blk0000003b_CARRYOUT<1>_UNCONNECTED , 
\NLW_blk0000003b_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .BCIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .B({sig00000002, s_axis_b_tdata[33], s_axis_b_tdata[32], s_axis_b_tdata[31], s_axis_b_tdata[30], s_axis_b_tdata[29], s_axis_b_tdata[28], 
s_axis_b_tdata[27], s_axis_b_tdata[26], s_axis_b_tdata[25], s_axis_b_tdata[24], s_axis_b_tdata[23], s_axis_b_tdata[22], s_axis_b_tdata[21], 
s_axis_b_tdata[20], s_axis_b_tdata[19], s_axis_b_tdata[18], s_axis_b_tdata[17]}),
    .BCOUT({sig000002ac, sig000002ab, sig000002aa, sig000002a9, sig000002a8, sig000002a7, sig000002a6, sig000002a5, sig000002a4, sig000002a3, 
sig000002a2, sig000002a1, sig000002a0, sig0000029f, sig0000029e, sig0000029d, sig0000029c, sig0000029b}),
    .D({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002}),
    .P({\NLW_blk0000003b_P<47>_UNCONNECTED , \NLW_blk0000003b_P<46>_UNCONNECTED , \NLW_blk0000003b_P<45>_UNCONNECTED , 
\NLW_blk0000003b_P<44>_UNCONNECTED , \NLW_blk0000003b_P<43>_UNCONNECTED , \NLW_blk0000003b_P<42>_UNCONNECTED , \NLW_blk0000003b_P<41>_UNCONNECTED , 
\NLW_blk0000003b_P<40>_UNCONNECTED , \NLW_blk0000003b_P<39>_UNCONNECTED , \NLW_blk0000003b_P<38>_UNCONNECTED , \NLW_blk0000003b_P<37>_UNCONNECTED , 
\NLW_blk0000003b_P<36>_UNCONNECTED , \NLW_blk0000003b_P<35>_UNCONNECTED , \NLW_blk0000003b_P<34>_UNCONNECTED , \NLW_blk0000003b_P<33>_UNCONNECTED , 
\NLW_blk0000003b_P<32>_UNCONNECTED , \NLW_blk0000003b_P<31>_UNCONNECTED , \NLW_blk0000003b_P<30>_UNCONNECTED , \NLW_blk0000003b_P<29>_UNCONNECTED , 
\NLW_blk0000003b_P<28>_UNCONNECTED , \NLW_blk0000003b_P<27>_UNCONNECTED , \NLW_blk0000003b_P<26>_UNCONNECTED , \NLW_blk0000003b_P<25>_UNCONNECTED , 
\NLW_blk0000003b_P<24>_UNCONNECTED , \NLW_blk0000003b_P<23>_UNCONNECTED , \NLW_blk0000003b_P<22>_UNCONNECTED , \NLW_blk0000003b_P<21>_UNCONNECTED , 
\NLW_blk0000003b_P<20>_UNCONNECTED , \NLW_blk0000003b_P<19>_UNCONNECTED , \NLW_blk0000003b_P<18>_UNCONNECTED , \NLW_blk0000003b_P<17>_UNCONNECTED , 
\NLW_blk0000003b_P<16>_UNCONNECTED , \NLW_blk0000003b_P<15>_UNCONNECTED , \NLW_blk0000003b_P<14>_UNCONNECTED , \NLW_blk0000003b_P<13>_UNCONNECTED , 
\NLW_blk0000003b_P<12>_UNCONNECTED , \NLW_blk0000003b_P<11>_UNCONNECTED , \NLW_blk0000003b_P<10>_UNCONNECTED , \NLW_blk0000003b_P<9>_UNCONNECTED , 
\NLW_blk0000003b_P<8>_UNCONNECTED , \NLW_blk0000003b_P<7>_UNCONNECTED , \NLW_blk0000003b_P<6>_UNCONNECTED , \NLW_blk0000003b_P<5>_UNCONNECTED , 
\NLW_blk0000003b_P<4>_UNCONNECTED , \NLW_blk0000003b_P<3>_UNCONNECTED , \NLW_blk0000003b_P<2>_UNCONNECTED , \NLW_blk0000003b_P<1>_UNCONNECTED , 
\NLW_blk0000003b_P<0>_UNCONNECTED }),
    .A({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, s_axis_a_tdata[16], s_axis_a_tdata[15], s_axis_a_tdata[14], s_axis_a_tdata[13], s_axis_a_tdata[12], s_axis_a_tdata[11], 
s_axis_a_tdata[10], s_axis_a_tdata[9], s_axis_a_tdata[8], s_axis_a_tdata[7], s_axis_a_tdata[6], s_axis_a_tdata[5], s_axis_a_tdata[4], 
s_axis_a_tdata[3], s_axis_a_tdata[2], s_axis_a_tdata[1], s_axis_a_tdata[0]}),
    .PCOUT({sig0000029a, sig00000299, sig00000298, sig00000297, sig00000296, sig00000295, sig00000294, sig00000293, sig00000292, sig00000291, 
sig00000290, sig0000028f, sig0000028e, sig0000028d, sig0000028c, sig0000028b, sig0000028a, sig00000289, sig00000288, sig00000287, sig00000286, 
sig00000285, sig00000284, sig00000283, sig00000282, sig00000281, sig00000280, sig0000027f, sig0000027e, sig0000027d, sig0000027c, sig0000027b, 
sig0000027a, sig00000279, sig00000278, sig00000277, sig00000276, sig00000275, sig00000274, sig00000273, sig00000272, sig00000271, sig00000270, 
sig0000026f, sig0000026e, sig0000026d, sig0000026c, sig0000026b}),
    .ACIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYINSEL({sig00000002, sig00000002, sig00000002})
  );
  DSP48E1 #(
    .ACASCREG ( 0 ),
    .ADREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 0 ),
    .AUTORESET_PATDET ( "NO_RESET" ),
    .A_INPUT ( "CASCADE" ),
    .BCASCREG ( 1 ),
    .BREG ( 1 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .DREG ( 0 ),
    .INMODEREG ( 0 ),
    .MASK ( 48'h3FFFFFFFFFFF ),
    .MREG ( 1 ),
    .OPMODEREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 0 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .USE_DPORT ( "FALSE" ),
    .USE_MULT ( "MULTIPLY" ),
    .USE_PATTERN_DETECT ( "NO_PATDET" ),
    .USE_SIMD ( "ONE48" ))
  blk0000003c (
    .PATTERNBDETECT(NLW_blk0000003c_PATTERNBDETECT_UNCONNECTED),
    .RSTC(sig00000002),
    .CEB1(sig00000002),
    .CEAD(sig00000002),
    .MULTSIGNOUT(NLW_blk0000003c_MULTSIGNOUT_UNCONNECTED),
    .CEC(sig00000002),
    .RSTM(sig00000002),
    .MULTSIGNIN(sig00000002),
    .CEB2(aclken),
    .RSTCTRL(sig00000002),
    .CEP(sig00000002),
    .CARRYCASCOUT(NLW_blk0000003c_CARRYCASCOUT_UNCONNECTED),
    .RSTA(sig00000002),
    .CECARRYIN(sig00000002),
    .UNDERFLOW(NLW_blk0000003c_UNDERFLOW_UNCONNECTED),
    .PATTERNDETECT(NLW_blk0000003c_PATTERNDETECT_UNCONNECTED),
    .RSTALUMODE(sig00000002),
    .RSTALLCARRYIN(sig00000002),
    .CED(sig00000002),
    .RSTD(sig00000002),
    .CEALUMODE(sig00000002),
    .CEA2(sig00000002),
    .CLK(aclk),
    .CEA1(sig00000002),
    .RSTB(sig00000002),
    .OVERFLOW(NLW_blk0000003c_OVERFLOW_UNCONNECTED),
    .CECTRL(sig00000002),
    .CEM(aclken),
    .CARRYIN(sig00000002),
    .CARRYCASCIN(sig00000002),
    .RSTINMODE(sig00000002),
    .CEINMODE(sig00000002),
    .RSTP(sig00000002),
    .ACOUT({\NLW_blk0000003c_ACOUT<29>_UNCONNECTED , \NLW_blk0000003c_ACOUT<28>_UNCONNECTED , \NLW_blk0000003c_ACOUT<27>_UNCONNECTED , 
\NLW_blk0000003c_ACOUT<26>_UNCONNECTED , \NLW_blk0000003c_ACOUT<25>_UNCONNECTED , \NLW_blk0000003c_ACOUT<24>_UNCONNECTED , 
\NLW_blk0000003c_ACOUT<23>_UNCONNECTED , \NLW_blk0000003c_ACOUT<22>_UNCONNECTED , \NLW_blk0000003c_ACOUT<21>_UNCONNECTED , 
\NLW_blk0000003c_ACOUT<20>_UNCONNECTED , \NLW_blk0000003c_ACOUT<19>_UNCONNECTED , \NLW_blk0000003c_ACOUT<18>_UNCONNECTED , 
\NLW_blk0000003c_ACOUT<17>_UNCONNECTED , \NLW_blk0000003c_ACOUT<16>_UNCONNECTED , \NLW_blk0000003c_ACOUT<15>_UNCONNECTED , 
\NLW_blk0000003c_ACOUT<14>_UNCONNECTED , \NLW_blk0000003c_ACOUT<13>_UNCONNECTED , \NLW_blk0000003c_ACOUT<12>_UNCONNECTED , 
\NLW_blk0000003c_ACOUT<11>_UNCONNECTED , \NLW_blk0000003c_ACOUT<10>_UNCONNECTED , \NLW_blk0000003c_ACOUT<9>_UNCONNECTED , 
\NLW_blk0000003c_ACOUT<8>_UNCONNECTED , \NLW_blk0000003c_ACOUT<7>_UNCONNECTED , \NLW_blk0000003c_ACOUT<6>_UNCONNECTED , 
\NLW_blk0000003c_ACOUT<5>_UNCONNECTED , \NLW_blk0000003c_ACOUT<4>_UNCONNECTED , \NLW_blk0000003c_ACOUT<3>_UNCONNECTED , 
\NLW_blk0000003c_ACOUT<2>_UNCONNECTED , \NLW_blk0000003c_ACOUT<1>_UNCONNECTED , \NLW_blk0000003c_ACOUT<0>_UNCONNECTED }),
    .OPMODE({sig00000001, sig00000002, sig00000001, sig00000002, sig00000001, sig00000002, sig00000001}),
    .PCIN({sig0000010c, sig0000010b, sig0000010a, sig00000109, sig00000108, sig00000107, sig00000106, sig00000105, sig00000104, sig00000103, 
sig00000102, sig00000101, sig00000100, sig000000ff, sig000000fe, sig000000fd, sig000000fc, sig000000fb, sig000000fa, sig000000f9, sig000000f8, 
sig000000f7, sig000000f6, sig000000f5, sig000000f4, sig000000f3, sig000000f2, sig000000f1, sig000000f0, sig000000ef, sig000000ee, sig000000ed, 
sig000000ec, sig000000eb, sig000000ea, sig000000e9, sig000000e8, sig000000e7, sig000000e6, sig000000e5, sig000000e4, sig000000e3, sig000000e2, 
sig000000e1, sig000000e0, sig000000df, sig000000de, sig000000dd}),
    .ALUMODE({sig00000002, sig00000002, sig00000002, sig00000002}),
    .C({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYOUT({\NLW_blk0000003c_CARRYOUT<3>_UNCONNECTED , \NLW_blk0000003c_CARRYOUT<2>_UNCONNECTED , \NLW_blk0000003c_CARRYOUT<1>_UNCONNECTED , 
\NLW_blk0000003c_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .BCIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .B({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000001, s_axis_b_tdata[51]}),
    .BCOUT({\NLW_blk0000003c_BCOUT<17>_UNCONNECTED , \NLW_blk0000003c_BCOUT<16>_UNCONNECTED , \NLW_blk0000003c_BCOUT<15>_UNCONNECTED , 
\NLW_blk0000003c_BCOUT<14>_UNCONNECTED , \NLW_blk0000003c_BCOUT<13>_UNCONNECTED , \NLW_blk0000003c_BCOUT<12>_UNCONNECTED , 
\NLW_blk0000003c_BCOUT<11>_UNCONNECTED , \NLW_blk0000003c_BCOUT<10>_UNCONNECTED , \NLW_blk0000003c_BCOUT<9>_UNCONNECTED , 
\NLW_blk0000003c_BCOUT<8>_UNCONNECTED , \NLW_blk0000003c_BCOUT<7>_UNCONNECTED , \NLW_blk0000003c_BCOUT<6>_UNCONNECTED , 
\NLW_blk0000003c_BCOUT<5>_UNCONNECTED , \NLW_blk0000003c_BCOUT<4>_UNCONNECTED , \NLW_blk0000003c_BCOUT<3>_UNCONNECTED , 
\NLW_blk0000003c_BCOUT<2>_UNCONNECTED , \NLW_blk0000003c_BCOUT<1>_UNCONNECTED , \NLW_blk0000003c_BCOUT<0>_UNCONNECTED }),
    .D({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002}),
    .P({\NLW_blk0000003c_P<47>_UNCONNECTED , \NLW_blk0000003c_P<46>_UNCONNECTED , \NLW_blk0000003c_P<45>_UNCONNECTED , 
\NLW_blk0000003c_P<44>_UNCONNECTED , \NLW_blk0000003c_P<43>_UNCONNECTED , \NLW_blk0000003c_P<42>_UNCONNECTED , \NLW_blk0000003c_P<41>_UNCONNECTED , 
\NLW_blk0000003c_P<40>_UNCONNECTED , \NLW_blk0000003c_P<39>_UNCONNECTED , \NLW_blk0000003c_P<38>_UNCONNECTED , \NLW_blk0000003c_P<37>_UNCONNECTED , 
\NLW_blk0000003c_P<36>_UNCONNECTED , \NLW_blk0000003c_P<35>_UNCONNECTED , \NLW_blk0000003c_P<34>_UNCONNECTED , \NLW_blk0000003c_P<33>_UNCONNECTED , 
\NLW_blk0000003c_P<32>_UNCONNECTED , \NLW_blk0000003c_P<31>_UNCONNECTED , \NLW_blk0000003c_P<30>_UNCONNECTED , \NLW_blk0000003c_P<29>_UNCONNECTED , 
\NLW_blk0000003c_P<28>_UNCONNECTED , \NLW_blk0000003c_P<27>_UNCONNECTED , \NLW_blk0000003c_P<26>_UNCONNECTED , \NLW_blk0000003c_P<25>_UNCONNECTED , 
\NLW_blk0000003c_P<24>_UNCONNECTED , \NLW_blk0000003c_P<23>_UNCONNECTED , \NLW_blk0000003c_P<22>_UNCONNECTED , \NLW_blk0000003c_P<21>_UNCONNECTED , 
sig00000069, sig00000068, sig00000067, sig00000066, sig00000065, sig00000064, sig00000063, sig00000062, sig00000061, sig00000060, sig0000005f, 
sig0000005e, sig0000005d, sig0000005c, sig0000005b, sig0000005a, sig00000059, sig00000058, sig00000057, sig00000056, sig00000055}),
    .A({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .PCOUT({\NLW_blk0000003c_PCOUT<47>_UNCONNECTED , \NLW_blk0000003c_PCOUT<46>_UNCONNECTED , \NLW_blk0000003c_PCOUT<45>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<44>_UNCONNECTED , \NLW_blk0000003c_PCOUT<43>_UNCONNECTED , \NLW_blk0000003c_PCOUT<42>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<41>_UNCONNECTED , \NLW_blk0000003c_PCOUT<40>_UNCONNECTED , \NLW_blk0000003c_PCOUT<39>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<38>_UNCONNECTED , \NLW_blk0000003c_PCOUT<37>_UNCONNECTED , \NLW_blk0000003c_PCOUT<36>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<35>_UNCONNECTED , \NLW_blk0000003c_PCOUT<34>_UNCONNECTED , \NLW_blk0000003c_PCOUT<33>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<32>_UNCONNECTED , \NLW_blk0000003c_PCOUT<31>_UNCONNECTED , \NLW_blk0000003c_PCOUT<30>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<29>_UNCONNECTED , \NLW_blk0000003c_PCOUT<28>_UNCONNECTED , \NLW_blk0000003c_PCOUT<27>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<26>_UNCONNECTED , \NLW_blk0000003c_PCOUT<25>_UNCONNECTED , \NLW_blk0000003c_PCOUT<24>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<23>_UNCONNECTED , \NLW_blk0000003c_PCOUT<22>_UNCONNECTED , \NLW_blk0000003c_PCOUT<21>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<20>_UNCONNECTED , \NLW_blk0000003c_PCOUT<19>_UNCONNECTED , \NLW_blk0000003c_PCOUT<18>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<17>_UNCONNECTED , \NLW_blk0000003c_PCOUT<16>_UNCONNECTED , \NLW_blk0000003c_PCOUT<15>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<14>_UNCONNECTED , \NLW_blk0000003c_PCOUT<13>_UNCONNECTED , \NLW_blk0000003c_PCOUT<12>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<11>_UNCONNECTED , \NLW_blk0000003c_PCOUT<10>_UNCONNECTED , \NLW_blk0000003c_PCOUT<9>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<8>_UNCONNECTED , \NLW_blk0000003c_PCOUT<7>_UNCONNECTED , \NLW_blk0000003c_PCOUT<6>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<5>_UNCONNECTED , \NLW_blk0000003c_PCOUT<4>_UNCONNECTED , \NLW_blk0000003c_PCOUT<3>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<2>_UNCONNECTED , \NLW_blk0000003c_PCOUT<1>_UNCONNECTED , \NLW_blk0000003c_PCOUT<0>_UNCONNECTED }),
    .ACIN({sig0000012a, sig00000129, sig00000128, sig00000127, sig00000126, sig00000125, sig00000124, sig00000123, sig00000122, sig00000121, 
sig00000120, sig0000011f, sig0000011e, sig0000011d, sig0000011c, sig0000011b, sig0000011a, sig00000119, sig00000118, sig00000117, sig00000116, 
sig00000115, sig00000114, sig00000113, sig00000112, sig00000111, sig00000110, sig0000010f, sig0000010e, sig0000010d}),
    .CARRYINSEL({sig00000002, sig00000002, sig00000002})
  );
  DSP48E1 #(
    .ACASCREG ( 0 ),
    .ADREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 0 ),
    .AUTORESET_PATDET ( "NO_RESET" ),
    .A_INPUT ( "CASCADE" ),
    .BCASCREG ( 1 ),
    .BREG ( 1 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .DREG ( 0 ),
    .INMODEREG ( 0 ),
    .MASK ( 48'h3FFFFFFFFFFF ),
    .MREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 1 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .USE_DPORT ( "FALSE" ),
    .USE_MULT ( "MULTIPLY" ),
    .USE_PATTERN_DETECT ( "NO_PATDET" ),
    .USE_SIMD ( "ONE48" ))
  blk0000003d (
    .PATTERNBDETECT(NLW_blk0000003d_PATTERNBDETECT_UNCONNECTED),
    .RSTC(sig00000002),
    .CEB1(sig00000002),
    .CEAD(sig00000002),
    .MULTSIGNOUT(NLW_blk0000003d_MULTSIGNOUT_UNCONNECTED),
    .CEC(sig00000002),
    .RSTM(sig00000002),
    .MULTSIGNIN(sig00000002),
    .CEB2(aclken),
    .RSTCTRL(sig00000002),
    .CEP(aclken),
    .CARRYCASCOUT(NLW_blk0000003d_CARRYCASCOUT_UNCONNECTED),
    .RSTA(sig00000002),
    .CECARRYIN(sig00000002),
    .UNDERFLOW(NLW_blk0000003d_UNDERFLOW_UNCONNECTED),
    .PATTERNDETECT(NLW_blk0000003d_PATTERNDETECT_UNCONNECTED),
    .RSTALUMODE(sig00000002),
    .RSTALLCARRYIN(sig00000002),
    .CED(sig00000002),
    .RSTD(sig00000002),
    .CEALUMODE(sig00000002),
    .CEA2(sig00000002),
    .CLK(aclk),
    .CEA1(sig00000002),
    .RSTB(sig00000002),
    .OVERFLOW(NLW_blk0000003d_OVERFLOW_UNCONNECTED),
    .CECTRL(sig00000002),
    .CEM(sig00000002),
    .CARRYIN(sig00000002),
    .CARRYCASCIN(sig00000002),
    .RSTINMODE(sig00000002),
    .CEINMODE(sig00000002),
    .RSTP(sig00000002),
    .ACOUT({sig0000012a, sig00000129, sig00000128, sig00000127, sig00000126, sig00000125, sig00000124, sig00000123, sig00000122, sig00000121, 
sig00000120, sig0000011f, sig0000011e, sig0000011d, sig0000011c, sig0000011b, sig0000011a, sig00000119, sig00000118, sig00000117, sig00000116, 
sig00000115, sig00000114, sig00000113, sig00000112, sig00000111, sig00000110, sig0000010f, sig0000010e, sig0000010d}),
    .OPMODE({sig00000001, sig00000002, sig00000001, sig00000002, sig00000001, sig00000002, sig00000001}),
    .PCIN({sig0000016b, sig0000016a, sig00000169, sig00000168, sig00000167, sig00000166, sig00000165, sig00000164, sig00000163, sig00000162, 
sig00000161, sig00000160, sig0000015f, sig0000015e, sig0000015d, sig0000015c, sig0000015b, sig0000015a, sig00000159, sig00000158, sig00000157, 
sig00000156, sig00000155, sig00000154, sig00000153, sig00000152, sig00000151, sig00000150, sig0000014f, sig0000014e, sig0000014d, sig0000014c, 
sig0000014b, sig0000014a, sig00000149, sig00000148, sig00000147, sig00000146, sig00000145, sig00000144, sig00000143, sig00000142, sig00000141, 
sig00000140, sig0000013f, sig0000013e, sig0000013d, sig0000013c}),
    .ALUMODE({sig00000002, sig00000002, sig00000002, sig00000002}),
    .C({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYOUT({\NLW_blk0000003d_CARRYOUT<3>_UNCONNECTED , \NLW_blk0000003d_CARRYOUT<2>_UNCONNECTED , \NLW_blk0000003d_CARRYOUT<1>_UNCONNECTED , 
\NLW_blk0000003d_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .BCIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .B({sig00000002, s_axis_b_tdata[50], s_axis_b_tdata[49], s_axis_b_tdata[48], s_axis_b_tdata[47], s_axis_b_tdata[46], s_axis_b_tdata[45], 
s_axis_b_tdata[44], s_axis_b_tdata[43], s_axis_b_tdata[42], s_axis_b_tdata[41], s_axis_b_tdata[40], s_axis_b_tdata[39], s_axis_b_tdata[38], 
s_axis_b_tdata[37], s_axis_b_tdata[36], s_axis_b_tdata[35], s_axis_b_tdata[34]}),
    .BCOUT({\NLW_blk0000003d_BCOUT<17>_UNCONNECTED , \NLW_blk0000003d_BCOUT<16>_UNCONNECTED , \NLW_blk0000003d_BCOUT<15>_UNCONNECTED , 
\NLW_blk0000003d_BCOUT<14>_UNCONNECTED , \NLW_blk0000003d_BCOUT<13>_UNCONNECTED , \NLW_blk0000003d_BCOUT<12>_UNCONNECTED , 
\NLW_blk0000003d_BCOUT<11>_UNCONNECTED , \NLW_blk0000003d_BCOUT<10>_UNCONNECTED , \NLW_blk0000003d_BCOUT<9>_UNCONNECTED , 
\NLW_blk0000003d_BCOUT<8>_UNCONNECTED , \NLW_blk0000003d_BCOUT<7>_UNCONNECTED , \NLW_blk0000003d_BCOUT<6>_UNCONNECTED , 
\NLW_blk0000003d_BCOUT<5>_UNCONNECTED , \NLW_blk0000003d_BCOUT<4>_UNCONNECTED , \NLW_blk0000003d_BCOUT<3>_UNCONNECTED , 
\NLW_blk0000003d_BCOUT<2>_UNCONNECTED , \NLW_blk0000003d_BCOUT<1>_UNCONNECTED , \NLW_blk0000003d_BCOUT<0>_UNCONNECTED }),
    .D({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002}),
    .P({\NLW_blk0000003d_P<47>_UNCONNECTED , \NLW_blk0000003d_P<46>_UNCONNECTED , \NLW_blk0000003d_P<45>_UNCONNECTED , 
\NLW_blk0000003d_P<44>_UNCONNECTED , \NLW_blk0000003d_P<43>_UNCONNECTED , \NLW_blk0000003d_P<42>_UNCONNECTED , \NLW_blk0000003d_P<41>_UNCONNECTED , 
\NLW_blk0000003d_P<40>_UNCONNECTED , \NLW_blk0000003d_P<39>_UNCONNECTED , \NLW_blk0000003d_P<38>_UNCONNECTED , \NLW_blk0000003d_P<37>_UNCONNECTED , 
\NLW_blk0000003d_P<36>_UNCONNECTED , \NLW_blk0000003d_P<35>_UNCONNECTED , \NLW_blk0000003d_P<34>_UNCONNECTED , \NLW_blk0000003d_P<33>_UNCONNECTED , 
\NLW_blk0000003d_P<32>_UNCONNECTED , \NLW_blk0000003d_P<31>_UNCONNECTED , \NLW_blk0000003d_P<30>_UNCONNECTED , \NLW_blk0000003d_P<29>_UNCONNECTED , 
\NLW_blk0000003d_P<28>_UNCONNECTED , \NLW_blk0000003d_P<27>_UNCONNECTED , \NLW_blk0000003d_P<26>_UNCONNECTED , \NLW_blk0000003d_P<25>_UNCONNECTED , 
\NLW_blk0000003d_P<24>_UNCONNECTED , \NLW_blk0000003d_P<23>_UNCONNECTED , \NLW_blk0000003d_P<22>_UNCONNECTED , \NLW_blk0000003d_P<21>_UNCONNECTED , 
\NLW_blk0000003d_P<20>_UNCONNECTED , \NLW_blk0000003d_P<19>_UNCONNECTED , \NLW_blk0000003d_P<18>_UNCONNECTED , \NLW_blk0000003d_P<17>_UNCONNECTED , 
sig00000054, sig00000053, sig00000052, sig00000051, sig00000050, sig0000004f, sig0000004e, sig0000004d, sig0000004c, sig0000004b, sig0000004a, 
sig00000049, sig00000048, sig00000047, sig00000046, sig00000045, sig00000044}),
    .A({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .PCOUT({sig0000010c, sig0000010b, sig0000010a, sig00000109, sig00000108, sig00000107, sig00000106, sig00000105, sig00000104, sig00000103, 
sig00000102, sig00000101, sig00000100, sig000000ff, sig000000fe, sig000000fd, sig000000fc, sig000000fb, sig000000fa, sig000000f9, sig000000f8, 
sig000000f7, sig000000f6, sig000000f5, sig000000f4, sig000000f3, sig000000f2, sig000000f1, sig000000f0, sig000000ef, sig000000ee, sig000000ed, 
sig000000ec, sig000000eb, sig000000ea, sig000000e9, sig000000e8, sig000000e7, sig000000e6, sig000000e5, sig000000e4, sig000000e3, sig000000e2, 
sig000000e1, sig000000e0, sig000000df, sig000000de, sig000000dd}),
    .ACIN({sig00000189, sig00000188, sig00000187, sig00000186, sig00000185, sig00000184, sig00000183, sig00000182, sig00000181, sig00000180, 
sig0000017f, sig0000017e, sig0000017d, sig0000017c, sig0000017b, sig0000017a, sig00000179, sig00000178, sig00000177, sig00000176, sig00000175, 
sig00000174, sig00000173, sig00000172, sig00000171, sig00000170, sig0000016f, sig0000016e, sig0000016d, sig0000016c}),
    .CARRYINSEL({sig00000002, sig00000002, sig00000002})
  );
  DSP48E1 #(
    .ACASCREG ( 1 ),
    .ADREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 1 ),
    .AUTORESET_PATDET ( "NO_RESET" ),
    .A_INPUT ( "DIRECT" ),
    .BCASCREG ( 1 ),
    .BREG ( 1 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .DREG ( 0 ),
    .INMODEREG ( 0 ),
    .MASK ( 48'h3FFFFFFFFFFF ),
    .MREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 0 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .USE_DPORT ( "FALSE" ),
    .USE_MULT ( "MULTIPLY" ),
    .USE_PATTERN_DETECT ( "NO_PATDET" ),
    .USE_SIMD ( "ONE48" ))
  blk0000003e (
    .PATTERNBDETECT(NLW_blk0000003e_PATTERNBDETECT_UNCONNECTED),
    .RSTC(sig00000002),
    .CEB1(sig00000002),
    .CEAD(sig00000002),
    .MULTSIGNOUT(NLW_blk0000003e_MULTSIGNOUT_UNCONNECTED),
    .CEC(sig00000002),
    .RSTM(sig00000002),
    .MULTSIGNIN(sig00000002),
    .CEB2(aclken),
    .RSTCTRL(sig00000002),
    .CEP(sig00000002),
    .CARRYCASCOUT(NLW_blk0000003e_CARRYCASCOUT_UNCONNECTED),
    .RSTA(sig00000002),
    .CECARRYIN(sig00000002),
    .UNDERFLOW(NLW_blk0000003e_UNDERFLOW_UNCONNECTED),
    .PATTERNDETECT(NLW_blk0000003e_PATTERNDETECT_UNCONNECTED),
    .RSTALUMODE(sig00000002),
    .RSTALLCARRYIN(sig00000002),
    .CED(sig00000002),
    .RSTD(sig00000002),
    .CEALUMODE(sig00000002),
    .CEA2(aclken),
    .CLK(aclk),
    .CEA1(sig00000002),
    .RSTB(sig00000002),
    .OVERFLOW(NLW_blk0000003e_OVERFLOW_UNCONNECTED),
    .CECTRL(sig00000002),
    .CEM(sig00000002),
    .CARRYIN(sig00000002),
    .CARRYCASCIN(sig00000002),
    .RSTINMODE(sig00000002),
    .CEINMODE(sig00000002),
    .RSTP(sig00000002),
    .ACOUT({sig00000189, sig00000188, sig00000187, sig00000186, sig00000185, sig00000184, sig00000183, sig00000182, sig00000181, sig00000180, 
sig0000017f, sig0000017e, sig0000017d, sig0000017c, sig0000017b, sig0000017a, sig00000179, sig00000178, sig00000177, sig00000176, sig00000175, 
sig00000174, sig00000173, sig00000172, sig00000171, sig00000170, sig0000016f, sig0000016e, sig0000016d, sig0000016c}),
    .OPMODE({sig00000002, sig00000002, sig00000001, sig00000002, sig00000001, sig00000002, sig00000001}),
    .PCIN({sig000001b9, sig000001b8, sig000001b7, sig000001b6, sig000001b5, sig000001b4, sig000001b3, sig000001b2, sig000001b1, sig000001b0, 
sig000001af, sig000001ae, sig000001ad, sig000001ac, sig000001ab, sig000001aa, sig000001a9, sig000001a8, sig000001a7, sig000001a6, sig000001a5, 
sig000001a4, sig000001a3, sig000001a2, sig000001a1, sig000001a0, sig0000019f, sig0000019e, sig0000019d, sig0000019c, sig0000019b, sig0000019a, 
sig00000199, sig00000198, sig00000197, sig00000196, sig00000195, sig00000194, sig00000193, sig00000192, sig00000191, sig00000190, sig0000018f, 
sig0000018e, sig0000018d, sig0000018c, sig0000018b, sig0000018a}),
    .ALUMODE({sig00000002, sig00000002, sig00000002, sig00000002}),
    .C({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYOUT({\NLW_blk0000003e_CARRYOUT<3>_UNCONNECTED , \NLW_blk0000003e_CARRYOUT<2>_UNCONNECTED , \NLW_blk0000003e_CARRYOUT<1>_UNCONNECTED , 
\NLW_blk0000003e_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .BCIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .B({sig00000002, s_axis_b_tdata[33], s_axis_b_tdata[32], s_axis_b_tdata[31], s_axis_b_tdata[30], s_axis_b_tdata[29], s_axis_b_tdata[28], 
s_axis_b_tdata[27], s_axis_b_tdata[26], s_axis_b_tdata[25], s_axis_b_tdata[24], s_axis_b_tdata[23], s_axis_b_tdata[22], s_axis_b_tdata[21], 
s_axis_b_tdata[20], s_axis_b_tdata[19], s_axis_b_tdata[18], s_axis_b_tdata[17]}),
    .BCOUT({\NLW_blk0000003e_BCOUT<17>_UNCONNECTED , \NLW_blk0000003e_BCOUT<16>_UNCONNECTED , \NLW_blk0000003e_BCOUT<15>_UNCONNECTED , 
\NLW_blk0000003e_BCOUT<14>_UNCONNECTED , \NLW_blk0000003e_BCOUT<13>_UNCONNECTED , \NLW_blk0000003e_BCOUT<12>_UNCONNECTED , 
\NLW_blk0000003e_BCOUT<11>_UNCONNECTED , \NLW_blk0000003e_BCOUT<10>_UNCONNECTED , \NLW_blk0000003e_BCOUT<9>_UNCONNECTED , 
\NLW_blk0000003e_BCOUT<8>_UNCONNECTED , \NLW_blk0000003e_BCOUT<7>_UNCONNECTED , \NLW_blk0000003e_BCOUT<6>_UNCONNECTED , 
\NLW_blk0000003e_BCOUT<5>_UNCONNECTED , \NLW_blk0000003e_BCOUT<4>_UNCONNECTED , \NLW_blk0000003e_BCOUT<3>_UNCONNECTED , 
\NLW_blk0000003e_BCOUT<2>_UNCONNECTED , \NLW_blk0000003e_BCOUT<1>_UNCONNECTED , \NLW_blk0000003e_BCOUT<0>_UNCONNECTED }),
    .D({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002}),
    .P({\NLW_blk0000003e_P<47>_UNCONNECTED , \NLW_blk0000003e_P<46>_UNCONNECTED , \NLW_blk0000003e_P<45>_UNCONNECTED , 
\NLW_blk0000003e_P<44>_UNCONNECTED , \NLW_blk0000003e_P<43>_UNCONNECTED , \NLW_blk0000003e_P<42>_UNCONNECTED , \NLW_blk0000003e_P<41>_UNCONNECTED , 
\NLW_blk0000003e_P<40>_UNCONNECTED , \NLW_blk0000003e_P<39>_UNCONNECTED , \NLW_blk0000003e_P<38>_UNCONNECTED , \NLW_blk0000003e_P<37>_UNCONNECTED , 
\NLW_blk0000003e_P<36>_UNCONNECTED , \NLW_blk0000003e_P<35>_UNCONNECTED , \NLW_blk0000003e_P<34>_UNCONNECTED , \NLW_blk0000003e_P<33>_UNCONNECTED , 
\NLW_blk0000003e_P<32>_UNCONNECTED , \NLW_blk0000003e_P<31>_UNCONNECTED , \NLW_blk0000003e_P<30>_UNCONNECTED , \NLW_blk0000003e_P<29>_UNCONNECTED , 
\NLW_blk0000003e_P<28>_UNCONNECTED , \NLW_blk0000003e_P<27>_UNCONNECTED , \NLW_blk0000003e_P<26>_UNCONNECTED , \NLW_blk0000003e_P<25>_UNCONNECTED , 
\NLW_blk0000003e_P<24>_UNCONNECTED , \NLW_blk0000003e_P<23>_UNCONNECTED , \NLW_blk0000003e_P<22>_UNCONNECTED , \NLW_blk0000003e_P<21>_UNCONNECTED , 
\NLW_blk0000003e_P<20>_UNCONNECTED , \NLW_blk0000003e_P<19>_UNCONNECTED , \NLW_blk0000003e_P<18>_UNCONNECTED , \NLW_blk0000003e_P<17>_UNCONNECTED , 
sig0000013b, sig0000013a, sig00000139, sig00000138, sig00000137, sig00000136, sig00000135, sig00000134, sig00000133, sig00000132, sig00000131, 
sig00000130, sig0000012f, sig0000012e, sig0000012d, sig0000012c, sig0000012b}),
    .A({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000001, s_axis_a_tdata[51], s_axis_a_tdata[50], s_axis_a_tdata[49], s_axis_a_tdata[48], s_axis_a_tdata[47], s_axis_a_tdata[46], 
s_axis_a_tdata[45], s_axis_a_tdata[44], s_axis_a_tdata[43], s_axis_a_tdata[42], s_axis_a_tdata[41], s_axis_a_tdata[40], s_axis_a_tdata[39], 
s_axis_a_tdata[38], s_axis_a_tdata[37], s_axis_a_tdata[36], s_axis_a_tdata[35], s_axis_a_tdata[34]}),
    .PCOUT({sig0000016b, sig0000016a, sig00000169, sig00000168, sig00000167, sig00000166, sig00000165, sig00000164, sig00000163, sig00000162, 
sig00000161, sig00000160, sig0000015f, sig0000015e, sig0000015d, sig0000015c, sig0000015b, sig0000015a, sig00000159, sig00000158, sig00000157, 
sig00000156, sig00000155, sig00000154, sig00000153, sig00000152, sig00000151, sig00000150, sig0000014f, sig0000014e, sig0000014d, sig0000014c, 
sig0000014b, sig0000014a, sig00000149, sig00000148, sig00000147, sig00000146, sig00000145, sig00000144, sig00000143, sig00000142, sig00000141, 
sig00000140, sig0000013f, sig0000013e, sig0000013d, sig0000013c}),
    .ACIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYINSEL({sig00000002, sig00000002, sig00000002})
  );
  DSP48E1 #(
    .ACASCREG ( 0 ),
    .ADREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 0 ),
    .AUTORESET_PATDET ( "NO_RESET" ),
    .A_INPUT ( "CASCADE" ),
    .BCASCREG ( 1 ),
    .BREG ( 1 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .DREG ( 0 ),
    .INMODEREG ( 0 ),
    .MASK ( 48'h3FFFFFFFFFFF ),
    .MREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 0 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .USE_DPORT ( "FALSE" ),
    .USE_MULT ( "MULTIPLY" ),
    .USE_PATTERN_DETECT ( "NO_PATDET" ),
    .USE_SIMD ( "ONE48" ))
  blk0000003f (
    .PATTERNBDETECT(NLW_blk0000003f_PATTERNBDETECT_UNCONNECTED),
    .RSTC(sig00000002),
    .CEB1(sig00000002),
    .CEAD(sig00000002),
    .MULTSIGNOUT(NLW_blk0000003f_MULTSIGNOUT_UNCONNECTED),
    .CEC(sig00000002),
    .RSTM(sig00000002),
    .MULTSIGNIN(sig00000002),
    .CEB2(aclken),
    .RSTCTRL(sig00000002),
    .CEP(sig00000002),
    .CARRYCASCOUT(NLW_blk0000003f_CARRYCASCOUT_UNCONNECTED),
    .RSTA(sig00000002),
    .CECARRYIN(sig00000002),
    .UNDERFLOW(NLW_blk0000003f_UNDERFLOW_UNCONNECTED),
    .PATTERNDETECT(NLW_blk0000003f_PATTERNDETECT_UNCONNECTED),
    .RSTALUMODE(sig00000002),
    .RSTALLCARRYIN(sig00000002),
    .CED(sig00000002),
    .RSTD(sig00000002),
    .CEALUMODE(sig00000002),
    .CEA2(sig00000002),
    .CLK(aclk),
    .CEA1(sig00000002),
    .RSTB(sig00000002),
    .OVERFLOW(NLW_blk0000003f_OVERFLOW_UNCONNECTED),
    .CECTRL(sig00000002),
    .CEM(sig00000002),
    .CARRYIN(sig00000002),
    .CARRYCASCIN(sig00000002),
    .RSTINMODE(sig00000002),
    .CEINMODE(sig00000002),
    .RSTP(sig00000002),
    .ACOUT({\NLW_blk0000003f_ACOUT<29>_UNCONNECTED , \NLW_blk0000003f_ACOUT<28>_UNCONNECTED , \NLW_blk0000003f_ACOUT<27>_UNCONNECTED , 
\NLW_blk0000003f_ACOUT<26>_UNCONNECTED , \NLW_blk0000003f_ACOUT<25>_UNCONNECTED , \NLW_blk0000003f_ACOUT<24>_UNCONNECTED , 
\NLW_blk0000003f_ACOUT<23>_UNCONNECTED , \NLW_blk0000003f_ACOUT<22>_UNCONNECTED , \NLW_blk0000003f_ACOUT<21>_UNCONNECTED , 
\NLW_blk0000003f_ACOUT<20>_UNCONNECTED , \NLW_blk0000003f_ACOUT<19>_UNCONNECTED , \NLW_blk0000003f_ACOUT<18>_UNCONNECTED , 
\NLW_blk0000003f_ACOUT<17>_UNCONNECTED , \NLW_blk0000003f_ACOUT<16>_UNCONNECTED , \NLW_blk0000003f_ACOUT<15>_UNCONNECTED , 
\NLW_blk0000003f_ACOUT<14>_UNCONNECTED , \NLW_blk0000003f_ACOUT<13>_UNCONNECTED , \NLW_blk0000003f_ACOUT<12>_UNCONNECTED , 
\NLW_blk0000003f_ACOUT<11>_UNCONNECTED , \NLW_blk0000003f_ACOUT<10>_UNCONNECTED , \NLW_blk0000003f_ACOUT<9>_UNCONNECTED , 
\NLW_blk0000003f_ACOUT<8>_UNCONNECTED , \NLW_blk0000003f_ACOUT<7>_UNCONNECTED , \NLW_blk0000003f_ACOUT<6>_UNCONNECTED , 
\NLW_blk0000003f_ACOUT<5>_UNCONNECTED , \NLW_blk0000003f_ACOUT<4>_UNCONNECTED , \NLW_blk0000003f_ACOUT<3>_UNCONNECTED , 
\NLW_blk0000003f_ACOUT<2>_UNCONNECTED , \NLW_blk0000003f_ACOUT<1>_UNCONNECTED , \NLW_blk0000003f_ACOUT<0>_UNCONNECTED }),
    .OPMODE({sig00000001, sig00000002, sig00000001, sig00000002, sig00000001, sig00000002, sig00000001}),
    .PCIN({sig000001ea, sig000001e9, sig000001e8, sig000001e7, sig000001e6, sig000001e5, sig000001e4, sig000001e3, sig000001e2, sig000001e1, 
sig000001e0, sig000001df, sig000001de, sig000001dd, sig000001dc, sig000001db, sig000001da, sig000001d9, sig000001d8, sig000001d7, sig000001d6, 
sig000001d5, sig000001d4, sig000001d3, sig000001d2, sig000001d1, sig000001d0, sig000001cf, sig000001ce, sig000001cd, sig000001cc, sig000001cb, 
sig000001ca, sig000001c9, sig000001c8, sig000001c7, sig000001c6, sig000001c5, sig000001c4, sig000001c3, sig000001c2, sig000001c1, sig000001c0, 
sig000001bf, sig000001be, sig000001bd, sig000001bc, sig000001bb}),
    .ALUMODE({sig00000002, sig00000002, sig00000002, sig00000002}),
    .C({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYOUT({\NLW_blk0000003f_CARRYOUT<3>_UNCONNECTED , \NLW_blk0000003f_CARRYOUT<2>_UNCONNECTED , \NLW_blk0000003f_CARRYOUT<1>_UNCONNECTED , 
\NLW_blk0000003f_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .BCIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .B({sig00000002, s_axis_a_tdata[33], s_axis_a_tdata[32], s_axis_a_tdata[31], s_axis_a_tdata[30], s_axis_a_tdata[29], s_axis_a_tdata[28], 
s_axis_a_tdata[27], s_axis_a_tdata[26], s_axis_a_tdata[25], s_axis_a_tdata[24], s_axis_a_tdata[23], s_axis_a_tdata[22], s_axis_a_tdata[21], 
s_axis_a_tdata[20], s_axis_a_tdata[19], s_axis_a_tdata[18], s_axis_a_tdata[17]}),
    .BCOUT({\NLW_blk0000003f_BCOUT<17>_UNCONNECTED , \NLW_blk0000003f_BCOUT<16>_UNCONNECTED , \NLW_blk0000003f_BCOUT<15>_UNCONNECTED , 
\NLW_blk0000003f_BCOUT<14>_UNCONNECTED , \NLW_blk0000003f_BCOUT<13>_UNCONNECTED , \NLW_blk0000003f_BCOUT<12>_UNCONNECTED , 
\NLW_blk0000003f_BCOUT<11>_UNCONNECTED , \NLW_blk0000003f_BCOUT<10>_UNCONNECTED , \NLW_blk0000003f_BCOUT<9>_UNCONNECTED , 
\NLW_blk0000003f_BCOUT<8>_UNCONNECTED , \NLW_blk0000003f_BCOUT<7>_UNCONNECTED , \NLW_blk0000003f_BCOUT<6>_UNCONNECTED , 
\NLW_blk0000003f_BCOUT<5>_UNCONNECTED , \NLW_blk0000003f_BCOUT<4>_UNCONNECTED , \NLW_blk0000003f_BCOUT<3>_UNCONNECTED , 
\NLW_blk0000003f_BCOUT<2>_UNCONNECTED , \NLW_blk0000003f_BCOUT<1>_UNCONNECTED , \NLW_blk0000003f_BCOUT<0>_UNCONNECTED }),
    .D({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002}),
    .P({\NLW_blk0000003f_P<47>_UNCONNECTED , \NLW_blk0000003f_P<46>_UNCONNECTED , \NLW_blk0000003f_P<45>_UNCONNECTED , 
\NLW_blk0000003f_P<44>_UNCONNECTED , \NLW_blk0000003f_P<43>_UNCONNECTED , \NLW_blk0000003f_P<42>_UNCONNECTED , \NLW_blk0000003f_P<41>_UNCONNECTED , 
\NLW_blk0000003f_P<40>_UNCONNECTED , \NLW_blk0000003f_P<39>_UNCONNECTED , \NLW_blk0000003f_P<38>_UNCONNECTED , \NLW_blk0000003f_P<37>_UNCONNECTED , 
\NLW_blk0000003f_P<36>_UNCONNECTED , \NLW_blk0000003f_P<35>_UNCONNECTED , \NLW_blk0000003f_P<34>_UNCONNECTED , \NLW_blk0000003f_P<33>_UNCONNECTED , 
\NLW_blk0000003f_P<32>_UNCONNECTED , \NLW_blk0000003f_P<31>_UNCONNECTED , \NLW_blk0000003f_P<30>_UNCONNECTED , \NLW_blk0000003f_P<29>_UNCONNECTED , 
\NLW_blk0000003f_P<28>_UNCONNECTED , \NLW_blk0000003f_P<27>_UNCONNECTED , \NLW_blk0000003f_P<26>_UNCONNECTED , \NLW_blk0000003f_P<25>_UNCONNECTED , 
\NLW_blk0000003f_P<24>_UNCONNECTED , \NLW_blk0000003f_P<23>_UNCONNECTED , \NLW_blk0000003f_P<22>_UNCONNECTED , \NLW_blk0000003f_P<21>_UNCONNECTED , 
\NLW_blk0000003f_P<20>_UNCONNECTED , \NLW_blk0000003f_P<19>_UNCONNECTED , \NLW_blk0000003f_P<18>_UNCONNECTED , \NLW_blk0000003f_P<17>_UNCONNECTED , 
\NLW_blk0000003f_P<16>_UNCONNECTED , \NLW_blk0000003f_P<15>_UNCONNECTED , \NLW_blk0000003f_P<14>_UNCONNECTED , \NLW_blk0000003f_P<13>_UNCONNECTED , 
\NLW_blk0000003f_P<12>_UNCONNECTED , \NLW_blk0000003f_P<11>_UNCONNECTED , \NLW_blk0000003f_P<10>_UNCONNECTED , \NLW_blk0000003f_P<9>_UNCONNECTED , 
\NLW_blk0000003f_P<8>_UNCONNECTED , \NLW_blk0000003f_P<7>_UNCONNECTED , \NLW_blk0000003f_P<6>_UNCONNECTED , \NLW_blk0000003f_P<5>_UNCONNECTED , 
\NLW_blk0000003f_P<4>_UNCONNECTED , \NLW_blk0000003f_P<3>_UNCONNECTED , \NLW_blk0000003f_P<2>_UNCONNECTED , \NLW_blk0000003f_P<1>_UNCONNECTED , 
\NLW_blk0000003f_P<0>_UNCONNECTED }),
    .A({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .PCOUT({sig000001b9, sig000001b8, sig000001b7, sig000001b6, sig000001b5, sig000001b4, sig000001b3, sig000001b2, sig000001b1, sig000001b0, 
sig000001af, sig000001ae, sig000001ad, sig000001ac, sig000001ab, sig000001aa, sig000001a9, sig000001a8, sig000001a7, sig000001a6, sig000001a5, 
sig000001a4, sig000001a3, sig000001a2, sig000001a1, sig000001a0, sig0000019f, sig0000019e, sig0000019d, sig0000019c, sig0000019b, sig0000019a, 
sig00000199, sig00000198, sig00000197, sig00000196, sig00000195, sig00000194, sig00000193, sig00000192, sig00000191, sig00000190, sig0000018f, 
sig0000018e, sig0000018d, sig0000018c, sig0000018b, sig0000018a}),
    .ACIN({sig00000208, sig00000207, sig00000206, sig00000205, sig00000204, sig00000203, sig00000202, sig00000201, sig00000200, sig000001ff, 
sig000001fe, sig000001fd, sig000001fc, sig000001fb, sig000001fa, sig000001f9, sig000001f8, sig000001f7, sig000001f6, sig000001f5, sig000001f4, 
sig000001f3, sig000001f2, sig000001f1, sig000001f0, sig000001ef, sig000001ee, sig000001ed, sig000001ec, sig000001eb}),
    .CARRYINSEL({sig00000002, sig00000002, sig00000002})
  );
  DSP48E1 #(
    .ACASCREG ( 1 ),
    .ADREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 1 ),
    .AUTORESET_PATDET ( "NO_RESET" ),
    .A_INPUT ( "DIRECT" ),
    .BCASCREG ( 1 ),
    .BREG ( 1 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .DREG ( 0 ),
    .INMODEREG ( 0 ),
    .MASK ( 48'hFFFFFFFE0000 ),
    .MREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 0 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .USE_DPORT ( "FALSE" ),
    .USE_MULT ( "MULTIPLY" ),
    .USE_PATTERN_DETECT ( "PATDET" ),
    .USE_SIMD ( "ONE48" ))
  blk00000040 (
    .PATTERNBDETECT(NLW_blk00000040_PATTERNBDETECT_UNCONNECTED),
    .RSTC(sig00000002),
    .CEB1(sig00000002),
    .CEAD(sig00000002),
    .MULTSIGNOUT(NLW_blk00000040_MULTSIGNOUT_UNCONNECTED),
    .CEC(sig00000002),
    .RSTM(sig00000002),
    .MULTSIGNIN(sig00000002),
    .CEB2(aclken),
    .RSTCTRL(sig00000002),
    .CEP(sig00000002),
    .CARRYCASCOUT(NLW_blk00000040_CARRYCASCOUT_UNCONNECTED),
    .RSTA(sig00000002),
    .CECARRYIN(sig00000002),
    .UNDERFLOW(NLW_blk00000040_UNDERFLOW_UNCONNECTED),
    .PATTERNDETECT(sig000001ba),
    .RSTALUMODE(sig00000002),
    .RSTALLCARRYIN(sig00000002),
    .CED(sig00000002),
    .RSTD(sig00000002),
    .CEALUMODE(sig00000002),
    .CEA2(aclken),
    .CLK(aclk),
    .CEA1(sig00000002),
    .RSTB(sig00000002),
    .OVERFLOW(NLW_blk00000040_OVERFLOW_UNCONNECTED),
    .CECTRL(sig00000002),
    .CEM(sig00000002),
    .CARRYIN(sig00000002),
    .CARRYCASCIN(sig00000002),
    .RSTINMODE(sig00000002),
    .CEINMODE(sig00000002),
    .RSTP(sig00000002),
    .ACOUT({sig00000208, sig00000207, sig00000206, sig00000205, sig00000204, sig00000203, sig00000202, sig00000201, sig00000200, sig000001ff, 
sig000001fe, sig000001fd, sig000001fc, sig000001fb, sig000001fa, sig000001f9, sig000001f8, sig000001f7, sig000001f6, sig000001f5, sig000001f4, 
sig000001f3, sig000001f2, sig000001f1, sig000001f0, sig000001ef, sig000001ee, sig000001ed, sig000001ec, sig000001eb}),
    .OPMODE({sig00000002, sig00000002, sig00000001, sig00000002, sig00000001, sig00000002, sig00000001}),
    .PCIN({sig00000238, sig00000237, sig00000236, sig00000235, sig00000234, sig00000233, sig00000232, sig00000231, sig00000230, sig0000022f, 
sig0000022e, sig0000022d, sig0000022c, sig0000022b, sig0000022a, sig00000229, sig00000228, sig00000227, sig00000226, sig00000225, sig00000224, 
sig00000223, sig00000222, sig00000221, sig00000220, sig0000021f, sig0000021e, sig0000021d, sig0000021c, sig0000021b, sig0000021a, sig00000219, 
sig00000218, sig00000217, sig00000216, sig00000215, sig00000214, sig00000213, sig00000212, sig00000211, sig00000210, sig0000020f, sig0000020e, 
sig0000020d, sig0000020c, sig0000020b, sig0000020a, sig00000209}),
    .ALUMODE({sig00000002, sig00000002, sig00000002, sig00000002}),
    .C({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYOUT({\NLW_blk00000040_CARRYOUT<3>_UNCONNECTED , \NLW_blk00000040_CARRYOUT<2>_UNCONNECTED , \NLW_blk00000040_CARRYOUT<1>_UNCONNECTED , 
\NLW_blk00000040_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .BCIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .B({sig00000002, s_axis_a_tdata[16], s_axis_a_tdata[15], s_axis_a_tdata[14], s_axis_a_tdata[13], s_axis_a_tdata[12], s_axis_a_tdata[11], 
s_axis_a_tdata[10], s_axis_a_tdata[9], s_axis_a_tdata[8], s_axis_a_tdata[7], s_axis_a_tdata[6], s_axis_a_tdata[5], s_axis_a_tdata[4], 
s_axis_a_tdata[3], s_axis_a_tdata[2], s_axis_a_tdata[1], s_axis_a_tdata[0]}),
    .BCOUT({\NLW_blk00000040_BCOUT<17>_UNCONNECTED , \NLW_blk00000040_BCOUT<16>_UNCONNECTED , \NLW_blk00000040_BCOUT<15>_UNCONNECTED , 
\NLW_blk00000040_BCOUT<14>_UNCONNECTED , \NLW_blk00000040_BCOUT<13>_UNCONNECTED , \NLW_blk00000040_BCOUT<12>_UNCONNECTED , 
\NLW_blk00000040_BCOUT<11>_UNCONNECTED , \NLW_blk00000040_BCOUT<10>_UNCONNECTED , \NLW_blk00000040_BCOUT<9>_UNCONNECTED , 
\NLW_blk00000040_BCOUT<8>_UNCONNECTED , \NLW_blk00000040_BCOUT<7>_UNCONNECTED , \NLW_blk00000040_BCOUT<6>_UNCONNECTED , 
\NLW_blk00000040_BCOUT<5>_UNCONNECTED , \NLW_blk00000040_BCOUT<4>_UNCONNECTED , \NLW_blk00000040_BCOUT<3>_UNCONNECTED , 
\NLW_blk00000040_BCOUT<2>_UNCONNECTED , \NLW_blk00000040_BCOUT<1>_UNCONNECTED , \NLW_blk00000040_BCOUT<0>_UNCONNECTED }),
    .D({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002}),
    .P({\NLW_blk00000040_P<47>_UNCONNECTED , \NLW_blk00000040_P<46>_UNCONNECTED , \NLW_blk00000040_P<45>_UNCONNECTED , 
\NLW_blk00000040_P<44>_UNCONNECTED , \NLW_blk00000040_P<43>_UNCONNECTED , \NLW_blk00000040_P<42>_UNCONNECTED , \NLW_blk00000040_P<41>_UNCONNECTED , 
\NLW_blk00000040_P<40>_UNCONNECTED , \NLW_blk00000040_P<39>_UNCONNECTED , \NLW_blk00000040_P<38>_UNCONNECTED , \NLW_blk00000040_P<37>_UNCONNECTED , 
\NLW_blk00000040_P<36>_UNCONNECTED , \NLW_blk00000040_P<35>_UNCONNECTED , \NLW_blk00000040_P<34>_UNCONNECTED , \NLW_blk00000040_P<33>_UNCONNECTED , 
\NLW_blk00000040_P<32>_UNCONNECTED , \NLW_blk00000040_P<31>_UNCONNECTED , \NLW_blk00000040_P<30>_UNCONNECTED , \NLW_blk00000040_P<29>_UNCONNECTED , 
\NLW_blk00000040_P<28>_UNCONNECTED , \NLW_blk00000040_P<27>_UNCONNECTED , \NLW_blk00000040_P<26>_UNCONNECTED , \NLW_blk00000040_P<25>_UNCONNECTED , 
\NLW_blk00000040_P<24>_UNCONNECTED , \NLW_blk00000040_P<23>_UNCONNECTED , \NLW_blk00000040_P<22>_UNCONNECTED , \NLW_blk00000040_P<21>_UNCONNECTED , 
\NLW_blk00000040_P<20>_UNCONNECTED , \NLW_blk00000040_P<19>_UNCONNECTED , \NLW_blk00000040_P<18>_UNCONNECTED , \NLW_blk00000040_P<17>_UNCONNECTED , 
\NLW_blk00000040_P<16>_UNCONNECTED , \NLW_blk00000040_P<15>_UNCONNECTED , \NLW_blk00000040_P<14>_UNCONNECTED , \NLW_blk00000040_P<13>_UNCONNECTED , 
\NLW_blk00000040_P<12>_UNCONNECTED , \NLW_blk00000040_P<11>_UNCONNECTED , \NLW_blk00000040_P<10>_UNCONNECTED , \NLW_blk00000040_P<9>_UNCONNECTED , 
\NLW_blk00000040_P<8>_UNCONNECTED , \NLW_blk00000040_P<7>_UNCONNECTED , \NLW_blk00000040_P<6>_UNCONNECTED , \NLW_blk00000040_P<5>_UNCONNECTED , 
\NLW_blk00000040_P<4>_UNCONNECTED , \NLW_blk00000040_P<3>_UNCONNECTED , \NLW_blk00000040_P<2>_UNCONNECTED , \NLW_blk00000040_P<1>_UNCONNECTED , 
\NLW_blk00000040_P<0>_UNCONNECTED }),
    .A({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000001, s_axis_b_tdata[51], s_axis_b_tdata[50], s_axis_b_tdata[49], s_axis_b_tdata[48], s_axis_b_tdata[47], s_axis_b_tdata[46], 
s_axis_b_tdata[45], s_axis_b_tdata[44], s_axis_b_tdata[43], s_axis_b_tdata[42], s_axis_b_tdata[41], s_axis_b_tdata[40], s_axis_b_tdata[39], 
s_axis_b_tdata[38], s_axis_b_tdata[37], s_axis_b_tdata[36], s_axis_b_tdata[35], s_axis_b_tdata[34]}),
    .PCOUT({sig000001ea, sig000001e9, sig000001e8, sig000001e7, sig000001e6, sig000001e5, sig000001e4, sig000001e3, sig000001e2, sig000001e1, 
sig000001e0, sig000001df, sig000001de, sig000001dd, sig000001dc, sig000001db, sig000001da, sig000001d9, sig000001d8, sig000001d7, sig000001d6, 
sig000001d5, sig000001d4, sig000001d3, sig000001d2, sig000001d1, sig000001d0, sig000001cf, sig000001ce, sig000001cd, sig000001cc, sig000001cb, 
sig000001ca, sig000001c9, sig000001c8, sig000001c7, sig000001c6, sig000001c5, sig000001c4, sig000001c3, sig000001c2, sig000001c1, sig000001c0, 
sig000001bf, sig000001be, sig000001bd, sig000001bc, sig000001bb}),
    .ACIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYINSEL({sig00000002, sig00000002, sig00000002})
  );
  DSP48E1 #(
    .ACASCREG ( 0 ),
    .ADREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 0 ),
    .AUTORESET_PATDET ( "NO_RESET" ),
    .A_INPUT ( "DIRECT" ),
    .BCASCREG ( 0 ),
    .BREG ( 0 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .DREG ( 0 ),
    .INMODEREG ( 0 ),
    .MASK ( 48'h3FFFFFFFFFFF ),
    .MREG ( 1 ),
    .OPMODEREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 0 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .USE_DPORT ( "FALSE" ),
    .USE_MULT ( "MULTIPLY" ),
    .USE_PATTERN_DETECT ( "NO_PATDET" ),
    .USE_SIMD ( "ONE48" ))
  blk00000041 (
    .PATTERNBDETECT(NLW_blk00000041_PATTERNBDETECT_UNCONNECTED),
    .RSTC(sig00000002),
    .CEB1(sig00000002),
    .CEAD(sig00000002),
    .MULTSIGNOUT(NLW_blk00000041_MULTSIGNOUT_UNCONNECTED),
    .CEC(sig00000002),
    .RSTM(sig00000002),
    .MULTSIGNIN(sig00000002),
    .CEB2(sig00000002),
    .RSTCTRL(sig00000002),
    .CEP(sig00000002),
    .CARRYCASCOUT(NLW_blk00000041_CARRYCASCOUT_UNCONNECTED),
    .RSTA(sig00000002),
    .CECARRYIN(sig00000002),
    .UNDERFLOW(NLW_blk00000041_UNDERFLOW_UNCONNECTED),
    .PATTERNDETECT(NLW_blk00000041_PATTERNDETECT_UNCONNECTED),
    .RSTALUMODE(sig00000002),
    .RSTALLCARRYIN(sig00000002),
    .CED(sig00000002),
    .RSTD(sig00000002),
    .CEALUMODE(sig00000002),
    .CEA2(sig00000002),
    .CLK(aclk),
    .CEA1(sig00000002),
    .RSTB(sig00000002),
    .OVERFLOW(NLW_blk00000041_OVERFLOW_UNCONNECTED),
    .CECTRL(sig00000002),
    .CEM(aclken),
    .CARRYIN(sig00000002),
    .CARRYCASCIN(sig00000002),
    .RSTINMODE(sig00000002),
    .CEINMODE(sig00000002),
    .RSTP(sig00000002),
    .ACOUT({\NLW_blk00000041_ACOUT<29>_UNCONNECTED , \NLW_blk00000041_ACOUT<28>_UNCONNECTED , \NLW_blk00000041_ACOUT<27>_UNCONNECTED , 
\NLW_blk00000041_ACOUT<26>_UNCONNECTED , \NLW_blk00000041_ACOUT<25>_UNCONNECTED , \NLW_blk00000041_ACOUT<24>_UNCONNECTED , 
\NLW_blk00000041_ACOUT<23>_UNCONNECTED , \NLW_blk00000041_ACOUT<22>_UNCONNECTED , \NLW_blk00000041_ACOUT<21>_UNCONNECTED , 
\NLW_blk00000041_ACOUT<20>_UNCONNECTED , \NLW_blk00000041_ACOUT<19>_UNCONNECTED , \NLW_blk00000041_ACOUT<18>_UNCONNECTED , 
\NLW_blk00000041_ACOUT<17>_UNCONNECTED , \NLW_blk00000041_ACOUT<16>_UNCONNECTED , \NLW_blk00000041_ACOUT<15>_UNCONNECTED , 
\NLW_blk00000041_ACOUT<14>_UNCONNECTED , \NLW_blk00000041_ACOUT<13>_UNCONNECTED , \NLW_blk00000041_ACOUT<12>_UNCONNECTED , 
\NLW_blk00000041_ACOUT<11>_UNCONNECTED , \NLW_blk00000041_ACOUT<10>_UNCONNECTED , \NLW_blk00000041_ACOUT<9>_UNCONNECTED , 
\NLW_blk00000041_ACOUT<8>_UNCONNECTED , \NLW_blk00000041_ACOUT<7>_UNCONNECTED , \NLW_blk00000041_ACOUT<6>_UNCONNECTED , 
\NLW_blk00000041_ACOUT<5>_UNCONNECTED , \NLW_blk00000041_ACOUT<4>_UNCONNECTED , \NLW_blk00000041_ACOUT<3>_UNCONNECTED , 
\NLW_blk00000041_ACOUT<2>_UNCONNECTED , \NLW_blk00000041_ACOUT<1>_UNCONNECTED , \NLW_blk00000041_ACOUT<0>_UNCONNECTED }),
    .OPMODE({sig00000002, sig00000002, sig00000001, sig00000002, sig00000001, sig00000002, sig00000001}),
    .PCIN({sig00000268, sig00000267, sig00000266, sig00000265, sig00000264, sig00000263, sig00000262, sig00000261, sig00000260, sig0000025f, 
sig0000025e, sig0000025d, sig0000025c, sig0000025b, sig0000025a, sig00000259, sig00000258, sig00000257, sig00000256, sig00000255, sig00000254, 
sig00000253, sig00000252, sig00000251, sig00000250, sig0000024f, sig0000024e, sig0000024d, sig0000024c, sig0000024b, sig0000024a, sig00000249, 
sig00000248, sig00000247, sig00000246, sig00000245, sig00000244, sig00000243, sig00000242, sig00000241, sig00000240, sig0000023f, sig0000023e, 
sig0000023d, sig0000023c, sig0000023b, sig0000023a, sig00000239}),
    .ALUMODE({sig00000002, sig00000002, sig00000002, sig00000002}),
    .C({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYOUT({\NLW_blk00000041_CARRYOUT<3>_UNCONNECTED , \NLW_blk00000041_CARRYOUT<2>_UNCONNECTED , \NLW_blk00000041_CARRYOUT<1>_UNCONNECTED , 
\NLW_blk00000041_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .BCIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .B({sig00000002, s_axis_b_tdata[16], s_axis_b_tdata[15], s_axis_b_tdata[14], s_axis_b_tdata[13], s_axis_b_tdata[12], s_axis_b_tdata[11], 
s_axis_b_tdata[10], s_axis_b_tdata[9], s_axis_b_tdata[8], s_axis_b_tdata[7], s_axis_b_tdata[6], s_axis_b_tdata[5], s_axis_b_tdata[4], 
s_axis_b_tdata[3], s_axis_b_tdata[2], s_axis_b_tdata[1], s_axis_b_tdata[0]}),
    .BCOUT({\NLW_blk00000041_BCOUT<17>_UNCONNECTED , \NLW_blk00000041_BCOUT<16>_UNCONNECTED , \NLW_blk00000041_BCOUT<15>_UNCONNECTED , 
\NLW_blk00000041_BCOUT<14>_UNCONNECTED , \NLW_blk00000041_BCOUT<13>_UNCONNECTED , \NLW_blk00000041_BCOUT<12>_UNCONNECTED , 
\NLW_blk00000041_BCOUT<11>_UNCONNECTED , \NLW_blk00000041_BCOUT<10>_UNCONNECTED , \NLW_blk00000041_BCOUT<9>_UNCONNECTED , 
\NLW_blk00000041_BCOUT<8>_UNCONNECTED , \NLW_blk00000041_BCOUT<7>_UNCONNECTED , \NLW_blk00000041_BCOUT<6>_UNCONNECTED , 
\NLW_blk00000041_BCOUT<5>_UNCONNECTED , \NLW_blk00000041_BCOUT<4>_UNCONNECTED , \NLW_blk00000041_BCOUT<3>_UNCONNECTED , 
\NLW_blk00000041_BCOUT<2>_UNCONNECTED , \NLW_blk00000041_BCOUT<1>_UNCONNECTED , \NLW_blk00000041_BCOUT<0>_UNCONNECTED }),
    .D({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002}),
    .P({\NLW_blk00000041_P<47>_UNCONNECTED , \NLW_blk00000041_P<46>_UNCONNECTED , \NLW_blk00000041_P<45>_UNCONNECTED , 
\NLW_blk00000041_P<44>_UNCONNECTED , \NLW_blk00000041_P<43>_UNCONNECTED , \NLW_blk00000041_P<42>_UNCONNECTED , \NLW_blk00000041_P<41>_UNCONNECTED , 
\NLW_blk00000041_P<40>_UNCONNECTED , \NLW_blk00000041_P<39>_UNCONNECTED , \NLW_blk00000041_P<38>_UNCONNECTED , \NLW_blk00000041_P<37>_UNCONNECTED , 
\NLW_blk00000041_P<36>_UNCONNECTED , \NLW_blk00000041_P<35>_UNCONNECTED , \NLW_blk00000041_P<34>_UNCONNECTED , \NLW_blk00000041_P<33>_UNCONNECTED , 
\NLW_blk00000041_P<32>_UNCONNECTED , \NLW_blk00000041_P<31>_UNCONNECTED , \NLW_blk00000041_P<30>_UNCONNECTED , \NLW_blk00000041_P<29>_UNCONNECTED , 
\NLW_blk00000041_P<28>_UNCONNECTED , \NLW_blk00000041_P<27>_UNCONNECTED , \NLW_blk00000041_P<26>_UNCONNECTED , \NLW_blk00000041_P<25>_UNCONNECTED , 
\NLW_blk00000041_P<24>_UNCONNECTED , \NLW_blk00000041_P<23>_UNCONNECTED , \NLW_blk00000041_P<22>_UNCONNECTED , \NLW_blk00000041_P<21>_UNCONNECTED , 
\NLW_blk00000041_P<20>_UNCONNECTED , \NLW_blk00000041_P<19>_UNCONNECTED , \NLW_blk00000041_P<18>_UNCONNECTED , \NLW_blk00000041_P<17>_UNCONNECTED , 
\NLW_blk00000041_P<16>_UNCONNECTED , \NLW_blk00000041_P<15>_UNCONNECTED , \NLW_blk00000041_P<14>_UNCONNECTED , \NLW_blk00000041_P<13>_UNCONNECTED , 
\NLW_blk00000041_P<12>_UNCONNECTED , \NLW_blk00000041_P<11>_UNCONNECTED , \NLW_blk00000041_P<10>_UNCONNECTED , \NLW_blk00000041_P<9>_UNCONNECTED , 
\NLW_blk00000041_P<8>_UNCONNECTED , \NLW_blk00000041_P<7>_UNCONNECTED , \NLW_blk00000041_P<6>_UNCONNECTED , \NLW_blk00000041_P<5>_UNCONNECTED , 
\NLW_blk00000041_P<4>_UNCONNECTED , \NLW_blk00000041_P<3>_UNCONNECTED , \NLW_blk00000041_P<2>_UNCONNECTED , \NLW_blk00000041_P<1>_UNCONNECTED , 
\NLW_blk00000041_P<0>_UNCONNECTED }),
    .A({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000001, s_axis_a_tdata[51], s_axis_a_tdata[50], s_axis_a_tdata[49], s_axis_a_tdata[48], s_axis_a_tdata[47], s_axis_a_tdata[46], 
s_axis_a_tdata[45], s_axis_a_tdata[44], s_axis_a_tdata[43], s_axis_a_tdata[42], s_axis_a_tdata[41], s_axis_a_tdata[40], s_axis_a_tdata[39], 
s_axis_a_tdata[38], s_axis_a_tdata[37], s_axis_a_tdata[36], s_axis_a_tdata[35], s_axis_a_tdata[34]}),
    .PCOUT({sig00000238, sig00000237, sig00000236, sig00000235, sig00000234, sig00000233, sig00000232, sig00000231, sig00000230, sig0000022f, 
sig0000022e, sig0000022d, sig0000022c, sig0000022b, sig0000022a, sig00000229, sig00000228, sig00000227, sig00000226, sig00000225, sig00000224, 
sig00000223, sig00000222, sig00000221, sig00000220, sig0000021f, sig0000021e, sig0000021d, sig0000021c, sig0000021b, sig0000021a, sig00000219, 
sig00000218, sig00000217, sig00000216, sig00000215, sig00000214, sig00000213, sig00000212, sig00000211, sig00000210, sig0000020f, sig0000020e, 
sig0000020d, sig0000020c, sig0000020b, sig0000020a, sig00000209}),
    .ACIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYINSEL({sig00000002, sig00000002, sig00000002})
  );
  DSP48E1 #(
    .ACASCREG ( 0 ),
    .ADREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 0 ),
    .AUTORESET_PATDET ( "NO_RESET" ),
    .A_INPUT ( "DIRECT" ),
    .BCASCREG ( 0 ),
    .BREG ( 0 ),
    .B_INPUT ( "CASCADE" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .DREG ( 0 ),
    .INMODEREG ( 0 ),
    .MASK ( 48'h3FFFFFFFFFFF ),
    .MREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 1 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .USE_DPORT ( "FALSE" ),
    .USE_MULT ( "MULTIPLY" ),
    .USE_PATTERN_DETECT ( "NO_PATDET" ),
    .USE_SIMD ( "ONE48" ))
  blk00000042 (
    .PATTERNBDETECT(NLW_blk00000042_PATTERNBDETECT_UNCONNECTED),
    .RSTC(sig00000002),
    .CEB1(sig00000002),
    .CEAD(sig00000002),
    .MULTSIGNOUT(NLW_blk00000042_MULTSIGNOUT_UNCONNECTED),
    .CEC(sig00000002),
    .RSTM(sig00000002),
    .MULTSIGNIN(sig00000002),
    .CEB2(sig00000002),
    .RSTCTRL(sig00000002),
    .CEP(aclken),
    .CARRYCASCOUT(NLW_blk00000042_CARRYCASCOUT_UNCONNECTED),
    .RSTA(sig00000002),
    .CECARRYIN(sig00000002),
    .UNDERFLOW(NLW_blk00000042_UNDERFLOW_UNCONNECTED),
    .PATTERNDETECT(NLW_blk00000042_PATTERNDETECT_UNCONNECTED),
    .RSTALUMODE(sig00000002),
    .RSTALLCARRYIN(sig00000002),
    .CED(sig00000002),
    .RSTD(sig00000002),
    .CEALUMODE(sig00000002),
    .CEA2(sig00000002),
    .CLK(aclk),
    .CEA1(sig00000002),
    .RSTB(sig00000002),
    .OVERFLOW(NLW_blk00000042_OVERFLOW_UNCONNECTED),
    .CECTRL(sig00000002),
    .CEM(sig00000002),
    .CARRYIN(sig00000002),
    .CARRYCASCIN(sig00000002),
    .RSTINMODE(sig00000002),
    .CEINMODE(sig00000002),
    .RSTP(sig00000002),
    .ACOUT({\NLW_blk00000042_ACOUT<29>_UNCONNECTED , \NLW_blk00000042_ACOUT<28>_UNCONNECTED , \NLW_blk00000042_ACOUT<27>_UNCONNECTED , 
\NLW_blk00000042_ACOUT<26>_UNCONNECTED , \NLW_blk00000042_ACOUT<25>_UNCONNECTED , \NLW_blk00000042_ACOUT<24>_UNCONNECTED , 
\NLW_blk00000042_ACOUT<23>_UNCONNECTED , \NLW_blk00000042_ACOUT<22>_UNCONNECTED , \NLW_blk00000042_ACOUT<21>_UNCONNECTED , 
\NLW_blk00000042_ACOUT<20>_UNCONNECTED , \NLW_blk00000042_ACOUT<19>_UNCONNECTED , \NLW_blk00000042_ACOUT<18>_UNCONNECTED , 
\NLW_blk00000042_ACOUT<17>_UNCONNECTED , \NLW_blk00000042_ACOUT<16>_UNCONNECTED , \NLW_blk00000042_ACOUT<15>_UNCONNECTED , 
\NLW_blk00000042_ACOUT<14>_UNCONNECTED , \NLW_blk00000042_ACOUT<13>_UNCONNECTED , \NLW_blk00000042_ACOUT<12>_UNCONNECTED , 
\NLW_blk00000042_ACOUT<11>_UNCONNECTED , \NLW_blk00000042_ACOUT<10>_UNCONNECTED , \NLW_blk00000042_ACOUT<9>_UNCONNECTED , 
\NLW_blk00000042_ACOUT<8>_UNCONNECTED , \NLW_blk00000042_ACOUT<7>_UNCONNECTED , \NLW_blk00000042_ACOUT<6>_UNCONNECTED , 
\NLW_blk00000042_ACOUT<5>_UNCONNECTED , \NLW_blk00000042_ACOUT<4>_UNCONNECTED , \NLW_blk00000042_ACOUT<3>_UNCONNECTED , 
\NLW_blk00000042_ACOUT<2>_UNCONNECTED , \NLW_blk00000042_ACOUT<1>_UNCONNECTED , \NLW_blk00000042_ACOUT<0>_UNCONNECTED }),
    .OPMODE({sig00000001, sig00000002, sig00000001, sig00000002, sig00000001, sig00000002, sig00000001}),
    .PCIN({sig0000029a, sig00000299, sig00000298, sig00000297, sig00000296, sig00000295, sig00000294, sig00000293, sig00000292, sig00000291, 
sig00000290, sig0000028f, sig0000028e, sig0000028d, sig0000028c, sig0000028b, sig0000028a, sig00000289, sig00000288, sig00000287, sig00000286, 
sig00000285, sig00000284, sig00000283, sig00000282, sig00000281, sig00000280, sig0000027f, sig0000027e, sig0000027d, sig0000027c, sig0000027b, 
sig0000027a, sig00000279, sig00000278, sig00000277, sig00000276, sig00000275, sig00000274, sig00000273, sig00000272, sig00000271, sig00000270, 
sig0000026f, sig0000026e, sig0000026d, sig0000026c, sig0000026b}),
    .ALUMODE({sig00000002, sig00000002, sig00000002, sig00000002}),
    .C({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYOUT({\NLW_blk00000042_CARRYOUT<3>_UNCONNECTED , \NLW_blk00000042_CARRYOUT<2>_UNCONNECTED , \NLW_blk00000042_CARRYOUT<1>_UNCONNECTED , 
\NLW_blk00000042_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .BCIN({sig000002ac, sig000002ab, sig000002aa, sig000002a9, sig000002a8, sig000002a7, sig000002a6, sig000002a5, sig000002a4, sig000002a3, 
sig000002a2, sig000002a1, sig000002a0, sig0000029f, sig0000029e, sig0000029d, sig0000029c, sig0000029b}),
    .B({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .BCOUT({\NLW_blk00000042_BCOUT<17>_UNCONNECTED , \NLW_blk00000042_BCOUT<16>_UNCONNECTED , \NLW_blk00000042_BCOUT<15>_UNCONNECTED , 
\NLW_blk00000042_BCOUT<14>_UNCONNECTED , \NLW_blk00000042_BCOUT<13>_UNCONNECTED , \NLW_blk00000042_BCOUT<12>_UNCONNECTED , 
\NLW_blk00000042_BCOUT<11>_UNCONNECTED , \NLW_blk00000042_BCOUT<10>_UNCONNECTED , \NLW_blk00000042_BCOUT<9>_UNCONNECTED , 
\NLW_blk00000042_BCOUT<8>_UNCONNECTED , \NLW_blk00000042_BCOUT<7>_UNCONNECTED , \NLW_blk00000042_BCOUT<6>_UNCONNECTED , 
\NLW_blk00000042_BCOUT<5>_UNCONNECTED , \NLW_blk00000042_BCOUT<4>_UNCONNECTED , \NLW_blk00000042_BCOUT<3>_UNCONNECTED , 
\NLW_blk00000042_BCOUT<2>_UNCONNECTED , \NLW_blk00000042_BCOUT<1>_UNCONNECTED , \NLW_blk00000042_BCOUT<0>_UNCONNECTED }),
    .D({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002}),
    .P({\NLW_blk00000042_P<47>_UNCONNECTED , \NLW_blk00000042_P<46>_UNCONNECTED , \NLW_blk00000042_P<45>_UNCONNECTED , 
\NLW_blk00000042_P<44>_UNCONNECTED , \NLW_blk00000042_P<43>_UNCONNECTED , \NLW_blk00000042_P<42>_UNCONNECTED , \NLW_blk00000042_P<41>_UNCONNECTED , 
\NLW_blk00000042_P<40>_UNCONNECTED , \NLW_blk00000042_P<39>_UNCONNECTED , \NLW_blk00000042_P<38>_UNCONNECTED , \NLW_blk00000042_P<37>_UNCONNECTED , 
\NLW_blk00000042_P<36>_UNCONNECTED , \NLW_blk00000042_P<35>_UNCONNECTED , \NLW_blk00000042_P<34>_UNCONNECTED , \NLW_blk00000042_P<33>_UNCONNECTED , 
\NLW_blk00000042_P<32>_UNCONNECTED , \NLW_blk00000042_P<31>_UNCONNECTED , \NLW_blk00000042_P<30>_UNCONNECTED , \NLW_blk00000042_P<29>_UNCONNECTED , 
\NLW_blk00000042_P<28>_UNCONNECTED , \NLW_blk00000042_P<27>_UNCONNECTED , \NLW_blk00000042_P<26>_UNCONNECTED , \NLW_blk00000042_P<25>_UNCONNECTED , 
\NLW_blk00000042_P<24>_UNCONNECTED , \NLW_blk00000042_P<23>_UNCONNECTED , \NLW_blk00000042_P<22>_UNCONNECTED , \NLW_blk00000042_P<21>_UNCONNECTED , 
\NLW_blk00000042_P<20>_UNCONNECTED , \NLW_blk00000042_P<19>_UNCONNECTED , \NLW_blk00000042_P<18>_UNCONNECTED , \NLW_blk00000042_P<17>_UNCONNECTED , 
\NLW_blk00000042_P<16>_UNCONNECTED , \NLW_blk00000042_P<15>_UNCONNECTED , \NLW_blk00000042_P<14>_UNCONNECTED , \NLW_blk00000042_P<13>_UNCONNECTED , 
\NLW_blk00000042_P<12>_UNCONNECTED , \NLW_blk00000042_P<11>_UNCONNECTED , \NLW_blk00000042_P<10>_UNCONNECTED , \NLW_blk00000042_P<9>_UNCONNECTED , 
\NLW_blk00000042_P<8>_UNCONNECTED , \NLW_blk00000042_P<7>_UNCONNECTED , \NLW_blk00000042_P<6>_UNCONNECTED , \NLW_blk00000042_P<5>_UNCONNECTED , 
\NLW_blk00000042_P<4>_UNCONNECTED , \NLW_blk00000042_P<3>_UNCONNECTED , \NLW_blk00000042_P<2>_UNCONNECTED , \NLW_blk00000042_P<1>_UNCONNECTED , 
\NLW_blk00000042_P<0>_UNCONNECTED }),
    .A({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, s_axis_a_tdata[33], s_axis_a_tdata[32], s_axis_a_tdata[31], s_axis_a_tdata[30], s_axis_a_tdata[29], s_axis_a_tdata[28], 
s_axis_a_tdata[27], s_axis_a_tdata[26], s_axis_a_tdata[25], s_axis_a_tdata[24], s_axis_a_tdata[23], s_axis_a_tdata[22], s_axis_a_tdata[21], 
s_axis_a_tdata[20], s_axis_a_tdata[19], s_axis_a_tdata[18], s_axis_a_tdata[17]}),
    .PCOUT({sig00000268, sig00000267, sig00000266, sig00000265, sig00000264, sig00000263, sig00000262, sig00000261, sig00000260, sig0000025f, 
sig0000025e, sig0000025d, sig0000025c, sig0000025b, sig0000025a, sig00000259, sig00000258, sig00000257, sig00000256, sig00000255, sig00000254, 
sig00000253, sig00000252, sig00000251, sig00000250, sig0000024f, sig0000024e, sig0000024d, sig0000024c, sig0000024b, sig0000024a, sig00000249, 
sig00000248, sig00000247, sig00000246, sig00000245, sig00000244, sig00000243, sig00000242, sig00000241, sig00000240, sig0000023f, sig0000023e, 
sig0000023d, sig0000023c, sig0000023b, sig0000023a, sig00000239}),
    .ACIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYINSEL({sig00000002, sig00000002, sig00000002})
  );
  DSP48E1 #(
    .ACASCREG ( 0 ),
    .ADREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 0 ),
    .AUTORESET_PATDET ( "NO_RESET" ),
    .A_INPUT ( "DIRECT" ),
    .BCASCREG ( 0 ),
    .BREG ( 0 ),
    .B_INPUT ( "CASCADE" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .DREG ( 0 ),
    .INMODEREG ( 0 ),
    .MASK ( 48'h3FFFFFFFFFFF ),
    .MREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 0 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .USE_DPORT ( "FALSE" ),
    .USE_MULT ( "MULTIPLY" ),
    .USE_PATTERN_DETECT ( "NO_PATDET" ),
    .USE_SIMD ( "ONE48" ))
  blk00000043 (
    .PATTERNBDETECT(NLW_blk00000043_PATTERNBDETECT_UNCONNECTED),
    .RSTC(sig00000002),
    .CEB1(sig00000002),
    .CEAD(sig00000002),
    .MULTSIGNOUT(NLW_blk00000043_MULTSIGNOUT_UNCONNECTED),
    .CEC(sig00000002),
    .RSTM(sig00000002),
    .MULTSIGNIN(sig00000002),
    .CEB2(sig00000002),
    .RSTCTRL(sig00000002),
    .CEP(sig00000002),
    .CARRYCASCOUT(NLW_blk00000043_CARRYCASCOUT_UNCONNECTED),
    .RSTA(sig00000002),
    .CECARRYIN(sig00000002),
    .UNDERFLOW(NLW_blk00000043_UNDERFLOW_UNCONNECTED),
    .PATTERNDETECT(NLW_blk00000043_PATTERNDETECT_UNCONNECTED),
    .RSTALUMODE(sig00000002),
    .RSTALLCARRYIN(sig00000002),
    .CED(sig00000002),
    .RSTD(sig00000002),
    .CEALUMODE(sig00000002),
    .CEA2(sig00000002),
    .CLK(aclk),
    .CEA1(sig00000002),
    .RSTB(sig00000002),
    .OVERFLOW(NLW_blk00000043_OVERFLOW_UNCONNECTED),
    .CECTRL(sig00000002),
    .CEM(sig00000002),
    .CARRYIN(sig00000002),
    .CARRYCASCIN(sig00000002),
    .RSTINMODE(sig00000002),
    .CEINMODE(sig00000002),
    .RSTP(sig00000002),
    .ACOUT({\NLW_blk00000043_ACOUT<29>_UNCONNECTED , \NLW_blk00000043_ACOUT<28>_UNCONNECTED , \NLW_blk00000043_ACOUT<27>_UNCONNECTED , 
\NLW_blk00000043_ACOUT<26>_UNCONNECTED , \NLW_blk00000043_ACOUT<25>_UNCONNECTED , \NLW_blk00000043_ACOUT<24>_UNCONNECTED , 
\NLW_blk00000043_ACOUT<23>_UNCONNECTED , \NLW_blk00000043_ACOUT<22>_UNCONNECTED , \NLW_blk00000043_ACOUT<21>_UNCONNECTED , 
\NLW_blk00000043_ACOUT<20>_UNCONNECTED , \NLW_blk00000043_ACOUT<19>_UNCONNECTED , \NLW_blk00000043_ACOUT<18>_UNCONNECTED , 
\NLW_blk00000043_ACOUT<17>_UNCONNECTED , \NLW_blk00000043_ACOUT<16>_UNCONNECTED , \NLW_blk00000043_ACOUT<15>_UNCONNECTED , 
\NLW_blk00000043_ACOUT<14>_UNCONNECTED , \NLW_blk00000043_ACOUT<13>_UNCONNECTED , \NLW_blk00000043_ACOUT<12>_UNCONNECTED , 
\NLW_blk00000043_ACOUT<11>_UNCONNECTED , \NLW_blk00000043_ACOUT<10>_UNCONNECTED , \NLW_blk00000043_ACOUT<9>_UNCONNECTED , 
\NLW_blk00000043_ACOUT<8>_UNCONNECTED , \NLW_blk00000043_ACOUT<7>_UNCONNECTED , \NLW_blk00000043_ACOUT<6>_UNCONNECTED , 
\NLW_blk00000043_ACOUT<5>_UNCONNECTED , \NLW_blk00000043_ACOUT<4>_UNCONNECTED , \NLW_blk00000043_ACOUT<3>_UNCONNECTED , 
\NLW_blk00000043_ACOUT<2>_UNCONNECTED , \NLW_blk00000043_ACOUT<1>_UNCONNECTED , \NLW_blk00000043_ACOUT<0>_UNCONNECTED }),
    .OPMODE({sig00000001, sig00000002, sig00000001, sig00000002, sig00000001, sig00000002, sig00000001}),
    .PCIN({sig0000030d, sig0000030c, sig0000030b, sig0000030a, sig00000309, sig00000308, sig00000307, sig00000306, sig00000305, sig00000304, 
sig00000303, sig00000302, sig00000301, sig00000300, sig000002ff, sig000002fe, sig000002fd, sig000002fc, sig000002fb, sig000002fa, sig000002f9, 
sig000002f8, sig000002f7, sig000002f6, sig000002f5, sig000002f4, sig000002f3, sig000002f2, sig000002f1, sig000002f0, sig000002ef, sig000002ee, 
sig000002ed, sig000002ec, sig000002eb, sig000002ea, sig000002e9, sig000002e8, sig000002e7, sig000002e6, sig000002e5, sig000002e4, sig000002e3, 
sig000002e2, sig000002e1, sig000002e0, sig000002df, sig000002de}),
    .ALUMODE({sig00000002, sig00000002, sig00000002, sig00000002}),
    .C({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYOUT({\NLW_blk00000043_CARRYOUT<3>_UNCONNECTED , \NLW_blk00000043_CARRYOUT<2>_UNCONNECTED , \NLW_blk00000043_CARRYOUT<1>_UNCONNECTED , 
\NLW_blk00000043_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .BCIN({sig0000031f, sig0000031e, sig0000031d, sig0000031c, sig0000031b, sig0000031a, sig00000319, sig00000318, sig00000317, sig00000316, 
sig00000315, sig00000314, sig00000313, sig00000312, sig00000311, sig00000310, sig0000030f, sig0000030e}),
    .B({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .BCOUT({\NLW_blk00000043_BCOUT<17>_UNCONNECTED , \NLW_blk00000043_BCOUT<16>_UNCONNECTED , \NLW_blk00000043_BCOUT<15>_UNCONNECTED , 
\NLW_blk00000043_BCOUT<14>_UNCONNECTED , \NLW_blk00000043_BCOUT<13>_UNCONNECTED , \NLW_blk00000043_BCOUT<12>_UNCONNECTED , 
\NLW_blk00000043_BCOUT<11>_UNCONNECTED , \NLW_blk00000043_BCOUT<10>_UNCONNECTED , \NLW_blk00000043_BCOUT<9>_UNCONNECTED , 
\NLW_blk00000043_BCOUT<8>_UNCONNECTED , \NLW_blk00000043_BCOUT<7>_UNCONNECTED , \NLW_blk00000043_BCOUT<6>_UNCONNECTED , 
\NLW_blk00000043_BCOUT<5>_UNCONNECTED , \NLW_blk00000043_BCOUT<4>_UNCONNECTED , \NLW_blk00000043_BCOUT<3>_UNCONNECTED , 
\NLW_blk00000043_BCOUT<2>_UNCONNECTED , \NLW_blk00000043_BCOUT<1>_UNCONNECTED , \NLW_blk00000043_BCOUT<0>_UNCONNECTED }),
    .D({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002}),
    .P({\NLW_blk00000043_P<47>_UNCONNECTED , \NLW_blk00000043_P<46>_UNCONNECTED , \NLW_blk00000043_P<45>_UNCONNECTED , 
\NLW_blk00000043_P<44>_UNCONNECTED , \NLW_blk00000043_P<43>_UNCONNECTED , \NLW_blk00000043_P<42>_UNCONNECTED , \NLW_blk00000043_P<41>_UNCONNECTED , 
\NLW_blk00000043_P<40>_UNCONNECTED , \NLW_blk00000043_P<39>_UNCONNECTED , \NLW_blk00000043_P<38>_UNCONNECTED , \NLW_blk00000043_P<37>_UNCONNECTED , 
\NLW_blk00000043_P<36>_UNCONNECTED , \NLW_blk00000043_P<35>_UNCONNECTED , \NLW_blk00000043_P<34>_UNCONNECTED , \NLW_blk00000043_P<33>_UNCONNECTED , 
\NLW_blk00000043_P<32>_UNCONNECTED , \NLW_blk00000043_P<31>_UNCONNECTED , \NLW_blk00000043_P<30>_UNCONNECTED , \NLW_blk00000043_P<29>_UNCONNECTED , 
\NLW_blk00000043_P<28>_UNCONNECTED , \NLW_blk00000043_P<27>_UNCONNECTED , \NLW_blk00000043_P<26>_UNCONNECTED , \NLW_blk00000043_P<25>_UNCONNECTED , 
\NLW_blk00000043_P<24>_UNCONNECTED , \NLW_blk00000043_P<23>_UNCONNECTED , \NLW_blk00000043_P<22>_UNCONNECTED , \NLW_blk00000043_P<21>_UNCONNECTED , 
\NLW_blk00000043_P<20>_UNCONNECTED , \NLW_blk00000043_P<19>_UNCONNECTED , \NLW_blk00000043_P<18>_UNCONNECTED , \NLW_blk00000043_P<17>_UNCONNECTED , 
\NLW_blk00000043_P<16>_UNCONNECTED , \NLW_blk00000043_P<15>_UNCONNECTED , \NLW_blk00000043_P<14>_UNCONNECTED , \NLW_blk00000043_P<13>_UNCONNECTED , 
\NLW_blk00000043_P<12>_UNCONNECTED , \NLW_blk00000043_P<11>_UNCONNECTED , \NLW_blk00000043_P<10>_UNCONNECTED , \NLW_blk00000043_P<9>_UNCONNECTED , 
\NLW_blk00000043_P<8>_UNCONNECTED , \NLW_blk00000043_P<7>_UNCONNECTED , \NLW_blk00000043_P<6>_UNCONNECTED , \NLW_blk00000043_P<5>_UNCONNECTED , 
\NLW_blk00000043_P<4>_UNCONNECTED , \NLW_blk00000043_P<3>_UNCONNECTED , \NLW_blk00000043_P<2>_UNCONNECTED , \NLW_blk00000043_P<1>_UNCONNECTED , 
\NLW_blk00000043_P<0>_UNCONNECTED }),
    .A({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, s_axis_a_tdata[33], s_axis_a_tdata[32], s_axis_a_tdata[31], s_axis_a_tdata[30], s_axis_a_tdata[29], s_axis_a_tdata[28], 
s_axis_a_tdata[27], s_axis_a_tdata[26], s_axis_a_tdata[25], s_axis_a_tdata[24], s_axis_a_tdata[23], s_axis_a_tdata[22], s_axis_a_tdata[21], 
s_axis_a_tdata[20], s_axis_a_tdata[19], s_axis_a_tdata[18], s_axis_a_tdata[17]}),
    .PCOUT({sig000002dc, sig000002db, sig000002da, sig000002d9, sig000002d8, sig000002d7, sig000002d6, sig000002d5, sig000002d4, sig000002d3, 
sig000002d2, sig000002d1, sig000002d0, sig000002cf, sig000002ce, sig000002cd, sig000002cc, sig000002cb, sig000002ca, sig000002c9, sig000002c8, 
sig000002c7, sig000002c6, sig000002c5, sig000002c4, sig000002c3, sig000002c2, sig000002c1, sig000002c0, sig000002bf, sig000002be, sig000002bd, 
sig000002bc, sig000002bb, sig000002ba, sig000002b9, sig000002b8, sig000002b7, sig000002b6, sig000002b5, sig000002b4, sig000002b3, sig000002b2, 
sig000002b1, sig000002b0, sig000002af, sig000002ae, sig000002ad}),
    .ACIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYINSEL({sig00000002, sig00000002, sig00000002})
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000044 (
    .C(aclk),
    .CE(aclken),
    .D(sig000000db),
    .Q(sig00000032)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000045 (
    .C(aclk),
    .CE(aclken),
    .D(sig000000dc),
    .Q(sig00000269)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000046 (
    .C(aclk),
    .CE(aclken),
    .D(sig0000013b),
    .Q(sig00000043)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000047 (
    .C(aclk),
    .CE(aclken),
    .D(sig0000013a),
    .Q(sig00000042)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000048 (
    .C(aclk),
    .CE(aclken),
    .D(sig00000139),
    .Q(sig00000041)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000049 (
    .C(aclk),
    .CE(aclken),
    .D(sig00000138),
    .Q(sig00000040)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004a (
    .C(aclk),
    .CE(aclken),
    .D(sig00000137),
    .Q(sig0000003f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004b (
    .C(aclk),
    .CE(aclken),
    .D(sig00000136),
    .Q(sig0000003e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004c (
    .C(aclk),
    .CE(aclken),
    .D(sig00000135),
    .Q(sig0000003d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004d (
    .C(aclk),
    .CE(aclken),
    .D(sig00000134),
    .Q(sig0000003c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004e (
    .C(aclk),
    .CE(aclken),
    .D(sig00000133),
    .Q(sig0000003b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004f (
    .C(aclk),
    .CE(aclken),
    .D(sig00000132),
    .Q(sig0000003a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000050 (
    .C(aclk),
    .CE(aclken),
    .D(sig00000131),
    .Q(sig00000039)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000051 (
    .C(aclk),
    .CE(aclken),
    .D(sig00000130),
    .Q(sig00000038)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000052 (
    .C(aclk),
    .CE(aclken),
    .D(sig0000012f),
    .Q(sig00000037)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000053 (
    .C(aclk),
    .CE(aclken),
    .D(sig0000012e),
    .Q(sig00000036)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000054 (
    .C(aclk),
    .CE(aclken),
    .D(sig0000012d),
    .Q(sig00000035)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000055 (
    .C(aclk),
    .CE(aclken),
    .D(sig0000012c),
    .Q(sig00000034)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000056 (
    .C(aclk),
    .CE(aclken),
    .D(sig0000012b),
    .Q(sig00000033)
  );
  MUXCY   blk00000057 (
    .CI(sig00000002),
    .DI(sig00000002),
    .S(sig000003cb),
    .O(sig00000320)
  );
  XORCY   blk00000058 (
    .CI(sig00000002),
    .LI(sig000003cb),
    .O(sig00000360)
  );
  MUXCY   blk00000059 (
    .CI(sig00000320),
    .DI(sig00000002),
    .S(sig000003cc),
    .O(sig00000321)
  );
  XORCY   blk0000005a (
    .CI(sig00000320),
    .LI(sig000003cc),
    .O(sig00000361)
  );
  MUXCY   blk0000005b (
    .CI(sig00000321),
    .DI(sig00000002),
    .S(sig000003cd),
    .O(sig00000322)
  );
  XORCY   blk0000005c (
    .CI(sig00000321),
    .LI(sig000003cd),
    .O(sig00000362)
  );
  MUXCY   blk0000005d (
    .CI(sig00000322),
    .DI(sig00000002),
    .S(sig000003ce),
    .O(sig00000323)
  );
  XORCY   blk0000005e (
    .CI(sig00000322),
    .LI(sig000003ce),
    .O(sig00000363)
  );
  MUXCY   blk0000005f (
    .CI(sig00000323),
    .DI(sig00000002),
    .S(sig000003cf),
    .O(sig00000324)
  );
  XORCY   blk00000060 (
    .CI(sig00000323),
    .LI(sig000003cf),
    .O(sig00000364)
  );
  MUXCY   blk00000061 (
    .CI(sig00000324),
    .DI(sig00000002),
    .S(sig000003d0),
    .O(sig00000325)
  );
  XORCY   blk00000062 (
    .CI(sig00000324),
    .LI(sig000003d0),
    .O(sig00000365)
  );
  MUXCY   blk00000063 (
    .CI(sig00000325),
    .DI(sig00000002),
    .S(sig000003d1),
    .O(sig00000326)
  );
  XORCY   blk00000064 (
    .CI(sig00000325),
    .LI(sig000003d1),
    .O(NLW_blk00000064_O_UNCONNECTED)
  );
  MUXCY   blk00000065 (
    .CI(sig00000326),
    .DI(sig00000001),
    .S(sig000003d2),
    .O(sig00000327)
  );
  XORCY   blk00000066 (
    .CI(sig00000326),
    .LI(sig000003d2),
    .O(NLW_blk00000066_O_UNCONNECTED)
  );
  MUXCY   blk00000067 (
    .CI(sig00000327),
    .DI(sig00000002),
    .S(sig000003d3),
    .O(sig00000328)
  );
  XORCY   blk00000068 (
    .CI(sig00000327),
    .LI(sig000003d3),
    .O(sig00000366)
  );
  MUXCY   blk00000069 (
    .CI(sig00000328),
    .DI(sig00000002),
    .S(sig000003d4),
    .O(sig00000329)
  );
  XORCY   blk0000006a (
    .CI(sig00000328),
    .LI(sig000003d4),
    .O(sig00000367)
  );
  MUXCY   blk0000006b (
    .CI(sig00000329),
    .DI(sig00000002),
    .S(sig000003d5),
    .O(sig0000032a)
  );
  XORCY   blk0000006c (
    .CI(sig00000329),
    .LI(sig000003d5),
    .O(sig00000368)
  );
  MUXCY   blk0000006d (
    .CI(sig0000032a),
    .DI(sig00000002),
    .S(sig000003d6),
    .O(sig0000032b)
  );
  XORCY   blk0000006e (
    .CI(sig0000032a),
    .LI(sig000003d6),
    .O(sig00000369)
  );
  MUXCY   blk0000006f (
    .CI(sig0000032b),
    .DI(sig00000002),
    .S(sig000003d7),
    .O(sig0000032c)
  );
  XORCY   blk00000070 (
    .CI(sig0000032b),
    .LI(sig000003d7),
    .O(sig0000036a)
  );
  MUXCY   blk00000071 (
    .CI(sig0000032c),
    .DI(sig00000002),
    .S(sig000003d8),
    .O(sig0000032d)
  );
  XORCY   blk00000072 (
    .CI(sig0000032c),
    .LI(sig000003d8),
    .O(sig0000036b)
  );
  MUXCY   blk00000073 (
    .CI(sig0000032d),
    .DI(sig00000002),
    .S(sig000003d9),
    .O(sig0000032e)
  );
  XORCY   blk00000074 (
    .CI(sig0000032d),
    .LI(sig000003d9),
    .O(sig0000036c)
  );
  MUXCY   blk00000075 (
    .CI(sig0000032e),
    .DI(sig00000002),
    .S(sig000003da),
    .O(sig0000032f)
  );
  XORCY   blk00000076 (
    .CI(sig0000032e),
    .LI(sig000003da),
    .O(sig0000036d)
  );
  MUXCY   blk00000077 (
    .CI(sig0000032f),
    .DI(sig00000002),
    .S(sig000003db),
    .O(sig00000330)
  );
  XORCY   blk00000078 (
    .CI(sig0000032f),
    .LI(sig000003db),
    .O(sig0000036e)
  );
  MUXCY   blk00000079 (
    .CI(sig00000330),
    .DI(sig00000002),
    .S(sig000003dc),
    .O(sig00000331)
  );
  XORCY   blk0000007a (
    .CI(sig00000330),
    .LI(sig000003dc),
    .O(sig0000036f)
  );
  XORCY   blk0000007b (
    .CI(sig00000331),
    .LI(sig000003e7),
    .O(sig00000370)
  );
  MUXCY   blk0000007c (
    .CI(sig00000001),
    .DI(sig00000002),
    .S(sig00000346),
    .O(sig00000332)
  );
  XORCY   blk0000007d (
    .CI(sig00000001),
    .LI(sig00000346),
    .O(sig0000034f)
  );
  MUXCY   blk0000007e (
    .CI(sig00000332),
    .DI(sig00000002),
    .S(sig00000347),
    .O(sig00000333)
  );
  XORCY   blk0000007f (
    .CI(sig00000332),
    .LI(sig00000347),
    .O(sig00000350)
  );
  MUXCY   blk00000080 (
    .CI(sig00000333),
    .DI(sig00000002),
    .S(sig00000348),
    .O(sig00000334)
  );
  XORCY   blk00000081 (
    .CI(sig00000333),
    .LI(sig00000348),
    .O(sig00000351)
  );
  MUXCY   blk00000082 (
    .CI(sig00000334),
    .DI(sig00000002),
    .S(sig00000349),
    .O(sig00000335)
  );
  XORCY   blk00000083 (
    .CI(sig00000334),
    .LI(sig00000349),
    .O(sig00000352)
  );
  MUXCY   blk00000084 (
    .CI(sig00000335),
    .DI(sig00000002),
    .S(sig0000034a),
    .O(sig00000336)
  );
  XORCY   blk00000085 (
    .CI(sig00000335),
    .LI(sig0000034a),
    .O(sig00000353)
  );
  MUXCY   blk00000086 (
    .CI(sig00000336),
    .DI(sig00000002),
    .S(sig0000034b),
    .O(sig00000337)
  );
  XORCY   blk00000087 (
    .CI(sig00000336),
    .LI(sig0000034b),
    .O(sig00000354)
  );
  MUXCY   blk00000088 (
    .CI(sig00000337),
    .DI(sig00000002),
    .S(sig0000034c),
    .O(sig00000338)
  );
  XORCY   blk00000089 (
    .CI(sig00000337),
    .LI(sig0000034c),
    .O(NLW_blk00000089_O_UNCONNECTED)
  );
  MUXCY   blk0000008a (
    .CI(sig00000338),
    .DI(sig00000001),
    .S(sig0000034d),
    .O(sig00000339)
  );
  XORCY   blk0000008b (
    .CI(sig00000338),
    .LI(sig0000034d),
    .O(NLW_blk0000008b_O_UNCONNECTED)
  );
  MUXCY   blk0000008c (
    .CI(sig00000339),
    .DI(sig00000002),
    .S(sig000003dd),
    .O(sig0000033a)
  );
  XORCY   blk0000008d (
    .CI(sig00000339),
    .LI(sig000003dd),
    .O(sig00000355)
  );
  MUXCY   blk0000008e (
    .CI(sig0000033a),
    .DI(sig00000002),
    .S(sig000003de),
    .O(sig0000033b)
  );
  XORCY   blk0000008f (
    .CI(sig0000033a),
    .LI(sig000003de),
    .O(sig00000356)
  );
  MUXCY   blk00000090 (
    .CI(sig0000033b),
    .DI(sig00000002),
    .S(sig000003df),
    .O(sig0000033c)
  );
  XORCY   blk00000091 (
    .CI(sig0000033b),
    .LI(sig000003df),
    .O(sig00000357)
  );
  MUXCY   blk00000092 (
    .CI(sig0000033c),
    .DI(sig00000002),
    .S(sig000003e0),
    .O(sig0000033d)
  );
  XORCY   blk00000093 (
    .CI(sig0000033c),
    .LI(sig000003e0),
    .O(sig00000358)
  );
  MUXCY   blk00000094 (
    .CI(sig0000033d),
    .DI(sig00000002),
    .S(sig000003e1),
    .O(sig0000033e)
  );
  XORCY   blk00000095 (
    .CI(sig0000033d),
    .LI(sig000003e1),
    .O(sig00000359)
  );
  MUXCY   blk00000096 (
    .CI(sig0000033e),
    .DI(sig00000002),
    .S(sig000003e2),
    .O(sig0000033f)
  );
  XORCY   blk00000097 (
    .CI(sig0000033e),
    .LI(sig000003e2),
    .O(sig0000035a)
  );
  MUXCY   blk00000098 (
    .CI(sig0000033f),
    .DI(sig00000002),
    .S(sig000003e3),
    .O(sig00000340)
  );
  XORCY   blk00000099 (
    .CI(sig0000033f),
    .LI(sig000003e3),
    .O(sig0000035b)
  );
  MUXCY   blk0000009a (
    .CI(sig00000340),
    .DI(sig00000002),
    .S(sig000003e4),
    .O(sig00000341)
  );
  XORCY   blk0000009b (
    .CI(sig00000340),
    .LI(sig000003e4),
    .O(sig0000035c)
  );
  MUXCY   blk0000009c (
    .CI(sig00000341),
    .DI(sig00000002),
    .S(sig000003e5),
    .O(sig00000342)
  );
  XORCY   blk0000009d (
    .CI(sig00000341),
    .LI(sig000003e5),
    .O(sig0000035d)
  );
  MUXCY   blk0000009e (
    .CI(sig00000342),
    .DI(sig00000002),
    .S(sig000003e6),
    .O(sig00000343)
  );
  XORCY   blk0000009f (
    .CI(sig00000342),
    .LI(sig000003e6),
    .O(sig0000035e)
  );
  XORCY   blk000000a0 (
    .CI(sig00000343),
    .LI(sig0000034e),
    .O(sig0000035f)
  );
  DSP48E1 #(
    .ACASCREG ( 0 ),
    .ADREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 0 ),
    .AUTORESET_PATDET ( "NO_RESET" ),
    .A_INPUT ( "DIRECT" ),
    .BCASCREG ( 0 ),
    .BREG ( 0 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .DREG ( 0 ),
    .INMODEREG ( 0 ),
    .MASK ( 48'h3FFFFFFFFFFF ),
    .MREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 0 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .USE_DPORT ( "FALSE" ),
    .USE_MULT ( "NONE" ),
    .USE_PATTERN_DETECT ( "NO_PATDET" ),
    .USE_SIMD ( "ONE48" ))
  blk000000a1 (
    .PATTERNBDETECT(NLW_blk000000a1_PATTERNBDETECT_UNCONNECTED),
    .RSTC(sig00000002),
    .CEB1(sig00000002),
    .CEAD(sig00000002),
    .MULTSIGNOUT(NLW_blk000000a1_MULTSIGNOUT_UNCONNECTED),
    .CEC(sig00000002),
    .RSTM(sig00000002),
    .MULTSIGNIN(sig00000002),
    .CEB2(sig00000002),
    .RSTCTRL(sig00000002),
    .CEP(sig00000002),
    .CARRYCASCOUT(NLW_blk000000a1_CARRYCASCOUT_UNCONNECTED),
    .RSTA(sig00000002),
    .CECARRYIN(sig00000002),
    .UNDERFLOW(NLW_blk000000a1_UNDERFLOW_UNCONNECTED),
    .PATTERNDETECT(NLW_blk000000a1_PATTERNDETECT_UNCONNECTED),
    .RSTALUMODE(sig00000002),
    .RSTALLCARRYIN(sig00000002),
    .CED(sig00000002),
    .RSTD(sig00000002),
    .CEALUMODE(sig00000002),
    .CEA2(sig00000002),
    .CLK(aclk),
    .CEA1(sig00000002),
    .RSTB(sig00000002),
    .OVERFLOW(NLW_blk000000a1_OVERFLOW_UNCONNECTED),
    .CECTRL(sig00000002),
    .CEM(sig00000002),
    .CARRYIN(sig00000002),
    .CARRYCASCIN(sig00000002),
    .RSTINMODE(sig00000002),
    .CEINMODE(sig00000002),
    .RSTP(sig00000002),
    .ACOUT({\NLW_blk000000a1_ACOUT<29>_UNCONNECTED , \NLW_blk000000a1_ACOUT<28>_UNCONNECTED , \NLW_blk000000a1_ACOUT<27>_UNCONNECTED , 
\NLW_blk000000a1_ACOUT<26>_UNCONNECTED , \NLW_blk000000a1_ACOUT<25>_UNCONNECTED , \NLW_blk000000a1_ACOUT<24>_UNCONNECTED , 
\NLW_blk000000a1_ACOUT<23>_UNCONNECTED , \NLW_blk000000a1_ACOUT<22>_UNCONNECTED , \NLW_blk000000a1_ACOUT<21>_UNCONNECTED , 
\NLW_blk000000a1_ACOUT<20>_UNCONNECTED , \NLW_blk000000a1_ACOUT<19>_UNCONNECTED , \NLW_blk000000a1_ACOUT<18>_UNCONNECTED , 
\NLW_blk000000a1_ACOUT<17>_UNCONNECTED , \NLW_blk000000a1_ACOUT<16>_UNCONNECTED , \NLW_blk000000a1_ACOUT<15>_UNCONNECTED , 
\NLW_blk000000a1_ACOUT<14>_UNCONNECTED , \NLW_blk000000a1_ACOUT<13>_UNCONNECTED , \NLW_blk000000a1_ACOUT<12>_UNCONNECTED , 
\NLW_blk000000a1_ACOUT<11>_UNCONNECTED , \NLW_blk000000a1_ACOUT<10>_UNCONNECTED , \NLW_blk000000a1_ACOUT<9>_UNCONNECTED , 
\NLW_blk000000a1_ACOUT<8>_UNCONNECTED , \NLW_blk000000a1_ACOUT<7>_UNCONNECTED , \NLW_blk000000a1_ACOUT<6>_UNCONNECTED , 
\NLW_blk000000a1_ACOUT<5>_UNCONNECTED , \NLW_blk000000a1_ACOUT<4>_UNCONNECTED , \NLW_blk000000a1_ACOUT<3>_UNCONNECTED , 
\NLW_blk000000a1_ACOUT<2>_UNCONNECTED , \NLW_blk000000a1_ACOUT<1>_UNCONNECTED , \NLW_blk000000a1_ACOUT<0>_UNCONNECTED }),
    .OPMODE({sig00000002, sig00000001, sig00000001, sig00000078, sig00000078, sig00000001, sig00000001}),
    .PCIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .ALUMODE({sig00000002, sig00000002, sig00000002, sig00000002}),
    .C({sig00000002, sig00000345, sig00000061, sig00000060, sig0000005f, sig0000005e, sig0000005d, sig0000005c, sig0000005b, sig0000005a, sig00000059
, sig00000058, sig00000057, sig00000056, sig00000055, sig00000054, sig00000053, sig00000052, sig00000051, sig00000050, sig0000004f, sig0000004e, 
sig0000004d, sig0000004c, sig0000004b, sig0000004a, sig00000049, sig00000048, sig00000047, sig00000046, sig00000045, sig00000044, sig00000043, 
sig00000042, sig00000041, sig00000040, sig0000003f, sig0000003e, sig0000003d, sig0000003c, sig0000003b, sig0000003a, sig00000039, sig00000038, 
sig00000037, sig00000036, sig00000035, sig00000034}),
    .CARRYOUT({\NLW_blk000000a1_CARRYOUT<3>_UNCONNECTED , \NLW_blk000000a1_CARRYOUT<2>_UNCONNECTED , \NLW_blk000000a1_CARRYOUT<1>_UNCONNECTED , 
\NLW_blk000000a1_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .BCIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .B({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000344, sig00000002}),
    .BCOUT({\NLW_blk000000a1_BCOUT<17>_UNCONNECTED , \NLW_blk000000a1_BCOUT<16>_UNCONNECTED , \NLW_blk000000a1_BCOUT<15>_UNCONNECTED , 
\NLW_blk000000a1_BCOUT<14>_UNCONNECTED , \NLW_blk000000a1_BCOUT<13>_UNCONNECTED , \NLW_blk000000a1_BCOUT<12>_UNCONNECTED , 
\NLW_blk000000a1_BCOUT<11>_UNCONNECTED , \NLW_blk000000a1_BCOUT<10>_UNCONNECTED , \NLW_blk000000a1_BCOUT<9>_UNCONNECTED , 
\NLW_blk000000a1_BCOUT<8>_UNCONNECTED , \NLW_blk000000a1_BCOUT<7>_UNCONNECTED , \NLW_blk000000a1_BCOUT<6>_UNCONNECTED , 
\NLW_blk000000a1_BCOUT<5>_UNCONNECTED , \NLW_blk000000a1_BCOUT<4>_UNCONNECTED , \NLW_blk000000a1_BCOUT<3>_UNCONNECTED , 
\NLW_blk000000a1_BCOUT<2>_UNCONNECTED , \NLW_blk000000a1_BCOUT<1>_UNCONNECTED , \NLW_blk000000a1_BCOUT<0>_UNCONNECTED }),
    .D({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002}),
    .P({sig00000371, sig00000031, sig00000030, sig0000002f, sig0000002e, sig0000002d, sig0000002c, sig0000002b, sig0000002a, sig00000029, sig00000028
, sig00000027, sig00000026, sig00000025, sig00000024, sig00000023, sig00000022, sig00000021, sig00000020, sig0000001f, sig0000001e, sig0000001d, 
sig0000001c, sig0000001b, sig0000001a, sig00000019, sig00000018, sig00000017, sig00000016, sig00000015, sig00000014, sig00000013, sig00000012, 
sig00000011, sig00000010, sig0000000f, sig0000000e, sig0000000d, sig0000000c, sig0000000b, sig0000000a, sig00000009, sig00000008, sig00000007, 
sig00000006, sig00000005, sig00000004, \NLW_blk000000a1_P<0>_UNCONNECTED }),
    .A({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .PCOUT({\NLW_blk000000a1_PCOUT<47>_UNCONNECTED , \NLW_blk000000a1_PCOUT<46>_UNCONNECTED , \NLW_blk000000a1_PCOUT<45>_UNCONNECTED , 
\NLW_blk000000a1_PCOUT<44>_UNCONNECTED , \NLW_blk000000a1_PCOUT<43>_UNCONNECTED , \NLW_blk000000a1_PCOUT<42>_UNCONNECTED , 
\NLW_blk000000a1_PCOUT<41>_UNCONNECTED , \NLW_blk000000a1_PCOUT<40>_UNCONNECTED , \NLW_blk000000a1_PCOUT<39>_UNCONNECTED , 
\NLW_blk000000a1_PCOUT<38>_UNCONNECTED , \NLW_blk000000a1_PCOUT<37>_UNCONNECTED , \NLW_blk000000a1_PCOUT<36>_UNCONNECTED , 
\NLW_blk000000a1_PCOUT<35>_UNCONNECTED , \NLW_blk000000a1_PCOUT<34>_UNCONNECTED , \NLW_blk000000a1_PCOUT<33>_UNCONNECTED , 
\NLW_blk000000a1_PCOUT<32>_UNCONNECTED , \NLW_blk000000a1_PCOUT<31>_UNCONNECTED , \NLW_blk000000a1_PCOUT<30>_UNCONNECTED , 
\NLW_blk000000a1_PCOUT<29>_UNCONNECTED , \NLW_blk000000a1_PCOUT<28>_UNCONNECTED , \NLW_blk000000a1_PCOUT<27>_UNCONNECTED , 
\NLW_blk000000a1_PCOUT<26>_UNCONNECTED , \NLW_blk000000a1_PCOUT<25>_UNCONNECTED , \NLW_blk000000a1_PCOUT<24>_UNCONNECTED , 
\NLW_blk000000a1_PCOUT<23>_UNCONNECTED , \NLW_blk000000a1_PCOUT<22>_UNCONNECTED , \NLW_blk000000a1_PCOUT<21>_UNCONNECTED , 
\NLW_blk000000a1_PCOUT<20>_UNCONNECTED , \NLW_blk000000a1_PCOUT<19>_UNCONNECTED , \NLW_blk000000a1_PCOUT<18>_UNCONNECTED , 
\NLW_blk000000a1_PCOUT<17>_UNCONNECTED , \NLW_blk000000a1_PCOUT<16>_UNCONNECTED , \NLW_blk000000a1_PCOUT<15>_UNCONNECTED , 
\NLW_blk000000a1_PCOUT<14>_UNCONNECTED , \NLW_blk000000a1_PCOUT<13>_UNCONNECTED , \NLW_blk000000a1_PCOUT<12>_UNCONNECTED , 
\NLW_blk000000a1_PCOUT<11>_UNCONNECTED , \NLW_blk000000a1_PCOUT<10>_UNCONNECTED , \NLW_blk000000a1_PCOUT<9>_UNCONNECTED , 
\NLW_blk000000a1_PCOUT<8>_UNCONNECTED , \NLW_blk000000a1_PCOUT<7>_UNCONNECTED , \NLW_blk000000a1_PCOUT<6>_UNCONNECTED , 
\NLW_blk000000a1_PCOUT<5>_UNCONNECTED , \NLW_blk000000a1_PCOUT<4>_UNCONNECTED , \NLW_blk000000a1_PCOUT<3>_UNCONNECTED , 
\NLW_blk000000a1_PCOUT<2>_UNCONNECTED , \NLW_blk000000a1_PCOUT<1>_UNCONNECTED , \NLW_blk000000a1_PCOUT<0>_UNCONNECTED }),
    .ACIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYINSEL({sig00000002, sig00000002, sig00000002})
  );
  MUXCY   blk000000a2 (
    .CI(sig00000001),
    .DI(sig00000002),
    .S(sig00000375),
    .O(sig00000372)
  );
  MUXCY   blk000000a3 (
    .CI(sig00000372),
    .DI(sig00000002),
    .S(sig00000002),
    .O(sig00000373)
  );
  MUXCY   blk000000a4 (
    .CI(sig00000373),
    .DI(sig00000001),
    .S(sig00000374),
    .O(sig00000344)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a5 (
    .C(aclk),
    .D(sig000003a8),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_0 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a6 (
    .C(aclk),
    .D(sig000003a7),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a7 (
    .C(aclk),
    .D(sig000003a6),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a8 (
    .C(aclk),
    .D(sig000003a5),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_3 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a9 (
    .C(aclk),
    .D(sig000003a4),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_4 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000aa (
    .C(aclk),
    .D(sig000003a3),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_5 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ab (
    .C(aclk),
    .D(sig000003a2),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_6 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ac (
    .C(aclk),
    .D(sig000003a1),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_7 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ad (
    .C(aclk),
    .D(sig000003a0),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_8 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ae (
    .C(aclk),
    .D(sig0000039f),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_9 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000af (
    .C(aclk),
    .D(sig0000039e),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_10 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b0 (
    .C(aclk),
    .D(sig0000039d),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_11 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b1 (
    .C(aclk),
    .D(sig0000039c),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_12 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b2 (
    .C(aclk),
    .D(sig0000039b),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_13 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b3 (
    .C(aclk),
    .D(sig0000039a),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_14 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b4 (
    .C(aclk),
    .D(sig00000399),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_15 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b5 (
    .C(aclk),
    .D(sig00000398),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_16 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b6 (
    .C(aclk),
    .D(sig00000397),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_17 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b7 (
    .C(aclk),
    .D(sig00000396),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_18 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b8 (
    .C(aclk),
    .D(sig00000395),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_19 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b9 (
    .C(aclk),
    .D(sig00000394),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_20 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ba (
    .C(aclk),
    .D(sig00000393),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_21 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000bb (
    .C(aclk),
    .D(sig00000392),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_22 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000bc (
    .C(aclk),
    .D(sig00000391),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_23 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000bd (
    .C(aclk),
    .D(sig00000390),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_24 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000be (
    .C(aclk),
    .D(sig0000038f),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_25 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000bf (
    .C(aclk),
    .D(sig0000038e),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_26 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000c0 (
    .C(aclk),
    .D(sig0000038d),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_27 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000c1 (
    .C(aclk),
    .D(sig0000038c),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_28 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000c2 (
    .C(aclk),
    .D(sig0000038b),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_29 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000c3 (
    .C(aclk),
    .D(sig0000038a),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_30 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000c4 (
    .C(aclk),
    .D(sig00000389),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_31 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000c5 (
    .C(aclk),
    .D(sig00000388),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_32 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000c6 (
    .C(aclk),
    .D(sig00000387),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_33 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000c7 (
    .C(aclk),
    .D(sig00000386),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_34 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000c8 (
    .C(aclk),
    .D(sig00000385),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_35 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000c9 (
    .C(aclk),
    .D(sig00000384),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_36 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ca (
    .C(aclk),
    .D(sig00000383),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_37 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000cb (
    .C(aclk),
    .D(sig00000382),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_38 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000cc (
    .C(aclk),
    .D(sig00000381),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_39 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000cd (
    .C(aclk),
    .D(sig00000380),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_40 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ce (
    .C(aclk),
    .D(sig0000037f),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_41 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000cf (
    .C(aclk),
    .D(sig0000037e),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_42 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d0 (
    .C(aclk),
    .D(sig0000037d),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_43 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d1 (
    .C(aclk),
    .D(sig0000037c),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_44 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d2 (
    .C(aclk),
    .D(sig0000037b),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_45 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d3 (
    .C(aclk),
    .D(sig0000037a),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_46 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d4 (
    .C(aclk),
    .D(sig00000379),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_47 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d5 (
    .C(aclk),
    .D(sig00000378),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_48 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d6 (
    .C(aclk),
    .D(sig00000377),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_49 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d7 (
    .C(aclk),
    .D(sig00000376),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_50 )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d8 (
    .C(aclk),
    .D(sig000003a9),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op [51])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d9 (
    .C(aclk),
    .D(sig000003b4),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000da (
    .C(aclk),
    .D(sig000003b3),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000db (
    .C(aclk),
    .D(sig000003b2),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000dc (
    .C(aclk),
    .D(sig000003b1),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000dd (
    .C(aclk),
    .D(sig000003b0),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000de (
    .C(aclk),
    .D(sig000003af),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000df (
    .C(aclk),
    .D(sig000003ae),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000e0 (
    .C(aclk),
    .D(sig000003ad),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000e1 (
    .C(aclk),
    .D(sig000003ac),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000e2 (
    .C(aclk),
    .D(sig000003ab),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000e3 (
    .C(aclk),
    .D(sig000003aa),
    .Q(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [0])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk000000e4 (
    .I0(s_axis_a_tvalid),
    .I1(s_axis_b_tvalid),
    .O(sig00000003)
  );
  LUT6 #(
    .INIT ( 64'hBB00808080008080 ))
  blk000000e5 (
    .I0(sig0000009e),
    .I1(sig00000080),
    .I2(sig00000083),
    .I3(sig0000009d),
    .I4(sig00000082),
    .I5(sig00000081),
    .O(sig00000092)
  );
  LUT6 #(
    .INIT ( 64'h153E113215141110 ))
  blk000000e6 (
    .I0(sig00000080),
    .I1(sig00000082),
    .I2(sig00000081),
    .I3(sig00000083),
    .I4(sig0000009d),
    .I5(sig0000009e),
    .O(sig00000094)
  );
  LUT3 #(
    .INIT ( 8'hF8 ))
  blk000000e7 (
    .I0(sig0000009a),
    .I1(sig00000069),
    .I2(sig00000098),
    .O(sig0000007a)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF54545554 ))
  blk000000e8 (
    .I0(sig0000009b),
    .I1(sig00000097),
    .I2(sig0000007a),
    .I3(sig00000099),
    .I4(sig00000069),
    .I5(sig0000009c),
    .O(sig0000006a)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  blk000000e9 (
    .I0(sig000000aa),
    .I1(sig0000009f),
    .I2(sig000000a0),
    .I3(sig0000007b),
    .O(sig00000090)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk000000ea (
    .I0(sig000000a0),
    .I1(sig000000aa),
    .I2(sig0000007b),
    .O(sig00000096)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  blk000000eb (
    .I0(sig00000082),
    .I1(sig00000080),
    .O(sig00000093)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ec (
    .I0(s_axis_a_tdata[52]),
    .I1(s_axis_b_tdata[52]),
    .O(sig00000084)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ed (
    .I0(s_axis_a_tdata[53]),
    .I1(s_axis_b_tdata[53]),
    .O(sig00000085)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ee (
    .I0(s_axis_a_tdata[54]),
    .I1(s_axis_b_tdata[54]),
    .O(sig00000086)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ef (
    .I0(s_axis_a_tdata[55]),
    .I1(s_axis_b_tdata[55]),
    .O(sig00000087)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f0 (
    .I0(s_axis_a_tdata[56]),
    .I1(s_axis_b_tdata[56]),
    .O(sig00000088)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f1 (
    .I0(s_axis_a_tdata[57]),
    .I1(s_axis_b_tdata[57]),
    .O(sig00000089)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f2 (
    .I0(s_axis_a_tdata[58]),
    .I1(s_axis_b_tdata[58]),
    .O(sig0000008a)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f3 (
    .I0(s_axis_a_tdata[59]),
    .I1(s_axis_b_tdata[59]),
    .O(sig0000008b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f4 (
    .I0(s_axis_a_tdata[60]),
    .I1(s_axis_b_tdata[60]),
    .O(sig0000008c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f5 (
    .I0(s_axis_a_tdata[61]),
    .I1(s_axis_b_tdata[61]),
    .O(sig0000008d)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f6 (
    .I0(s_axis_a_tdata[62]),
    .I1(s_axis_b_tdata[62]),
    .O(sig0000008e)
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  blk000000f7 (
    .I0(sig0000009f),
    .I1(sig000000aa),
    .O(sig0000008f)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk000000f8 (
    .I0(s_axis_a_tdata[42]),
    .I1(s_axis_a_tdata[43]),
    .I2(s_axis_a_tdata[44]),
    .I3(s_axis_a_tdata[45]),
    .I4(s_axis_a_tdata[46]),
    .I5(s_axis_a_tdata[47]),
    .O(sig000000b5)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk000000f9 (
    .I0(s_axis_a_tdata[36]),
    .I1(s_axis_a_tdata[37]),
    .I2(s_axis_a_tdata[38]),
    .I3(s_axis_a_tdata[39]),
    .I4(s_axis_a_tdata[40]),
    .I5(s_axis_a_tdata[41]),
    .O(sig000000b6)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk000000fa (
    .I0(s_axis_a_tdata[30]),
    .I1(s_axis_a_tdata[31]),
    .I2(s_axis_a_tdata[32]),
    .I3(s_axis_a_tdata[33]),
    .I4(s_axis_a_tdata[34]),
    .I5(s_axis_a_tdata[35]),
    .O(sig000000b7)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk000000fb (
    .I0(s_axis_a_tdata[24]),
    .I1(s_axis_a_tdata[25]),
    .I2(s_axis_a_tdata[26]),
    .I3(s_axis_a_tdata[27]),
    .I4(s_axis_a_tdata[28]),
    .I5(s_axis_a_tdata[29]),
    .O(sig000000b8)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk000000fc (
    .I0(s_axis_a_tdata[18]),
    .I1(s_axis_a_tdata[19]),
    .I2(s_axis_a_tdata[20]),
    .I3(s_axis_a_tdata[21]),
    .I4(s_axis_a_tdata[22]),
    .I5(s_axis_a_tdata[23]),
    .O(sig000000b9)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk000000fd (
    .I0(s_axis_a_tdata[12]),
    .I1(s_axis_a_tdata[13]),
    .I2(s_axis_a_tdata[14]),
    .I3(s_axis_a_tdata[15]),
    .I4(s_axis_a_tdata[16]),
    .I5(s_axis_a_tdata[17]),
    .O(sig000000ba)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk000000fe (
    .I0(s_axis_a_tdata[6]),
    .I1(s_axis_a_tdata[7]),
    .I2(s_axis_a_tdata[8]),
    .I3(s_axis_a_tdata[9]),
    .I4(s_axis_a_tdata[10]),
    .I5(s_axis_a_tdata[11]),
    .O(sig000000bb)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk000000ff (
    .I0(s_axis_a_tdata[0]),
    .I1(s_axis_a_tdata[1]),
    .I2(s_axis_a_tdata[2]),
    .I3(s_axis_a_tdata[3]),
    .I4(s_axis_a_tdata[4]),
    .I5(s_axis_a_tdata[5]),
    .O(sig000000bc)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000100 (
    .I0(s_axis_a_tdata[48]),
    .I1(s_axis_a_tdata[49]),
    .I2(s_axis_a_tdata[50]),
    .I3(s_axis_a_tdata[51]),
    .O(sig000000bd)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000101 (
    .I0(s_axis_b_tdata[42]),
    .I1(s_axis_b_tdata[43]),
    .I2(s_axis_b_tdata[44]),
    .I3(s_axis_b_tdata[45]),
    .I4(s_axis_b_tdata[46]),
    .I5(s_axis_b_tdata[47]),
    .O(sig000000be)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000102 (
    .I0(s_axis_b_tdata[36]),
    .I1(s_axis_b_tdata[37]),
    .I2(s_axis_b_tdata[38]),
    .I3(s_axis_b_tdata[39]),
    .I4(s_axis_b_tdata[40]),
    .I5(s_axis_b_tdata[41]),
    .O(sig000000bf)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000103 (
    .I0(s_axis_b_tdata[30]),
    .I1(s_axis_b_tdata[31]),
    .I2(s_axis_b_tdata[32]),
    .I3(s_axis_b_tdata[33]),
    .I4(s_axis_b_tdata[34]),
    .I5(s_axis_b_tdata[35]),
    .O(sig000000c0)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000104 (
    .I0(s_axis_b_tdata[24]),
    .I1(s_axis_b_tdata[25]),
    .I2(s_axis_b_tdata[26]),
    .I3(s_axis_b_tdata[27]),
    .I4(s_axis_b_tdata[28]),
    .I5(s_axis_b_tdata[29]),
    .O(sig000000c1)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000105 (
    .I0(s_axis_b_tdata[18]),
    .I1(s_axis_b_tdata[19]),
    .I2(s_axis_b_tdata[20]),
    .I3(s_axis_b_tdata[21]),
    .I4(s_axis_b_tdata[22]),
    .I5(s_axis_b_tdata[23]),
    .O(sig000000c2)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000106 (
    .I0(s_axis_b_tdata[12]),
    .I1(s_axis_b_tdata[13]),
    .I2(s_axis_b_tdata[14]),
    .I3(s_axis_b_tdata[15]),
    .I4(s_axis_b_tdata[16]),
    .I5(s_axis_b_tdata[17]),
    .O(sig000000c3)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000107 (
    .I0(s_axis_b_tdata[6]),
    .I1(s_axis_b_tdata[7]),
    .I2(s_axis_b_tdata[8]),
    .I3(s_axis_b_tdata[9]),
    .I4(s_axis_b_tdata[10]),
    .I5(s_axis_b_tdata[11]),
    .O(sig000000c4)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000108 (
    .I0(s_axis_b_tdata[0]),
    .I1(s_axis_b_tdata[1]),
    .I2(s_axis_b_tdata[2]),
    .I3(s_axis_b_tdata[3]),
    .I4(s_axis_b_tdata[4]),
    .I5(s_axis_b_tdata[5]),
    .O(sig000000c5)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000109 (
    .I0(s_axis_b_tdata[48]),
    .I1(s_axis_b_tdata[49]),
    .I2(s_axis_b_tdata[50]),
    .I3(s_axis_b_tdata[51]),
    .O(sig000000c6)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk0000010a (
    .I0(sig00000269),
    .I1(sig000001ba),
    .O(sig000000db)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk0000010b (
    .I0(sig0000026a),
    .I1(sig000002dd),
    .O(sig000000dc)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk0000010c (
    .I0(sig00000069),
    .I1(sig00000063),
    .I2(sig00000062),
    .O(sig00000346)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk0000010d (
    .I0(sig00000069),
    .I1(sig00000064),
    .I2(sig00000063),
    .O(sig00000347)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk0000010e (
    .I0(sig00000069),
    .I1(sig00000065),
    .I2(sig00000064),
    .O(sig00000348)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk0000010f (
    .I0(sig00000069),
    .I1(sig00000066),
    .I2(sig00000065),
    .O(sig00000349)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk00000110 (
    .I0(sig00000069),
    .I1(sig00000067),
    .I2(sig00000066),
    .O(sig0000034a)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk00000111 (
    .I0(sig00000069),
    .I1(sig00000068),
    .I2(sig00000067),
    .O(sig0000034b)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  blk00000112 (
    .I0(sig00000069),
    .I1(sig00000068),
    .O(sig0000034c)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk00000113 (
    .I0(sig00000062),
    .I1(sig00000069),
    .O(sig00000345)
  );
  LUT5 #(
    .INIT ( 32'h04FF0FCF ))
  blk00000114 (
    .I0(sig00000035),
    .I1(sig00000032),
    .I2(sig00000033),
    .I3(sig00000034),
    .I4(sig00000069),
    .O(sig00000374)
  );
  LUT3 #(
    .INIT ( 8'hEF ))
  blk00000115 (
    .I0(sig00000034),
    .I1(sig00000033),
    .I2(sig00000032),
    .O(sig00000375)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000116 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000005),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_49 ),
    .O(sig00000377)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000117 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000006),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_48 ),
    .O(sig00000378)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000118 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000004),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_50 ),
    .O(sig00000376)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000119 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000008),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_46 ),
    .O(sig0000037a)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000011a (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000009),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_45 ),
    .O(sig0000037b)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000011b (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000007),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_47 ),
    .O(sig00000379)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000011c (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig0000000b),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_43 ),
    .O(sig0000037d)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000011d (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig0000000c),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_42 ),
    .O(sig0000037e)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000011e (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig0000000a),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_44 ),
    .O(sig0000037c)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000011f (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig0000000e),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_40 ),
    .O(sig00000380)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000120 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig0000000f),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_39 ),
    .O(sig00000381)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000121 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig0000000d),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_41 ),
    .O(sig0000037f)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000122 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000012),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_36 ),
    .O(sig00000384)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000123 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000010),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_38 ),
    .O(sig00000382)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000124 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000011),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_37 ),
    .O(sig00000383)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000125 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000014),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_34 ),
    .O(sig00000386)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000126 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000015),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_33 ),
    .O(sig00000387)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000127 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000013),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_35 ),
    .O(sig00000385)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000128 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000017),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_31 ),
    .O(sig00000389)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000129 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000018),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_30 ),
    .O(sig0000038a)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000012a (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000016),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_32 ),
    .O(sig00000388)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000012b (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig0000001b),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_27 ),
    .O(sig0000038d)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000012c (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000019),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_29 ),
    .O(sig0000038b)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000012d (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig0000001a),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_28 ),
    .O(sig0000038c)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000012e (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig0000001d),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_25 ),
    .O(sig0000038f)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000012f (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig0000001e),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_24 ),
    .O(sig00000390)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000130 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig0000001c),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_26 ),
    .O(sig0000038e)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000131 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000020),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_22 ),
    .O(sig00000392)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000132 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000021),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_21 ),
    .O(sig00000393)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000133 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig0000001f),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_23 ),
    .O(sig00000391)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000134 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000024),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_18 ),
    .O(sig00000396)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000135 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000022),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_20 ),
    .O(sig00000394)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000136 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000023),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_19 ),
    .O(sig00000395)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000137 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000026),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_16 ),
    .O(sig00000398)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000138 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000027),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_15 ),
    .O(sig00000399)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000139 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000025),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_17 ),
    .O(sig00000397)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000013a (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000029),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_13 ),
    .O(sig0000039b)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000013b (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig0000002a),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_12 ),
    .O(sig0000039c)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000013c (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000028),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_14 ),
    .O(sig0000039a)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000013d (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig0000002d),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_9 ),
    .O(sig0000039f)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000013e (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig0000002b),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_11 ),
    .O(sig0000039d)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000013f (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig0000002c),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_10 ),
    .O(sig0000039e)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000140 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig0000002f),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_7 ),
    .O(sig000003a1)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000141 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000030),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_6 ),
    .O(sig000003a2)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000142 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig0000002e),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_8 ),
    .O(sig000003a0)
  );
  LUT6 #(
    .INIT ( 64'h7775575522200200 ))
  blk00000143 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000371),
    .I3(sig00000360),
    .I4(sig0000034f),
    .I5(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_4 ),
    .O(sig000003a4)
  );
  LUT6 #(
    .INIT ( 64'h7775575522200200 ))
  blk00000144 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000371),
    .I3(sig00000361),
    .I4(sig00000350),
    .I5(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_3 ),
    .O(sig000003a5)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000145 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000031),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_5 ),
    .O(sig000003a3)
  );
  LUT6 #(
    .INIT ( 64'h7775575522200200 ))
  blk00000146 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000371),
    .I3(sig00000364),
    .I4(sig00000353),
    .I5(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_0 ),
    .O(sig000003a8)
  );
  LUT6 #(
    .INIT ( 64'h7775575522200200 ))
  blk00000147 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000371),
    .I3(sig00000362),
    .I4(sig00000351),
    .I5(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_2 ),
    .O(sig000003a6)
  );
  LUT6 #(
    .INIT ( 64'h7775575522200200 ))
  blk00000148 (
    .I0(aclken),
    .I1(sig0000006b),
    .I2(sig00000371),
    .I3(sig00000363),
    .I4(sig00000352),
    .I5(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op_sliced_1 ),
    .O(sig000003a7)
  );
  LUT3 #(
    .INIT ( 8'hA2 ))
  blk00000149 (
    .I0(sig00000082),
    .I1(sig0000009d),
    .I2(sig00000081),
    .O(sig000003b5)
  );
  LUT6 #(
    .INIT ( 64'h0004040000555500 ))
  blk0000014a (
    .I0(sig000003b5),
    .I1(sig0000009e),
    .I2(sig00000083),
    .I3(s_axis_b_tdata[63]),
    .I4(s_axis_a_tdata[63]),
    .I5(sig00000080),
    .O(sig00000095)
  );
  LUT6 #(
    .INIT ( 64'h2222000222222022 ))
  blk0000014b (
    .I0(sig0000006a),
    .I1(sig0000009b),
    .I2(sig00000097),
    .I3(sig000003b6),
    .I4(sig0000009c),
    .I5(sig00000099),
    .O(sig0000006c)
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  blk0000014c (
    .I0(sig000000a5),
    .I1(sig000000a4),
    .I2(sig000000a3),
    .I3(sig000000a2),
    .I4(sig000000a1),
    .O(sig000003b7)
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  blk0000014d (
    .I0(sig0000009f),
    .I1(sig000000a9),
    .I2(sig000000a8),
    .I3(sig000000a7),
    .I4(sig000000a6),
    .I5(sig000003b7),
    .O(sig0000007b)
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  blk0000014e (
    .I0(s_axis_a_tdata[57]),
    .I1(s_axis_a_tdata[56]),
    .I2(s_axis_a_tdata[55]),
    .I3(s_axis_a_tdata[54]),
    .I4(s_axis_a_tdata[53]),
    .I5(s_axis_a_tdata[52]),
    .O(sig000003b8)
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  blk0000014f (
    .I0(s_axis_a_tdata[62]),
    .I1(s_axis_a_tdata[61]),
    .I2(s_axis_a_tdata[60]),
    .I3(s_axis_a_tdata[59]),
    .I4(s_axis_a_tdata[58]),
    .I5(sig000003b8),
    .O(sig00000080)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  blk00000150 (
    .I0(s_axis_a_tdata[57]),
    .I1(s_axis_a_tdata[56]),
    .I2(s_axis_a_tdata[55]),
    .I3(s_axis_a_tdata[54]),
    .I4(s_axis_a_tdata[53]),
    .I5(s_axis_a_tdata[52]),
    .O(sig000003b9)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000151 (
    .I0(s_axis_a_tdata[62]),
    .I1(s_axis_a_tdata[61]),
    .I2(s_axis_a_tdata[60]),
    .I3(s_axis_a_tdata[59]),
    .I4(s_axis_a_tdata[58]),
    .I5(sig000003b9),
    .O(sig00000081)
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  blk00000152 (
    .I0(s_axis_b_tdata[57]),
    .I1(s_axis_b_tdata[56]),
    .I2(s_axis_b_tdata[55]),
    .I3(s_axis_b_tdata[54]),
    .I4(s_axis_b_tdata[53]),
    .I5(s_axis_b_tdata[52]),
    .O(sig000003ba)
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  blk00000153 (
    .I0(s_axis_b_tdata[62]),
    .I1(s_axis_b_tdata[61]),
    .I2(s_axis_b_tdata[60]),
    .I3(s_axis_b_tdata[59]),
    .I4(s_axis_b_tdata[58]),
    .I5(sig000003ba),
    .O(sig00000082)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  blk00000154 (
    .I0(s_axis_b_tdata[57]),
    .I1(s_axis_b_tdata[56]),
    .I2(s_axis_b_tdata[55]),
    .I3(s_axis_b_tdata[54]),
    .I4(s_axis_b_tdata[53]),
    .I5(s_axis_b_tdata[52]),
    .O(sig000003bb)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000155 (
    .I0(s_axis_b_tdata[62]),
    .I1(s_axis_b_tdata[61]),
    .I2(s_axis_b_tdata[60]),
    .I3(s_axis_b_tdata[59]),
    .I4(s_axis_b_tdata[58]),
    .I5(sig000003bb),
    .O(sig00000083)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000156 (
    .I0(sig000000a1),
    .I1(sig0000009f),
    .I2(sig000000a2),
    .I3(sig000000a3),
    .I4(sig000000a4),
    .I5(sig000000a5),
    .O(sig000003bc)
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  blk00000157 (
    .I0(sig000000a7),
    .I1(sig000000a6),
    .O(sig000003bd)
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  blk00000158 (
    .I0(sig000003bc),
    .I1(sig000000aa),
    .I2(sig000000a0),
    .I3(sig000000a8),
    .I4(sig000003bd),
    .I5(sig000000a9),
    .O(sig00000091)
  );
  LUT4 #(
    .INIT ( 16'hFBEA ))
  blk00000159 (
    .I0(sig000003c9),
    .I1(sig00000371),
    .I2(sig00000356),
    .I3(sig00000367),
    .O(sig000003be)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000015a (
    .I0(aclken),
    .I1(sig0000006c),
    .I2(sig000003be),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [1]),
    .O(sig000003ab)
  );
  LUT4 #(
    .INIT ( 16'hFBEA ))
  blk0000015b (
    .I0(sig000003c9),
    .I1(sig00000371),
    .I2(sig00000358),
    .I3(sig00000369),
    .O(sig000003bf)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000015c (
    .I0(aclken),
    .I1(sig0000006c),
    .I2(sig000003bf),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [3]),
    .O(sig000003ad)
  );
  LUT4 #(
    .INIT ( 16'hFBEA ))
  blk0000015d (
    .I0(sig000003c9),
    .I1(sig00000371),
    .I2(sig00000359),
    .I3(sig0000036a),
    .O(sig000003c0)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000015e (
    .I0(aclken),
    .I1(sig0000006c),
    .I2(sig000003c0),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [4]),
    .O(sig000003ae)
  );
  LUT4 #(
    .INIT ( 16'hFBEA ))
  blk0000015f (
    .I0(sig000003c9),
    .I1(sig00000371),
    .I2(sig00000357),
    .I3(sig00000368),
    .O(sig000003c1)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000160 (
    .I0(aclken),
    .I1(sig0000006c),
    .I2(sig000003c1),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [2]),
    .O(sig000003ac)
  );
  LUT4 #(
    .INIT ( 16'hFBEA ))
  blk00000161 (
    .I0(sig000003c9),
    .I1(sig00000371),
    .I2(sig0000035b),
    .I3(sig0000036c),
    .O(sig000003c2)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000162 (
    .I0(aclken),
    .I1(sig0000006c),
    .I2(sig000003c2),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [6]),
    .O(sig000003b0)
  );
  LUT4 #(
    .INIT ( 16'hFBEA ))
  blk00000163 (
    .I0(sig000003c9),
    .I1(sig00000371),
    .I2(sig0000035c),
    .I3(sig0000036d),
    .O(sig000003c3)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000164 (
    .I0(aclken),
    .I1(sig0000006c),
    .I2(sig000003c3),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [7]),
    .O(sig000003b1)
  );
  LUT4 #(
    .INIT ( 16'hFBEA ))
  blk00000165 (
    .I0(sig000003c9),
    .I1(sig00000371),
    .I2(sig0000035e),
    .I3(sig0000036f),
    .O(sig000003c4)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000166 (
    .I0(aclken),
    .I1(sig0000006c),
    .I2(sig000003c4),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [9]),
    .O(sig000003b3)
  );
  LUT4 #(
    .INIT ( 16'hFBEA ))
  blk00000167 (
    .I0(sig000003c9),
    .I1(sig00000371),
    .I2(sig0000035f),
    .I3(sig00000370),
    .O(sig000003c5)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk00000168 (
    .I0(aclken),
    .I1(sig0000006c),
    .I2(sig000003c5),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [10]),
    .O(sig000003b4)
  );
  LUT4 #(
    .INIT ( 16'hFBEA ))
  blk00000169 (
    .I0(sig000003c9),
    .I1(sig00000371),
    .I2(sig0000035a),
    .I3(sig0000036b),
    .O(sig000003c6)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000016a (
    .I0(aclken),
    .I1(sig0000006c),
    .I2(sig000003c6),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [5]),
    .O(sig000003af)
  );
  LUT4 #(
    .INIT ( 16'hFBEA ))
  blk0000016b (
    .I0(sig000003c9),
    .I1(sig00000371),
    .I2(sig0000035d),
    .I3(sig0000036e),
    .O(sig000003c7)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000016c (
    .I0(aclken),
    .I1(sig0000006c),
    .I2(sig000003c7),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [8]),
    .O(sig000003b2)
  );
  LUT4 #(
    .INIT ( 16'hFBEA ))
  blk0000016d (
    .I0(sig000003c9),
    .I1(sig00000371),
    .I2(sig00000355),
    .I3(sig00000366),
    .O(sig000003c8)
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  blk0000016e (
    .I0(aclken),
    .I1(sig0000006c),
    .I2(sig000003c8),
    .I3(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/exp_op [0]),
    .O(sig000003aa)
  );
  LUT6 #(
    .INIT ( 64'h0A0A08080A080A08 ))
  blk0000016f (
    .I0(aclken),
    .I1(sig000003c9),
    .I2(sig0000006a),
    .I3(sig00000365),
    .I4(sig00000354),
    .I5(sig00000371),
    .O(sig000003ca)
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  blk00000170 (
    .I0(aclken),
    .I1(\NlwRenamedSig_OI_U0/i_synth/MULT.OP/OP/mant_op [51]),
    .I2(sig000003ca),
    .O(sig000003a9)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk00000171 (
    .I0(sig00000069),
    .I1(sig00000063),
    .I2(sig00000062),
    .O(sig000003cb)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk00000172 (
    .I0(sig00000069),
    .I1(sig00000064),
    .I2(sig00000063),
    .O(sig000003cc)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk00000173 (
    .I0(sig00000069),
    .I1(sig00000065),
    .I2(sig00000064),
    .O(sig000003cd)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk00000174 (
    .I0(sig00000069),
    .I1(sig00000066),
    .I2(sig00000065),
    .O(sig000003ce)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk00000175 (
    .I0(sig00000069),
    .I1(sig00000067),
    .I2(sig00000066),
    .O(sig000003cf)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk00000176 (
    .I0(sig00000069),
    .I1(sig00000068),
    .I2(sig00000067),
    .O(sig000003d0)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  blk00000177 (
    .I0(sig00000069),
    .I1(sig00000068),
    .O(sig000003d1)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000178 (
    .I0(sig0000006d),
    .O(sig000003d3)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000179 (
    .I0(sig0000006e),
    .O(sig000003d4)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000017a (
    .I0(sig0000006f),
    .O(sig000003d5)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000017b (
    .I0(sig00000070),
    .O(sig000003d6)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000017c (
    .I0(sig00000071),
    .O(sig000003d7)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000017d (
    .I0(sig00000072),
    .O(sig000003d8)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000017e (
    .I0(sig00000073),
    .O(sig000003d9)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000017f (
    .I0(sig00000074),
    .O(sig000003da)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000180 (
    .I0(sig00000075),
    .O(sig000003db)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000181 (
    .I0(sig00000076),
    .O(sig000003dc)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000182 (
    .I0(sig0000006d),
    .O(sig000003dd)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000183 (
    .I0(sig0000006e),
    .O(sig000003de)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000184 (
    .I0(sig0000006f),
    .O(sig000003df)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000185 (
    .I0(sig00000070),
    .O(sig000003e0)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000186 (
    .I0(sig00000071),
    .O(sig000003e1)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000187 (
    .I0(sig00000072),
    .O(sig000003e2)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000188 (
    .I0(sig00000073),
    .O(sig000003e3)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000189 (
    .I0(sig00000074),
    .O(sig000003e4)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000018a (
    .I0(sig00000075),
    .O(sig000003e5)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000018b (
    .I0(sig00000076),
    .O(sig000003e6)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFEEFE ))
  blk0000018c (
    .I0(sig0000007a),
    .I1(sig0000009b),
    .I2(sig00000099),
    .I3(sig00000069),
    .I4(sig00000097),
    .I5(sig0000009c),
    .O(sig0000006b)
  );
  LUT4 #(
    .INIT ( 16'hFBEA ))
  blk0000018d (
    .I0(sig00000098),
    .I1(sig00000069),
    .I2(sig0000009a),
    .I3(sig00000099),
    .O(sig000003b6)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF11101010 ))
  blk0000018e (
    .I0(sig00000097),
    .I1(sig0000009c),
    .I2(sig00000098),
    .I3(sig0000009a),
    .I4(sig00000069),
    .I5(sig0000009b),
    .O(sig000003c9)
  );
  INV   blk0000018f (
    .I(sig00000069),
    .O(sig00000078)
  );
  INV   blk00000190 (
    .I(sig00000069),
    .O(sig0000034d)
  );
  INV   blk00000191 (
    .I(sig00000077),
    .O(sig0000034e)
  );
  INV   blk00000192 (
    .I(sig00000069),
    .O(sig000003d2)
  );
  INV   blk00000193 (
    .I(sig00000077),
    .O(sig000003e7)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000194 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(aclken),
    .CLK(aclk),
    .D(sig00000079),
    .Q(sig000003e8),
    .Q15(NLW_blk00000194_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000195 (
    .C(aclk),
    .CE(aclken),
    .D(sig000003e8),
    .Q(\U0/i_synth/i_nd_to_rdy/opt_has_pipe.pipe_3 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000196 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(aclken),
    .CLK(aclk),
    .D(sig000000aa),
    .Q(sig000003e9),
    .Q15(NLW_blk00000196_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000197 (
    .C(aclk),
    .CE(aclken),
    .D(sig000003e9),
    .Q(sig00000077)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000198 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(aclken),
    .CLK(aclk),
    .D(sig000000a9),
    .Q(sig000003ea),
    .Q15(NLW_blk00000198_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000199 (
    .C(aclk),
    .CE(aclken),
    .D(sig000003ea),
    .Q(sig00000076)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk0000019a (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(aclken),
    .CLK(aclk),
    .D(sig000000a8),
    .Q(sig000003eb),
    .Q15(NLW_blk0000019a_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000019b (
    .C(aclk),
    .CE(aclken),
    .D(sig000003eb),
    .Q(sig00000075)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk0000019c (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(aclken),
    .CLK(aclk),
    .D(sig000000a5),
    .Q(sig000003ec),
    .Q15(NLW_blk0000019c_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000019d (
    .C(aclk),
    .CE(aclken),
    .D(sig000003ec),
    .Q(sig00000072)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk0000019e (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(aclken),
    .CLK(aclk),
    .D(sig000000a7),
    .Q(sig000003ed),
    .Q15(NLW_blk0000019e_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000019f (
    .C(aclk),
    .CE(aclken),
    .D(sig000003ed),
    .Q(sig00000074)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001a0 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(aclken),
    .CLK(aclk),
    .D(sig000000a6),
    .Q(sig000003ee),
    .Q15(NLW_blk000001a0_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001a1 (
    .C(aclk),
    .CE(aclken),
    .D(sig000003ee),
    .Q(sig00000073)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001a2 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(aclken),
    .CLK(aclk),
    .D(sig000000a2),
    .Q(sig000003ef),
    .Q15(NLW_blk000001a2_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001a3 (
    .C(aclk),
    .CE(aclken),
    .D(sig000003ef),
    .Q(sig0000006f)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001a4 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(aclken),
    .CLK(aclk),
    .D(sig000000a4),
    .Q(sig000003f0),
    .Q15(NLW_blk000001a4_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001a5 (
    .C(aclk),
    .CE(aclken),
    .D(sig000003f0),
    .Q(sig00000071)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001a6 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(aclken),
    .CLK(aclk),
    .D(sig000000a3),
    .Q(sig000003f1),
    .Q15(NLW_blk000001a6_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001a7 (
    .C(aclk),
    .CE(aclken),
    .D(sig000003f1),
    .Q(sig00000070)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001a8 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(aclken),
    .CLK(aclk),
    .D(sig0000007d),
    .Q(sig000003f2),
    .Q15(NLW_blk000001a8_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001a9 (
    .C(aclk),
    .CE(aclken),
    .D(sig000003f2),
    .Q(\U0/i_synth/MULT.OP/OP/sign_op )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001aa (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(aclken),
    .CLK(aclk),
    .D(sig000000a1),
    .Q(sig000003f3),
    .Q15(NLW_blk000001aa_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001ab (
    .C(aclk),
    .CE(aclken),
    .D(sig000003f3),
    .Q(sig0000006e)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001ac (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(aclken),
    .CLK(aclk),
    .D(sig000000a0),
    .Q(sig000003f4),
    .Q15(NLW_blk000001ac_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001ad (
    .C(aclk),
    .CE(aclken),
    .D(sig000003f4),
    .Q(sig0000006d)
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
