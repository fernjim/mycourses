--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: hexb_synthesis.vhd
-- /___/   /\     Timestamp: Thu Jan 24 12:57:20 2019
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm hexb -w -dir netgen/synthesis -ofmt vhdl -sim hexb.ngc hexb_synthesis.vhd 
-- Device	: xc3s50a-5-tq144
-- Input file	: hexb.ngc
-- Output file	: E:\hexa\netgen\synthesis\hexb_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: hexb
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity hexb is
  port (
    en : out STD_LOGIC; 
    en1 : out STD_LOGIC; 
    en2 : out STD_LOGIC; 
    ss : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    dips : in STD_LOGIC_VECTOR ( 7 downto 4 ); 
    dip : in STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end hexb;

architecture Structure of hexb is
  signal dip_0_IBUF_4 : STD_LOGIC; 
  signal dip_1_IBUF_5 : STD_LOGIC; 
  signal dip_2_IBUF_6 : STD_LOGIC; 
  signal dip_3_IBUF_7 : STD_LOGIC; 
  signal en2_OBUF_11 : STD_LOGIC; 
  signal ss_0_OBUF_20 : STD_LOGIC; 
  signal ss_1_OBUF_21 : STD_LOGIC; 
  signal ss_2_OBUF_22 : STD_LOGIC; 
  signal ss_3_OBUF_23 : STD_LOGIC; 
  signal ss_4_OBUF_24 : STD_LOGIC; 
  signal ss_5_OBUF_25 : STD_LOGIC; 
  signal ss_6_OBUF_26 : STD_LOGIC; 
  signal ss_7_OBUF_27 : STD_LOGIC; 
begin
  XST_GND : GND
    port map (
      G => en2_OBUF_11
    );
  XST_VCC : VCC
    port map (
      P => ss_7_OBUF_27
    );
  Mrom_ss21 : LUT4
    generic map(
      INIT => X"445C"
    )
    port map (
      I0 => dip_3_IBUF_7,
      I1 => dip_0_IBUF_4,
      I2 => dip_2_IBUF_6,
      I3 => dip_1_IBUF_5,
      O => ss_2_OBUF_22
    );
  Mrom_ss41 : LUT4
    generic map(
      INIT => X"80C2"
    )
    port map (
      I0 => dip_1_IBUF_5,
      I1 => dip_2_IBUF_6,
      I2 => dip_3_IBUF_7,
      I3 => dip_0_IBUF_4,
      O => ss_4_OBUF_24
    );
  Mrom_ss51 : LUT4
    generic map(
      INIT => X"AC48"
    )
    port map (
      I0 => dip_3_IBUF_7,
      I1 => dip_2_IBUF_6,
      I2 => dip_0_IBUF_4,
      I3 => dip_1_IBUF_5,
      O => ss_5_OBUF_25
    );
  Mrom_ss111 : LUT4
    generic map(
      INIT => X"6032"
    )
    port map (
      I0 => dip_1_IBUF_5,
      I1 => dip_3_IBUF_7,
      I2 => dip_0_IBUF_4,
      I3 => dip_2_IBUF_6,
      O => ss_1_OBUF_21
    );
  Mrom_ss11 : LUT4
    generic map(
      INIT => X"0941"
    )
    port map (
      I0 => dip_1_IBUF_5,
      I1 => dip_2_IBUF_6,
      I2 => dip_3_IBUF_7,
      I3 => dip_0_IBUF_4,
      O => ss_0_OBUF_20
    );
  Mrom_ss31 : LUT4
    generic map(
      INIT => X"A118"
    )
    port map (
      I0 => dip_1_IBUF_5,
      I1 => dip_3_IBUF_7,
      I2 => dip_0_IBUF_4,
      I3 => dip_2_IBUF_6,
      O => ss_3_OBUF_23
    );
  Mrom_ss61 : LUT4
    generic map(
      INIT => X"2812"
    )
    port map (
      I0 => dip_0_IBUF_4,
      I1 => dip_1_IBUF_5,
      I2 => dip_2_IBUF_6,
      I3 => dip_3_IBUF_7,
      O => ss_6_OBUF_26
    );
  dip_3_IBUF : IBUF
    port map (
      I => dip(3),
      O => dip_3_IBUF_7
    );
  dip_2_IBUF : IBUF
    port map (
      I => dip(2),
      O => dip_2_IBUF_6
    );
  dip_1_IBUF : IBUF
    port map (
      I => dip(1),
      O => dip_1_IBUF_5
    );
  dip_0_IBUF : IBUF
    port map (
      I => dip(0),
      O => dip_0_IBUF_4
    );
  en_OBUF : OBUF
    port map (
      I => ss_7_OBUF_27,
      O => en
    );
  en1_OBUF : OBUF
    port map (
      I => ss_7_OBUF_27,
      O => en1
    );
  en2_OBUF : OBUF
    port map (
      I => en2_OBUF_11,
      O => en2
    );
  ss_7_OBUF : OBUF
    port map (
      I => ss_7_OBUF_27,
      O => ss(7)
    );
  ss_6_OBUF : OBUF
    port map (
      I => ss_6_OBUF_26,
      O => ss(6)
    );
  ss_5_OBUF : OBUF
    port map (
      I => ss_5_OBUF_25,
      O => ss(5)
    );
  ss_4_OBUF : OBUF
    port map (
      I => ss_4_OBUF_24,
      O => ss(4)
    );
  ss_3_OBUF : OBUF
    port map (
      I => ss_3_OBUF_23,
      O => ss(3)
    );
  ss_2_OBUF : OBUF
    port map (
      I => ss_2_OBUF_22,
      O => ss(2)
    );
  ss_1_OBUF : OBUF
    port map (
      I => ss_1_OBUF_21,
      O => ss(1)
    );
  ss_0_OBUF : OBUF
    port map (
      I => ss_0_OBUF_20,
      O => ss(0)
    );

end Structure;

