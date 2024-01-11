----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2023 19:23:55
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity link is
  Port (
        clk : in std_logic;
        reset : in std_logic;
        start : in std_logic;
        a : in integer;
        b : in integer;
        c : in integer;
        result : out integer
   );
end link;

architecture Behavioral of link is
    signal value  :  STD_LOGIC_VECTOR (15 downto 0);
    signal resultv :  STD_LOGIC_VECTOR (7 downto 0);
    signal resultint: integer range 0 to 65535;
begin
    combinacional: entity work.combinacional
        port map (
                clk => clk,
                reset => reset,
                start => start,
                a => a,
                b => b,
                c => c,
                result => resultint
                );
     squareroot: entity work.squareroot
        port map (
            value => value,
            result => resultv
        );
        
        value <= std_logic_vector(to_unsigned(resultint, 16));
        
        process (clk, a, b)
        begin
            if(a = b) then
                result <= resultint;
            else
                result <= to_integer(signed(resultv));
            end if;
        end process;

end Behavioral;
