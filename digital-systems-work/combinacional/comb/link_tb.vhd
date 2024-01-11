----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2023 21:04:22
-- Design Name: 
-- Module Name: link_tb - Behavioral
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

entity link_tb is
--  Port ( );
end link_tb;

architecture Behavioral of link_tb is
signal clk, reset, start: std_logic := '0';
signal a, b, c, result: integer;
begin
    UUT: entity work.link
        port map (
            clk => clk,
            reset => reset,
            start => start,
            a => a,
            b => b,
            c => c,
            result => result
        );
 
    clk <= not clk after 10ns;
    a <= 2 after 10ns;
    b <= 2 after 10ns;
    c <= 3 after 10ns;
    
end Behavioral;
