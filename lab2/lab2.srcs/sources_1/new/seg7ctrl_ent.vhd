----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/26/2024 10:10:37 AM
-- Design Name: 
-- Module Name: seg7ctrl - Entity
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

entity seg7ctrl is
    Port ( mclk : in STD_LOGIC;
           reset : in STD_LOGIC;
           d0 : in STD_LOGIC_VECTOR (3 downto 0);
           d1 : in STD_LOGIC_VECTOR (3 downto 0);
           d2 : in STD_LOGIC_VECTOR (3 downto 0);
           d3 : in STD_LOGIC_VECTOR (3 downto 0);
           dec : in STD_LOGIC_VECTOR (3 downto 0);
           abcdefgdec_n : out STD_LOGIC_VECTOR (7 downto 0);
           a_n : out STD_LOGIC_VECTOR (3 downto 0));
end seg7ctrl;
