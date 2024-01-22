----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2024 01:42:20 PM
-- Design Name: 
-- Module Name: shift8 - Behavioral
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

entity shift8 is
    Port ( sin : in STD_LOGIC;
           clk : in STD_LOGIC;
           sout : out STD_LOGIC);
end shift8;

architecture Behavioral of shift8 is
    component dff
    port( 
    rst_n : in std_logic;
    mclk : in std_logic;
    din : in std_logic;
    dout : out std_logic);
    end component;
    
    signal d : std_logic_vector(7 downto 0) := "00000000";

begin
    dff7: dff port map(    
        rst_n => '1',
        mclk => clk,
        din => d(6),
        dout => d(7)
     );

    dff6: dff port map(    
        rst_n => '1',
        mclk => clk,
        din => d(5),
        dout => d(6)
     );
     
    dff5: dff port map(    
        rst_n => '1',
        mclk => clk,
        din => d(4),
        dout => d(5)
    );     
      
    dff4: dff port map(    
       rst_n => '1',
       mclk => clk,
       din => d(3),
       dout => d(4)
    );      
        
    dff3: dff port map( 
       rst_n => '1',
       mclk => clk,
       din => d(2),
       dout => d(3)
    );        
    
    dff2: dff port map( 
       rst_n => '1',
       mclk => clk,
       din => d(1),
       dout => d(2)
    );    
    
    dff1: dff port map( 
       rst_n => '1',
       mclk => clk,
       din => d(0),
       dout => d(1)
    );    
    
    dff0: dff port map( 
       rst_n => '1',
       mclk => clk,
       din => sin,
       dout => d(0)
    );
    
    sout <= d(7);    

end Behavioral;
