----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/26/2024 11:01:37 AM
-- Design Name: 
-- Module Name: tb_seg7ctrl - Behavioral
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

entity tb_seg7ctrl is
--  Port ( );
end tb_seg7ctrl;

architecture Behavioral of tb_seg7ctrl is
    component seg7ctrl
    port (
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
    
    component seg7model
    port (
        a_n : in std_logic_vector(3 downto 0);
        abcdefgdec_n : in std_logic_vector(7 downto 0);
        disp0 : out std_logic_vector(3 downto 0);
        disp1 : out std_logic_vector(3 downto 0);
        disp2 : out std_logic_vector(3 downto 0);
        disp3 : out std_logic_vector(3 downto 0)
    );
    end component;
    
    signal clk : std_logic := 'U';
    signal reset : std_logic := '0';
    signal d0 : std_logic_vector(3 downto 0) := "UUUU";
    signal d1 : std_logic_vector(3 downto 0) := "UUUU";
    signal d2 : std_logic_vector(3 downto 0) := "UUUU";
    signal d3 : std_logic_vector(3 downto 0) := "UUUU";
    signal segments : std_logic_vector(7 downto 0) := "UUUUUUUU";
    signal sel : std_logic_vector(3 downto 0) := "UUUU";
    signal disp0 : std_logic_vector(3 downto 0) := "UUUU";
    signal disp1 : std_logic_vector(3 downto 0) := "UUUU";
    signal disp2 : std_logic_vector(3 downto 0) := "UUUU";
    signal disp3 : std_logic_vector(3 downto 0) := "UUUU";
        
    constant Half_Period : time := 10 ns;

begin
    uut: seg7ctrl port map(
        mclk => clk,
        reset => reset,
        d0 => d0,
        d1 => d1,
        d2 => d2,
        d3 => d3,
        dec => "0000",
        abcdefgdec_n => segments,
        a_n => sel
    );
    
    seg7: seg7model port map(
        a_n => sel,
        abcdefgdec_n => segments,
        disp0 => disp0,
        disp1 => disp1,
        disp2 => disp2,
        disp3 => disp3
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
        reset <= '1';
        wait for 2 * Half_Period;
        reset <= '0';        
        for n3 in 0 to 15 loop
            d3 <= std_logic_vector(to_unsigned(n3, d3'length));
            for n2 in 0 to 15 loop
                d2 <= std_logic_vector(to_unsigned(n2, d2'length));
                for n1 in 0 to 15 loop
                    d1 <= std_logic_vector(to_unsigned(n1, d1'length));
                    for n0 in 0 to 15 loop
                        d0 <= std_logic_vector(to_unsigned(n0, d0'length));
                        wait for 2 * 4 * Half_Period;
                    end loop; 
                end loop; 
            end loop;
        end loop;
    end process;
        
end Behavioral;
