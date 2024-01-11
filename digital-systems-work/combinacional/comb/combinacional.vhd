library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity combinacional is
    port(
        clk : in std_logic;
        reset : in std_logic;
        start : in std_logic;
        a : in integer;
        b : in integer;
        c : in integer;
        result : out integer
    );
end combinacional;

architecture Behavior of combinacional is 
    signal reg : integer;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            reg <= 0;
        elsif rising_edge(clk) then
            if start = '0' then
                if a = b then
                    reg <= (5 * a * (b * b * b)) - (4 * (c * c));
                else 
                    reg <= (5 * a * (b * b * b));
                end if;
            end if; 
        end if;
    end process;
    result <= reg;
end Behavior;
