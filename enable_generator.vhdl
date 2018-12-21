library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity enable_generator is
  generic(N : natural);
  port (
    clk, rst : in std_logic;
    ena : out std_logic
  );
end entity;

architecture behavior of enable_generator is
begin
  process(clk, rst)
    variable cnt : natural range 0 to N-1;
  begin
    if rst = '1' then
      cnt := 0;
    elsif rising_edge(clk) then
      if cnt = N-1 then
        cnt := 0;
      else
        cnt := cnt + 1;
      end if;
    end if;
    if cnt = N-1 then
      ena <= '1';
    else
      ena <= '0';
    end if;
  end process;
end architecture;
