----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:36:26 04/26/2019 
-- Design Name: 
-- Module Name:    muxb - Behavioral 
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
--lesson. Follow my mouse cursor as we go through the code. This vhdl code is a 4 bit 2 to 1 
--multiplexer

library IEEE;  --The code starts here by adding 2 library files to the Xilinx ide.
use IEEE.STD_LOGIC_1164.ALL;

entity muxb is --line 27 starts the entity with the name muxb
port(
in0 : in std_logic;  --line 29 to 32, in0 to in3 called bus A are from dipswitches 8 7 6 and 5
in1 : in std_logic;  
in2 : in std_logic;
in3 : in std_logic;
in4 : in std_logic;  --line 33 to 36, in4 to in7 called bus B are from dipswitches 4 3 2 and 1
in5 : in std_logic;  
in6 : in std_logic;
in7 : in std_logic;
out0 : out std_logic;  --line 37, out0 to out3 are 4 output bits that go to Leds D8 to D5 on 
out1 : out std_logic;  --the Fpga trainer board
out2 : out std_logic;  
out3 : out std_logic;  
 ina : in std_logic    --line 41, ina is an input from press switch SW1  
);
end muxb;  --line 43 ends the entity with the name muxb

architecture muxa of muxb is  --line 45 starts the architecture with the names muxa of muxb

begin  --line 47 begins our code
out0 <= in0 when ina = '1' else in4;  --line 48 to line 54, When ina (press switch SW1) is
--pressed in4 to in7 is sent to out0 to out3. When ina (press switch SW1) is 
--not pressed in0 to in3 is sent to out0 to out3. The UCF code connects 
--out0, out1, out2, and out3 to Fpga trainer board leds, D8, D7, D6, and D5. 
out1 <= in1 when ina = '1' else in5;
out2 <= in2 when ina = '1' else in6;
out3 <= in3 when ina = '1' else in7;

end muxa; --line 56 ends the architecture with the name muxa

--To test this circuit, put a binary number into Bus A dipswitches and put a different binary
--number into Bus B dipswitches. Press, press switch SW1 to see the data change from Bus A to
--Bus B.

--Lets go to the UCF file to see how the switches and the leds are connected on the Fpga 
--trainer board

