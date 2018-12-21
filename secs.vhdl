library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity secs is
  generic (N: natural);
  port (
    clk, rst : in std_logic;
    hex : out std_logic_vector(6 downto 0)
  );
end entity;

architecture behavior of secs is
  component enable_generator
    generic(N : natural);
    port (
      clk, rst : in std_logic;
      ena : out std_logic
    );
  end component;

  component countern
    generic(N : natural; BITS: natural);
    port (
      clk, rst : in std_logic;
      ena : in std_logic;
      cnt : out std_logic_vector(BITS-1 downto 0)
    );
  end component;

  component decoder
    port (
      num : in std_logic_vector(3 downto 0);
      hex : out std_logic_vector(6 downto 0)
    );
  end component;

  constant CNT_N : natural := 10;
  constant BITS : natural := 4;
  signal ena : std_logic;
  signal cnt : std_logic_vector(BITS-1 downto 0);

begin
  enable_generator0 : enable_generator generic map (N=>N)
  port map (
    clk => clk, rst => rst,
    ena => ena
  );
  
  countern0 : countern generic map(N=>CNT_N, BITS=>BITS)
  port map (
    clk => clk, rst => rst,
    ena => ena,
    cnt => cnt
  );

  decoder0 : decoder port map (
    num => cnt,
    hex => hex
  );
end architecture;
