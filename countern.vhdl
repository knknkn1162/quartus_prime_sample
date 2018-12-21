library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity countern is
  generic(N : natural; BITS: natural);
  port (
    clk, rst : in std_logic;
    ena : in std_logic;
    cnt : out std_logic_vector(BITS-1 downto 0)
  );
end entity;

architecture behavior of countern is
  signal cnt0 : natural range 0 to N;
begin
  process(clk, rst, ena)
  begin
    if rst = '1' then
      cnt0 <= 0;
    elsif rising_edge(clk) then
      if cnt0 = N then
        cnt0 <= 0;
      elsif ena = '1' then
        cnt0 <= cnt0 + 1;
      end if;
    end if;
  end process;
  cnt <= std_logic_vector(to_unsigned(cnt0, BITS));
end architecture;
