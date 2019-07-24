----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:24:27 02/10/2019 
-- Design Name: 
-- Module Name:    alub - Behavioral 
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
--lesson. Follow my mouse cursor as we go through the code. The Vhdl circuit is a 4 bit ALU 
--(Arithmetic Logic Unit) 

library IEEE;  --The code starts here by adding 3 library files to the Xilinx ide.
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

 entity alub is  --line 28 starts the entity with the name alub
Port ( 
ina : in signed(3 downto 0);       --line 30 is a 4 bit input from the dipswitch called ina 
inb : in signed(3 downto 0);       --line 31 is a 4 bit input from the dipswitch called inb
sel : in STD_LOGIC_VECTOR (2 downto 0);--line 32 is a 3 bit input from an external dipswitch
--called sel. Sel selects the alu functions.                                      
led : out signed(3 downto 0));  --line 34, led is a 4 bit output that goes to led D8, D7, D6, 
--and D5 on the Fpga trainer board
end alub;  --line 36 ends the entity with the name alub

 architecture alua of alub is  --line 38 starts the architecture with the name alua of alub
begin  --line 39 begins the architecture
process(ina, inb, sel)  --line 40 the process inputs are ina, inb, and sel
begin  --line 41 begins the process

case sel is  --line 43, the case statement finds the code for 8 ALU logic functions. The case
--statement looks at the sel input from 3 external dipswitch switches, and compares it to the
--3 bit binary numbers that are attached to each of the 8 case statements below. When it 
--finds a match, it executes that statement. 
when "000" =>  -- line 47 to line 62, The explanation for this code starts at line 72
led <= ina + inb;  --addition
when "001" =>
led <= ina - inb;  --subtraction
when "010" =>
led <= ina - 1;    --subtract 1
when "011" =>
led <= ina + 1;    --add 1
when "100" =>
led <= ina and inb;--AND gate
when "101" =>
led <= ina or inb; --OR gate
when "110" =>
led <= not ina ;   --NOT gate (invert)
when "111" =>
led <= ina xor inb;--XOR gate
when others =>  --line 63 and 64, no other inputs or outputs are allowed with this code
NULL;

end case;  --line 66 ends the case. 

end process;  --line 68 ends the process

end alua;  --line 70 ends the architecture with the name alua

--The ALU has two 4 bit inputs and one 4 bit output. Input inb is, dipswitch switches 1,2,3,4
--and input ina is, dipswitch switches 5,6,7,8. The ALU has 8 functions. The functions are 
-->ina plus inb -> ina minus inb -> ina minus 1 -> ina plus 1 -> ina and inb are anded -> 
-->ina and inb are ored -> ina inverted ->ina and inb are exclusively ored. 3 dipswitches
--on an external board, selects the functions. The results of those functions are sent to 4 
--leds on the Fpga trainer board. To test this circut, choose a number to put in ina and 
--choose another number to put in inb, select a function and look at the led results.


--Lets go to the ucf file so we can see how the inputs and the outputs are connected on the
--Fpga trainer board. 