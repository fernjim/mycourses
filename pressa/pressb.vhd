----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:34:49 07/12/2019 
-- Design Name: 
-- Module Name:    pressb - Behavioral 
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
--Here is the Xilinx ise or(ide). It has already been opened up with the files that you need 
--for this lesson. Follow my mouse cursor as we go through the code. The green words that you
--see on this screen, have no effect on the code. These 2 symbols -- are used to write green 
--words.

library IEEE;  --The code starts here by adding 2 library files to the Xilinx ise (ide).
use IEEE.STD_LOGIC_1164.ALL;

entity pressb is  --The entity starts here with the name pressb. You can call the entity any 
--name you want as long as it is not a code word. The entity declares the inputs and outputs.
--The port is the name of all the inputs and outputs. psw1 to psw3 are the signal names for 
--the press switches. 'in' means it is an input. led0 to led2 is a signal that goes to Leds 
--D8 to D6 on the Fpga trainer board. out means it is an output. std_logic means, tell the 
--Xilinx ise to use the standard logic library to execute this code. The semicolon means, the
--statement it over, go to the next code.
port(
psw1 : in std_logic;  --psw1 is an input from press switch SW1
psw2 : in std_logic;  --psw2 is an input from press switch SW2
psw3 : in std_logic;  --psw3 is an input from press switch SW3
led0 : out std_logic; --led0 is an output to Led D8 on the Fpga trainer board
led1 : out std_logic; --led1 is an output to Led D7 on the Fpga trainer board
led2 : out std_logic  --led2 is an output to Led D6 on the Fpga trainer board
);
end pressb;  --The entity ends with the name pressb. The semicolon sends the code to the 
--architecture. The architecture decides what the inputs and the outputs are going to do.

architecture pressa of pressb is  --The architecture starts with the names pressa of pressb.
--It is better to stay with the names that you started this code with, pressa and pressb 

begin  --begin starts the code. The next 3 codes are read from right to left.
led0 <= psw1;  --The equal pointer symbol sends psw1, from press switch SW1, to output led0.
--The ucf file takes led0 and connects it to led D8 on the Fpga trainer board. 
led1 <= psw2;  --The equal pointer symbol sends psw2, from press switch SW2, to output led1.
--The ucf file takes led1 and connects it to led D7 on the Fpga trainer board. 
led2 <= psw3;  --The equal pointer symbol sends psw3, from press switch SW3, to output led2.
--The ucf file takes led2 and connects it to led D6 on the Fpga trainer board. 
end pressa;  --The architecture ends with the name pressa.

--I am going to the ucf file to show you how the inputs and outputs are connected to the 
--Fpga trainer board leds and the press switches.I will come back here when I am finished.

--When the Fpga trainer board is programmed with this code, leds D8 D7 and D6 will be on. 
--In the ucf file, press switches SW1 SW2 and SW3, have there pull up resistors enabled. 
--Those resistors are supplying the power to light up the 3 leds. When one the 3 press 
--switches are pressed, the power to the led is grounded and the led turns off. Pressing 
--those 3 switches, is how you test the code.

--To program this code into the Fpga, click synthesize and run on the left side of this 
--screen. This checks the syntax of the codes. Then click on implement design and run. This 
--checks if all the codes are written in a logical order. Then click on generate programming 
--and run. This creates a bit file that the Fpga needs to operate. When these 3 operations 
--have been completed, and passed, it is time to go to the Elbert v2 Fpga configuration tool. 
--This tool, will send the generated bit file, through the usb cable, to program the Fpga 
--trainer board. I will show you how to use that tool, and a short video of me pressing the 
--switches, and watching the Leds turn off. I will then show you how to set up the Xilinx ise, 
--to write code, for a new project. 

