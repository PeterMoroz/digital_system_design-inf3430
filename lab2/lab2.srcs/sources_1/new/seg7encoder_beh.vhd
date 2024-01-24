----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/24/2024 03:01:39 PM
-- Design Name: 
-- Module Name: seg7encoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

architecture Behavioral of seg7encoder is
begin
    segments(7) <= (not hexnum(3) and not hexnum(2) and not hexnum(1) and hexnum(0)) 
                or (not hexnum(3) and hexnum(2) and not hexnum(1) and not hexnum(0))
                or (hexnum(3) and not hexnum(2) and hexnum(1) and hexnum(0))
                or (hexnum(3) and hexnum(2) and not hexnum(1) and hexnum(0));
    segments(6) <= (not hexnum(3) and hexnum(2) and not hexnum(1) and hexnum(0)) 
                or (not hexnum(3) and hexnum(2) and hexnum(1) and not hexnum(0))
                or (hexnum(3) and not hexnum(2) and hexnum(1) and hexnum(0))
                or (hexnum(3) and hexnum(2) and not hexnum(1) and not hexnum(0))
                or (hexnum(3) and hexnum(2) and hexnum(1) and not hexnum(0))
                or (hexnum(3) and hexnum(2) and hexnum(1) and hexnum(0));
    segments(5) <= (not hexnum(3) and not hexnum(2) and hexnum(1) and not hexnum(0)) 
                or (hexnum(3) and hexnum(2) and not hexnum(1) and not hexnum(0))
                or (hexnum(3) and hexnum(2) and hexnum(1) and not hexnum(0))
                or (hexnum(3) and hexnum(2) and hexnum(1) and hexnum(0));
    segments(4) <= (not hexnum(3) and not hexnum(2) and not hexnum(1) and hexnum(0)) 
                or (not hexnum(3) and hexnum(2) and not hexnum(1) and not hexnum(0))
                or (not hexnum(3) and hexnum(2) and hexnum(1) and hexnum(0))
                -- there is a mistake in truth table (Table 2. Truth table for a seven segment display)
                -- or (hexnum(3) and not hexnum(2) and not hexnum(1) and hexnum(0))
                or (hexnum(3) and not hexnum(2) and hexnum(1) and not hexnum(0))
                or (hexnum(3) and hexnum(2) and hexnum(1) and hexnum(0));
    segments(3) <= (not hexnum(3) and not hexnum(2) and not hexnum(1) and hexnum(0)) 
                or (not hexnum(3) and not hexnum(2) and hexnum(1) and hexnum(0))
                or (not hexnum(3) and hexnum(2) and not hexnum(1) and not hexnum(0))
                or (not hexnum(3) and hexnum(2) and not hexnum(1) and hexnum(0))
                or (not hexnum(3) and hexnum(2) and hexnum(1) and hexnum(0))
                or (hexnum(3) and not hexnum(2) and not hexnum(1) and hexnum(0));
    segments(2) <= (not hexnum(3) and not hexnum(2) and not hexnum(1) and hexnum(0)) 
                or (not hexnum(3) and not hexnum(2) and hexnum(1) and not hexnum(0))
                or (not hexnum(3) and not hexnum(2) and hexnum(1) and hexnum(0))
                or (not hexnum(3) and hexnum(2) and hexnum(1) and hexnum(0))
                or (hexnum(3) and hexnum(2) and not hexnum(1) and hexnum(0));
    segments(1) <= (not hexnum(3) and not hexnum(2) and not hexnum(1) and not hexnum(0)) 
                or (not hexnum(3) and not hexnum(2) and not hexnum(1) and hexnum(0))
                or (not hexnum(3) and hexnum(2) and hexnum(1) and hexnum(0))
                or (hexnum(3) and hexnum(2) and not hexnum(1) and not hexnum(0));
    segments(0) <= not decpoint;

end Behavioral;
