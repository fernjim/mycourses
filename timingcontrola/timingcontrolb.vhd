----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:07:12 02/12/2019 
-- Design Name: 
-- Module Name:    timingcontrolb - Behavioral 
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
--lesson. Follow my mouse cursor as we go through the code. This Vhdl code will execute the 
--Load A register instruction code A901 and the Load X register instruction code A202.
--Follow the flow of data on the two instruction diagram, as the code is being explained.

library IEEE; --The code starts here by adding 3 library files to the Xilinx ide.
use ieee.std_logic_1164.all; 
use IEEE.numeric_std.all; 
 
entity timingcontrolb is --line 29 starts the entity with the name timingcontrolb
   port (                  
addr : in std_logic_vector (11 downto 0); --line 31 addr is a 12 bit address input that comes
-- from 2 separate sets of dipswitches and goes to Irom addresses A0 to A11.
led : out std_logic_vector (7 downto 0) --line 33 led is a 8 bit output that goes to 8 leds
--on the Fpga trainer board
); 

end timingcontrolb; --line 37 ends the entity with the name timingcontrolb
 
architecture timingcontrola of timingcontrolb is --line 39 starts the architecture with the
--names timingcontrola of timingcontrolb 
type rom_type is array (0 to 4095) of std_logic_vector(7 downto 0); --line 41 declares a   
--8 data bit Rom, that has 12 address bits and 4096 addresses.  
constant romc: rom_type := ( --The code in black from line 59 to line 116 shows the data that 
--is stored in the Rom. The hexadecimal number on the left side of the code is the address 
--location of the stored data and the binary number on right side of the code shows the 
--stored data. The 8 bit stored data has one bit that is programmed with a '1'. The bit 
--position of the stored '1', is the selected output control signal that turns on a led. 

--As the computer code is being explained refer to the 2 instruction diagram.  
--The load A instruction starts with 0600 in the Program Counter. The dipswitches are
--connected to the Irom addessses and the control signals are connected to leds on the Fpga 
--trainer board. Watching the Leds turn on in the right order is the purpose of this code. To
--start the instructions, set the 8 external Instruction Register Switches to zero (00000000) 
--and set the Irom counter switches 5,6,7,8 to zero (0000). The code will run when you select 
--the Irom counter switches in a binary order. Irom data bits D0 to D5 are the control 
--signals out of the Irom.
            
				--EXPLAINATING HOW TO RUN THE CODE STARTS HERE--                            
1 => "00000100", --Set Irom counter switches to 0001(switch 5, 6, 7, 8). Control signal D2 
--(Led D6) tells the Program Counter to output 0600 to the address bus. The upper byte of that
--address (06) goes to the decoder and decoder output 6, enables the Program Rom. The lower 
--byte of that address (00) goes to the addresses on the Program Rom. Program Rom address 00 
--outputs op code A9 to the data bus. 
2 => "00001000",--Set Irom counter switches to 0010. D3 (Led D5) takes op code number A9 from
--the data bus and puts it in the instruction register.
3 => "00010000",--Set Irom counter switches to 0011. D4 (Led D4) sends the op code from the
--Instruction Register to Irom addresses A4 to A11. 

--Manually load op code A9 into instruction register dipswitchs 1 to 8. To manually load 
--op code A9, set the 8 dipswitches to 10101001 in binary. The new Irom address number is now
--2707. D0 has a stored '1' at that address and will be executed next.
2707 => "00000001", --The Irom counter switches remain set at 0011 and D0 (Led D8) increments
--the Program Counter address number to 0601.
2708 => "00000100",--Set Irom counter switches to 0100. D2 (Led D6) tells the Program Counter  
--to output 0601 to the address bus. The upper byte of that address (06) goes to the decoder
--and decoder output 6 enables the Program Rom. The lower byte of that address (01) goes to
--the addresses on the Program Rom. Program Rom address 01 outputs data 01 to the data bus.
2709 => "00000010",--Set Irom counter switches to 0101. D1 (Led D7) takes data number 01 from 
--the data bus and sends to the A register.
2710 => "00000001",--Set Irom counter switches to 0110. D0 (led D8) increments the Program
--counter address number to 0602, to get ready for the next instruction.

                    -- THE FIRST INSTRUCTION HAS BEEN COMPLETED -- 
--The codes on Line 59, 64, and 66 are simulating the fetch cycle on the load A register
--instruction. Fetch means, get the next instruction code from Program Rom memory. The next
--instruction to be executed is the Load X register. The op code number, the data number, the
--Program address number, and the Program Rom address number have changed on the load X 
--register instruction. But the Irom counter numbers and the Vhdl code numbers have remained
--the same for the fetch cycle. That means we can reuse them on the load X register 
--instruction.
--To start fetch again, put all the dipswitch switches back to zero.

--THE LOAD X REGISTER INSTRUCTION STARTS HERE AT LINE 95. FOLLOW THE PROCEDURE

--1 => "00000100", --Set Irom counter switches to 0001(switch 5, 6, 7, 8). D2 (Led D6) tells
--the Program Counter to output 0602 to the address bus. The the upper byte of that address
--(06) goes to the decoder and decoder output 6, enables the Program Rom. The lower byte of
--that address (02) goes to the addresses on the Program Rom. Program Rom address 02 outputs 
--op code A2 to the data bus. 
--2 => "00001000",--Set Irom counter switches to 0010. D3 (Led D5) takes op code number A2 
--from the data bus and puts it in the instruction register.
--3 => "00010000",--Set Irom counter switches to 0011. D4 (Led D4) sends the op code from the
--Instruction Register to Irom addresses A4 to A11.

--Manually load op code A2 into instruction register dipswitches 1 to 8. To manually load 
--op code A2, set dipswitches 1 to 8 to 10100010 in binary. The new Irom address number is now
--2595. D0 has a stored '1' at that address and will be executed next.
2595 => "00000001",--The Irom counter switches remain set at 0011. D0 (Led D8) increments the
--Program Counter address number to 0603.  
2596 => "00000100",--Set Irom counter switches to 0100. D2 (Led D6) tells the Program Counter
--to output 0603 to the address bus. The upper byte of that address (06) goes to the decoder
--and decoder output 6 enables the Program Rom. The lower byte of that address (03) goes to
--the addresses on the Program Rom. Program Rom address 03 outputs data 02 to the data bus.
2597 => "00100000",--Set Irom counter switches to 0101. D5 (led D3) tells the X register to 
--input 02 from the data bus.  
2598 => "00000001",--Set Irom counter switches to 0110. D0 (led D8) increments the Program
--counter address number to 0604 to get ready for the next instruction.

--WHEN THE LAST LED CONTROL SIGNAL IS DISPLAYED, THE TWO INSTRUCTIONS ARE COMPLETED
others => "00000000");--line 120 the Irom Data in all the other addresses, are cleared to zero
                             
begin --line 122 begins the next code
 
led <= romc (to_integer (unsigned (addr)) ); --line 124, 6 IRom data bits from address addr 
--are sent to 6 led output bits. The 6 led output bits are sent to the UCF file where they are
--connected to 6 Leds on the Fpga trainer board.
       		 
end timingcontrola; --line 128 ends the architecture with the name timingcontrola

--CPU timing and control is one of the harder things to understand about computer hardware.
--If you understand this write up and the code used, you are doing very well. Notice that I 
--have only used 14 Irom addresses to do two instructions. There are enough addresses left in
--the Irom to supply all the instructions needed for an 8 bit computer system. The op codes
--used in this code are from a 6502 CPU.

--This is the order of the switches and Leds. If you had trouble following the first 
--procedure, try this one, or just execute one instruction to make things easier. To get ready
--for the first instruction, set the Irom counter switches 5,6,7,8 to zero and the instruction
--register switches 1 to 8, to zero. -->IF YOU WANT TO DO THE PROCEDURE IT IS HERE<--

--1.  Set Irom switches to 0001. Led D6 turns on.
--2.  Set Irom switches to 0010. Led D5 turns on.
--3.  Set Irom switches to 0011. Led D4 turns on.
--4.  Set Instruction register switches to 10101001. Led D8 turns on.
--5.  Set Irom switches to 0100. Led D6 turns on.
--6.  Set Irom switches to 0101. Led D7 turns on.
--7.  Set Irom switches to 0110. led D8 turns on.
--The first instruction has been completed and the second instruction starts here. Set the
--Irom counter switches to 0000 and instructon register switches to zero (00000000) to
--get ready for the next instruction.
--8.  Set Irom switches to 0001. Led D6 turns on.
--9.  Set Iron switches to 0010. Led D5 turns on.
--10. Set Irom switches to 0011. Led D4 turns on.
--11. Set Instruction register switches to 10100010. Led D8 turns on.
--12. Set Irom switches to 0100. Led D6 turns on.
--13. Set Irom switches to 0101. Led D3 turns on. 
--14  Set Irom switches to 0110. led D8 turns on.
--The second instruction has now been completed.

--Lets go to the ucf file to see how the inputs and the outputs are connected on the Fpga
--trainer board 