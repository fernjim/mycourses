----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:35:09 01/06/2019 
-- Design Name: 
-- Module Name:    andb - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
 
entity liftgate is
  port (
    sw0  : in  std_logic;
    sw1  : in  std_logic;
    led0 : out std_logic
    );
end liftgate;
 
architecture liftgate1 of liftgate is
  signal and_gate : std_logic;
begin
  and_gate <= sw0 and sw1; 
  led0 <= and_gate; 
end liftgate1;

--This is the vhdl code for a two input 'and' gate. Dipswitch switch 8 is one input and 
--Dipswitch switch 7 is the other input and Led D8 is the output. The entity using the 
--IEEE library declares the inputs and the outputs. After that the architecture describes what
--the inputs and outputs are going to do. The two main codes in the architecture are,'signal'
--and 'and'. The architecture code logically 'ands' sw0 with sw1 and sends the result to the 
--and_gate signal. The and_gate signal outputs its signal to the Led. If sw0= '1' and sw1= '1'
--the led turns on. With any other input combination and the led is off.