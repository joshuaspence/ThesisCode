// Version: release . Copyright (C) 2011 XILINX, Inc.


//------------------------------------------------------------------------------
//-- Add.
//------------------------------------------------------------------------------
module ACMP_add_comb(din0, din1, dout);
parameter ID = 0;
parameter NUM_STAGE = 1;
parameter din0_WIDTH = 32; 
parameter din1_WIDTH = 32;
parameter dout_WIDTH = 32;
input[din0_WIDTH-1:0] din0;
input[din1_WIDTH-1:0] din1;
output[dout_WIDTH-1:0] dout;

AESL_Add #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH) 
    ACMP_Add_U (
        .clk(1'b1),
        .reset(1'b1),
        .ce(1'b1),
        .din0(din0),
        .din1(din1),
        .dout(dout));

endmodule

module ACMP_add(clk, reset, ce, din0, din1, dout);
parameter ID = 0;
parameter NUM_STAGE = 2;
parameter din0_WIDTH = 32; 
parameter din1_WIDTH = 32;
parameter dout_WIDTH = 32;
input    clk, reset, ce;
input[din0_WIDTH-1:0] din0;
input[din1_WIDTH-1:0] din1;
output[dout_WIDTH-1:0] dout;

AESL_Add #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH) 
    ACMP_Add_U (
        .clk(clk),
        .reset(reset),
        .ce(ce),
        .din0(din0),
        .din1(din1),
        .dout(dout));

endmodule


//-----------------------------------------------------------------------------
//-- Sub.
//-----------------------------------------------------------------------------
module ACMP_sub_comb (din0, din1, dout);
parameter ID = 0;
parameter   NUM_STAGE = 1;
parameter   din0_WIDTH = 32;
parameter   din1_WIDTH = 32;
parameter   dout_WIDTH = 32;
input[din0_WIDTH-1:0]    din0;
input[din1_WIDTH-1:0]    din1;
output[dout_WIDTH-1:0]   dout;

AESL_Sub #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
    ACMP_Sub_U(
        .clk(1'b1),
        .reset(1'b1),
        .ce(1'b1),
        .din0(din0),
        .din1(din1),
        .dout(dout));

endmodule


module ACMP_sub (clk, reset, ce, din0, din1, dout);
parameter ID = 0;
parameter   NUM_STAGE = 2;
parameter   din0_WIDTH = 32;
parameter   din1_WIDTH = 32;
parameter   dout_WIDTH = 32;
input    clk, reset, ce;
input[din0_WIDTH-1:0]    din0;
input[din1_WIDTH-1:0]    din1;
output[dout_WIDTH-1:0]   dout;

AESL_Sub #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
    ACMP_Sub_U(
        .clk(clk),
        .reset(reset),
        .ce(ce),
        .din0(din0),
        .din1(din1),
        .dout(dout));

endmodule



//-----------------------------------------------------------------------------
//-- Mul.
//-----------------------------------------------------------------------------
module ACMP_mul_ss (clk, reset, ce, din0, din1, dout);
parameter ID = 0;
parameter   NUM_STAGE = 2;
parameter   din0_WIDTH = 32;
parameter   din1_WIDTH = 32;
parameter   dout_WIDTH = 32;
input       clk, reset, ce;
input[din0_WIDTH-1:0]   din0;
input[din1_WIDTH-1:0]   din1;
output[dout_WIDTH-1:0]  dout;

AESL_Mul_ss #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
    ACMP_Mul_U (
        .clk(clk),
        .reset(reset),
        .ce(ce),
        .din0(din0),
        .din1(din1),
        .dout(dout));
endmodule 


module ACMP_mul_us (clk, reset, ce, din0, din1, dout);
parameter ID = 0;
parameter   NUM_STAGE = 2;
parameter   din0_WIDTH = 32;
parameter   din1_WIDTH = 32;
parameter   dout_WIDTH = 32;
input       clk, reset, ce;
input[din0_WIDTH-1:0]   din0;
input[din1_WIDTH-1:0]   din1;
output[dout_WIDTH-1:0]  dout;

AESL_Mul_us #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
    ACMP_Mul_U (
        .clk(clk),
        .reset(reset),
        .ce(ce),
        .din0(din0),
        .din1(din1),
        .dout(dout));
endmodule 


module ACMP_mul_su (clk, reset, ce, din0, din1, dout);
parameter ID = 0;
parameter   NUM_STAGE = 2;
parameter   din0_WIDTH = 32;
parameter   din1_WIDTH = 32;
parameter   dout_WIDTH = 32;
input       clk, reset, ce;
input[din0_WIDTH-1:0]   din0;
input[din1_WIDTH-1:0]   din1;
output[dout_WIDTH-1:0]  dout;

AESL_Mul_su #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
    ACMP_Mul_U (
        .clk(clk),
        .reset(reset),
        .ce(ce),
        .din0(din0),
        .din1(din1),
        .dout(dout));
endmodule 


module ACMP_mul_uu (clk, reset, ce, din0, din1, dout);
parameter ID = 0;
parameter   NUM_STAGE = 2;
parameter   din0_WIDTH = 32;
parameter   din1_WIDTH = 32;
parameter   dout_WIDTH = 32;
input       clk, reset, ce;
input[din0_WIDTH-1:0]   din0;
input[din1_WIDTH-1:0]   din1;
output[dout_WIDTH-1:0]  dout;

AESL_Mul_uu #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
    ACMP_Mul_U (
        .clk(clk),
        .reset(reset),
        .ce(ce),
        .din0(din0),
        .din1(din1),
        .dout(dout));
endmodule 


//-----------------------------------------------------------------------------
//-- Single Cycle Mul.
//-----------------------------------------------------------------------------
module ACMP_smul_ss (din0, din1, dout);
parameter ID = 0;
parameter   NUM_STAGE = 2;
parameter   din0_WIDTH = 32;
parameter   din1_WIDTH = 32;
parameter   dout_WIDTH = 32;
input[din0_WIDTH-1:0]   din0;
input[din1_WIDTH-1:0]   din1;
output[dout_WIDTH-1:0]  dout;

AESL_Mul_ss #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
    ACMP_Mul_U (
        .clk(1'b1),
        .reset(1'b1),
        .ce(1'b1),
        .din0(din0),
        .din1(din1),
        .dout(dout));
endmodule 


module ACMP_smul_us (din0, din1, dout);
parameter ID = 0;
parameter   NUM_STAGE = 2;
parameter   din0_WIDTH = 32;
parameter   din1_WIDTH = 32;
parameter   dout_WIDTH = 32;
input[din0_WIDTH-1:0]   din0;
input[din1_WIDTH-1:0]   din1;
output[dout_WIDTH-1:0]  dout;

AESL_Mul_us #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
    ACMP_Mul_U (
        .clk(1'b1),
        .reset(1'b1),
        .ce(1'b1),
        .din0(din0),
        .din1(din1),
        .dout(dout));
endmodule 


module ACMP_smul_su (din0, din1, dout);
parameter ID = 0;
parameter   NUM_STAGE = 2;
parameter   din0_WIDTH = 32;
parameter   din1_WIDTH = 32;
parameter   dout_WIDTH = 32;
input[din0_WIDTH-1:0]   din0;
input[din1_WIDTH-1:0]   din1;
output[dout_WIDTH-1:0]  dout;

AESL_Mul_su #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
    ACMP_Mul_U (
        .clk(1'b1),
        .reset(1'b1),
        .ce(1'b1),
        .din0(din0),
        .din1(din1),
        .dout(dout));
endmodule 


module ACMP_smul_uu (din0, din1, dout);
parameter ID = 0;
parameter   NUM_STAGE = 2;
parameter   din0_WIDTH = 32;
parameter   din1_WIDTH = 32;
parameter   dout_WIDTH = 32;
input[din0_WIDTH-1:0]   din0;
input[din1_WIDTH-1:0]   din1;
output[dout_WIDTH-1:0]  dout;

AESL_Mul_uu #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
    ACMP_Mul_U (
        .clk(1'b1),
        .reset(1'b1),
        .ce(1'b1),
        .din0(din0),
        .din1(din1),
        .dout(dout));
endmodule 


//-----------------------------------------------------------------------------
//-- SDivide.
//------------------------------------------------------------------------------
module ACMP_sdiv_comb(din0, din1, dout);
parameter ID = 0;
parameter   NUM_STAGE = 1;
parameter   din0_WIDTH = 32;
parameter   din1_WIDTH = 32;
parameter   dout_WIDTH = 32;
input[din0_WIDTH-1:0]    din0;
input[din1_WIDTH-1:0]    din1;
output[dout_WIDTH-1:0]   dout;

AESL_sdiv #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
    ACMP_sdiv_U(
        .clk(1'b1),
        .reset(1'b1),
        .ce(1'b1),
        .din0(din0),
        .din1(din1),
        .dout(dout));
endmodule

module ACMP_sdiv(clk, reset, ce, din0, din1, dout);
parameter ID = 0;
parameter   NUM_STAGE = 2;
parameter   din0_WIDTH = 32;
parameter   din1_WIDTH = 32;
parameter   dout_WIDTH = 32;
input    clk, reset, ce;
input[din0_WIDTH-1:0]    din0;
input[din1_WIDTH-1:0]    din1;
output[dout_WIDTH-1:0]   dout;

AESL_sdiv #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
    ACMP_sdiv_U(
        .clk(clk),
        .reset(reset),
        .ce(ce),
        .din0(din0),
        .din1(din1),
        .dout(dout));
endmodule


//-----------------------------------------------------------------------------
//-- UDivide.
//-----------------------------------------------------------------------------
module ACMP_udiv_comb (din0, din1, dout);
parameter ID = 0;
parameter    NUM_STAGE = 1;
parameter    din0_WIDTH = 32;
parameter    din1_WIDTH = 32;
parameter    dout_WIDTH = 32;
input[din0_WIDTH-1:0]    din0;
input[din1_WIDTH-1:0]    din1;
output[dout_WIDTH-1:0]   dout;
    
AESL_udiv #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
    ACMP_udiv_U(
        .clk(1'b1),
        .reset(1'b1),
        .ce(1'b1),
        .din0(din0),
        .din1(din1),
        .dout(dout));

endmodule 

module ACMP_udiv (clk, reset, ce, din0, din1, dout);
parameter ID = 0;
parameter    NUM_STAGE = 2;
parameter    din0_WIDTH = 32;
parameter    din1_WIDTH = 32;
parameter    dout_WIDTH = 32;
input    clk, reset, ce;
input[din0_WIDTH-1:0]    din0;
input[din1_WIDTH-1:0]    din1;
output[dout_WIDTH-1:0]   dout;
    
AESL_udiv #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
    ACMP_udiv_U(
        .clk(clk),
        .reset(reset),
        .ce(ce),
        .din0(din0),
        .din1(din1),
        .dout(dout));

endmodule 

//-----------------------------------------------------------------------------
//-- SRem
//-----------------------------------------------------------------------------
module ACMP_srem_comb (din0, din1, dout);
parameter ID = 0;
parameter    NUM_STAGE = 1;
parameter    din0_WIDTH = 32;
parameter    din1_WIDTH = 32;
parameter    dout_WIDTH = 32;
input[din0_WIDTH-1:0]    din0;
input[din1_WIDTH-1:0]    din1;
output[dout_WIDTH-1:0]   dout;

AESL_srem #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
    ACMP_srem_U (
        .clk(1'b1),
        .reset(1'b1),
        .ce(1'b1),
        .din0(din0),
        .din1(din1),
        .dout(dout));
endmodule 

module ACMP_srem (clk, reset, ce, din0, din1, dout);
parameter ID = 0;
parameter    NUM_STAGE = 2;
parameter    din0_WIDTH = 32;
parameter    din1_WIDTH = 32;
parameter    dout_WIDTH = 32;
input    clk, reset, ce;
input[din0_WIDTH-1:0]    din0;
input[din1_WIDTH-1:0]    din1;
output[dout_WIDTH-1:0]   dout;

AESL_srem #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
    ACMP_srem_U (
        .clk(clk),
        .reset(reset),
        .ce(ce),
        .din0(din0),
        .din1(din1),
        .dout(dout));
endmodule 


//----------------------------------------------------------------------------
//-- URem.
//----------------------------------------------------------------------------
module ACMP_urem_comb (din0, din1, dout);
parameter ID = 0;
parameter    NUM_STAGE = 1;
parameter    din0_WIDTH = 32;
parameter    din1_WIDTH = 32;
parameter    dout_WIDTH = 32;
input[din0_WIDTH-1:0]    din0;
input[din1_WIDTH-1:0]    din1;
output[dout_WIDTH-1:0]   dout;

AESL_urem #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
    ACMP_urem_U (
        .clk(1'b1),
        .reset(1'b1),
        .ce(1'b1),
        .din0(din0),
        .din1(din1),
        .dout(dout));
endmodule 


module ACMP_urem (clk, reset, ce, din0, din1, dout);
parameter ID = 0;
parameter    NUM_STAGE = 2;
parameter    din0_WIDTH = 32;
parameter    din1_WIDTH = 32;
parameter    dout_WIDTH = 32;
input    clk, reset, ce;
input[din0_WIDTH-1:0]    din0;
input[din1_WIDTH-1:0]    din1;
output[dout_WIDTH-1:0]   dout;

AESL_urem #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
    ACMP_urem_U (
        .clk(clk),
        .reset(reset),
        .ce(ce),
        .din0(din0),
        .din1(din1),
        .dout(dout));
endmodule 



//-----------------------------------------------------------------------------
//-- SDiv/SRem
//-----------------------------------------------------------------------------
module ACMP_sdivsrem_comb (opcode, din0, din1, dout);
   parameter ID = 0;
   parameter NUM_STAGE = 1;
   parameter din0_WIDTH = 32;
   parameter din1_WIDTH = 32;
   parameter dout_WIDTH = 32;
   input [1:0] opcode;
   input [din0_WIDTH-1:0] din0;
   input [din1_WIDTH-1:0] din1;
   output [dout_WIDTH-1:0] dout;

   AESL_sdivsrem #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
   ACMP_sdivsrem_U (
                    .clk(1'b1),
                    .reset(1'b1),
                    .ce(1'b1),
                    .opcode(opcode[0]), 
                    .din0(din0),
                    .din1(din1),
                    .dout(dout));
endmodule 

module ACMP_sdivsrem (clk, reset, ce, opcode, din0, din1, dout);
   parameter ID = 0;
   parameter NUM_STAGE = 2;
   parameter din0_WIDTH = 32;
   parameter din1_WIDTH = 32;
   parameter dout_WIDTH = 32;
   input     clk, reset, ce;
   input [1:0] opcode;
   input [din0_WIDTH-1:0] din0;
   input [din1_WIDTH-1:0] din1;
   output [dout_WIDTH-1:0] dout;

   AESL_sdivsrem #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
   ACMP_sdivsrem_U (
                    .clk(clk),
                    .reset(reset),
                    .ce(ce),
                    .opcode(opcode[0]), 
                    .din0(din0),
                    .din1(din1),
                    .dout(dout));
endmodule 


//----------------------------------------------------------------------------
//-- UDiv/URem
//----------------------------------------------------------------------------
module ACMP_udivurem_comb (opcode, din0, din1, dout);
   parameter ID = 0;
   parameter NUM_STAGE = 1;
   parameter din0_WIDTH = 32;
   parameter din1_WIDTH = 32;
   parameter dout_WIDTH = 32;
   input [1:0] opcode;
   input [din0_WIDTH-1:0] din0;
   input [din1_WIDTH-1:0] din1;
   output [dout_WIDTH-1:0] dout;

   AESL_udivurem #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
   ACMP_udivurem_U (
                    .clk(1'b1),
                    .reset(1'b1),
                    .ce(1'b1),
                    .opcode(opcode[0]), 
                    .din0(din0),
                    .din1(din1),
                    .dout(dout));
endmodule 

module ACMP_udivurem (clk, reset, ce, opcode, din0, din1, dout);
   parameter ID = 0;
   parameter NUM_STAGE = 2;
   parameter din0_WIDTH = 32;
   parameter din1_WIDTH = 32;
   parameter dout_WIDTH = 32;
   input     clk, reset, ce;
   input [1:0] opcode;
   input [din0_WIDTH-1:0] din0;
   input [din1_WIDTH-1:0] din1;
   output [dout_WIDTH-1:0] dout;

   AESL_udivurem #(NUM_STAGE, din0_WIDTH, din1_WIDTH, dout_WIDTH)
   ACMP_udivurem_U (
                    .clk(clk),
                    .reset(reset),
                    .ce(ce),
                    .opcode(opcode[0]), 
                    .din0(din0),
                    .din1(din1),
                    .dout(dout));
endmodule 

