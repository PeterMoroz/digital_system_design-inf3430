----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2024 02:39:18 PM
-- Design Name: 
-- Module Name: shift32 - Behavioral
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

entity shift32 is
    Port ( sin : in STD_LOGIC;
           clk : in STD_LOGIC;
           sout : out STD_LOGIC);
end shift32;

architecture Behavioral of shift32 is
    component dff
    port(
        rst_n : in std_logic;
        mclk : in std_logic;
        din : in std_logic;
        dout : out std_logic
    );
    end component;
    
    signal d : std_logic_vector(31 downto 0) := (others => '0');

begin
    gen_dff: for i in 0 to 31 generate
    
        lower_bit: if i = 0 generate
            dff_0: dff port map(
                rst_n => '1',
                mclk => clk,
                din => sin,
                dout => d(i)
            );
        end generate;
        
        upper_bits: if i > 0 generate
            dff_n: dff port map(
                rst_n => '1',
                mclk => clk,
                din => d(i - 1),
                dout => d(i)
            );        
        end generate;
    
    end generate; 

    sout <= d(31);

end Behavioral;
