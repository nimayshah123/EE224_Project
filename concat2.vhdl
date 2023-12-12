library ieee;
use ieee.std_logic_1164.all;

entity concat2 is
    port (
        A: in std_logic_vector(7 downto 0);
        C: out std_logic_vector(15 downto 0)
    );
end entity;

architecture struct of concat2 is
begin
process(A)
 variable ans: std_logic_vector(15 downto 0) := (others => '0');
 begin
        for_loop: for i in 7 downto 0 loop
            ans(i) := A(i);
        end loop for_loop;
		  
        for_loop1: for i in 15 downto 8 loop
            ans(i) := '0' ;
        end loop for_loop1;
        C<=ans;
end process;
end struct;