----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:36:57 01/06/2019 
-- Design Name: 
-- Module Name:    orb - Behavioral 
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
--lesson. Follow my mouse cursor as we go through the code. This Vhdl code is an orgate

library ieee;  --The code starts here by adding 2 library files to the Xilinx ide.
use ieee.std_logic_1164.all;
 
entity orb is  --line 26 the entity starts here with the name orb
  port (
    sw0    : in  std_logic;  --line 28 and 29 are the orgate inputs called sw0 and sw1
    sw1    : in  std_logic;
    led0 : out std_logic  -- line 30 is a led output called led0
    );
end orb;  --The entity ends with the name orb. The next code is the architecture, the 
--architecture will decide what the inputs and the outputs are going to do.
 architecture ora of orb is  --line 34 starts the architecture with the name ora of orb. You
--can call it any name that you want as long as it is not a code word.
  signal or_gate : std_logic;  --line 36 declares a Signal named or_gate. A signal stores a
--binary '1' or '0', then later, when requested, outputs that stored number.
begin  --line 38 begins our code.
  or_gate   <= sw0 or sw1;  --line 39 let's examine this code. sw0 and sw1 are the orgate
--inputs. The code word -or- in blue, logically ors sw0 with sw1. The (equal to) symbol sends 
--the logic result to the Signal named or_gate.
  led0 <= or_gate;  --line 42 let's examine this code. The or_gate Signal has a stored '1' or
--'0' from the last code. The (equal to) symbol sends the or_gate Signal to led0. Led0 is 
--connected to Led D8 on the Fpga trainer board.
end ora;  --line 44 ends the code with the name ora.

--Let's go to the UCF file to see how the inputs and outputs are connected to the Switches 
--and the Led on the Fpga trainer board.
 