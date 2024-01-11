----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2023 10:01:10
-- Design Name: 
-- Module Name: operation - Behavioral
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
use ieee.numeric_std.all ;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity operation is
    Port (
       clk, ls, lt, ld, lraiz, rs, rd, rt, reset: in std_logic;
       a, b, c: in integer range 0 to 255;
       sout: out integer range 0 to 255;
       op: in integer range 0 to 4;
       s1, s2: in integer range 0 to 8;
       rcmp, acmp: out std_logic
     );
end operation;

architecture Behavioral of operation is
signal s1out: integer range 0 to 255;
signal s2out: integer range 0 to 255;
signal sumOut: integer range 0 to 1000;
signal tempOut, mul, sub, opout, s, t, d, raiz: integer range 0 to 1000;
begin

process (clk, ls, rs, reset)
begin
    if(clk'EVENT AND clk = '1') then
        if(reset = '1') then
            s <= 0;
        elsif (rs = '1') then
            s <= 1;
        elsif (ls = '1') then
            s <= opout;
        else 
            s <= s;
        end if;
    end if;
end process;

process (clk, lt, rt, reset)
begin
    if(clk'EVENT AND clk = '1') then
       if(reset = '1') then
            t <= 0;
        elsif (rt = '1') then
            t <= 4;
       elsif (lt = '1') then
            t <= opout;
       else 
            t <= t;
       end if;
    end if;
end process;

process (clk, ld, rd)
begin
    if(clk'EVENT AND clk = '1') then
        if (rd = '1') then
            d <= 2;
        elsif (ld = '1') then
            d <= opout;
        else 
            d <= d;
        end if;
    end if;
end process;

process (clk, lraiz)
begin
    if(clk'EVENT AND clk = '1') then
        if (lraiz = '1') then
            raiz <= s;
        else 
            raiz <= raiz;
        end if;
    end if;
end process;

process(a, b, c, s, s1)
begin
case s1 is
    WHEN 0 => s1out <= a;
    WHEN 1 => s1out <= b;
    WHEN 2 => s1out <= c;
    WHEN 3 => s1out <= s;
    WHEN 4 => s1out <= 4;
    WHEN 5 => s1out <= d;
    WHEN 6 => s1out <= 1;
    WHEN OTHERS => s1out <= s1out;
end case;
end process;
         
process(b, c, s, t, s2)
begin
case s2 is
    WHEN 0 => s2out <= b;
    WHEN 1 => s2out <= c;
    WHEN 2 => s2out <= 5;
    WHEN 3 => s2out <= s;
    WHEN 4 => s2out <= t;
    WHEN 5 => s2out <= 2;
    WHEN 6 => s2out <= 1;
    WHEN OTHERS => s2out <= s2out;
end case;
end process;

process(op, s1out, s2out)
begin
case op is
    WHEN 0 => opout <= s1out * s2out;
    WHEN 1 => opout <= s1out - s2out;
    WHEN 2 => opout <= s1out + s2out;
    WHEN OTHERS => opout <= 0;
end case;
end process;

sout <= s;
rcmp <= '1' when t <= raiz else '0';
acmp <= '1' when a = b else '0';
end Behavioral;
