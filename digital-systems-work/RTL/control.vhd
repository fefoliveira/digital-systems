----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2023 18:27:21
-- Design Name: 
-- Module Name: control - Behavioral
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

entity control is
    PORT( clk, reset, start, rcmp, acmp: IN STD_LOGIC;
            ls, lt, ld, lraiz, rs, rt, rd, done: OUT STD_LOGIC;
            op: OUT integer range 0 to 4;
            s1, s2: OUT INTEGER RANGE 0 TO 8);
end control;

architecture Behavioral of control is
    TYPE State_type IS (IDLE, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O);
    SIGNAL s: State_type;
begin
    PROCESS( reset, clk, rcmp )
        BEGIN
            IF reset = '1' THEN
                s <= IDLE;
            ElSIF (clk'event AND clk = '1') THEN
                CASE s IS
                    WHEN IDLE =>
                        if (start = '1') then
                            s <= A;
                        else
                            s <= s;
                        end if;    
                    WHEN A => s <= B;
                    WHEN B => s <= C;
                    WHEN C => s <= D;
                    WHEN D => 
                        if(acmp = '0') then
                            s <= I;
                        else
                            s <= E;
                        end if;
                    WHEN E => s <= F;
                    WHEN F => s <= G;
                    WHEN G => s <= H;
                    WHEN H => s <= H;
                    
                    WHEN I => s <= J;
                    WHEN J => s <= K;
                    WHEN K => s <= L;
                    WHEN L => s <= M;
                    WHEN M => s <= N;
                    WHEN N => s <= O;
                    WHEN O => 
                    if(rcmp = '1') then
                        s <= K;
                    elsif(rcmp = '0') then
                        s <= H;
                    end if;
                END CASE;
            END IF;
            
             CASE s IS
                WHEN IDLE => s1 <= 0; s2 <= 0; op <= 0; ls <= '0'; lt <= '0'; done <= '0'; ld <= '0'; lraiz <= '0'; rs <= '0'; rt <= '0'; rd <= '0';   
                WHEN A => s1 <= 0; s2 <= 2; op <= 0; ls <= '1'; lt <= '0'; done <= '0'; ld <= '0'; lraiz <= '0'; rs <= '0'; rt <= '0'; rd <= '0';
                WHEN B => s1 <= 3; s2 <= 0; op <= 0; ls <= '1'; lt <= '0'; done <= '0'; ld <= '0'; lraiz <= '0'; rs <= '0'; rt <= '0'; rd <= '0';
                WHEN C => s1 <= 3; s2 <= 0; op <= 0; ls <= '1'; lt <= '0'; done <= '0'; ld <= '0'; lraiz <= '0'; rs <= '0'; rt <= '0'; rd <= '0';
                WHEN D => s1 <= 3; s2 <= 0; op <= 0; ls <= '1'; lt <= '0'; done <= '0'; ld <= '0'; lraiz <= '0'; rs <= '0'; rt <= '0'; rd <= '0';
                WHEN E => s1 <= 4; s2 <= 1; op <= 0; ls <= '0'; lt <= '1'; done <= '0'; ld <= '0'; lraiz <= '0'; rs <= '0'; rt <= '0'; rd <= '0';
                WHEN F => s1 <= 2; s2 <= 4; op <= 0; ls <= '0'; lt <= '1'; done <= '0'; ld <= '0'; lraiz <= '0'; rs <= '0'; rt <= '0'; rd <= '0';
                WHEN G => s1 <= 3; s2 <= 4; op <= 1; ls <= '1'; lt <= '0'; done <= '0'; ld <= '0'; lraiz <= '0'; rs <= '0'; rt <= '0'; rd <= '0';
                WHEN H => s1 <= 0; s2 <= 0; op <= 0; ls <= '0'; lt <= '0'; done <= '1'; ld <= '0'; lraiz <= '0'; rs <= '0'; rt <= '0'; rd <= '0';
                
                WHEN I => s1 <= 0; s2 <= 0; op <= 0; ls <= '0'; lt <= '0'; done <= '0'; ld <= '0'; lraiz <= '1'; rs <= '0'; rt <= '0'; rd <= '0';
                WHEN J => s1 <= 0; s2 <= 0; op <= 0; ls <= '0'; lt <= '0'; done <= '0'; ld <= '0'; lraiz <= '0'; rs <= '1'; rt <= '1'; rd <= '1';
                WHEN K => s1 <= 3; s2 <= 6; op <= 2; ls <= '1'; lt <= '0'; done <= '0'; ld <= '0'; lraiz <= '0'; rs <= '0'; rt <= '0'; rd <= '0';
                WHEN L => s1 <= 5; s2 <= 5; op <= 2; ls <= '0'; lt <= '0'; done <= '0'; ld <= '1'; lraiz <= '0'; rs <= '0'; rt <= '0'; rd <= '0';
                WHEN M => s1 <= 6; s2 <= 4; op <= 2; ls <= '0'; lt <= '1'; done <= '0'; ld <= '0'; lraiz <= '0'; rs <= '0'; rt <= '0'; rd <= '0';
                WHEN N => s1 <= 5; s2 <= 4; op <= 2; ls <= '0'; lt <= '1'; done <= '0'; ld <= '0'; lraiz <= '0'; rs <= '0'; rt <= '0'; rd <= '0';
                WHEN O => s1 <= 0; s2 <= 0; op <= 0; ls <= '0'; lt <= '0'; done <= '0'; ld <= '0'; lraiz <= '0'; rs <= '0'; rt <= '0'; rd <= '0';
            END CASE;
        END PROCESS;
        
   

end Behavioral;
