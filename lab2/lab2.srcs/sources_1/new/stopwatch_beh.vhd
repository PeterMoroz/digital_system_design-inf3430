----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/03/2024 03:07:36 PM
-- Design Name:
-- Module Name: stopwatch - Behavioral
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

architecture Behavioral of stopwatch is
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
    
    signal n0 : integer range 0 to 9 := 0;
    signal n1 : integer range 0 to 9 := 0;
    signal n2 : integer range 0 to 9 := 0;
    signal n3 : integer range 0 to 9 := 0;
    signal clock_count : integer := 0;
    
    signal clk0 : bit := '0';
    signal clk1 : bit := '0';
    signal clk2 : bit := '0';
    signal clk3 : bit := '0';
    
    constant Max_Count : integer := 9;
    
    signal count_on : bit := '0';

begin

    seg7ctrl_0: seg7ctrl port map(
        mclk => mclk,
        reset => reset,
        d0 => d0,
        d1 => d1,
        d2 => d2,
        d3 => d3,
        dec => "0000",
        abcdefgdec_n => abcdefgdec_n,
        a_n => a_n
    );

    process(start, stop)
    begin
        if (start = '1') then
            count_on <= '1';
        elsif (stop = '1') then
            count_on <= '0';
        end if;
    end process;
    
    process(mclk)
    begin
        if (rising_edge(mclk)) then
            if (count_on = '1') then
                if (clock_count = 50000000) then
                    clk0 <= not clk0;
                    clock_count <= 0;
                else
                    clock_count <= clock_count + 1;
                end if;
            end if;
        end if;
    end process;

    count_0: process(clk0, reset)
    begin
        if (reset = '1') then
            n0 <= 0;
        elsif (clk0 = '1' and clk0'event) then
            if (n0 = Max_Count) then
                clk1 <= '1';
                n0 <= 0;
            else
                clk1 <= '0';
                n0 <= n0 + 1;
            end if;
        end if;
    end process;
    
    count_1: process(clk1, reset)
    begin
        if (reset = '1') then
            n1 <= 0;
        elsif (clk1 = '1' and clk1'event) then
            if (n1 = Max_Count) then
                clk2 <= '1';
                n1 <= 0;
            else
                clk2 <= '0';
                n1 <= n1 + 1;
            end if;
        end if;
    end process;
    
    count_2: process(clk2, reset)
    begin
        if (reset = '1') then
            n2 <= 0;
        elsif (clk2 = '1' and clk2'event) then
            if (n2 = Max_Count) then
                clk3 <= '1';
                n2 <= 0;
            else
                clk3 <= '0';
                n2 <= n2 + 1;
            end if;
        end if;
    end process;
    
    count_3: process(clk3, reset)
    begin
        if (reset = '1') then
            n3 <= 0;
        elsif (clk3 = '1' and clk3'event) then
            if (n3 = Max_Count) then
                n3 <= 0;
            else
                n3 <= n3 + 1;
            end if;
        end if;
    end process;
        
    d0 <= std_logic_vector(to_unsigned(n0, d0'length));
    d1 <= std_logic_vector(to_unsigned(n1, d1'length));
    d2 <= std_logic_vector(to_unsigned(n2, d2'length));
    d3 <= std_logic_vector(to_unsigned(n3, d3'length));

end Behavioral;