library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter10 is
  port (
    clk, rst : in std_logic;
    cnt : out std_logic_vector(3 downto 0)
  );
end entity;

architecture behavior of counter10 is
begin
  process(clk, rst)
    variable cnt0 : natural range 0 to 9;
  begin
    if rst = '1' then
      cnt0 := 0;
    elsif rising_edge(clk) then
      cnt0 := cnt0 + 1;
    end if;
    cnt <= std_logic_vector(to_signed(cnt0, 4));
  end process;
end architecture;
