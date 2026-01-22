library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
    Port (
        a : in STD_LOGIC;  -- First input
        b : in STD_LOGIC;  -- Second input
        y : out STD_LOGIC   -- Output
    );
end and_gate;

architecture rtl of and_gate is
begin
  process(a, b) is 
  begin
     y <= a and b;  -- Perform AND operation
  end process;
end rtl;
