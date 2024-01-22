----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2024 09:35:51 AM
-- Design Name: 
-- Module Name: decoder_2_to_4 - Behavioral
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

entity decoder_2_to_4 is
    Port ( x : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC_VECTOR (3 downto 0));
end decoder_2_to_4;

architecture Behavioral of decoder_2_to_4 is

begin

    process (x)
    begin        
        case (x) is
            when "00" =>
                y <= "0001";
            when "01" =>
                y <= "0010";
            when "10" =>
                y <= "0100";
            when "11" =>
                y <= "1000";
            when others =>
                y <= "0000";
        end case;
    end process;


end Behavioral;
