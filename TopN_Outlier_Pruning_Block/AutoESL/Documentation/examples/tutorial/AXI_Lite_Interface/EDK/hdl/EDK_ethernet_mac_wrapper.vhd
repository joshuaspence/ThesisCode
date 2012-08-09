-------------------------------------------------------------------------------
-- EDK_ethernet_mac_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library axi_ethernetlite_v1_01_b;
use axi_ethernetlite_v1_01_b.all;

entity EDK_ethernet_mac_wrapper is
  port (
    S_AXI_ACLK : in std_logic;
    S_AXI_ARESETN : in std_logic;
    IP2INTC_Irpt : out std_logic;
    S_AXI_AWID : in std_logic_vector(0 downto 0);
    S_AXI_AWADDR : in std_logic_vector(31 downto 0);
    S_AXI_AWLEN : in std_logic_vector(7 downto 0);
    S_AXI_AWSIZE : in std_logic_vector(2 downto 0);
    S_AXI_AWBURST : in std_logic_vector(1 downto 0);
    S_AXI_AWCACHE : in std_logic_vector(3 downto 0);
    S_AXI_AWVALID : in std_logic;
    S_AXI_AWREADY : out std_logic;
    S_AXI_WDATA : in std_logic_vector(31 downto 0);
    S_AXI_WSTRB : in std_logic_vector(3 downto 0);
    S_AXI_WLAST : in std_logic;
    S_AXI_WVALID : in std_logic;
    S_AXI_WREADY : out std_logic;
    S_AXI_BID : out std_logic_vector(0 downto 0);
    S_AXI_BRESP : out std_logic_vector(1 downto 0);
    S_AXI_BVALID : out std_logic;
    S_AXI_BREADY : in std_logic;
    S_AXI_ARID : in std_logic_vector(0 downto 0);
    S_AXI_ARADDR : in std_logic_vector(31 downto 0);
    S_AXI_ARLEN : in std_logic_vector(7 downto 0);
    S_AXI_ARSIZE : in std_logic_vector(2 downto 0);
    S_AXI_ARBURST : in std_logic_vector(1 downto 0);
    S_AXI_ARCACHE : in std_logic_vector(3 downto 0);
    S_AXI_ARVALID : in std_logic;
    S_AXI_ARREADY : out std_logic;
    S_AXI_RID : out std_logic_vector(0 downto 0);
    S_AXI_RDATA : out std_logic_vector(31 downto 0);
    S_AXI_RRESP : out std_logic_vector(1 downto 0);
    S_AXI_RLAST : out std_logic;
    S_AXI_RVALID : out std_logic;
    S_AXI_RREADY : in std_logic;
    PHY_tx_clk : in std_logic;
    PHY_rx_clk : in std_logic;
    PHY_crs : in std_logic;
    PHY_dv : in std_logic;
    PHY_rx_data : in std_logic_vector(3 downto 0);
    PHY_col : in std_logic;
    PHY_rx_er : in std_logic;
    PHY_rst_n : out std_logic;
    PHY_tx_en : out std_logic;
    PHY_tx_data : out std_logic_vector(3 downto 0);
    PHY_MDC : out std_logic;
    PHY_MDIO_I : in std_logic;
    PHY_MDIO_O : out std_logic;
    PHY_MDIO_T : out std_logic
  );

  attribute x_core_info : STRING;
  attribute x_core_info of EDK_ethernet_mac_wrapper : entity is "axi_ethernetlite_v1_01_b";

end EDK_ethernet_mac_wrapper;

architecture STRUCTURE of EDK_ethernet_mac_wrapper is

  component axi_ethernetlite is
    generic (
      C_FAMILY : STRING;
      C_BASEADDR : std_logic_vector;
      C_HIGHADDR : std_logic_vector;
      C_S_AXI_ACLK_PERIOD_PS : INTEGER;
      C_S_AXI_ADDR_WIDTH : INTEGER;
      C_S_AXI_DATA_WIDTH : INTEGER;
      C_S_AXI_ID_WIDTH : INTEGER;
      C_INCLUDE_MDIO : INTEGER;
      C_INCLUDE_GLOBAL_BUFFERS : INTEGER;
      C_INCLUDE_INTERNAL_LOOPBACK : INTEGER;
      C_DUPLEX : INTEGER;
      C_TX_PING_PONG : INTEGER;
      C_RX_PING_PONG : INTEGER
    );
    port (
      S_AXI_ACLK : in std_logic;
      S_AXI_ARESETN : in std_logic;
      IP2INTC_Irpt : out std_logic;
      S_AXI_AWID : in std_logic_vector((C_S_AXI_ID_WIDTH-1) downto 0);
      S_AXI_AWADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_AWLEN : in std_logic_vector(7 downto 0);
      S_AXI_AWSIZE : in std_logic_vector(2 downto 0);
      S_AXI_AWBURST : in std_logic_vector(1 downto 0);
      S_AXI_AWCACHE : in std_logic_vector(3 downto 0);
      S_AXI_AWVALID : in std_logic;
      S_AXI_AWREADY : out std_logic;
      S_AXI_WDATA : in std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      S_AXI_WSTRB : in std_logic_vector(((C_S_AXI_DATA_WIDTH/8)-1) downto 0);
      S_AXI_WLAST : in std_logic;
      S_AXI_WVALID : in std_logic;
      S_AXI_WREADY : out std_logic;
      S_AXI_BID : out std_logic_vector((C_S_AXI_ID_WIDTH-1) downto 0);
      S_AXI_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_BVALID : out std_logic;
      S_AXI_BREADY : in std_logic;
      S_AXI_ARID : in std_logic_vector((C_S_AXI_ID_WIDTH-1) downto 0);
      S_AXI_ARADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_ARLEN : in std_logic_vector(7 downto 0);
      S_AXI_ARSIZE : in std_logic_vector(2 downto 0);
      S_AXI_ARBURST : in std_logic_vector(1 downto 0);
      S_AXI_ARCACHE : in std_logic_vector(3 downto 0);
      S_AXI_ARVALID : in std_logic;
      S_AXI_ARREADY : out std_logic;
      S_AXI_RID : out std_logic_vector((C_S_AXI_ID_WIDTH-1) downto 0);
      S_AXI_RDATA : out std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      S_AXI_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_RLAST : out std_logic;
      S_AXI_RVALID : out std_logic;
      S_AXI_RREADY : in std_logic;
      PHY_tx_clk : in std_logic;
      PHY_rx_clk : in std_logic;
      PHY_crs : in std_logic;
      PHY_dv : in std_logic;
      PHY_rx_data : in std_logic_vector(3 downto 0);
      PHY_col : in std_logic;
      PHY_rx_er : in std_logic;
      PHY_rst_n : out std_logic;
      PHY_tx_en : out std_logic;
      PHY_tx_data : out std_logic_vector(3 downto 0);
      PHY_MDC : out std_logic;
      PHY_MDIO_I : in std_logic;
      PHY_MDIO_O : out std_logic;
      PHY_MDIO_T : out std_logic
    );
  end component;

begin

  Ethernet_MAC : axi_ethernetlite
    generic map (
      C_FAMILY => "spartan6",
      C_BASEADDR => X"40e00000",
      C_HIGHADDR => X"40e0ffff",
      C_S_AXI_ACLK_PERIOD_PS => 10000,
      C_S_AXI_ADDR_WIDTH => 32,
      C_S_AXI_DATA_WIDTH => 32,
      C_S_AXI_ID_WIDTH => 1,
      C_INCLUDE_MDIO => 1,
      C_INCLUDE_GLOBAL_BUFFERS => 0,
      C_INCLUDE_INTERNAL_LOOPBACK => 0,
      C_DUPLEX => 1,
      C_TX_PING_PONG => 0,
      C_RX_PING_PONG => 0
    )
    port map (
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARESETN => S_AXI_ARESETN,
      IP2INTC_Irpt => IP2INTC_Irpt,
      S_AXI_AWID => S_AXI_AWID,
      S_AXI_AWADDR => S_AXI_AWADDR,
      S_AXI_AWLEN => S_AXI_AWLEN,
      S_AXI_AWSIZE => S_AXI_AWSIZE,
      S_AXI_AWBURST => S_AXI_AWBURST,
      S_AXI_AWCACHE => S_AXI_AWCACHE,
      S_AXI_AWVALID => S_AXI_AWVALID,
      S_AXI_AWREADY => S_AXI_AWREADY,
      S_AXI_WDATA => S_AXI_WDATA,
      S_AXI_WSTRB => S_AXI_WSTRB,
      S_AXI_WLAST => S_AXI_WLAST,
      S_AXI_WVALID => S_AXI_WVALID,
      S_AXI_WREADY => S_AXI_WREADY,
      S_AXI_BID => S_AXI_BID,
      S_AXI_BRESP => S_AXI_BRESP,
      S_AXI_BVALID => S_AXI_BVALID,
      S_AXI_BREADY => S_AXI_BREADY,
      S_AXI_ARID => S_AXI_ARID,
      S_AXI_ARADDR => S_AXI_ARADDR,
      S_AXI_ARLEN => S_AXI_ARLEN,
      S_AXI_ARSIZE => S_AXI_ARSIZE,
      S_AXI_ARBURST => S_AXI_ARBURST,
      S_AXI_ARCACHE => S_AXI_ARCACHE,
      S_AXI_ARVALID => S_AXI_ARVALID,
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_RID => S_AXI_RID,
      S_AXI_RDATA => S_AXI_RDATA,
      S_AXI_RRESP => S_AXI_RRESP,
      S_AXI_RLAST => S_AXI_RLAST,
      S_AXI_RVALID => S_AXI_RVALID,
      S_AXI_RREADY => S_AXI_RREADY,
      PHY_tx_clk => PHY_tx_clk,
      PHY_rx_clk => PHY_rx_clk,
      PHY_crs => PHY_crs,
      PHY_dv => PHY_dv,
      PHY_rx_data => PHY_rx_data,
      PHY_col => PHY_col,
      PHY_rx_er => PHY_rx_er,
      PHY_rst_n => PHY_rst_n,
      PHY_tx_en => PHY_tx_en,
      PHY_tx_data => PHY_tx_data,
      PHY_MDC => PHY_MDC,
      PHY_MDIO_I => PHY_MDIO_I,
      PHY_MDIO_O => PHY_MDIO_O,
      PHY_MDIO_T => PHY_MDIO_T
    );

end architecture STRUCTURE;

