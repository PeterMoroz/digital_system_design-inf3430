----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2024 03:15:37 PM
-- Design Name: 
-- Module Name: tb_shiftn - Behavioral
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

entity tb_shiftn is
--  Port ( );
end tb_shiftn;

architecture Behavioral of tb_shiftn is
    component shiftn
    generic(n : integer);
    port(sin : in std_logic;
        clk : in std_logic;
        sout : out std_logic
    );
    end component;
    
    signal clk : std_logic := 'U';
    signal sin : std_logic := 'U';
    signal sout : std_logic := 'U';
    
    constant Half_Period : time := 10 ns;
    constant Bit_Width : integer := 64;

begin
    uut: shiftn 
        generic map(Bit_Width)
        port map(sin, clk, sout);
        
    clkgen: process
    begin
        clk <= '0';
        wait for Half_Period;
        clk <= '1';
        wait for Half_Period;
    end process;
    
    stimuli: process
    begin
        sin <= '0';
        wait for 2 * Half_Period;
        sin <= '1';
        wait for 2 * Half_Period;
        sin <= '0';
        wait for 2 * Half_Period * Bit_Width;
    end process;

end Behavioral;
