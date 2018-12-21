library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity countern_tb is
end entity;

architecture testbench of countern_tb is
  component countern
    generic(N : natural; BITS: natural);
    port (
      clk, rst : in std_logic;
      cnt : out std_logic_vector(3 downto 0)
    );
  end component;

  constant N : natural := 10;
  constant BITS : natural := 4;
  signal clk, rst : std_logic;
  signal cnt : std_logic_vector(BITS-1 downto 0);
  constant clk_period : time := 10 ns;
  signal stop : boolean;

begin
  uut : countern generic map (N=>N, BITS=>BITS)
  port map (
    clk => clk, rst => rst,
    cnt => cnt
  );

  clk_process: process
  begin
    while not stop loop
      clk <= '0'; wait for clk_period/2;
      clk <= '1'; wait for clk_period/2;
    end loop;
    wait;
  end process;

  stim_proc : process
  begin
    wait for clk_period;
    rst <= '1'; wait for 1 ns; rst <= '0';
    assert cnt = "0000";
    wait until rising_edge(clk); wait for 1 ns;
    assert cnt = "0001";
    wait until rising_edge(clk); wait for 1 ns;
    assert cnt = "0010";
    wait until rising_edge(clk); wait for 1 ns;
    assert cnt = "0011";
    wait until rising_edge(clk); wait for 1 ns;
    assert cnt = "0100";
    wait until rising_edge(clk); wait for 1 ns;
    assert cnt = "0101";
    wait until rising_edge(clk); wait for 1 ns;
    assert cnt = "0110";
    wait until rising_edge(clk); wait for 1 ns;
    assert cnt = "0111";
    wait until rising_edge(clk); wait for 1 ns;
    assert cnt = "1000";
    wait until rising_edge(clk); wait for 1 ns;
    assert cnt = "1001";
    wait until rising_edge(clk); wait for 1 ns;
    assert cnt = "0000";
    wait until rising_edge(clk); wait for 1 ns;
    assert cnt = "0001";

    stop <= TRUE;
    -- success message
    assert false report "end of test" severity note;
    wait;
  end process;
end architecture;
