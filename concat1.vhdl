library ieee;
use ieee.std_logic_1164.all;

entity concat1 is
    port (
        A: in std_logic_vector(7 downto 0);
        C: out std_logic_vector(15 downto 0)
    );
end entity;

architecture struct of concat1 is
begin

process(A)
    variable ans: std_logic_vector(15 downto 0) := (others => '0');
begin
	 
    loopy1: for i in 15 downto 8 loop
        ans(i) := A(i-8);
    end loop loopy1;

    loopy2: for i in 7 downto 0 loop
        ans(i) := '0';
    end loop loopy2;

    C <= ans;
end process;

end struct;