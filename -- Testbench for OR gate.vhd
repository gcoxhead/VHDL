-- Testbench for OR gate
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component declaration
component or_gate is
port(
  a: in std_logic;
  b: in std_logic;
  q: out std_logic);
end component;

signal a_in, b_in, q_out: std_logic;

begin

  -- Instantiate the DUT (Device Under Test)
  DUT: or_gate port map(a_in, b_in, q_out);

  process
  begin
    -- Test case 1: 0 OR 0
    a_in <= '0';
    b_in <= '0';
    wait for 1 ns;
    assert(q_out='0') report "Fail 0/0" severity error;
    
    -- Test case 2: 0 OR 1
    a_in <= '0';
    b_in <= '1';
    wait for 1 ns;
    assert(q_out='1') report "Fail 0/1" severity error;

    -- Test case 3: 1 OR unknown (x)
    a_in <= '1';
    b_in <= 'X';
    wait for 1 ns;
    assert(q_out='1') report "Fail 1/X" severity error;

    -- Tes case 4: 1 OR 1 
    a_in <= '1';
    b_in <= '1';
    wait for 1 ns;
    assert(q_out='1') report "Fail 1/1" severity error;
    
    -- Clear inputs back to 0
    a_in <= '0';
    b_in <= '0';
    wait for 1 ns; -- Ensure signal has time to settle
    
    -- End of tests
    assert false report "Test done." severity note;
    wait;
  end process;
end tb;