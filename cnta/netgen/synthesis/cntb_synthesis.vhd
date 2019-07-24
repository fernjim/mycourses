--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: cntb_synthesis.vhd
-- /___/   /\     Timestamp: Fri Feb 22 20:53:13 2019
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm cntb -w -dir netgen/synthesis -ofmt vhdl -sim cntb.ngc cntb_synthesis.vhd 
-- Device	: xc3s50a-5-tq144
-- Input file	: cntb.ngc
-- Output file	: E:\cnta\netgen\synthesis\cntb_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: cntb
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

entity cntb is
  port (
    clk : in STD_LOGIC := 'X'; 
    reset : in STD_LOGIC := 'X'; 
    sw0 : in STD_LOGIC := 'X'; 
    led : out STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end cntb;

architecture Structure of cntb is
  signal N0 : STD_LOGIC; 
  signal N01 : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal N5 : STD_LOGIC; 
  signal Result_0_1 : STD_LOGIC; 
  signal Result_1_1 : STD_LOGIC; 
  signal Result_2_1 : STD_LOGIC; 
  signal Result_3_1 : STD_LOGIC; 
  signal clk_BUFGP_16 : STD_LOGIC; 
  signal delay_cmp_lt0000 : STD_LOGIC; 
  signal pulse_28 : STD_LOGIC; 
  signal pulse_cmp_eq0000_29 : STD_LOGIC; 
  signal reset_IBUF_31 : STD_LOGIC; 
  signal reset_inv : STD_LOGIC; 
  signal sw0_IBUF_34 : STD_LOGIC; 
  signal sw0_inv : STD_LOGIC; 
  signal Mcount_delay_cy : STD_LOGIC_VECTOR ( 3 downto 3 ); 
  signal Result : STD_LOGIC_VECTOR ( 5 downto 0 ); 
  signal delay : STD_LOGIC_VECTOR ( 5 downto 0 ); 
  signal temp : STD_LOGIC_VECTOR ( 3 downto 0 ); 
begin
  XST_GND : GND
    port map (
      G => N0
    );
  pulse : FDSE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_BUFGP_16,
      CE => sw0_inv,
      D => N0,
      S => pulse_cmp_eq0000_29,
      Q => pulse_28
    );
  temp_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => pulse_28,
      CLR => reset_inv,
      D => Result(0),
      Q => temp(0)
    );
  temp_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => pulse_28,
      CLR => reset_inv,
      D => Result(1),
      Q => temp(1)
    );
  temp_2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => pulse_28,
      CLR => reset_inv,
      D => Result(2),
      Q => temp(2)
    );
  temp_3 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => pulse_28,
      CLR => reset_inv,
      D => Result(3),
      Q => temp(3)
    );
  delay_0 : FDRE
    port map (
      C => clk_BUFGP_16,
      CE => delay_cmp_lt0000,
      D => Result_0_1,
      R => sw0_inv,
      Q => delay(0)
    );
  delay_1 : FDRE
    port map (
      C => clk_BUFGP_16,
      CE => delay_cmp_lt0000,
      D => Result_1_1,
      R => sw0_inv,
      Q => delay(1)
    );
  delay_2 : FDRE
    port map (
      C => clk_BUFGP_16,
      CE => delay_cmp_lt0000,
      D => Result_2_1,
      R => sw0_inv,
      Q => delay(2)
    );
  delay_3 : FDRE
    port map (
      C => clk_BUFGP_16,
      CE => delay_cmp_lt0000,
      D => Result_3_1,
      R => sw0_inv,
      Q => delay(3)
    );
  delay_4 : FDRE
    port map (
      C => clk_BUFGP_16,
      CE => delay_cmp_lt0000,
      D => Result(4),
      R => sw0_inv,
      Q => delay(4)
    );
  delay_5 : FDRE
    port map (
      C => clk_BUFGP_16,
      CE => delay_cmp_lt0000,
      D => Result(5),
      R => sw0_inv,
      Q => delay(5)
    );
  Mcount_temp_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => temp(1),
      I1 => temp(0),
      O => Result(1)
    );
  Mcount_delay_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => delay(1),
      I1 => delay(0),
      O => Result_1_1
    );
  Mcount_temp_xor_2_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => temp(2),
      I1 => temp(1),
      I2 => temp(0),
      O => Result(2)
    );
  Mcount_delay_xor_2_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => delay(2),
      I1 => delay(0),
      I2 => delay(1),
      O => Result_2_1
    );
  Mcount_temp_xor_3_11 : LUT4
    generic map(
      INIT => X"6CCC"
    )
    port map (
      I0 => temp(0),
      I1 => temp(3),
      I2 => temp(1),
      I3 => temp(2),
      O => Result(3)
    );
  Mcount_delay_xor_3_11 : LUT4
    generic map(
      INIT => X"6CCC"
    )
    port map (
      I0 => delay(0),
      I1 => delay(3),
      I2 => delay(1),
      I3 => delay(2),
      O => Result_3_1
    );
  delay_cmp_lt00001 : LUT4
    generic map(
      INIT => X"7FFF"
    )
    port map (
      I0 => delay(3),
      I1 => delay(2),
      I2 => delay(1),
      I3 => N01,
      O => delay_cmp_lt0000
    );
  pulse_cmp_eq0000 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => delay(3),
      I1 => delay(2),
      I2 => delay(1),
      I3 => N4,
      O => pulse_cmp_eq0000_29
    );
  Mcount_delay_xor_4_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => delay(4),
      I1 => N5,
      O => Result(4)
    );
  Mcount_delay_xor_5_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => delay(5),
      I1 => delay(4),
      I2 => Mcount_delay_cy(3),
      O => Result(5)
    );
  reset_IBUF : IBUF
    port map (
      I => reset,
      O => reset_IBUF_31
    );
  sw0_IBUF : IBUF
    port map (
      I => sw0,
      O => sw0_IBUF_34
    );
  led_3_OBUF : OBUF
    port map (
      I => temp(3),
      O => led(3)
    );
  led_2_OBUF : OBUF
    port map (
      I => temp(2),
      O => led(2)
    );
  led_1_OBUF : OBUF
    port map (
      I => temp(1),
      O => led(1)
    );
  led_0_OBUF : OBUF
    port map (
      I => temp(0),
      O => led(0)
    );
  clk_BUFGP : BUFGP
    port map (
      I => clk,
      O => clk_BUFGP_16
    );
  reset_inv1_INV_0 : INV
    port map (
      I => reset_IBUF_31,
      O => reset_inv
    );
  sw0_inv1_INV_0 : INV
    port map (
      I => sw0_IBUF_34,
      O => sw0_inv
    );
  Mcount_temp_xor_0_11_INV_0 : INV
    port map (
      I => temp(0),
      O => Result(0)
    );
  Mcount_delay_xor_0_11_INV_0 : INV
    port map (
      I => delay(0),
      O => Result_0_1
    );
  delay_cmp_lt00001_SW0 : LUT3_D
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => delay(5),
      I1 => delay(4),
      I2 => delay(0),
      LO => N4,
      O => N01
    );
  Mcount_delay_cy_3_11 : LUT4_D
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => delay(3),
      I1 => delay(2),
      I2 => delay(1),
      I3 => delay(0),
      LO => N5,
      O => Mcount_delay_cy(3)
    );

end Structure;

