// Version: release . Copyright (C) 2011 XILINX, Inc.

// -------------------------------------------------------------------------------
// -- Add.
// -------------------------------------------------------------------------------
module AESL_Add
#(
parameter
        NUM_STAGE       =       2,
        din0_WIDTH      =       32,
        din1_WIDTH      =       32,
        dout_WIDTH      =       32
)
(
        input                                   clk,
        input                                   reset,
        input                                   ce,
        input           [din0_WIDTH-1:0]        din0,
        input           [din1_WIDTH-1:0]        din1,
        output  wire    [dout_WIDTH-1:0]        dout
);
generate
        if (NUM_STAGE==1)
        begin : comb
                assign  dout = din0 + din1;
        end
        else
        begin : buff
                integer i;
                reg [dout_WIDTH-1:0] dout_buff[NUM_STAGE-2:0];
                assign  dout = dout_buff[NUM_STAGE-2];
                always @(posedge clk)
                begin
                        if (ce)
                        begin
                                for (i=0;i<NUM_STAGE-1;i=i+1)
                                begin
                                        if (i==0)
                                                dout_buff[i] <= din0 + din1;
                                        else
                                                dout_buff[i] <= dout_buff[i-1];
                                end
                        end
                end
        end
endgenerate

endmodule

// -------------------------------------------------------------------------------
// -- Sub.
// -------------------------------------------------------------------------------
module AESL_Sub
#(
parameter
        NUM_STAGE       =       2,
        din0_WIDTH      =       32,
        din1_WIDTH      =       32,
        dout_WIDTH      =       32
)
(
        input                                   clk,
        input                                   reset,
        input                                   ce,
        input           [din0_WIDTH-1:0]        din0,
        input           [din1_WIDTH-1:0]        din1,
        output  wire    [dout_WIDTH-1:0]        dout
);
generate
        if (NUM_STAGE==1)
        begin : comb
                assign  dout = din0 - din1;
        end
        else
        begin : buff
                integer i;
                reg [dout_WIDTH-1:0] dout_buff[NUM_STAGE-2:0];
                assign  dout = dout_buff[NUM_STAGE-2];
                always @(posedge clk)
                begin
                        if (ce)
                        begin
                                for (i=0;i<NUM_STAGE-1;i=i+1)
                                begin
                                        if (i==0)
                                                dout_buff[i] <= din0 - din1;
                                        else
                                                dout_buff[i] <= dout_buff[i-1];
                                end
                        end
                end
        end
endgenerate

endmodule

// -------------------------------------------------------------------------------
// -- Mul.
// -------------------------------------------------------------------------------
module AESL_Mul_ss
#(
parameter
        NUM_STAGE       =       2,
        din0_WIDTH      =       32,
        din1_WIDTH      =       32,
        dout_WIDTH      =       32
)
(
        input                                   clk,
        input                                   reset,
        input                                   ce,
        input           [din0_WIDTH-1:0]        din0,
        input           [din1_WIDTH-1:0]        din1,
        output  wire    [dout_WIDTH-1:0]        dout
);
wire signed [din0_WIDTH:0] a;
wire signed [din1_WIDTH:0] b;
assign a = {din0[din0_WIDTH-1], din0};
assign b = {din1[din1_WIDTH-1], din1};
generate
        if (NUM_STAGE==1)
        begin : comb
                assign  dout = a * b;
        end
        else
        begin : buff
                integer i;
                reg [dout_WIDTH-1:0] dout_buff[NUM_STAGE-2:0];
                assign  dout = dout_buff[NUM_STAGE-2];
                always @(posedge clk)
                begin
                        if (ce)
                        begin
                                for (i=0;i<NUM_STAGE-1;i=i+1)
                                begin
                                        if (i==0)
                                                dout_buff[i] <= a * b;
                                        else
                                                dout_buff[i] <= dout_buff[i-1];
                                end
                        end
                end
        end
endgenerate

endmodule

module AESL_Mul_us
#(
parameter
        NUM_STAGE       =       2,
        din0_WIDTH      =       32,
        din1_WIDTH      =       32,
        dout_WIDTH      =       32
)
(
        input                                   clk,
        input                                   reset,
        input                                   ce,
        input           [din0_WIDTH-1:0]        din0,
        input           [din1_WIDTH-1:0]        din1,
        output  wire    [dout_WIDTH-1:0]        dout
);
wire signed [din0_WIDTH:0] a;
wire signed [din1_WIDTH:0] b;
assign a = {1'b0,               din0};
assign b = {din1[din1_WIDTH-1], din1};
generate
        if (NUM_STAGE==1)
        begin : comb
                assign  dout = a * b;
        end
        else
        begin : buff
                integer i;
                reg [dout_WIDTH-1:0] dout_buff[NUM_STAGE-2:0];
                assign  dout = dout_buff[NUM_STAGE-2];
                always @(posedge clk)
                begin
                        if (ce)
                        begin
                                for (i=0;i<NUM_STAGE-1;i=i+1)
                                begin
                                        if (i==0)
                                                dout_buff[i] <= a * b;
                                        else
                                                dout_buff[i] <= dout_buff[i-1];
                                end
                        end
                end
        end
endgenerate

endmodule

module AESL_Mul_su
#(
parameter
        NUM_STAGE       =       2,
        din0_WIDTH      =       32,
        din1_WIDTH      =       32,
        dout_WIDTH      =       32
)
(
        input                                   clk,
        input                                   reset,
        input                                   ce,
        input           [din0_WIDTH-1:0]        din0,
        input           [din1_WIDTH-1:0]        din1,
        output  wire    [dout_WIDTH-1:0]        dout
);
wire signed [din0_WIDTH:0] a;
wire signed [din1_WIDTH:0] b;
assign a = {din0[din0_WIDTH-1], din0};
assign b = {1'b0              , din1};
generate
        if (NUM_STAGE==1)
        begin : comb
                assign  dout = a * b;
        end
        else
        begin : buff
                integer i;
                reg [dout_WIDTH-1:0] dout_buff[NUM_STAGE-2:0];
                assign  dout = dout_buff[NUM_STAGE-2];
                always @(posedge clk)
                begin
                        if (ce)
                        begin
                                for (i=0;i<NUM_STAGE-1;i=i+1)
                                begin
                                        if (i==0)
                                                dout_buff[i] <= a * b;
                                        else
                                                dout_buff[i] <= dout_buff[i-1];
                                end
                        end
                end
        end
endgenerate

endmodule

module AESL_Mul_uu
#(
parameter
        NUM_STAGE       =       2,
        din0_WIDTH      =       32,
        din1_WIDTH      =       32,
        dout_WIDTH      =       32
)
(
        input                                   clk,
        input                                   reset,
        input                                   ce,
        input           [din0_WIDTH-1:0]        din0,
        input           [din1_WIDTH-1:0]        din1,
        output  wire    [dout_WIDTH-1:0]        dout
);
generate
        if (NUM_STAGE==1)
        begin : comb
                assign  dout = din0 * din1;
        end
        else
        begin : buff
                integer i;
                reg [dout_WIDTH-1:0] dout_buff[NUM_STAGE-2:0];
                assign  dout = dout_buff[NUM_STAGE-2];
                always @(posedge clk)
                begin
                        if (ce)
                        begin
                                for (i=0;i<NUM_STAGE-1;i=i+1)
                                begin
                                        if (i==0)
                                                dout_buff[i] <= din0 * din1;
                                        else
                                                dout_buff[i] <= dout_buff[i-1];
                                end
                        end
                end
        end
endgenerate

endmodule

// -------------------------------------------------------------------------------
// -- SDivide.
// -------------------------------------------------------------------------------
module AESL_sdiv
#(
parameter
        NUM_STAGE       =       2,
        din0_WIDTH      =       32,
        din1_WIDTH      =       32,
        dout_WIDTH      =       32
)
(
        input                                   clk,
        input                                   reset,
        input                                   ce,
        input           [din0_WIDTH-1:0]        din0,
        input           [din1_WIDTH-1:0]        din1,
        output  wire    [dout_WIDTH-1:0]        dout
);
wire signed [din0_WIDTH:0] a;
wire signed [din1_WIDTH:0] b;
assign a = {din0[din0_WIDTH-1], din0};
assign b = {din1[din1_WIDTH-1], din1};
generate
        if (NUM_STAGE==1)
        begin : comb
                assign  dout = a / b;
        end
        else
        begin : buff
                integer i;
                reg [dout_WIDTH-1:0] dout_buff[NUM_STAGE-2:0];
                assign  dout = dout_buff[NUM_STAGE-2];
                always @(posedge clk)
                begin
                        if (ce)
                        begin
                                for (i=0;i<NUM_STAGE-1;i=i+1)
                                begin
                                        if (i==0)
                                                dout_buff[i] <= a / b;
                                        else
                                                dout_buff[i] <= dout_buff[i-1];
                                end
                        end
                end
        end
endgenerate

endmodule

//-------------------------------------------------------------------------------
//-- UDivide.
//-------------------------------------------------------------------------------
module AESL_udiv
#(
parameter
        NUM_STAGE       =       2,
        din0_WIDTH      =       32,
        din1_WIDTH      =       32,
        dout_WIDTH      =       32
)
(
        input                                   clk,
        input                                   reset,
        input                                   ce,
        input           [din0_WIDTH-1:0]        din0,
        input           [din1_WIDTH-1:0]        din1,
        output  wire    [dout_WIDTH-1:0]        dout
);
generate
        if (NUM_STAGE==1)
        begin : comb
                assign  dout = din0 / din1;
        end
        else
        begin : buff
                integer i;
                reg [dout_WIDTH-1:0] dout_buff[NUM_STAGE-2:0];
                assign  dout = dout_buff[NUM_STAGE-2];
                always @(posedge clk)
                begin
                        if (ce)
                        begin
                                for (i=0;i<NUM_STAGE-1;i=i+1)
                                begin
                                        if (i==0)
                                                dout_buff[i] <= din0 / din1;
                                        else
                                                dout_buff[i] <= dout_buff[i-1];
                                end
                        end
                end
        end
endgenerate

endmodule

// -------------------------------------------------------------------------------
// -- SRem
// -------------------------------------------------------------------------------
module AESL_srem
#(
parameter
        NUM_STAGE       =       2,
        din0_WIDTH      =       32,
        din1_WIDTH      =       32,
        dout_WIDTH      =       32
)
(
        input                                   clk,
        input                                   reset,
        input                                   ce,
        input           [din0_WIDTH-1:0]        din0,
        input           [din1_WIDTH-1:0]        din1,
        output  wire    [dout_WIDTH-1:0]        dout
);
wire signed [din0_WIDTH:0] a;
wire signed [din1_WIDTH:0] b;
assign a = {din0[din0_WIDTH-1], din0};
assign b = {din1[din1_WIDTH-1], din1};
generate
        if (NUM_STAGE==1)
        begin : comb
                assign  dout = a % b;
        end
        else
        begin : buff
                integer i;
                reg [dout_WIDTH-1:0] dout_buff[NUM_STAGE-2:0];
                assign  dout = dout_buff[NUM_STAGE-2];
                always @(posedge clk)
                begin
                        if (ce)
                        begin
                                for (i=0;i<NUM_STAGE-1;i=i+1)
                                begin
                                        if (i==0)
                                                dout_buff[i] <= a % b;
                                        else
                                                dout_buff[i] <= dout_buff[i-1];
                                end
                        end
                end
        end
endgenerate

endmodule


// -------------------------------------------------------------------------------
// -- URem
// -------------------------------------------------------------------------------
module AESL_urem
#(
parameter
        NUM_STAGE       =       2,
        din0_WIDTH      =       32,
        din1_WIDTH      =       32,
        dout_WIDTH      =       32
)
(
        input                                   clk,
        input                                   reset,
        input                                   ce,
        input           [din0_WIDTH-1:0]        din0,
        input           [din1_WIDTH-1:0]        din1,
        output  wire    [dout_WIDTH-1:0]        dout
);
generate
        if (NUM_STAGE==1)
        begin : comb
                assign  dout = din0 % din1;
        end
        else
        begin : buff
                integer i;
                reg [dout_WIDTH-1:0] dout_buff[NUM_STAGE-2:0];
                assign  dout = dout_buff[NUM_STAGE-2];
                always @(posedge clk)
                begin
                        if (ce)
                        begin
                                for (i=0;i<NUM_STAGE-1;i=i+1)
                                begin
                                        if (i==0)
                                                dout_buff[i] <= din0 % din1;
                                        else
                                                dout_buff[i] <= dout_buff[i-1];
                                end
                        end
                end
        end
endgenerate

endmodule

// -------------------------------------------------------------------------------
// -- SDiv/SRem
// -------------------------------------------------------------------------------
module AESL_sdivsrem
#(
parameter
        NUM_STAGE       =       2,
        din0_WIDTH      =       32,
        din1_WIDTH      =       32,
        dout_WIDTH      =       32
)
(
        input                                   clk,
        input                                   reset,
        input                                   ce,
        input                                   opcode,
        input           [din0_WIDTH-1:0]        din0,
        input           [din1_WIDTH-1:0]        din1,
        output  wire    [dout_WIDTH-1:0]        dout
);
wire signed [din0_WIDTH:0] a;
wire signed [din1_WIDTH:0] b;
assign a = {din0[din0_WIDTH-1], din0};
assign b = {din1[din1_WIDTH-1], din1};
generate
        if (NUM_STAGE==1)
        begin : comb
                assign  dout = opcode? a % b :
                                       a / b;
        end
        else
        begin : buff
                integer i;
                reg [dout_WIDTH-1:0] dout_buff[NUM_STAGE-2:0];
                assign  dout = dout_buff[NUM_STAGE-2];
                always @(posedge clk)
                begin
                        if (ce)
                        begin
                                for (i=0;i<NUM_STAGE-1;i=i+1)
                                begin
                                        if (i==0)
                                                dout_buff[i] <= opcode? a % b :
                                                                        a / b;
                                        else
                                                dout_buff[i] <= dout_buff[i-1];
                                end
                        end
                end
        end
endgenerate

endmodule

// -------------------------------------------------------------------------------
// -- UDiv/URem
// -------------------------------------------------------------------------------
module AESL_udivurem
#(
parameter
        NUM_STAGE       =       2,
        din0_WIDTH      =       32,
        din1_WIDTH      =       32,
        dout_WIDTH      =       32
)
(
        input                                   clk,
        input                                   reset,
        input                                   ce,
        input                                   opcode,
        input           [din0_WIDTH-1:0]        din0,
        input           [din1_WIDTH-1:0]        din1,
        output  wire    [dout_WIDTH-1:0]        dout
);
generate
        if (NUM_STAGE==1)
        begin : comb
                assign  dout = opcode? din0 % din1 :
                                       din0 / din1;
        end
        else
        begin : buff
                integer i;
                reg [dout_WIDTH-1:0] dout_buff[NUM_STAGE-2:0];
                assign  dout = dout_buff[NUM_STAGE-2];
                always @(posedge clk)
                begin
                        if (ce)
                        begin
                                for (i=0;i<NUM_STAGE-1;i=i+1)
                                begin
                                        if (i==0)
                                                dout_buff[i] <= opcode? din0 % din1 :
                                                                        din0 / din1;
                                        else
                                                dout_buff[i] <= dout_buff[i-1];
                                end
                        end
                end
        end
endgenerate

endmodule

