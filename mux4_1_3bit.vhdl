library ieee;
use ieee.std_logic_1164.all;

entity mux4_1_3bit is 
 port( A,B,C,D: in std_logic_vector(2 downto 0);sel0,sel1 : in std_logic; Y: out std_logic_vector(2 downto 0));
end entity;

architecture struct of mux4_1_3bit is 
 component mux4_1 is 
	 port( A,B,C,D,sel0,sel1: in std_logic; Y: out std_logic);
 end component;
 
begin 
 gen: for i in 0 to 2 generate
  mux: mux4_1
   port map( A => A(i), B => B(i),C => C(i), D => D(i), sel0 => sel0, sel1 => sel1, Y => Y(i));
 end generate;	

end struct;  