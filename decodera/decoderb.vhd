----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:25:12 05/08/2019 
-- Design Name: 
-- Module Name:    decoderb - Behavioral 
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
--lesson. Follow my mouse cursor as we go through the code. The Vhdl circuit is an 8 bit 
--binary to decimal decoder. 8 binary numbers select 8 decimal outputs.

library IEEE;  --The code starts here by adding 2 library files to the Xilinx ide. 
use IEEE.STD_LOGIC_1164.ALL;

entity decoderb is  --line 27 starts the entity with the name decoderb
port(    
in0 : in std_logic;   --line 29 in0 is an input from dipswitch 8
in1 : in std_logic;   --line 30 in1 is an input from dipswitch 7
in2 : in std_logic;   --line 31 in2 is an input from dipswitch 6
out0 : out std_logic; --line 32 out0 is an output to Led D8 on the Fpga trainer board             
out1 : out std_logic; --line 33 out1 is an output to Led D7 on the Fpga trainer board
out2 : out std_logic; --line 34 out2 is an output to Led D6 on the Fpga trainer board
out3 : out std_logic; --line 35 out3 is an output to Led D5 on the Fpga trainer board
out4 : out std_logic; --line 36 out4 is an output to Led D4 on the Fpga trainer board
out5 : out std_logic; --line 37 out5 is an output to Led D3 on the Fpga trainer board
out6 : out std_logic; --line 38 out6 is an output to Led D2 on the Fpga trainer board
out7 : out std_logic  --line 39 out7 is an output to Led D1 on the Fpga trainer board
);
end decoderb;  --line 41 ends the entity with the name decoderb

architecture decodera of decoderb is--line 43 starts the architecture with the names 
--decodera of decoderb

begin --line 46 begins the architecture

--line 48, A 3 bit binary to decimal decoder inputs 8 binary numbers and converts them to 8 
--decimal outputs. The decoder inputs comes from 3 dipswitches and the decoder outputs go to 
--8 leds. The decoder uses 8, 3 input andgates to do the binary to decimal conversion. The
--andgate codes are listed from line 60 to line 67. in2, in1, and in0 from dipswitches 6, 7, 
--and 8 are the 3 inputs to the andgates. out0 to out7 are the andgate outputs that go to 
--leds D8 to D1. The 3 bit number that you select on the dipswitches goes to all the andgate 
--inputs. The andgates will only output a '1' and turn on a led when all 3 inputs are a '1'. 
--By inverting or not inverting the andgate input code, the dipswitches are able to select 
--the right andgate to output a '1' and turn on a led. The code word 'and' in blue, means 
--logicaly 'and', and the code word 'not' in blue means invert. The decoder inputs are the 
--green 3 bit binary numbers listed on the right side of each andgate code. Each decoder 
--output in black, on the left side of the andgate code, go to each of the leds
out0 <= (not in2) and (not in1) and (not in0);--binary "000" 
out1 <= (not in2) and (not in1) and in0;--------Binary "001"
out2 <= (not in2) and in1 and (not in0);--------Binary "010"
out3 <= (not in2) and in1 and in0;--------------Binary "011"
out4 <= in2 and (not in1) and (not in0);--------Binary "100"
out5 <= in2 and (not in1) and in0;--------------Binary "101"
out6 <= in2 and in1 and (not in0);--------------Binary "110"
out7 <= in2 and in1 and in0;--------------------Binary "111"

end decodera;--line 69 ends the architecture with the name decodera

--This vhdl code is a binary to decimal decoder. When a binary number from 000 to 111 is 
--selected with Dipswitch switchs 6,7,and 8, a decimal output will turn on a Led. To test 
--this circuit select dipswitch switchs 6,7,and 8 in a binary order and watch the decimal
--equivalent Leds on the Fpga trainer board, turn on in a decimal order.

--Let's go to the UCF file to see how out0 to out7 is connected to the 8 Leds and to see how 
--in0, and in1 and in2 are connected to the dipswitches.

