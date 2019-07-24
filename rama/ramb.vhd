----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:21:16 01/22/2019 
-- Design Name: 
-- Module Name:    ramb - Behavioral 
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
--lesson. Follow my mouse cursor as we go through the code. This Vhdl circuit is a Ram

library IEEE; -- The code starts here by adding 2 library files to the Xilinx ide
use IEEE.numeric_bit.all; 
 
entity ramb is  --line 26 starts the entity with the name ramb
   port (                  
addr : in unsigned (2 downto 0);     --line 28 addr is a 3 bit binary address input from the 
--dipswitch
clk : in bit;                        --line 30 is a clock input called clk         
memwrite: in bit;                    --line 31 memwrite is an input from press switch SW1
din : in unsigned (3 downto 0);      --line 32 din is a 4 data bit input from the dipswitch
outled : out unsigned (3 downto 0)   --line 33 outled is a 4 bit output that goes to 4 leds on
--the Fpga trainer board
); 

end ramb;  --line 37 ends the entity with the name ramb 
 
architecture rama of ramb is  --line 39 starts the architecture with the names rama of ramb 
 
type ram is array (0 to 7) of unsigned(3 downto 0); --line 41 declares a 4 data bit Ram that
--has 3 address bits and 8 addresses     
signal datamem: ram;  --line 43 is a 4 bit ram signal called datamem. The datamem signal is
--the ram
begin  --line 45 begins the process 
 process(clk,addr)  --line 46, clk and addr are the process inputs      
	 begin  --line 47 begins the process. Line 48 to line 50 is explained next      
	 if clk'event and clk = '1' then        --if there is a clock event and clk is a '1'
    if memwrite = '0' then                --and memwrite (press switch SW1) has been pressed
	 datamem (to_integer (addr)) <= din; --the data bit information from dipswitches 5, 6, 7, 
--and 8 are written into the datamem signal Ram at the selected addr address location
	  end if;  --line 52 ends if
	  outled <= datamem (to_integer (addr)); --line 53, at the addr address location, 4 data 
--bits from the datamem signal ram are sent to the 4 outled output bits. The 4 outled output 
--bits are sent to 4 leds on the Fpga trainer board 
       end if; --line 56 ends if and line 57 ends the process.    
		 end process; 
 
end rama;--line 59 ends the architecture with the name rama

--This vhdl code is an 8 address 4 data bit Ram. Dipswitch switches 2,3,4 selects a Ram 
--address and dipswitches 5,6,7,8 selects a data bit number. Pressing memwrite
--(press switch SW1) writes the selected data into the selected address. Test this circuit by
--writing random data numbers, into all 8 addresses. Then use dipswitches 2,3,4 in a 
--binary order to read out the numbers. 4 leds on the Fpga trainer board, will show all of the 
--stored data numbers. 

--I am going to the UCF file to show you how the 4 outled output bits are connected to the 4 
--leds on the Fpga trainer board. 