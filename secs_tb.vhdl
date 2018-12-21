library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity secs_tb is
end entity;

architecture testbench of secs_tb is
  component secs
    generic (N: natural);
    port (
      clk, rst : in std_logic;
      hex : out std_logic_vector(6 downto 0)
    );
  end component;

  signal clk, rst : std_logic;
  signal hex : std_logic_vector(6 downto 0);
  constant clk_period : time := 20 ns;
  signal stop : boolean;

begin
  uut : secs generic map (N=>10)
  port map (
    clk => clk, rst => rst,
    hex => hex
  );

  clk_process: process
  begin
    -- 50 MHz
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
    assert hex = "1000000";
    wait for 200 ns;
    assert hex = "1111001";
    wait for 200 ns;
    assert hex = "0100100";
    stop <= TRUE;
    -- success message
    assert false report "end of test" severity note;
    wait;
  end process;
end architecture;
