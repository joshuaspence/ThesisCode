-- ==============================================================
-- File generated by AutoESL - High-Level Synthesis System (C, C++, SystemC)
-- Version: 2012.1
-- Copyright (C) 2012 Xilinx Inc. All rights reserved.
-- 
-- ==============================================================

Library ieee;
use ieee.std_logic_1164.all;

entity distance_squared_grp_fu_219_ACMP_dadd_2 is
    generic (
        ID         : integer := 2;
        NUM_STAGE  : integer := 5;
        din0_WIDTH : integer := 64;
        din1_WIDTH : integer := 64;
        dout_WIDTH : integer := 64
    );
    port (
        clk   : in  std_logic;
        reset : in  std_logic;
        ce    : in  std_logic;
        din0  : in  std_logic_vector(din0_WIDTH-1 downto 0);
        din1  : in  std_logic_vector(din1_WIDTH-1 downto 0);
        dout  : out std_logic_vector(dout_WIDTH-1 downto 0)
    );
end entity;

architecture arch of distance_squared_grp_fu_219_ACMP_dadd_2 is
    --------------------- Component ---------------------
    component distance_squared_ap_dadd_3_full_dsp is
        port (
            aclk                 : in  std_logic;
            aclken               : in  std_logic;
            s_axis_a_tvalid      : in  std_logic;
            s_axis_a_tdata       : in  std_logic_vector(63 downto 0);
            s_axis_b_tvalid      : in  std_logic;
            s_axis_b_tdata       : in  std_logic_vector(63 downto 0);
            m_axis_result_tvalid : out std_logic;
            m_axis_result_tdata  : out std_logic_vector(63 downto 0)
        );
    end component;
    --------------------- Local signal ------------------
    signal aclk      : std_logic;
    signal aclken    : std_logic;
    signal a_tvalid  : std_logic;
    signal a_tdata   : std_logic_vector(63 downto 0);
    signal b_tvalid  : std_logic;
    signal b_tdata   : std_logic_vector(63 downto 0);
    signal r_tvalid  : std_logic;
    signal r_tdata   : std_logic_vector(63 downto 0);
    signal ce_buf1   : std_logic;
    signal din0_buf1 : std_logic_vector(din0_WIDTH-1 downto 0);
    signal din1_buf1 : std_logic_vector(din1_WIDTH-1 downto 0);
begin
    --------------------- Instantiation -----------------
    distance_squared_ap_dadd_3_full_dsp_u : component distance_squared_ap_dadd_3_full_dsp
    port map (
        aclk                 => aclk,
        aclken               => aclken,
        s_axis_a_tvalid      => a_tvalid,
        s_axis_a_tdata       => a_tdata,
        s_axis_b_tvalid      => b_tvalid,
        s_axis_b_tdata       => b_tdata,
        m_axis_result_tvalid => r_tvalid,
        m_axis_result_tdata  => r_tdata
    );

    --------------------- Assignment --------------------
    aclk     <= clk;
    aclken   <= ce_buf1;
    a_tvalid <= '1';
    a_tdata  <= din0_buf1;
    b_tvalid <= '1';
    b_tdata  <= din1_buf1;
    dout     <= r_tdata;

    --------------------- Input buffer ------------------
    process (clk) begin
        if clk'event and clk = '1' then
            ce_buf1   <= ce;
            din0_buf1 <= din0;
            din1_buf1 <= din1;
        end if;
    end process;

end architecture;
