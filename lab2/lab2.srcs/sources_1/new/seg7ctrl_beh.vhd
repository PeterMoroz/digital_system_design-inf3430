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

architecture Behavioral of seg7ctrl is

    component seg7encoder
    port(
        hexnum : in std_logic_vector(3 downto 0);
        decpoint : in std_logic;
        segments : out std_logic_vector(7 downto 0)
    );
    end component;

    signal curr_dig_num : integer range 0 to 3 := 0;
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
    
    count: process(mclk, reset)
    begin
        if (reset = '1') then
            curr_dig_num <= 0;
        elsif (rising_edge(mclk)) then
            if (curr_dig_num < 3) then
                curr_dig_num <= curr_dig_num + 1;
            else
                curr_dig_num <= 0;
            end if;
        end if;
    end process;
           
    with curr_dig_num select
        abcdefgdec_n <= segments0 when 0,
                        segments1 when 1,
                        segments2 when 2,
                        segments3 when 3,
                        "UUUUUUUU" when others;

--    with curr_dig_num select
--        a_n <= "0001" when 0,
--                "0010" when 1,
--                "0100" when 2,
--                "1000" when 3,
--                "UUUU" when others;

    with curr_dig_num select
        a_n <= "1110" when 0,
                "1101" when 1,
                "1011" when 2,
                "0111" when 3,
                "UUUU" when others;

end Behavioral;
