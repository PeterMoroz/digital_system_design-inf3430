----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2024 03:07:34 PM
-- Design Name: 
-- Module Name: shiftn - Behavioral
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

entity shiftn is
    generic(n : integer);
    Port ( sin : in STD_LOGIC;
           clk : in STD_LOGIC;
           sout : out STD_LOGIC);
end shiftn;

architecture Behavioral of shiftn is
    signal d : std_logic_vector(n - 1 downto 0) := (others => '0');

begin
    process(clk)
    begin
        if (rising_edge(clk)) then
            d <= d(n - 2 downto 0) & sin;
        end if;
    end process;

    sout <= d(n - 1);

end Behavioral;
