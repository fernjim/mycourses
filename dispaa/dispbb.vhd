----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:35:11 02/07/2019 
-- Design Name: 
-- Module Name:    dispbb - Behavioral 
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
--lesson. Follow my mouse cursor as we go through the code. This Vhdl circuit uses an 8x4 Ram 
--to control an 8x8 dot matrix display.

 
 library IEEE;  --The code starts here by adding 3 library files to the Xilinx ide. 
 use ieee.std_logic_1164.all;
 use IEEE.numeric_bit.all; 
 
entity dispbb is  --line 29 starts the entity with the name dispbb
   port (                  
   addr : in unsigned (2 downto 0);  --line 31 addr is a 3 bit address number from dipswitch 
--2,3,4 
    clk : in bit;  --line 33 is a clock input called clk         
memwrite: in bit;  --line 34 memwrite is an input from press switch SW1  
    din : in unsigned  (3 downto 0); --line 35 din is a 4 bit data number from dipswitch 5, 6,
--7, and 8
      d : out unsigned (3 downto 0); --line 37 d is a 4 bit output to keep 4 columns of 
--unused leds, turned off
      R : out unsigned (7 downto 0); --line 39 R sends 8 rows of data to the 8x8 matrix
      C : out unsigned (3 downto 0)  --line 40 C sends 4 columns of data to the 8x8 matrix
); 

end dispbb;  --line 43 ends the entity with the name dispbb 
 
architecture dispaa of dispbb is  --line 45 starts the architecture with the names dispaa of 
--dispbb 
type ram is array (0 to 7) of unsigned(3 downto 0); --line 47 is a ram that has 8 addresses 4 
--data bits and 3 address bits    
signal datamem: ram; --line 49 is a 4 bit ram signal called datamem
begin  --line 50 begins the process 
 process(clk,addr) --line 51, clk and addr are the process inputs    
	 begin  --line 52 begins the process       
	 if clk'event and clk = '1' then --line 53 to 76 is explained. A row position address 
--number called addr is selected with dipswitch 2, 3, and 4. A column position data number is 
--selected when dipswitch 5, or 6, or 7, or 8 is set to a '0'. When there is a clock event 
--and clk is a '1' and memwrite (press switch SW1) is pressed, the column data number is 
--written into the datamem signal Ram at the selected addr address. When press switch SW1 is 
--not pressed (the read mode), the column data number comes out of the datamem signal ram and 
--selects a column. A Row is selected when the 3 bit addr number from dipswitches 2, 3, and 4 
--gets compared with the eight, 3 bit addr numbers listed from line 69 to line 76. The line 
--that matches the addr number has a 8 bit row number that has one of its bits programmed with 
--a '1'. The bit position of that bit chooses a row led to turn on. Each row bit is connected
--to each row of leds.
     if memwrite = '0' then            
		 datamem (to_integer (addr)) <= din;  
    	 end if;	  
       C <= datamem (to_integer (addr));
	  end if;
        if addr = "000" then R <= "00000001";  
     elsif addr = "001" then R <= "00000010";
     elsif addr = "010" then R <= "00000100";
	  elsif addr = "011" then R <= "00001000";
     elsif addr = "100" then R <= "00010000"; 
	  elsif addr = "101" then R <= "00100000";
	  elsif addr = "110" then R <= "01000000";
	  elsif addr = "111" then R <= "10000000";
	   d <= "1111";  --line 77 turns off the unused leds 
		 end if;--line 78 ends if    
   	 
       
       		 
		 end process;  --line 82 ends the process 
 
end dispaa;  --line 84 ends the architecture with the name dispaa

--This circuit is simular to the dispa vhdl circuit, except it uses a Ram that has 8 addresses 
--and 4 data bits, instead of 2 rotate registers. To test this circuit, there are 3 things 
--that need to be remembered. 1. Use dipswitch 5 or 6 or 7 or 8 to select one of 4 colums. 2. 
--Use dipswitchs 2, 3, 4 in binary to select one of the 8 rows. 3. After selecting a row and 
--column, use press switch SW1 to write in the data. This is how you test this circuit. To 
--select column 8, set column switch 8 to a '0' and set column switches 5, 6, and 7 to a '1'. 
--To select row 1, set row switches 2, 3, and 4 to a binary 000. Then momentarily press, press 
--switch SW1, to write in the data. Column 8 row 1 led will turn on, and be stored. To turn 
--on and store the rest of the leds on column 8, press SW1 after setting each of the following
--row switches. Dipswitches 2, 3, 4 set to 001, to 010, to 011, to 100, to 101, to 110, and
--to 111. The vertical position of all 8 leds on column 1, have now been remembered in the 
--ram. To read out and display each of the leds on column 8, select row switches 2, 3, 4 in a 
--binary order. To store led data into column 7, do the procedure all over again after setting 
--dipswitch 7 to a '0', dipswitches 5, 6, and 8 to a '1', and setting dipswitches 2, 3 and 4 
--back to 000.

--I am going to the ucf file to see how the inputs and outputs are connected to the switches
--and the matrix led display.