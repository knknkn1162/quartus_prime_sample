library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sec10 is
  port (
    clk, rst : in std_logic;
    hex : out std_logic_vector(6 downto 0)
  );
end entity;

architecture behavior of sec10 is
  component secs
    generic (N: natural);
    port (
      clk, rst : in std_logic;
      hex : out std_logic_vector(6 downto 0)
    );
  end component;
  constant N : natural := 50000000;

begin
  secs0: secs generic map(N=>N)
  port map (
    clk => clk, rst => rst,
    hex => hex
  );
end architecture;

