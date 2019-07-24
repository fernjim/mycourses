----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:06:17 02/11/2019 
-- Design Name: 
-- Module Name:    romb - Behavioral 
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
--lesson. Follow my mouse cursor as we go through the code. This Vhdl circuit is a Rom

 library IEEE;  --The code starts here by adding 3 library files to the Xilinx ide 
 use ieee.std_logic_1164.all;
 use IEEE.numeric_std.all; 
 
entity romb is --line 27 starts the entity with the name romb
   port (                  
addr : in std_logic_vector(2 downto 0);  --line 29 addr is a 3 bit address input from the 
--dipswitch
led  : out std_logic_vector (7 downto 0) --line 31 led is a 8 bit output that goes to 8 leds
--on the Fpga trainer board
); 

end romb;  --line 35 ends the entity with the name romb 
 
architecture roma of romb is  --line 37 starts the architecture with the names roma of romb  
 
type rom_type is array (0 to 7) of std_logic_vector(7 downto 0);  --line 39 declares a     
--8 data bit Rom, that has 8 addresses and 3 address bits  
constant rom: rom_type := (--line 41 to 51, the vhdl code on the left in black are hexadecimal
--Rom address numbers and the numbers next to it are the 8 bit numbers that are stored at 
--that address
     0 => "00000001",  --01 is stored in binary address "000"
     1 => "00000010",  --02 is stored in binary address "001"
     2 => "00000100",  --04 is stored in binary address "010"
     3 => "00001000",  --08 is stored in binary address "011"
     4 => "00010000",  --10 is stored in binary address "100"
     5 => "00100000",  --20 is stored in binary address "101"
     6 => "01000000",  --40 is stored in binary address "110"
     7 => "10000000"); --80 is stored in binary address "111"

begin  --line 53 begins the architecture 
 
led <= rom (to_integer (unsigned (addr)) ); --line 55, an addr address from dipswitch 6, 7, 8 
--is sent to the addresses of the Rom. 8 bits of Rom data from that address, are sent to 8 
--led output bits and the 8 led outputs bits are sent to 8 leds on the Fpga trainer board.      		 
		  
end roma; --line 59 ends the architecture with the name roma

--This vhdl Rom has 8 addresses that are stored with 8 bits of data. The stored hexadecimal 
--data in each of the 8 addresses are 0= 01, 1= 02, 2= 04, 3= 08, 4= 10, 5= 20, 6= 40' 7= 80. 
--Roms are read only, they can not be written into. To test this Rom, select dipswitches 
--6,7,8 in a binary order and the 8 leds on the Fpga trainer board will show you the stored 
--binary numbers.

--I am going to the UCF file to show you how the inputs and the outputs are connected on the
--on Fpga trainer board.
