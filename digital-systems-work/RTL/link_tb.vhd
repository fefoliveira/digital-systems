----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2023 19:47:10
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
    signal clk, start: std_logic := '0';
    signal reset: std_logic := '0';
    signal done: std_logic := '0';
    signal sout: integer range 0 to 255;
    signal a, b, c: integer range 0 to 255;
begin

DUT: entity work.link
    port map(
        clk => clk,
        start => start,
        reset => reset,
        done => done,
        sout => sout,
        a => a,
        b => b,
        c => c   
    );
    
    clk <= not clk after 10ns;
    reset <= '1' after 50ns, '0' after 60ns;
    start <= '1' after 10ns, '0' after 20ns, '1' after 70ns;
    a <= 1;
    b <= 2;
    c <= 3;

end Behavioral;
