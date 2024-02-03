----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/03/2024 03:46:24 PM
-- Design Name:
-- Module Name: tb_stopwatch - Behavioral
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

entity tb_stopwatch is
--  Port ( );
end tb_stopwatch;

architecture Behavioral of tb_stopwatch is
    component stopwatch is
    port(mclk : in std_logic;
        reset : in std_logic;
        start : in std_logic;
        stop : in std_logic;
        abcdefgdec_n : out std_logic_vector(7 downto 0);
        a_n : out std_logic_vector(3 downto 0));
    end component;
    
    signal clk : std_logic := 'U';
    signal rst : std_logic := 'U';
    
    signal start : std_logic := 'U';
    signal stop : std_logic := 'U';
    
    signal abcdefgdec_n : std_logic_vector(7 downto 0) := "UUUUUUUU";
    signal a_n : std_logic_vector(3 downto 0) := "UUUU";
    
    constant Half_Period : time := 10 ns;

begin
    uut: stopwatch port map(
        mclk => clk,
        reset => rst,
        start => start,
        stop => stop,
        abcdefgdec_n => abcdefgdec_n,
        a_n => a_n
    );
    
    clock: process
    begin
        clk <= '0';
        wait for Half_Period;
        clk <= '1';
        wait for Half_Period;
    end process;
    
    stimuli: process
    begin
        start <= '0';
        stop <= '0';
        rst <= '0';
        wait for 2 * Half_Period;
        rst <= '1';
        wait for 2 * Half_Period;
        rst <= '0';
        wait for 2 * Half_Period;
        start <= '1';
        wait for 2 * half_Period;
        start <= '0';
        wait for 10 * Half_Period;
        stop <= '1';
        wait for 2 * Half_Period;
        stop <= '0';
        wait for 10 * Half_Period;
        start <= '1';
        wait for 2 * Half_Period;
        start <= '0';
        wait for 10 * Half_Period;
        
        rst <= '1';
        wait for 2 * Half_Period;
        rst <= '0';
        wait for 2 * Half_Period;
        start <= '1';
        wait for 2 * half_Period;
        start <= '0';
        wait for 10 * Half_Period;
        stop <= '1';
        wait for 2 * Half_Period;
        stop <= '0';
        wait for 10 * Half_Period;
        start <= '1';
        wait for 2 * Half_Period;
        start <= '0';
        wait for 10 * Half_Period;
        
        wait;
        
    end process;

end Behavioral;