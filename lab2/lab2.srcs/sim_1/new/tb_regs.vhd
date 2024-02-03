----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/03/2024 08:40:13 AM
-- Design Name:
-- Module Name: tb_regs - Behavioral
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

entity tb_regs is
--  Port ( );
end tb_regs;

architecture Behavioral of tb_regs is
    component regs is
    port(
        clk : in std_logic;
        reset : in std_logic;
        sw : in std_logic_vector(7 downto 0);
        load_btn : in std_logic;
        abcdefgdec_n : out std_logic_vector(7 downto 0);
        a_n : out std_logic_vector(3 downto 0)
    );
    end component;
    
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal sw : std_logic_vector(7 downto 0) := "UUUUUUUU";
    signal load_btn : std_logic := '0';
    signal abcdefgdec_n : std_logic_vector(7 downto 0) := "UUUUUUUU";
    signal a_n : std_logic_vector(3 downto 0) := "UUUU";
    
    constant Half_Period : time := 10 ns;

begin
    uut: regs port map(
        clk => clk,
        reset => reset,
        sw => sw,
        load_btn => load_btn,
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
    
    stimulus: process
    begin
        reset <= '1';
        wait for 2 * Half_Period;
        reset <= '0';
        wait for 2 * Half_Period;
        sw <= "00000000";
        wait for 2 * Half_Period;
        
        sw(3 downto 0) <= "1011";
        sw(7 downto 6) <= "11";
        wait for 2 * Half_Period;
        load_btn <= '1';
        wait for 2 * Half_Period;
        load_btn <= '0';
        
        sw(3 downto 0) <= "1110";
        sw(7 downto 6) <= "10";
        wait for 2 * Half_Period;
        load_btn <= '1';
        wait for 2 * Half_Period;
        load_btn <= '0';
        sw(7 downto 6) <= "01";
        wait for 2 * Half_Period;
        load_btn <= '1';
        wait for 2 * Half_Period;
        load_btn <= '0';
        sw(3 downto 0) <= "1111";
        sw(7 downto 6) <= "00";
        wait for 2 * Half_Period;
        load_btn <= '1';
        wait for 2 * Half_Period;
        load_btn <= '0';
        
        wait;
        
    end process;

end Behavioral;