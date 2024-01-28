----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/26/2024 10:10:37 AM
-- Design Name: 
-- Module Name: seg7ctrl - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

use IEEE.std_logic_unsigned.all;

architecture Behavioral of seg7ctrl is

    component seg7encoder
    port(
        hexnum : in std_logic_vector(3 downto 0);
        decpoint : in std_logic;
        segments : out std_logic_vector(7 downto 0)
    );
    end component;
    
--    signal refresh_counter: std_logic_vector(19 downto 0);
--    signal activation_counter: std_logic_vector(1 downto 0);

    signal clock_counter : integer := 0;
    signal digit_selector : integer range 0 to 3 := 0;
    signal segments0 : std_logic_vector(7 downto 0) := "UUUUUUUU";
    signal segments1 : std_logic_vector(7 downto 0) := "UUUUUUUU";
    signal segments2 : std_logic_vector(7 downto 0) := "UUUUUUUU";
    signal segments3 : std_logic_vector(7 downto 0) := "UUUUUUUU";

begin

    encoder0: seg7encoder port map(
        hexnum => d0,
        decpoint => dec(0),
        segments => segments0
    );
    
    encoder1: seg7encoder port map(
        hexnum => d1,
        decpoint => dec(1),
        segments => segments1
    );
    
    encoder2: seg7encoder port map(
        hexnum => d2,
        decpoint => dec(2),
        segments => segments2
    );
    
    encoder3: seg7encoder port map(
        hexnum => d3,
        decpoint => dec(3),
        segments => segments3
    );
    
--    process(mclk, reset)
--    begin
--        if (reset = '1') then
--            refresh_counter <= (others => '0');
--        elsif (rising_edge(mclk)) then
--            refresh_counter <= refresh_counter + 1;
--        end if;
--    end process;
    
--    activation_counter <= refresh_counter(19 downto 18);

--    with activation_counter select
--        abcdefgdec_n <= segments0 when "00",
--                        segments1 when "01",
--                        segments2 when "10",
--                        segments3 when "11",
--                        "UUUUUUUU" when others;

--    with activation_counter select
--        a_n <= "1110" when "00",
--                "1101" when "01",
--                "1011" when "10",
--                "0111" when "11",
--                "UUUU" when others;

    process(mclk, reset)
    begin
        if (reset = '1') then
            clock_counter <= 0;
        elsif (rising_edge(mclk)) then
            clock_counter <= clock_counter + 1;
        end if;
    end process;
    
    digit_selector <= clock_counter mod 4;

    with digit_selector select
        abcdefgdec_n <= segments0 when 0,
                        segments1 when 1,
                        segments2 when 2,
                        segments3 when 3,
                        "UUUUUUUU" when others;

    with digit_selector select
        a_n <= "1110" when 0,
                "1101" when 1,
                "1011" when 2,
                "0111" when 3,
                "UUUU" when others;

end Behavioral;