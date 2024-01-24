----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/24/2024 10:59:19 AM
-- Design Name: 
-- Module Name: tb_seg7model - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_seg7model is
--  Port ( );
end tb_seg7model;

architecture Behavioral of tb_seg7model is

    component seg7model
    port(
        a_n : in std_logic_vector(3 downto 0);
        abcdefgdec_n : in std_logic_vector(7 downto 0);
        disp3 : out std_logic_vector(3 downto 0);
        disp2 : out std_logic_vector(3 downto 0);
        disp1 : out std_logic_vector(3 downto 0);
        disp0 : out std_logic_vector(3 downto 0)
    );
    end component;
    
    signal an : std_logic_vector(3 downto 0) := "XXXX";
    signal seg : std_logic_vector(7 downto 0) := "XXXXXXXX";
    signal dig0 : std_logic_vector(3 downto 0) := "XXXX";
    signal dig1 : std_logic_vector(3 downto 0) := "XXXX";
    signal dig2 : std_logic_vector(3 downto 0) := "XXXX";
    signal dig3 : std_logic_vector(3 downto 0) := "XXXX";
    
    type seg7_digit is array(0 to 15) of std_logic_vector(6 downto 0);
    type digit_selector is array(0 to 3) of std_logic_vector(3 downto 0);
       
begin

    uut: seg7model port map(
        a_n => an,
        abcdefgdec_n => seg,
        disp0 => dig0,
        disp1 => dig1,
        disp2 => dig2,
        disp3 => dig3
    );
    
    stimuli: process
        variable seg7_digits_values : seg7_digit := (
            "0000001", "1001111", "0010010", "0000110",
            "1001100", "0100100", "0100000", "0001111",
            "0000000", "0000100", "0001000", "1100000",
            "0110001", "1000010", "0110000", "0111000"
        );
        
        variable dig_selector : digit_selector := ("0111", "1011", "1101", "1110");
        
    begin
        for i in 0 to 3 loop
            an <= dig_selector(i);
            wait for 10 ns;
            for j in 0 to 15 loop             
               seg <= seg7_digits_values(j) & '1';
                wait for 10 ns;
            end loop;
        end loop;
        wait;
    end process;
        
end Behavioral;
