----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/23/2024 10:28:38 AM
-- Design Name: 
-- Module Name: 
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

package subprog_pck is

    function parity(indata: std_logic_vector(15 downto 0)) return std_logic;
    
    function parity(indata: unsigned(15 downto 0)) return std_logic;

    procedure parity(indata: in std_logic_vector(15 downto 0); result: out std_logic);    
    procedure parity(indata: in unsigned(15 downto 0); result: out std_logic);

end subprog_pck;


package body subprog_pck is

    function parity(indata: std_logic_vector(15 downto 0)) return std_logic is
        variable result : std_logic;
    begin
        result := '0';
        for i in indata'range loop
            if indata(i) = '1' then
                result := not result;
            end if;
        end loop;
        return result;
    end parity;
    
    function parity(indata: unsigned(15 downto 0)) return std_logic is
        variable result : std_logic;
    begin
        result := '0';
        for i in indata'range loop
            result := result xor indata(i);
        end loop;
        return result;
    end parity;
    
    
    procedure parity(indata: in std_logic_vector(15 downto 0); result: out std_logic) is
        variable par : std_logic;
    begin
        par := '0';
        for i in indata'range loop
            if indata(i) = '1' then
                par := not par;
            end if;
        end loop;
        result := par;
    end parity;
    
    procedure parity(indata: in unsigned(15 downto 0); result: out std_logic) is
        variable par : std_logic;
    begin
        par := '0';
        for i in indata'range loop
            par := par xor indata(i);
        end loop;
        result := par;
    end parity;

end package body subprog_pck;