----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/03/2024 08:20:15 AM
-- Design Name:
-- Module Name: regs - Behavioral
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

architecture Behavioral of regs is
    component seg7ctrl is
    port(
        mclk : in std_logic;
        reset : in std_logic;
        d0 : in std_logic_vector(3 downto 0);
        d1 : in std_logic_vector(3 downto 0);
        d2 : in std_logic_vector(3 downto 0);
        d3 : in std_logic_vector(3 downto 0);
        dec : in std_logic_vector(3 downto 0);
        abcdefgdec_n : out std_logic_vector(7 downto 0);
        a_n : out std_logic_vector(3 downto 0)
    );
    end component;
    
    signal d0 : std_logic_vector(3 downto 0) := "UUUU";
    signal d1 : std_logic_vector(3 downto 0) := "UUUU";
    signal d2 : std_logic_vector(3 downto 0) := "UUUU";
    signal d3 : std_logic_vector(3 downto 0) := "UUUU";

begin

    seg7ctrl_0: seg7ctrl port map(
        mclk => clk,
        reset => reset,
        d0 => d0,
        d1 => d1,
        d2 => d2,
        d3 => d3,
        dec => "0000",
        abcdefgdec_n => abcdefgdec_n,
        a_n => a_n
    );
    
    process(clk, reset)
    begin
        if (reset = '1') then
            d0 <= "0000";
            d1 <= "0000";
            d2 <= "0000";
            d3 <= "0000";
        elsif (rising_edge(clk)) then
            if (load_btn = '1') then
                case (sw(7 downto 6)) is
                    when "00" =>
                        d0 <= sw(3 downto 0);
                    when "01" =>
                        d1 <= sw(3 downto 0);
                    when "10" =>
                        d2 <= sw(3 downto 0);
                    when "11" =>
                        d3 <= sw(3 downto 0);
                    when others => null;
                end case;
            end if;
        end if;
    end process;

end Behavioral;