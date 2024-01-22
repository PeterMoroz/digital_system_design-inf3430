----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2024 02:47:14 PM
-- Design Name: 
-- Module Name: tb_shift32 - Behavioral
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

entity tb_shift32 is
--  Port ( );
end tb_shift32;

architecture Behavioral of tb_shift32 is
    component shift32
    port( sin : in std_logic;
        clk : in std_logic;
        sout : out std_logic);
    end component;
        
    signal sin : std_logic := 'U';
    signal clk : std_logic := 'U';
    signal sout : std_logic := 'U';

begin

    uut: shift32 port map(
        sin => sin,
        clk => clk,
        sout => sout
    );
        
    
    clkgen: process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;
    
    
    stimuli: process
    begin
        sin <= '0';
        wait for 20 ns;
        sin <= '1';
        wait for 20 ns;
        sin <= '0';
        wait for 2 * 10 * 32 ns;        
    end process;

end Behavioral;
