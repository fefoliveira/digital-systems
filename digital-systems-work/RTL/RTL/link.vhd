----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2023 18:45:55
-- Design Name: 
-- Module Name: link - Behavioral
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

entity link is
    Port (
        clk: in std_logic;
        start, reset: in std_logic;
        done: out std_logic;
        sout: out integer range 0 to 255;
        a, b, c: in integer range 0 to 255
     );
end link;

architecture Behavioral of link is
       signal ls, lt, ld, lraiz, rs, rt, rd: std_logic := '0';
       signal rcmp, acmp: std_logic;
       signal op: integer range 0 to 4;
       signal s1, s2: integer range 0 to 8;
begin

OPERATIONAL: entity work.operation
        port map(
            clk => clk,
            op => op,
            ls => ls,
            lt => lt,
            ld => ld,
            lraiz => lraiz,
            rs => rs,
            rt => rt,
            rd => rd,
            a => a,
            b => b,
            c => c,
            sout => sout,
            s1 => s1,
            s2 => s2,
            reset => reset,
            rcmp => rcmp,
            acmp => acmp
        );

CONTROL: entity work.control
port map(
    clk => clk,
    reset => reset,
    start => start,
    op => op,
    ls => ls,
    lt => lt,
    done => done,
    s1 => s1,
    s2 => s2,
     ld => ld,
    lraiz => lraiz,
    rs => rs,
    rt => rt,
    rd => rd,
    rcmp => rcmp,
    acmp => acmp
);

end Behavioral;
