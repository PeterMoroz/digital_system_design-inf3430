library ieee;
use ieee.std_logic_1164.all;

entity pos_meas is
  port (
    -- System Clock and Reset
    rst      : in  std_logic;           -- Reset
    clk      : in  std_logic;           -- Clock
    sync_rst : in  std_logic;           -- Sync reset
    a        : in  std_logic;           -- From position sensor
    b        : in  std_logic;           -- From position sensor
    pos      : out signed(7 downto 0)   -- Measured position
    );      
end pos_meas;
