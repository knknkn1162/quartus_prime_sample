library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity countern is
  generic(N : natural; BITS: natural);
  port (
    clk, rst : in std_logic;
    cnt : out std_logic_vector(BITS-1 downto 0)
  );
end entity;

architecture behavior of countern is
begin
  process(clk, rst)
    variable cnt0 : natural range 0 to N-1;
  begin
    if rst = '1' then
      cnt0 := 0;
    elsif rising_edge(clk) then
      if cnt0 = N-1 then
        cnt0 := 0;
      else
        cnt0 := cnt0 + 1;
      end if;
    end if;
    cnt <= std_logic_vector(to_unsigned(cnt0, BITS));
  end process;
end architecture;
