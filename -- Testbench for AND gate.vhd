library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_and_gate is
end tb_and_gate;

architecture Behavioral of tb_and_gate is
    signal A_signal : STD_LOGIC;  -- Testbench input A
    signal B_signal : STD_LOGIC;  -- Testbench input B
    signal Y_signal : STD_LOGIC;  -- Output from the AND gate
    
    component and_gate
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;
    
begin
    -- Instantiate the AND gate
    UUT: and_gate Port Map (
        A => A_signal,
        B => B_signal,
        Y => Y_signal
    );

    -- Test procedure
    stim_proc: process
    begin
        -- Test case 1: A = 0, B = 0
        A_signal <= '0';
        B_signal <= '0';
        wait for 10 ns;

        -- Test case 2: A = 0, B = 1
        A_signal <= '0';
        B_signal <= '1';
        wait for 10 ns;

        -- Test case 3: A = 1, B = 0
        A_signal <= '1';
        B_signal <= '0';
        wait for 10 ns;

        -- Test case 4: A = 1, B = 1
        A_signal <= '1';
        B_signal <= '1';
        wait for 10 ns;

        -- Simulation ends
        assert false report "Simulation completed" severity note;
        wait;
    end process;
end Behavioral;
