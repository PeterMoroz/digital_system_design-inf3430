----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/03/2024 08:19:02 AM
-- Design Name:
-- Module Name: regs - Entity
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

entity regs is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (7 downto 0);
           load_btn : in STD_LOGIC;
           abcdefgdec_n : out STD_LOGIC_VECTOR (7 downto 0);
           a_n : out STD_LOGIC_VECTOR (3 downto 0));
end regs;