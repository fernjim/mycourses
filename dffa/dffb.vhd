----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:08:51 01/21/2019 
-- Design Name: 
-- Module Name:    dffb - Behavioral 
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
--lesson. Follow my mouse cursor as we go through the code. The Vhdl circuit is a D FLIP-FLOP.

library ieee ;  --The code starts here by adding 3 library files to the Xilinx ide.
use ieee.std_logic_1164.all;
use work.all;

entity dffb is  --line 27 starts the entity with the name dffb
port(	
sw0 :in std_logic;  --line 29 sw0 is an input from dipswitch 8 
PSW1: in std_logic; --line 30 PSW1 is an input from press switch SW1
clk :in std_logic;  --line 31 clk is a clock input
out0: out std_logic --line 32 out0 is an output that goes to Led D8 on the Fpga trainer board
);
end dffb;  --line 34 ends the entity with the name dffb

architecture dffa of dffb is  --line 36 starts the architecture with the names dffa of dffb
begin  --line 37 begins the code
   process(clk, PSW1)  --line 38 clk and PSW1 are the process inputs 
   begin  --line 39 begins the process
   if PSW1= '0' then--line 40, 44, and 45. When PSW1 changes to a '0' (SW1 got pressed)
--and there is a rising clock (clk), sw0, (Dip switch 8) is sent to out0. sw0 and out0 are 
--sent to the UCF file where sw0 is connected to dipswitch 8 and out0 is connected to 
--led D8, on the Fpga trainer board.
	if rising_edge (clk) then
	out0 <= sw0;
 	end if; --line 46 and 47 ends if and line 49 ends the process
	end if;
   
   end process;	

end dffa;  --line 51 ends the architecture with the name dffa


--Let's go to the UCF file to see how the inputs and outputs are connected to the switches 
--and the Leds on the Fpga trainer board.

--Click on the UCF file here

  