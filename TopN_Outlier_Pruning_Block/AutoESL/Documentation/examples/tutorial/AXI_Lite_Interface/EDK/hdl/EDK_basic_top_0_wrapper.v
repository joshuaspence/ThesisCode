//-----------------------------------------------------------------------------
// EDK_basic_top_0_wrapper.v
//-----------------------------------------------------------------------------

module EDK_basic_top_0_wrapper
  (
    SYS_CLK,
    SYS_RESET,
    s_axi_BUS_A_ACLK,
    s_axi_BUS_A_ARESETN,
    s_axi_BUS_A_AWADDR,
    s_axi_BUS_A_AWVALID,
    s_axi_BUS_A_AWREADY,
    s_axi_BUS_A_WDATA,
    s_axi_BUS_A_WSTRB,
    s_axi_BUS_A_WVALID,
    s_axi_BUS_A_WREADY,
    s_axi_BUS_A_BRESP,
    s_axi_BUS_A_BVALID,
    s_axi_BUS_A_BREADY,
    s_axi_BUS_A_ARADDR,
    s_axi_BUS_A_ARVALID,
    s_axi_BUS_A_ARREADY,
    s_axi_BUS_A_RDATA,
    s_axi_BUS_A_RRESP,
    s_axi_BUS_A_RVALID,
    s_axi_BUS_A_RREADY,
    interrupt
  );
  input SYS_CLK;
  input SYS_RESET;
  input s_axi_BUS_A_ACLK;
  input s_axi_BUS_A_ARESETN;
  input [31:0] s_axi_BUS_A_AWADDR;
  input s_axi_BUS_A_AWVALID;
  output s_axi_BUS_A_AWREADY;
  input [31:0] s_axi_BUS_A_WDATA;
  input [3:0] s_axi_BUS_A_WSTRB;
  input s_axi_BUS_A_WVALID;
  output s_axi_BUS_A_WREADY;
  output [1:0] s_axi_BUS_A_BRESP;
  output s_axi_BUS_A_BVALID;
  input s_axi_BUS_A_BREADY;
  input [31:0] s_axi_BUS_A_ARADDR;
  input s_axi_BUS_A_ARVALID;
  output s_axi_BUS_A_ARREADY;
  output [31:0] s_axi_BUS_A_RDATA;
  output [1:0] s_axi_BUS_A_RRESP;
  output s_axi_BUS_A_RVALID;
  input s_axi_BUS_A_RREADY;
  output interrupt;

  basic_top
    #(
      .RESET_ACTIVE_LOW ( 0 ),
      .C_S_AXI_BUS_A_ADDR_WIDTH ( 32 ),
      .C_S_AXI_BUS_A_DATA_WIDTH ( 32 )
    )
    basic_top_0 (
      .SYS_CLK ( SYS_CLK ),
      .SYS_RESET ( SYS_RESET ),
      .s_axi_BUS_A_ACLK ( s_axi_BUS_A_ACLK ),
      .s_axi_BUS_A_ARESETN ( s_axi_BUS_A_ARESETN ),
      .s_axi_BUS_A_AWADDR ( s_axi_BUS_A_AWADDR ),
      .s_axi_BUS_A_AWVALID ( s_axi_BUS_A_AWVALID ),
      .s_axi_BUS_A_AWREADY ( s_axi_BUS_A_AWREADY ),
      .s_axi_BUS_A_WDATA ( s_axi_BUS_A_WDATA ),
      .s_axi_BUS_A_WSTRB ( s_axi_BUS_A_WSTRB ),
      .s_axi_BUS_A_WVALID ( s_axi_BUS_A_WVALID ),
      .s_axi_BUS_A_WREADY ( s_axi_BUS_A_WREADY ),
      .s_axi_BUS_A_BRESP ( s_axi_BUS_A_BRESP ),
      .s_axi_BUS_A_BVALID ( s_axi_BUS_A_BVALID ),
      .s_axi_BUS_A_BREADY ( s_axi_BUS_A_BREADY ),
      .s_axi_BUS_A_ARADDR ( s_axi_BUS_A_ARADDR ),
      .s_axi_BUS_A_ARVALID ( s_axi_BUS_A_ARVALID ),
      .s_axi_BUS_A_ARREADY ( s_axi_BUS_A_ARREADY ),
      .s_axi_BUS_A_RDATA ( s_axi_BUS_A_RDATA ),
      .s_axi_BUS_A_RRESP ( s_axi_BUS_A_RRESP ),
      .s_axi_BUS_A_RVALID ( s_axi_BUS_A_RVALID ),
      .s_axi_BUS_A_RREADY ( s_axi_BUS_A_RREADY ),
      .interrupt ( interrupt )
    );

endmodule

