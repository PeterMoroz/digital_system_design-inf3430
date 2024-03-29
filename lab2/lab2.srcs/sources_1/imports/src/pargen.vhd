
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.subprog_pck.all;

entity pargen is 
  port (
    rst_n        : in  std_logic;
    mclk         : in  std_logic;
    indata1      : in  std_logic_vector(15 downto 0);
    indata2      : in  unsigned(15 downto 0);
    par          : out std_logic);  
end pargen;

architecture rtl1 of pargen is 
    
begin  
  process (rst_n, mclk) is    
    variable parity1, parity2 : std_logic;
  begin
    if (rst_n = '0') then       
      parity1 := '0';
      parity2 := '0';
      par <= '0';
    elsif rising_edge(mclk) then
        parity(indata1, parity1);
        parity(indata2, parity2);
      par <= parity1 xor parity2;
    end if;
  end process;
end rtl1;
