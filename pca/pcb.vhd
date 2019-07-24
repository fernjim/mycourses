----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:52:49 01/28/2019 
-- Design Name: 
-- Module Name:    pcb - Behavioral 
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
--lesson. Follow my mouse cursor as we go through the code. This vhdl circuit is a program
--counter

library IEEE;  --the code starts here by adding 3 library files into the Xilinx ide
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity pcb is  --line 28 starts the entity with the name pcb
port (
   clk : in std_logic;  --line 30 is a clock named clk
   inc : in std_logic;  --line 31 inc is an input from press switch SW1 that increments the 
--program counter
  load : in std_logic;  --line 33 load is an input from press switch SW2 that loads in a 
--8 bit address number from the dipswitch
 dipsw : in std_logic_vector (7 downto 0);--line 35 dipsw is a 8 bit input from the dipswitch 
	led : out  std_logic_vector(7 downto 0) --line 36 led is a 8 bit output that goes to 8 
--leds on the Fpga trainer board   
  );
  end pcb;  --line 39 ends the entity with the name pcb

architecture pca of pcb is  --line 41 starts the arch1tecture with the names pca of pcb

signal delay : std_logic_vector(5 downto 0);  --line 43 is a 6 bit signal called delay.
signal temp  : std_logic_vector(7 downto 0);  --line 44 is a 8 bit signal called temp. 
signal pulse : std_logic := '1';  -- line 45 pulse is a signal that is a '1' or '0'

begin  --Line 47 begins the process 
 
 debounce: process(inc,clk)       --inc and clk are the inputs for our process.
 begin  --The process code begins --I am going explain what happens from line 51 to line 56.
  if(clk'event and clk='1')then   --If you have a clock event and clk is a '1'
   if(inc='0')then                --and inc (press switch SW1) is not pressed
    delay <= "000000";            --then store a binary 000000 into the signal named delay
    pulse <= '0';                 --and store a binary '0' into the pulse signal
   elsif(delay<"111111")then      --when SW1 is pressed and the delay signal is not 111111
    delay <= delay + 1;           --increment the delay signal
   end if;                        --end if, and go to the next code
--The next 2 codes will explain what happens when inc (press switch SW1) has been pressed for 
--more than a few milliseconds and the delay time has been reached  
   if(delay="111111")then         --Line 60 and 62 says, if the delay signal has incremented
--from 000000 to 111111, then a binary '1' gets stored into the pulse signal
    pulse <= '1';
   end if;                        --Line 63 and 64 ends if. Line 65 ends the process. And the
  end if;                         --semicoln sends the code to the next process.
 end process; 
   
  process(pulse, load, dipsw) --line 67 pulse, reset and dipsw are the inputs for the process

 begin  --line 69 begins the process code
  if(load ='0')then  --line 70 and 72 says, if the load switch (press switch SW2) is pressed
--take the dipswitch information and put it into the signal named temp.
   temp <= dipsw;
  elsif(pulse'event and pulse='1')then --line 73 and 75 says if the pulse signal equals a '1'
--(press switch SW1 was pressed) increment the temp signal. The temp signal is the counter.
   temp <= temp + 1;                   
  end if;  --line 76, ends if
 end process;  --line 77, ends the process
 
 led <= temp;  --line 79, 8 temp signal bits are sent to 8 led output bits.
 
end pca;  --line 81 ends the architecture with the name pca

--8 led output bits are sent to the UCF file. The UCF file sends the 8 led output bits to 8
--leds on the Fpga trainer board.

--But before I show you that let me read something about Program Counters

--A Program Counter is an important part of a computer because it finds software routines 
--that are located in Program Rom memory. Many instructions are stored in 2 or 3 Program Rom 
--addresses. When that happens the Program Counter increments the Program Rom address 2 or 3 
--times to complete the instruction. The Program Counter can go anywhere in Program memory to 
--find instructions. The Fpga trainer board uses the following on board components to test 
--the Program Counter. Press switch SW2 loads in the dipswitch address, press switch SW1 
--increments the address and 8 leds displays the address.

--To test this circuit, select an address on the dipswitch, load it in, and increment it. 

--I am going to the UCF file to show you how the the inputs and the outputs are connected on 
--the Fpga trainer board

