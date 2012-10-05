////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.28xd
//  \   \         Application: netgen
//  /   /         Filename: distance_squared_ap_dcmp_1_no_dsp.v
// /___/   /\     Timestamp: Fri Oct 05 14:36:05 2012
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog D:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/FPGA/AutoESL/NO_BLOCKING/solution1/impl/pcores/distance_squared_top_v1_00_a/data/__coregen_tmp__/tmp/_cg/distance_squared_ap_dcmp_1_no_dsp.ngc D:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/FPGA/AutoESL/NO_BLOCKING/solution1/impl/pcores/distance_squared_top_v1_00_a/data/__coregen_tmp__/tmp/_cg/distance_squared_ap_dcmp_1_no_dsp.v 
// Device	: 7z020clg484-1
// Input file	: D:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/FPGA/AutoESL/NO_BLOCKING/solution1/impl/pcores/distance_squared_top_v1_00_a/data/__coregen_tmp__/tmp/_cg/distance_squared_ap_dcmp_1_no_dsp.ngc
// Output file	: D:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/FPGA/AutoESL/NO_BLOCKING/solution1/impl/pcores/distance_squared_top_v1_00_a/data/__coregen_tmp__/tmp/_cg/distance_squared_ap_dcmp_1_no_dsp.v
// # of Modules	: 1
// Design Name	: distance_squared_ap_dcmp_1_no_dsp
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

module distance_squared_ap_dcmp_1_no_dsp (
  aclk, aclken, s_axis_a_tvalid, s_axis_b_tvalid, s_axis_operation_tvalid, m_axis_result_tvalid, s_axis_a_tdata, s_axis_b_tdata, 
s_axis_operation_tdata, m_axis_result_tdata
)/* synthesis syn_black_box syn_noprune=1 */;
  input aclk;
  input aclken;
  input s_axis_a_tvalid;
  input s_axis_b_tvalid;
  input s_axis_operation_tvalid;
  output m_axis_result_tvalid;
  input [63 : 0] s_axis_a_tdata;
  input [63 : 0] s_axis_b_tdata;
  input [7 : 0] s_axis_operation_tdata;
  output [7 : 0] m_axis_result_tdata;
  
  // synthesis translate_off
  
  wire \U0/i_synth/i_nd_to_rdy/opt_has_pipe.first_q ;
  wire sig00000001;
  wire sig00000002;
  wire \U0/i_synth/result_ud ;
  wire sig00000003;
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
  wire [1 : 1] NlwRenamedSig_OI_m_axis_result_tdata;
  assign
    m_axis_result_tdata[7] = NlwRenamedSig_OI_m_axis_result_tdata[1],
    m_axis_result_tdata[6] = NlwRenamedSig_OI_m_axis_result_tdata[1],
    m_axis_result_tdata[5] = NlwRenamedSig_OI_m_axis_result_tdata[1],
    m_axis_result_tdata[4] = NlwRenamedSig_OI_m_axis_result_tdata[1],
    m_axis_result_tdata[3] = NlwRenamedSig_OI_m_axis_result_tdata[1],
    m_axis_result_tdata[2] = NlwRenamedSig_OI_m_axis_result_tdata[1],
    m_axis_result_tdata[1] = NlwRenamedSig_OI_m_axis_result_tdata[1],
    m_axis_result_tdata[0] = \U0/i_synth/result_ud ,
    m_axis_result_tvalid = \U0/i_synth/i_nd_to_rdy/opt_has_pipe.first_q ;
  VCC   blk00000001 (
    .P(sig00000001)
  );
  GND   blk00000002 (
    .G(NlwRenamedSig_OI_m_axis_result_tdata[1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000003 (
    .C(aclk),
    .CE(aclken),
    .D(sig00000002),
    .Q(\U0/i_synth/i_nd_to_rdy/opt_has_pipe.first_q )
  );
  MUXCY   blk00000004 (
    .CI(sig0000000d),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000008),
    .O(sig00000003)
  );
  MUXCY   blk00000005 (
    .CI(sig00000003),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000007),
    .O(sig0000000c)
  );
  MUXCY   blk00000006 (
    .CI(sig0000000f),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000006),
    .O(sig00000004)
  );
  MUXCY   blk00000007 (
    .CI(sig00000004),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000005),
    .O(sig0000000e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000008 (
    .C(aclk),
    .CE(aclken),
    .D(sig00000009),
    .Q(\U0/i_synth/result_ud )
  );
  MUXCY   blk00000009 (
    .CI(sig00000028),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000012),
    .O(sig00000011)
  );
  MUXCY   blk0000000a (
    .CI(sig00000029),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000013),
    .O(sig00000028)
  );
  MUXCY   blk0000000b (
    .CI(sig0000002a),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000014),
    .O(sig00000029)
  );
  MUXCY   blk0000000c (
    .CI(sig0000002b),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000015),
    .O(sig0000002a)
  );
  MUXCY   blk0000000d (
    .CI(sig0000002c),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000016),
    .O(sig0000002b)
  );
  MUXCY   blk0000000e (
    .CI(sig0000002d),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000017),
    .O(sig0000002c)
  );
  MUXCY   blk0000000f (
    .CI(sig0000002e),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000018),
    .O(sig0000002d)
  );
  MUXCY   blk00000010 (
    .CI(sig0000002f),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000019),
    .O(sig0000002e)
  );
  MUXCY   blk00000011 (
    .CI(sig00000030),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig0000001a),
    .O(sig0000002f)
  );
  MUXCY   blk00000012 (
    .CI(sig00000031),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig0000001b),
    .O(sig00000030)
  );
  MUXCY   blk00000013 (
    .CI(sig00000032),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig0000001c),
    .O(sig00000031)
  );
  MUXCY   blk00000014 (
    .CI(sig00000033),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig0000001d),
    .O(sig00000032)
  );
  MUXCY   blk00000015 (
    .CI(sig00000034),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig0000001e),
    .O(sig00000033)
  );
  MUXCY   blk00000016 (
    .CI(sig00000035),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig0000001f),
    .O(sig00000034)
  );
  MUXCY   blk00000017 (
    .CI(sig00000036),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000020),
    .O(sig00000035)
  );
  MUXCY   blk00000018 (
    .CI(sig00000037),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000021),
    .O(sig00000036)
  );
  MUXCY   blk00000019 (
    .CI(sig00000038),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000022),
    .O(sig00000037)
  );
  MUXCY   blk0000001a (
    .CI(sig00000039),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000023),
    .O(sig00000038)
  );
  MUXCY   blk0000001b (
    .CI(sig0000003a),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000024),
    .O(sig00000039)
  );
  MUXCY   blk0000001c (
    .CI(sig0000003b),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000025),
    .O(sig0000003a)
  );
  MUXCY   blk0000001d (
    .CI(sig0000003c),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000026),
    .O(sig0000003b)
  );
  MUXCY   blk0000001e (
    .CI(sig00000001),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000027),
    .O(sig0000003c)
  );
  MUXCY   blk0000001f (
    .CI(sig00000001),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000042),
    .O(sig0000003d)
  );
  MUXCY   blk00000020 (
    .CI(sig0000003d),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000041),
    .O(sig0000003e)
  );
  MUXCY   blk00000021 (
    .CI(sig0000003e),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000040),
    .O(sig0000003f)
  );
  MUXCY   blk00000022 (
    .CI(sig0000003f),
    .DI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .S(sig00000043),
    .O(sig00000010)
  );
  MUXCY   blk00000023 (
    .CI(sig00000056),
    .DI(sig00000001),
    .S(sig00000055),
    .O(sig0000000f)
  );
  MUXCY   blk00000024 (
    .CI(sig00000057),
    .DI(sig00000001),
    .S(sig0000004d),
    .O(sig00000056)
  );
  MUXCY   blk00000025 (
    .CI(sig00000058),
    .DI(sig00000001),
    .S(sig0000004e),
    .O(sig00000057)
  );
  MUXCY   blk00000026 (
    .CI(sig00000059),
    .DI(sig00000001),
    .S(sig0000004f),
    .O(sig00000058)
  );
  MUXCY   blk00000027 (
    .CI(sig0000005a),
    .DI(sig00000001),
    .S(sig00000050),
    .O(sig00000059)
  );
  MUXCY   blk00000028 (
    .CI(sig0000005b),
    .DI(sig00000001),
    .S(sig00000051),
    .O(sig0000005a)
  );
  MUXCY   blk00000029 (
    .CI(sig0000005c),
    .DI(sig00000001),
    .S(sig00000052),
    .O(sig0000005b)
  );
  MUXCY   blk0000002a (
    .CI(sig0000005d),
    .DI(sig00000001),
    .S(sig00000053),
    .O(sig0000005c)
  );
  MUXCY   blk0000002b (
    .CI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .DI(sig00000001),
    .S(sig00000054),
    .O(sig0000005d)
  );
  MUXCY   blk0000002c (
    .CI(sig0000005e),
    .DI(sig00000001),
    .S(sig0000004c),
    .O(sig0000000d)
  );
  MUXCY   blk0000002d (
    .CI(sig0000005f),
    .DI(sig00000001),
    .S(sig00000044),
    .O(sig0000005e)
  );
  MUXCY   blk0000002e (
    .CI(sig00000060),
    .DI(sig00000001),
    .S(sig00000045),
    .O(sig0000005f)
  );
  MUXCY   blk0000002f (
    .CI(sig00000061),
    .DI(sig00000001),
    .S(sig00000046),
    .O(sig00000060)
  );
  MUXCY   blk00000030 (
    .CI(sig00000062),
    .DI(sig00000001),
    .S(sig00000047),
    .O(sig00000061)
  );
  MUXCY   blk00000031 (
    .CI(sig00000063),
    .DI(sig00000001),
    .S(sig00000048),
    .O(sig00000062)
  );
  MUXCY   blk00000032 (
    .CI(sig00000064),
    .DI(sig00000001),
    .S(sig00000049),
    .O(sig00000063)
  );
  MUXCY   blk00000033 (
    .CI(sig00000065),
    .DI(sig00000001),
    .S(sig0000004a),
    .O(sig00000064)
  );
  MUXCY   blk00000034 (
    .CI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .DI(sig00000001),
    .S(sig0000004b),
    .O(sig00000065)
  );
  MUXCY   blk00000035 (
    .CI(sig000000a6),
    .DI(sig00000066),
    .S(sig00000067),
    .O(sig0000000b)
  );
  MUXCY   blk00000036 (
    .CI(sig000000a7),
    .DI(sig00000068),
    .S(sig00000069),
    .O(sig000000a6)
  );
  MUXCY   blk00000037 (
    .CI(sig000000a8),
    .DI(sig0000006a),
    .S(sig0000006b),
    .O(sig000000a7)
  );
  MUXCY   blk00000038 (
    .CI(sig000000a9),
    .DI(sig0000006c),
    .S(sig0000006d),
    .O(sig000000a8)
  );
  MUXCY   blk00000039 (
    .CI(sig000000aa),
    .DI(sig0000006e),
    .S(sig0000006f),
    .O(sig000000a9)
  );
  MUXCY   blk0000003a (
    .CI(sig000000ab),
    .DI(sig00000070),
    .S(sig00000071),
    .O(sig000000aa)
  );
  MUXCY   blk0000003b (
    .CI(sig000000ac),
    .DI(sig00000072),
    .S(sig00000073),
    .O(sig000000ab)
  );
  MUXCY   blk0000003c (
    .CI(sig000000ad),
    .DI(sig00000074),
    .S(sig00000075),
    .O(sig000000ac)
  );
  MUXCY   blk0000003d (
    .CI(sig000000ae),
    .DI(sig00000076),
    .S(sig00000077),
    .O(sig000000ad)
  );
  MUXCY   blk0000003e (
    .CI(sig000000af),
    .DI(sig00000078),
    .S(sig00000079),
    .O(sig000000ae)
  );
  MUXCY   blk0000003f (
    .CI(sig000000b0),
    .DI(sig0000007a),
    .S(sig0000007b),
    .O(sig000000af)
  );
  MUXCY   blk00000040 (
    .CI(sig000000b1),
    .DI(sig0000007c),
    .S(sig0000007d),
    .O(sig000000b0)
  );
  MUXCY   blk00000041 (
    .CI(sig000000b2),
    .DI(sig0000007e),
    .S(sig0000007f),
    .O(sig000000b1)
  );
  MUXCY   blk00000042 (
    .CI(sig000000b3),
    .DI(sig00000080),
    .S(sig00000081),
    .O(sig000000b2)
  );
  MUXCY   blk00000043 (
    .CI(sig000000b4),
    .DI(sig00000082),
    .S(sig00000083),
    .O(sig000000b3)
  );
  MUXCY   blk00000044 (
    .CI(sig000000b5),
    .DI(sig00000084),
    .S(sig00000085),
    .O(sig000000b4)
  );
  MUXCY   blk00000045 (
    .CI(sig000000b6),
    .DI(sig00000086),
    .S(sig00000087),
    .O(sig000000b5)
  );
  MUXCY   blk00000046 (
    .CI(sig000000b7),
    .DI(sig00000088),
    .S(sig00000089),
    .O(sig000000b6)
  );
  MUXCY   blk00000047 (
    .CI(sig000000b8),
    .DI(sig0000008a),
    .S(sig0000008b),
    .O(sig000000b7)
  );
  MUXCY   blk00000048 (
    .CI(sig000000b9),
    .DI(sig0000008c),
    .S(sig0000008d),
    .O(sig000000b8)
  );
  MUXCY   blk00000049 (
    .CI(sig000000ba),
    .DI(sig0000008e),
    .S(sig0000008f),
    .O(sig000000b9)
  );
  MUXCY   blk0000004a (
    .CI(sig000000bb),
    .DI(sig00000090),
    .S(sig00000091),
    .O(sig000000ba)
  );
  MUXCY   blk0000004b (
    .CI(sig000000bc),
    .DI(sig00000092),
    .S(sig00000093),
    .O(sig000000bb)
  );
  MUXCY   blk0000004c (
    .CI(sig000000bd),
    .DI(sig00000094),
    .S(sig00000095),
    .O(sig000000bc)
  );
  MUXCY   blk0000004d (
    .CI(sig000000be),
    .DI(sig00000096),
    .S(sig00000097),
    .O(sig000000bd)
  );
  MUXCY   blk0000004e (
    .CI(sig000000bf),
    .DI(sig00000098),
    .S(sig00000099),
    .O(sig000000be)
  );
  MUXCY   blk0000004f (
    .CI(sig000000c0),
    .DI(sig0000009a),
    .S(sig0000009b),
    .O(sig000000bf)
  );
  MUXCY   blk00000050 (
    .CI(sig000000c1),
    .DI(sig0000009c),
    .S(sig0000009d),
    .O(sig000000c0)
  );
  MUXCY   blk00000051 (
    .CI(sig000000c2),
    .DI(sig0000009e),
    .S(sig0000009f),
    .O(sig000000c1)
  );
  MUXCY   blk00000052 (
    .CI(sig000000c3),
    .DI(sig000000a0),
    .S(sig000000a1),
    .O(sig000000c2)
  );
  MUXCY   blk00000053 (
    .CI(sig000000c4),
    .DI(sig000000a2),
    .S(sig000000a3),
    .O(sig000000c3)
  );
  MUXCY   blk00000054 (
    .CI(NlwRenamedSig_OI_m_axis_result_tdata[1]),
    .DI(sig000000a4),
    .S(sig000000a5),
    .O(sig000000c4)
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  blk00000055 (
    .I0(s_axis_a_tvalid),
    .I1(s_axis_b_tvalid),
    .I2(s_axis_operation_tvalid),
    .O(sig00000002)
  );
  LUT5 #(
    .INIT ( 32'h04441444 ))
  blk00000056 (
    .I0(sig00000010),
    .I1(sig0000000b),
    .I2(s_axis_a_tdata[63]),
    .I3(s_axis_b_tdata[63]),
    .I4(sig00000011),
    .O(sig0000000a)
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  blk00000057 (
    .I0(s_axis_a_tdata[58]),
    .I1(s_axis_a_tdata[59]),
    .I2(s_axis_a_tdata[60]),
    .I3(s_axis_a_tdata[61]),
    .I4(s_axis_a_tdata[62]),
    .O(sig00000005)
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  blk00000058 (
    .I0(s_axis_a_tdata[52]),
    .I1(s_axis_a_tdata[53]),
    .I2(s_axis_a_tdata[54]),
    .I3(s_axis_a_tdata[55]),
    .I4(s_axis_a_tdata[56]),
    .I5(s_axis_a_tdata[57]),
    .O(sig00000006)
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  blk00000059 (
    .I0(s_axis_b_tdata[58]),
    .I1(s_axis_b_tdata[59]),
    .I2(s_axis_b_tdata[60]),
    .I3(s_axis_b_tdata[61]),
    .I4(s_axis_b_tdata[62]),
    .O(sig00000007)
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  blk0000005a (
    .I0(s_axis_b_tdata[52]),
    .I1(s_axis_b_tdata[53]),
    .I2(s_axis_b_tdata[54]),
    .I3(s_axis_b_tdata[55]),
    .I4(s_axis_b_tdata[56]),
    .I5(s_axis_b_tdata[57]),
    .O(sig00000008)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk0000005b (
    .I0(s_axis_a_tdata[27]),
    .I1(s_axis_b_tdata[27]),
    .I2(s_axis_a_tdata[29]),
    .I3(s_axis_b_tdata[29]),
    .I4(s_axis_a_tdata[28]),
    .I5(s_axis_b_tdata[28]),
    .O(sig0000001e)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk0000005c (
    .I0(s_axis_a_tdata[24]),
    .I1(s_axis_b_tdata[24]),
    .I2(s_axis_a_tdata[26]),
    .I3(s_axis_b_tdata[26]),
    .I4(s_axis_a_tdata[25]),
    .I5(s_axis_b_tdata[25]),
    .O(sig0000001f)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk0000005d (
    .I0(s_axis_a_tdata[21]),
    .I1(s_axis_b_tdata[21]),
    .I2(s_axis_a_tdata[23]),
    .I3(s_axis_b_tdata[23]),
    .I4(s_axis_a_tdata[22]),
    .I5(s_axis_b_tdata[22]),
    .O(sig00000020)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk0000005e (
    .I0(s_axis_a_tdata[18]),
    .I1(s_axis_b_tdata[18]),
    .I2(s_axis_a_tdata[20]),
    .I3(s_axis_b_tdata[20]),
    .I4(s_axis_a_tdata[19]),
    .I5(s_axis_b_tdata[19]),
    .O(sig00000021)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk0000005f (
    .I0(s_axis_a_tdata[15]),
    .I1(s_axis_b_tdata[15]),
    .I2(s_axis_a_tdata[17]),
    .I3(s_axis_b_tdata[17]),
    .I4(s_axis_a_tdata[16]),
    .I5(s_axis_b_tdata[16]),
    .O(sig00000022)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk00000060 (
    .I0(s_axis_a_tdata[12]),
    .I1(s_axis_b_tdata[12]),
    .I2(s_axis_a_tdata[14]),
    .I3(s_axis_b_tdata[14]),
    .I4(s_axis_a_tdata[13]),
    .I5(s_axis_b_tdata[13]),
    .O(sig00000023)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk00000061 (
    .I0(s_axis_a_tdata[10]),
    .I1(s_axis_b_tdata[10]),
    .I2(s_axis_a_tdata[9]),
    .I3(s_axis_b_tdata[9]),
    .I4(s_axis_a_tdata[11]),
    .I5(s_axis_b_tdata[11]),
    .O(sig00000024)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk00000062 (
    .I0(s_axis_a_tdata[6]),
    .I1(s_axis_b_tdata[6]),
    .I2(s_axis_a_tdata[8]),
    .I3(s_axis_b_tdata[8]),
    .I4(s_axis_a_tdata[7]),
    .I5(s_axis_b_tdata[7]),
    .O(sig00000025)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk00000063 (
    .I0(s_axis_a_tdata[60]),
    .I1(s_axis_b_tdata[60]),
    .I2(s_axis_a_tdata[62]),
    .I3(s_axis_b_tdata[62]),
    .I4(s_axis_a_tdata[61]),
    .I5(s_axis_b_tdata[61]),
    .O(sig00000013)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk00000064 (
    .I0(s_axis_a_tdata[3]),
    .I1(s_axis_b_tdata[3]),
    .I2(s_axis_a_tdata[5]),
    .I3(s_axis_b_tdata[5]),
    .I4(s_axis_a_tdata[4]),
    .I5(s_axis_b_tdata[4]),
    .O(sig00000026)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk00000065 (
    .I0(s_axis_a_tdata[57]),
    .I1(s_axis_b_tdata[57]),
    .I2(s_axis_a_tdata[59]),
    .I3(s_axis_b_tdata[59]),
    .I4(s_axis_a_tdata[58]),
    .I5(s_axis_b_tdata[58]),
    .O(sig00000014)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk00000066 (
    .I0(s_axis_a_tdata[54]),
    .I1(s_axis_b_tdata[54]),
    .I2(s_axis_a_tdata[56]),
    .I3(s_axis_b_tdata[56]),
    .I4(s_axis_a_tdata[55]),
    .I5(s_axis_b_tdata[55]),
    .O(sig00000015)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk00000067 (
    .I0(s_axis_a_tdata[51]),
    .I1(s_axis_b_tdata[51]),
    .I2(s_axis_a_tdata[53]),
    .I3(s_axis_b_tdata[53]),
    .I4(s_axis_a_tdata[52]),
    .I5(s_axis_b_tdata[52]),
    .O(sig00000016)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk00000068 (
    .I0(s_axis_a_tdata[48]),
    .I1(s_axis_b_tdata[48]),
    .I2(s_axis_a_tdata[50]),
    .I3(s_axis_b_tdata[50]),
    .I4(s_axis_a_tdata[49]),
    .I5(s_axis_b_tdata[49]),
    .O(sig00000017)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk00000069 (
    .I0(s_axis_a_tdata[45]),
    .I1(s_axis_b_tdata[45]),
    .I2(s_axis_a_tdata[47]),
    .I3(s_axis_b_tdata[47]),
    .I4(s_axis_a_tdata[46]),
    .I5(s_axis_b_tdata[46]),
    .O(sig00000018)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk0000006a (
    .I0(s_axis_a_tdata[42]),
    .I1(s_axis_b_tdata[42]),
    .I2(s_axis_a_tdata[44]),
    .I3(s_axis_b_tdata[44]),
    .I4(s_axis_a_tdata[43]),
    .I5(s_axis_b_tdata[43]),
    .O(sig00000019)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk0000006b (
    .I0(s_axis_a_tdata[39]),
    .I1(s_axis_b_tdata[39]),
    .I2(s_axis_a_tdata[41]),
    .I3(s_axis_b_tdata[41]),
    .I4(s_axis_a_tdata[40]),
    .I5(s_axis_b_tdata[40]),
    .O(sig0000001a)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk0000006c (
    .I0(s_axis_a_tdata[36]),
    .I1(s_axis_b_tdata[36]),
    .I2(s_axis_a_tdata[38]),
    .I3(s_axis_b_tdata[38]),
    .I4(s_axis_a_tdata[37]),
    .I5(s_axis_b_tdata[37]),
    .O(sig0000001b)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk0000006d (
    .I0(s_axis_a_tdata[33]),
    .I1(s_axis_b_tdata[33]),
    .I2(s_axis_a_tdata[35]),
    .I3(s_axis_b_tdata[35]),
    .I4(s_axis_a_tdata[34]),
    .I5(s_axis_b_tdata[34]),
    .O(sig0000001c)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk0000006e (
    .I0(s_axis_a_tdata[30]),
    .I1(s_axis_b_tdata[30]),
    .I2(s_axis_a_tdata[32]),
    .I3(s_axis_b_tdata[32]),
    .I4(s_axis_a_tdata[31]),
    .I5(s_axis_b_tdata[31]),
    .O(sig0000001d)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  blk0000006f (
    .I0(s_axis_a_tdata[0]),
    .I1(s_axis_b_tdata[0]),
    .I2(s_axis_a_tdata[2]),
    .I3(s_axis_b_tdata[2]),
    .I4(s_axis_a_tdata[1]),
    .I5(s_axis_b_tdata[1]),
    .O(sig00000027)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000070 (
    .I0(s_axis_b_tdata[63]),
    .I1(s_axis_a_tdata[63]),
    .O(sig00000012)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000071 (
    .I0(s_axis_a_tdata[53]),
    .I1(s_axis_a_tdata[54]),
    .I2(s_axis_a_tdata[55]),
    .I3(s_axis_a_tdata[56]),
    .I4(s_axis_a_tdata[57]),
    .I5(s_axis_a_tdata[58]),
    .O(sig00000040)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000072 (
    .I0(s_axis_b_tdata[58]),
    .I1(s_axis_b_tdata[59]),
    .I2(s_axis_b_tdata[60]),
    .I3(s_axis_b_tdata[61]),
    .I4(s_axis_b_tdata[62]),
    .I5(s_axis_a_tdata[52]),
    .O(sig00000041)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000073 (
    .I0(s_axis_b_tdata[52]),
    .I1(s_axis_b_tdata[53]),
    .I2(s_axis_b_tdata[54]),
    .I3(s_axis_b_tdata[55]),
    .I4(s_axis_b_tdata[56]),
    .I5(s_axis_b_tdata[57]),
    .O(sig00000042)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000074 (
    .I0(s_axis_a_tdata[59]),
    .I1(s_axis_a_tdata[60]),
    .I2(s_axis_a_tdata[61]),
    .I3(s_axis_a_tdata[62]),
    .O(sig00000043)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000075 (
    .I0(s_axis_b_tdata[42]),
    .I1(s_axis_b_tdata[43]),
    .I2(s_axis_b_tdata[44]),
    .I3(s_axis_b_tdata[45]),
    .I4(s_axis_b_tdata[46]),
    .I5(s_axis_b_tdata[47]),
    .O(sig00000044)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000076 (
    .I0(s_axis_b_tdata[36]),
    .I1(s_axis_b_tdata[37]),
    .I2(s_axis_b_tdata[38]),
    .I3(s_axis_b_tdata[39]),
    .I4(s_axis_b_tdata[40]),
    .I5(s_axis_b_tdata[41]),
    .O(sig00000045)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000077 (
    .I0(s_axis_b_tdata[30]),
    .I1(s_axis_b_tdata[31]),
    .I2(s_axis_b_tdata[32]),
    .I3(s_axis_b_tdata[33]),
    .I4(s_axis_b_tdata[34]),
    .I5(s_axis_b_tdata[35]),
    .O(sig00000046)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000078 (
    .I0(s_axis_b_tdata[24]),
    .I1(s_axis_b_tdata[25]),
    .I2(s_axis_b_tdata[26]),
    .I3(s_axis_b_tdata[27]),
    .I4(s_axis_b_tdata[28]),
    .I5(s_axis_b_tdata[29]),
    .O(sig00000047)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000079 (
    .I0(s_axis_b_tdata[18]),
    .I1(s_axis_b_tdata[19]),
    .I2(s_axis_b_tdata[20]),
    .I3(s_axis_b_tdata[21]),
    .I4(s_axis_b_tdata[22]),
    .I5(s_axis_b_tdata[23]),
    .O(sig00000048)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk0000007a (
    .I0(s_axis_b_tdata[12]),
    .I1(s_axis_b_tdata[13]),
    .I2(s_axis_b_tdata[14]),
    .I3(s_axis_b_tdata[15]),
    .I4(s_axis_b_tdata[16]),
    .I5(s_axis_b_tdata[17]),
    .O(sig00000049)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk0000007b (
    .I0(s_axis_b_tdata[6]),
    .I1(s_axis_b_tdata[7]),
    .I2(s_axis_b_tdata[8]),
    .I3(s_axis_b_tdata[9]),
    .I4(s_axis_b_tdata[10]),
    .I5(s_axis_b_tdata[11]),
    .O(sig0000004a)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk0000007c (
    .I0(s_axis_b_tdata[0]),
    .I1(s_axis_b_tdata[1]),
    .I2(s_axis_b_tdata[2]),
    .I3(s_axis_b_tdata[3]),
    .I4(s_axis_b_tdata[4]),
    .I5(s_axis_b_tdata[5]),
    .O(sig0000004b)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk0000007d (
    .I0(s_axis_b_tdata[48]),
    .I1(s_axis_b_tdata[49]),
    .I2(s_axis_b_tdata[50]),
    .I3(s_axis_b_tdata[51]),
    .O(sig0000004c)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk0000007e (
    .I0(s_axis_a_tdata[42]),
    .I1(s_axis_a_tdata[43]),
    .I2(s_axis_a_tdata[44]),
    .I3(s_axis_a_tdata[45]),
    .I4(s_axis_a_tdata[46]),
    .I5(s_axis_a_tdata[47]),
    .O(sig0000004d)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk0000007f (
    .I0(s_axis_a_tdata[36]),
    .I1(s_axis_a_tdata[37]),
    .I2(s_axis_a_tdata[38]),
    .I3(s_axis_a_tdata[39]),
    .I4(s_axis_a_tdata[40]),
    .I5(s_axis_a_tdata[41]),
    .O(sig0000004e)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000080 (
    .I0(s_axis_a_tdata[30]),
    .I1(s_axis_a_tdata[31]),
    .I2(s_axis_a_tdata[32]),
    .I3(s_axis_a_tdata[33]),
    .I4(s_axis_a_tdata[34]),
    .I5(s_axis_a_tdata[35]),
    .O(sig0000004f)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000081 (
    .I0(s_axis_a_tdata[24]),
    .I1(s_axis_a_tdata[25]),
    .I2(s_axis_a_tdata[26]),
    .I3(s_axis_a_tdata[27]),
    .I4(s_axis_a_tdata[28]),
    .I5(s_axis_a_tdata[29]),
    .O(sig00000050)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000082 (
    .I0(s_axis_a_tdata[18]),
    .I1(s_axis_a_tdata[19]),
    .I2(s_axis_a_tdata[20]),
    .I3(s_axis_a_tdata[21]),
    .I4(s_axis_a_tdata[22]),
    .I5(s_axis_a_tdata[23]),
    .O(sig00000051)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000083 (
    .I0(s_axis_a_tdata[12]),
    .I1(s_axis_a_tdata[13]),
    .I2(s_axis_a_tdata[14]),
    .I3(s_axis_a_tdata[15]),
    .I4(s_axis_a_tdata[16]),
    .I5(s_axis_a_tdata[17]),
    .O(sig00000052)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000084 (
    .I0(s_axis_a_tdata[6]),
    .I1(s_axis_a_tdata[7]),
    .I2(s_axis_a_tdata[8]),
    .I3(s_axis_a_tdata[9]),
    .I4(s_axis_a_tdata[10]),
    .I5(s_axis_a_tdata[11]),
    .O(sig00000053)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000085 (
    .I0(s_axis_a_tdata[0]),
    .I1(s_axis_a_tdata[1]),
    .I2(s_axis_a_tdata[2]),
    .I3(s_axis_a_tdata[3]),
    .I4(s_axis_a_tdata[4]),
    .I5(s_axis_a_tdata[5]),
    .O(sig00000054)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000086 (
    .I0(s_axis_a_tdata[48]),
    .I1(s_axis_a_tdata[49]),
    .I2(s_axis_a_tdata[50]),
    .I3(s_axis_a_tdata[51]),
    .O(sig00000055)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk00000087 (
    .I0(s_axis_a_tdata[19]),
    .I1(s_axis_b_tdata[19]),
    .I2(s_axis_a_tdata[18]),
    .I3(s_axis_b_tdata[18]),
    .O(sig00000093)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk00000088 (
    .I0(s_axis_a_tdata[17]),
    .I1(s_axis_b_tdata[17]),
    .I2(s_axis_a_tdata[16]),
    .I3(s_axis_b_tdata[16]),
    .O(sig00000095)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk00000089 (
    .I0(s_axis_a_tdata[15]),
    .I1(s_axis_b_tdata[15]),
    .I2(s_axis_a_tdata[14]),
    .I3(s_axis_b_tdata[14]),
    .O(sig00000097)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk0000008a (
    .I0(s_axis_a_tdata[13]),
    .I1(s_axis_b_tdata[13]),
    .I2(s_axis_a_tdata[12]),
    .I3(s_axis_b_tdata[12]),
    .O(sig00000099)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk0000008b (
    .I0(s_axis_a_tdata[11]),
    .I1(s_axis_b_tdata[11]),
    .I2(s_axis_a_tdata[10]),
    .I3(s_axis_b_tdata[10]),
    .O(sig0000009b)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk0000008c (
    .I0(s_axis_a_tdata[9]),
    .I1(s_axis_b_tdata[9]),
    .I2(s_axis_a_tdata[8]),
    .I3(s_axis_b_tdata[8]),
    .O(sig0000009d)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk0000008d (
    .I0(s_axis_a_tdata[7]),
    .I1(s_axis_b_tdata[7]),
    .I2(s_axis_a_tdata[6]),
    .I3(s_axis_b_tdata[6]),
    .O(sig0000009f)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk0000008e (
    .I0(s_axis_a_tdata[63]),
    .I1(s_axis_b_tdata[63]),
    .I2(s_axis_a_tdata[62]),
    .I3(s_axis_b_tdata[62]),
    .O(sig00000067)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk0000008f (
    .I0(s_axis_a_tdata[61]),
    .I1(s_axis_b_tdata[61]),
    .I2(s_axis_a_tdata[60]),
    .I3(s_axis_b_tdata[60]),
    .O(sig00000069)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk00000090 (
    .I0(s_axis_a_tdata[5]),
    .I1(s_axis_b_tdata[5]),
    .I2(s_axis_a_tdata[4]),
    .I3(s_axis_b_tdata[4]),
    .O(sig000000a1)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk00000091 (
    .I0(s_axis_a_tdata[59]),
    .I1(s_axis_b_tdata[59]),
    .I2(s_axis_a_tdata[58]),
    .I3(s_axis_b_tdata[58]),
    .O(sig0000006b)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk00000092 (
    .I0(s_axis_a_tdata[57]),
    .I1(s_axis_b_tdata[57]),
    .I2(s_axis_a_tdata[56]),
    .I3(s_axis_b_tdata[56]),
    .O(sig0000006d)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk00000093 (
    .I0(s_axis_a_tdata[55]),
    .I1(s_axis_b_tdata[55]),
    .I2(s_axis_a_tdata[54]),
    .I3(s_axis_b_tdata[54]),
    .O(sig0000006f)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk00000094 (
    .I0(s_axis_a_tdata[53]),
    .I1(s_axis_b_tdata[53]),
    .I2(s_axis_a_tdata[52]),
    .I3(s_axis_b_tdata[52]),
    .O(sig00000071)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk00000095 (
    .I0(s_axis_a_tdata[51]),
    .I1(s_axis_b_tdata[51]),
    .I2(s_axis_a_tdata[50]),
    .I3(s_axis_b_tdata[50]),
    .O(sig00000073)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk00000096 (
    .I0(s_axis_a_tdata[49]),
    .I1(s_axis_b_tdata[49]),
    .I2(s_axis_a_tdata[48]),
    .I3(s_axis_b_tdata[48]),
    .O(sig00000075)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk00000097 (
    .I0(s_axis_a_tdata[47]),
    .I1(s_axis_b_tdata[47]),
    .I2(s_axis_a_tdata[46]),
    .I3(s_axis_b_tdata[46]),
    .O(sig00000077)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk00000098 (
    .I0(s_axis_a_tdata[45]),
    .I1(s_axis_b_tdata[45]),
    .I2(s_axis_a_tdata[44]),
    .I3(s_axis_b_tdata[44]),
    .O(sig00000079)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk00000099 (
    .I0(s_axis_a_tdata[43]),
    .I1(s_axis_b_tdata[43]),
    .I2(s_axis_a_tdata[42]),
    .I3(s_axis_b_tdata[42]),
    .O(sig0000007b)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk0000009a (
    .I0(s_axis_a_tdata[41]),
    .I1(s_axis_b_tdata[41]),
    .I2(s_axis_a_tdata[40]),
    .I3(s_axis_b_tdata[40]),
    .O(sig0000007d)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk0000009b (
    .I0(s_axis_a_tdata[3]),
    .I1(s_axis_b_tdata[3]),
    .I2(s_axis_a_tdata[2]),
    .I3(s_axis_b_tdata[2]),
    .O(sig000000a3)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk0000009c (
    .I0(s_axis_a_tdata[39]),
    .I1(s_axis_b_tdata[39]),
    .I2(s_axis_a_tdata[38]),
    .I3(s_axis_b_tdata[38]),
    .O(sig0000007f)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk0000009d (
    .I0(s_axis_a_tdata[37]),
    .I1(s_axis_b_tdata[37]),
    .I2(s_axis_a_tdata[36]),
    .I3(s_axis_b_tdata[36]),
    .O(sig00000081)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk0000009e (
    .I0(s_axis_a_tdata[35]),
    .I1(s_axis_b_tdata[35]),
    .I2(s_axis_a_tdata[34]),
    .I3(s_axis_b_tdata[34]),
    .O(sig00000083)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk0000009f (
    .I0(s_axis_a_tdata[33]),
    .I1(s_axis_b_tdata[33]),
    .I2(s_axis_a_tdata[32]),
    .I3(s_axis_b_tdata[32]),
    .O(sig00000085)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk000000a0 (
    .I0(s_axis_a_tdata[31]),
    .I1(s_axis_b_tdata[31]),
    .I2(s_axis_a_tdata[30]),
    .I3(s_axis_b_tdata[30]),
    .O(sig00000087)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk000000a1 (
    .I0(s_axis_a_tdata[29]),
    .I1(s_axis_b_tdata[29]),
    .I2(s_axis_a_tdata[28]),
    .I3(s_axis_b_tdata[28]),
    .O(sig00000089)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk000000a2 (
    .I0(s_axis_a_tdata[27]),
    .I1(s_axis_b_tdata[27]),
    .I2(s_axis_a_tdata[26]),
    .I3(s_axis_b_tdata[26]),
    .O(sig0000008b)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk000000a3 (
    .I0(s_axis_a_tdata[25]),
    .I1(s_axis_b_tdata[25]),
    .I2(s_axis_a_tdata[24]),
    .I3(s_axis_b_tdata[24]),
    .O(sig0000008d)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk000000a4 (
    .I0(s_axis_a_tdata[23]),
    .I1(s_axis_b_tdata[23]),
    .I2(s_axis_a_tdata[22]),
    .I3(s_axis_b_tdata[22]),
    .O(sig0000008f)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk000000a5 (
    .I0(s_axis_a_tdata[21]),
    .I1(s_axis_b_tdata[21]),
    .I2(s_axis_a_tdata[20]),
    .I3(s_axis_b_tdata[20]),
    .O(sig00000091)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk000000a6 (
    .I0(s_axis_a_tdata[1]),
    .I1(s_axis_b_tdata[1]),
    .I2(s_axis_a_tdata[0]),
    .I3(s_axis_b_tdata[0]),
    .O(sig000000a5)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000a7 (
    .I0(s_axis_a_tdata[63]),
    .I1(s_axis_b_tdata[63]),
    .I2(s_axis_a_tdata[62]),
    .I3(s_axis_b_tdata[62]),
    .O(sig00000066)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000a8 (
    .I0(s_axis_b_tdata[61]),
    .I1(s_axis_a_tdata[61]),
    .I2(s_axis_a_tdata[60]),
    .I3(s_axis_b_tdata[60]),
    .O(sig00000068)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000a9 (
    .I0(s_axis_b_tdata[59]),
    .I1(s_axis_a_tdata[59]),
    .I2(s_axis_a_tdata[58]),
    .I3(s_axis_b_tdata[58]),
    .O(sig0000006a)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000aa (
    .I0(s_axis_b_tdata[57]),
    .I1(s_axis_a_tdata[57]),
    .I2(s_axis_a_tdata[56]),
    .I3(s_axis_b_tdata[56]),
    .O(sig0000006c)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000ab (
    .I0(s_axis_b_tdata[55]),
    .I1(s_axis_a_tdata[55]),
    .I2(s_axis_a_tdata[54]),
    .I3(s_axis_b_tdata[54]),
    .O(sig0000006e)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000ac (
    .I0(s_axis_b_tdata[53]),
    .I1(s_axis_a_tdata[53]),
    .I2(s_axis_a_tdata[52]),
    .I3(s_axis_b_tdata[52]),
    .O(sig00000070)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000ad (
    .I0(s_axis_b_tdata[51]),
    .I1(s_axis_a_tdata[51]),
    .I2(s_axis_a_tdata[50]),
    .I3(s_axis_b_tdata[50]),
    .O(sig00000072)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000ae (
    .I0(s_axis_b_tdata[49]),
    .I1(s_axis_a_tdata[49]),
    .I2(s_axis_a_tdata[48]),
    .I3(s_axis_b_tdata[48]),
    .O(sig00000074)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000af (
    .I0(s_axis_b_tdata[47]),
    .I1(s_axis_a_tdata[47]),
    .I2(s_axis_a_tdata[46]),
    .I3(s_axis_b_tdata[46]),
    .O(sig00000076)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000b0 (
    .I0(s_axis_b_tdata[45]),
    .I1(s_axis_a_tdata[45]),
    .I2(s_axis_a_tdata[44]),
    .I3(s_axis_b_tdata[44]),
    .O(sig00000078)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000b1 (
    .I0(s_axis_b_tdata[43]),
    .I1(s_axis_a_tdata[43]),
    .I2(s_axis_a_tdata[42]),
    .I3(s_axis_b_tdata[42]),
    .O(sig0000007a)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000b2 (
    .I0(s_axis_b_tdata[41]),
    .I1(s_axis_a_tdata[41]),
    .I2(s_axis_a_tdata[40]),
    .I3(s_axis_b_tdata[40]),
    .O(sig0000007c)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000b3 (
    .I0(s_axis_b_tdata[39]),
    .I1(s_axis_a_tdata[39]),
    .I2(s_axis_a_tdata[38]),
    .I3(s_axis_b_tdata[38]),
    .O(sig0000007e)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000b4 (
    .I0(s_axis_b_tdata[37]),
    .I1(s_axis_a_tdata[37]),
    .I2(s_axis_a_tdata[36]),
    .I3(s_axis_b_tdata[36]),
    .O(sig00000080)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000b5 (
    .I0(s_axis_b_tdata[35]),
    .I1(s_axis_a_tdata[35]),
    .I2(s_axis_a_tdata[34]),
    .I3(s_axis_b_tdata[34]),
    .O(sig00000082)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000b6 (
    .I0(s_axis_b_tdata[33]),
    .I1(s_axis_a_tdata[33]),
    .I2(s_axis_a_tdata[32]),
    .I3(s_axis_b_tdata[32]),
    .O(sig00000084)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000b7 (
    .I0(s_axis_b_tdata[31]),
    .I1(s_axis_a_tdata[31]),
    .I2(s_axis_a_tdata[30]),
    .I3(s_axis_b_tdata[30]),
    .O(sig00000086)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000b8 (
    .I0(s_axis_b_tdata[29]),
    .I1(s_axis_a_tdata[29]),
    .I2(s_axis_a_tdata[28]),
    .I3(s_axis_b_tdata[28]),
    .O(sig00000088)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000b9 (
    .I0(s_axis_b_tdata[27]),
    .I1(s_axis_a_tdata[27]),
    .I2(s_axis_a_tdata[26]),
    .I3(s_axis_b_tdata[26]),
    .O(sig0000008a)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000ba (
    .I0(s_axis_b_tdata[25]),
    .I1(s_axis_a_tdata[25]),
    .I2(s_axis_a_tdata[24]),
    .I3(s_axis_b_tdata[24]),
    .O(sig0000008c)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000bb (
    .I0(s_axis_b_tdata[23]),
    .I1(s_axis_a_tdata[23]),
    .I2(s_axis_a_tdata[22]),
    .I3(s_axis_b_tdata[22]),
    .O(sig0000008e)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000bc (
    .I0(s_axis_b_tdata[21]),
    .I1(s_axis_a_tdata[21]),
    .I2(s_axis_a_tdata[20]),
    .I3(s_axis_b_tdata[20]),
    .O(sig00000090)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000bd (
    .I0(s_axis_b_tdata[19]),
    .I1(s_axis_a_tdata[19]),
    .I2(s_axis_a_tdata[18]),
    .I3(s_axis_b_tdata[18]),
    .O(sig00000092)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000be (
    .I0(s_axis_b_tdata[17]),
    .I1(s_axis_a_tdata[17]),
    .I2(s_axis_a_tdata[16]),
    .I3(s_axis_b_tdata[16]),
    .O(sig00000094)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000bf (
    .I0(s_axis_b_tdata[15]),
    .I1(s_axis_a_tdata[15]),
    .I2(s_axis_a_tdata[14]),
    .I3(s_axis_b_tdata[14]),
    .O(sig00000096)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000c0 (
    .I0(s_axis_b_tdata[13]),
    .I1(s_axis_a_tdata[13]),
    .I2(s_axis_a_tdata[12]),
    .I3(s_axis_b_tdata[12]),
    .O(sig00000098)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000c1 (
    .I0(s_axis_b_tdata[11]),
    .I1(s_axis_a_tdata[11]),
    .I2(s_axis_a_tdata[10]),
    .I3(s_axis_b_tdata[10]),
    .O(sig0000009a)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000c2 (
    .I0(s_axis_b_tdata[9]),
    .I1(s_axis_a_tdata[9]),
    .I2(s_axis_a_tdata[8]),
    .I3(s_axis_b_tdata[8]),
    .O(sig0000009c)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000c3 (
    .I0(s_axis_b_tdata[7]),
    .I1(s_axis_a_tdata[7]),
    .I2(s_axis_a_tdata[6]),
    .I3(s_axis_b_tdata[6]),
    .O(sig0000009e)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000c4 (
    .I0(s_axis_b_tdata[5]),
    .I1(s_axis_a_tdata[5]),
    .I2(s_axis_a_tdata[4]),
    .I3(s_axis_b_tdata[4]),
    .O(sig000000a0)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000c5 (
    .I0(s_axis_b_tdata[3]),
    .I1(s_axis_a_tdata[3]),
    .I2(s_axis_a_tdata[2]),
    .I3(s_axis_b_tdata[2]),
    .O(sig000000a2)
  );
  LUT4 #(
    .INIT ( 16'h44D4 ))
  blk000000c6 (
    .I0(s_axis_b_tdata[1]),
    .I1(s_axis_a_tdata[1]),
    .I2(s_axis_a_tdata[0]),
    .I3(s_axis_b_tdata[0]),
    .O(sig000000a4)
  );
  LUT6 #(
    .INIT ( 64'hFF3CAA7DFF3CEF2D ))
  blk000000c7 (
    .I0(sig0000000c),
    .I1(s_axis_operation_tdata[5]),
    .I2(s_axis_operation_tdata[3]),
    .I3(s_axis_operation_tdata[4]),
    .I4(sig0000000e),
    .I5(sig00000010),
    .O(sig000000c5)
  );
  LUT6 #(
    .INIT ( 64'hEFFF1F0FEEEFE1E1 ))
  blk000000c8 (
    .I0(sig0000000e),
    .I1(sig0000000c),
    .I2(s_axis_operation_tdata[5]),
    .I3(sig00000010),
    .I4(s_axis_operation_tdata[4]),
    .I5(s_axis_operation_tdata[3]),
    .O(sig000000c6)
  );
  MUXF7   blk000000c9 (
    .I0(sig000000c7),
    .I1(sig000000c8),
    .S(sig00000011),
    .O(sig00000009)
  );
  LUT3 #(
    .INIT ( 8'h27 ))
  blk000000ca (
    .I0(sig0000000a),
    .I1(sig000000c6),
    .I2(sig000000c5),
    .O(sig000000c7)
  );
  LUT6 #(
    .INIT ( 64'h1E11001E1E10101E ))
  blk000000cb (
    .I0(sig0000000e),
    .I1(sig0000000c),
    .I2(s_axis_operation_tdata[4]),
    .I3(s_axis_operation_tdata[3]),
    .I4(s_axis_operation_tdata[5]),
    .I5(sig0000000a),
    .O(sig000000c8)
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
