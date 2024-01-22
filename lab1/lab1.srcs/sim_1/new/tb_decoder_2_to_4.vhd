----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2024 09:36:30 AM
-- Design Name: 
-- Module Name: tb_decoder_2_to_4 - Behavioral
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

entity tb_decoder_2_to_4 is
--  Port ( );
end tb_decoder_2_to_4;

architecture Behavioral of tb_decoder_2_to_4 is
    component decoder_2_to_4
    port(x : in std_logic_vector(1 downto 0);
        y : out std_logic_vector(3 downto 0));
    end component;
    
signal x : std_logic_vector(1 downto 0) := "UU";
signal y : std_logic_vector(3 downto 0) := "UUUU";


begin

uut: decoder_2_to_4 port map(
    x => x,
    y => y);

stimuli: process
begin
    x <= "00" after 10 ns;
    wait for 10 ns;
    x <= "01" after 10 ns;
    wait for 10 ns;
    x <= "10" after 10 ns;
    wait for 10 ns;
    x <= "11" after 10 ns;
    wait;
end process;

end Behavioral;
