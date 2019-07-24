----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:01:30 01/24/2019 
-- Design Name: 
-- Module Name:    cntb - Behavioral 
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
--lesson. Follow my mouse cursor as we go through the code. This Vhdl circuit is a 4 bit 
--binary counter

library IEEE;  --The code starts here by adding 3 library files to the Xilinx ide.
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity cntb is  --line 28 starts the entity with the name cntb.
port ( 
  clk : in std_logic;  --Line 30 is a clock called clk
  sw0 : in std_logic;  --line 31 sw0 is an input from press switch SW1 that increments the 
--counter
 reset : in std_logic; --line 33, reset is an input from SW2 that resets the counter to zero
	 
  led :  out  std_logic_vector(3 downto 0)--line 35, led is a 4 bit output that connects to 
--leds D8, D7, D6 and D5 on the Fpga trainer board
  );                                         
end cntb;  --line 38, ends the entity with the name cntb

architecture cnta of cntb is  --line 40 starts the architecture with the names cnta of cntb

signal delay : std_logic_vector(5 downto 0);         --line 42 is a 6 bit signal named delay.
signal temp  : std_logic_vector(3 downto 0):= "0000"; --line 43 is a 4 bit counter signal 
--named temp. "0000" are the counter output bits
signal pulse : std_logic := '1';  --line 45 pulse is a signal that can store a '1' or '0'.

begin --line 47 Begins our first process
 
 debounce: process(sw0,clk)     --line 49 sw0 and clk are the inputs for our process.
 begin--line 50, The process code begins. I will explain what happens from line 51 to line 56.
  if(clk'event and clk='1')then --If you have a clock event and clk is a '1'
   if(sw0='0')then              --and sw0 (press switch SW1) is not pressed
    delay <= "000000";          --then store a binary 000000 into the signal named delay
    pulse <= '0';               --and store a binary '0' into the pulse signal
   elsif(delay<"111111")then    --when SW1 is pressed and the delay signal is not 111111
    delay <= delay + 1;         --increment the delay signal
   end if;                      --line 57 ends if
--The next 2 codes will explain what happens when press switch SW1 has been pressed for more 
--than a few milliseconds and the delay time has been reached  
   if(delay="111111")then       --Line 60 and 62 says, if the delay signal has incremented
--from 000000 to 111111, then a binary '1' gets stored into the pulse signal
    pulse <= '1';
   end if;                      --Line 63 and 64 ends if, Line 65 ends the process, and the 
  end if;                       --semicoln sends the code to the next process.
 end process; 
   
 
 process(pulse, reset)  --line 68 pulse and reset are the process inputs
 begin  --line 69 begins the process code
  if(reset='0')then--Line 70, 73, and 74 -when reset (press switch SW2) is not pressed and the
--pulse signal equals a '1', the counter temp signal gets incremented.  
  temp <= (others => '0');--line 72,When reset is pressed, the temp bits get cleared to zeros.
  elsif(pulse'event and pulse='1')then
   temp <= temp + 1;
  end if;  --line 75 ends if
 end process;  --line 76 ends the process
 
 led <= temp;  --line 78 the 4 bit temp signal is sent to the 4 led output bits
 
end cnta;  --line 80 ends the architecture with the name cnta

--The 4 led output bits are sent to the UCF file. The UCF file sends the 4 led output bits 
--to 4 leds on the Fpga trainer board. I am going to the UCF file to show you how that is 
--done.
 

 
 


