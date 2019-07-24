----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:49:27 01/29/2019 
-- Design Name: 
-- Module Name:    regb - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Here is the Xilinx ide. It has already been opened up with the files that you need for this
--lesson. Follow my mouse cursor as we go through the code. This Vhdl circuit is an 8 bit 
--register

library IEEE;  --The code starts here by adding 3 library files to the Xilinx ide.
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

ENTITY regb IS  --line 28 starts the entity with the name regb 
PORT(
  dipsw : IN STD_LOGIC_vector (7 downto 0); --line 30 dipsw is an 8 bit input from the 
--dipswitch
  load  : IN STD_LOGIC;                     --line 32 load is an input from press switch SW2 
  clk   : IN STD_LOGIC;                     --line 33 is a clock input called clk
  led   : out std_logic_vector (7 downto 0) --line 34 led is an 8 bit output that goes to 8 
--leds on the Fpga trainer board
);
END regb;  --line 37 ends the entity with the name regb

ARCHITECTURE rega OF regb IS  --line 39 starts the architecture with the names rega of regb
signal temp :std_logic_vector (7 downto 0); --line 40 is a 8 bit signal called temp
BEGIN  --line 41 begins the process code
    process(clk,load) --line 42, clk and load are the process inputs
    begin  --line 43 begins our process code. Line 44 to line 46 will be explained.
       if rising_edge(clk) then --When clk (the clock) has a rising edge
            if load = '0' then  --and the load switch (press switch SW2) is pressed 
                temp <= dipsw;  --the binary information from 8 dipswitches, are sent to					 					 
					                 --the 8 bit temp signal.
            end if;  --line 48 and 49 ends if and line 50 ends the process
        end if;
    end process;
   led  <= temp;  --line 51, The 8 bit temp signal is sent to the 8 bit output called led.
	--The UCF file connects the 8 led output bits to Leds D8 to D1 on the Fpga trainer board. 
   end rega; --line 53 ends the architecture with the name rega

--This vhdl code is an 8 bit register. Registers are used in computers to temporally store a 
--number. Dipswitch switches 1 to 8 selects a binary number and pressing switch SW2 loads the
--number into the 8 bit register. Leds D8 to D1 displays the number on the Fpga trainer board. 
 
--I am going to the UCF file to show you how the inputs and the outputs are connected on the
--Fpga trainer board. 