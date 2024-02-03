----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/03/2024 03:06:20 PM
-- Design Name:
-- Module Name: stopwatch - Entity
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

entity stopwatch is
    Port ( mclk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           stop : in STD_LOGIC;
           abcdefgdec_n : out STD_LOGIC_VECTOR (7 downto 0);
           a_n : out STD_LOGIC_VECTOR (3 downto 0));
end stopwatch;