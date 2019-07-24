----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:23:28 01/23/2019 
-- Design Name: 
-- Module Name:    hexb - Behavioral 
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
--lesson. Follow my mouse cursor as we go through the code. This Vhdl circuit is a 7 segment 
--display.

library IEEE;  --The code starts here by adding 2 library files to the Xilinx ide.
use IEEE.STD_LOGIC_1164.ALL;

entity hexb is --line 27 starts the entity with the name hexb
    Port ( 
	        dip :in std_logic_vector (3 downto 0);  --line 29 dip is a 4 bit input from  
--dipswitch 5, 6, 7, and 8
	         ss : out  STD_LOGIC_VECTOR (7 downto 0); --line 31 ss has 8 output bits that go 
--to each of the segments
			   en : out std_logic;--line 33, 34, 35 enables only one 7 segment display to turn on
			  en1 : out std_logic;
			  en2 : out std_logic
			  );
end hexb;  --line 37 ends the entity with the name hexb

architecture hexa of hexb is  --line 39 starts the architecture with the names hexa of hexb
begin  --line 40 begins the code	
	with dip select
		ss(7 downto 0) <= --line 42 to line 64, 4 dip inputs from dipswitches 5, 6, 7, and 8 
--can select and display 16 different hexadecimal numbers on the 7 segment display. The 
--binary number that is selected with the 4 dipswitches will match one of the 16, 4 bit 
--binary numbers that are listed below. The line of code that matches the 4 bit number has a 
--8 bit binary number attached to it called ss. Each ss bit is connected to the negative side 
--of each segment. The bits that are a '0', turn on a led segment and the bits that are a '1' 
--turn off a led segment. The positive side of all the segments are connected to 3.3 volts   
  		 "10000001" when "0000", --0 --The green hex numbers and letters that you see here, will		 
		 "11001111" when "0001", --1 --be displayed on the 7 segment display
		 "10010010" when "0010", --2
		 "10000110" when "0011", --3
		 "11001100" when "0100", --4
		 "10100100" when "0101", --5 
		 "10100000" when "0110", --6
		 "10001111" when "0111", --7 
		 "10000000" when "1000", --8
		 "10000100" when "1001", --9
		 "10001000" when "1010", --A
		 "11100000" when "1011", --B
		 "10110001" when "1100", --C
		 "11000010" when "1101", --D
		 "10110000" when "1110", --E
		 "10111000" when "1111", --F
	    "11111111" when others; --line 65 All other inputs and outputs are turned off 
	     
		 en  <= '1';  --line 67 to line 70, this combination of binary numbers enables only one 
		              --7 segment display, to turn on.
	    en1 <= '1';
	    en2 <= '0';
	 
	end hexa  --line 72 ends the architecture with the name hexa

--Let's go to the UCF file to see how the inputs and the ss outputs are connected to 
--the dipswitches and the segments on the 7 segment display.