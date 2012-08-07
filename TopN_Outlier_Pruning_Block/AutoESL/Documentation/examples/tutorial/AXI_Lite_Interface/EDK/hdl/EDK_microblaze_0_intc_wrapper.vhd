-------------------------------------------------------------------------------
-- EDK_microblaze_0_intc_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library axi_intc_v1_02_a;
use axi_intc_v1_02_a.all;

entity EDK_microblaze_0_intc_wrapper is
  port (
    S_AXI_ACLK : in std_logic;
    S_AXI_ARESETN : in std_logic;
    S_AXI_AWADDR : in std_logic_vector(31 downto 0);
    S_AXI_AWVALID : in std_logic;
    S_AXI_AWREADY : out std_logic;
    S_AXI_WDATA : in std_logic_vector(31 downto 0);
    S_AXI_WSTRB : in std_logic_vector(3 downto 0);
    S_AXI_WVALID : in std_logic;
    S_AXI_WREADY : out std_logic;
    S_AXI_BRESP : out std_logic_vector(1 downto 0);
    S_AXI_BVALID : out std_logic;
    S_AXI_BREADY : in std_logic;
    S_AXI_ARADDR : in std_logic_vector(31 downto 0);
    S_AXI_ARVALID : in std_logic;
    S_AXI_ARREADY : out std_logic;
    S_AXI_RDATA : out std_logic_vector(31 downto 0);
    S_AXI_RRESP : out std_logic_vector(1 downto 0);
    S_AXI_RVALID : out std_logic;
    S_AXI_RREADY : in std_logic;
    Intr : in std_logic_vector(2 downto 0);
    Processor_clk : in std_logic;
    Processor_rst : in std_logic;
    Irq : out std_logic;
    Interrupt_address : out std_logic_vector(31 downto 0);
    Processor_ack : in std_logic_vector(1 downto 0)
  );

  attribute x_core_info : STRING;
  attribute x_core_info of EDK_microblaze_0_intc_wrapper : entity is "axi_intc_v1_02_a";

end EDK_microblaze_0_intc_wrapper;

architecture STRUCTURE of EDK_microblaze_0_intc_wrapper is

  component axi_intc is
    generic (
      C_FAMILY : STRING;
      C_BASEADDR : std_logic_vector(31 downto 0);
      C_HIGHADDR : std_logic_vector(31 downto 0);
      C_S_AXI_ADDR_WIDTH : INTEGER;
      C_S_AXI_DATA_WIDTH : INTEGER;
      C_NUM_INTR_INPUTS : INTEGER;
      C_KIND_OF_INTR : std_logic_vector(31 downto 0);
      C_KIND_OF_EDGE : std_logic_vector(31 downto 0);
      C_KIND_OF_LVL : std_logic_vector(31 downto 0);
      C_HAS_IPR : INTEGER;
      C_HAS_SIE : INTEGER;
      C_HAS_CIE : INTEGER;
      C_HAS_IVR : INTEGER;
      C_IRQ_IS_LEVEL : INTEGER;
      C_IRQ_ACTIVE : std_logic;
      C_DISABLE_SYNCHRONIZERS : INTEGER;
      C_MB_CLK_NOT_CONNECTED : INTEGER;
      C_HAS_FAST : INTEGER
    );
    port (
      S_AXI_ACLK : in std_logic;
      S_AXI_ARESETN : in std_logic;
      S_AXI_AWADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_AWVALID : in std_logic;
      S_AXI_AWREADY : out std_logic;
      S_AXI_WDATA : in std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      S_AXI_WSTRB : in std_logic_vector(((C_S_AXI_DATA_WIDTH/8)-1) downto 0);
      S_AXI_WVALID : in std_logic;
      S_AXI_WREADY : out std_logic;
      S_AXI_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_BVALID : out std_logic;
      S_AXI_BREADY : in std_logic;
      S_AXI_ARADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_ARVALID : in std_logic;
      S_AXI_ARREADY : out std_logic;
      S_AXI_RDATA : out std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      S_AXI_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_RVALID : out std_logic;
      S_AXI_RREADY : in std_logic;
      Intr : in std_logic_vector((C_NUM_INTR_INPUTS-1) downto 0);
      Processor_clk : in std_logic;
      Processor_rst : in std_logic;
      Irq : out std_logic;
      Interrupt_address : out std_logic_vector(31 downto 0);
      Processor_ack : in std_logic_vector(1 downto 0)
    );
  end component;

begin

  microblaze_0_intc : axi_intc
    generic map (
      C_FAMILY => "spartan6",
      C_BASEADDR => X"41200000",
      C_HIGHADDR => X"4120ffff",
      C_S_AXI_ADDR_WIDTH => 32,
      C_S_AXI_DATA_WIDTH => 32,
      C_NUM_INTR_INPUTS => 3,
      C_KIND_OF_INTR => B"11111111111111111111111111111010",
      C_KIND_OF_EDGE => B"11111111111111111111111111111111",
      C_KIND_OF_LVL => B"11111111111111111111111111111111",
      C_HAS_IPR => 1,
      C_HAS_SIE => 1,
      C_HAS_CIE => 1,
      C_HAS_IVR => 1,
      C_IRQ_IS_LEVEL => 1,
      C_IRQ_ACTIVE => '1',
      C_DISABLE_SYNCHRONIZERS => 1,
      C_MB_CLK_NOT_CONNECTED => 1,
      C_HAS_FAST => 0
    )
    port map (
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARESETN => S_AXI_ARESETN,
      S_AXI_AWADDR => S_AXI_AWADDR,
      S_AXI_AWVALID => S_AXI_AWVALID,
      S_AXI_AWREADY => S_AXI_AWREADY,
      S_AXI_WDATA => S_AXI_WDATA,
      S_AXI_WSTRB => S_AXI_WSTRB,
      S_AXI_WVALID => S_AXI_WVALID,
      S_AXI_WREADY => S_AXI_WREADY,
      S_AXI_BRESP => S_AXI_BRESP,
      S_AXI_BVALID => S_AXI_BVALID,
      S_AXI_BREADY => S_AXI_BREADY,
      S_AXI_ARADDR => S_AXI_ARADDR,
      S_AXI_ARVALID => S_AXI_ARVALID,
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_RDATA => S_AXI_RDATA,
      S_AXI_RRESP => S_AXI_RRESP,
      S_AXI_RVALID => S_AXI_RVALID,
      S_AXI_RREADY => S_AXI_RREADY,
      Intr => Intr,
      Processor_clk => Processor_clk,
      Processor_rst => Processor_rst,
      Irq => Irq,
      Interrupt_address => Interrupt_address,
      Processor_ack => Processor_ack
    );

end architecture STRUCTURE;

