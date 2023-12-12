library ieee;
use ieee.std_logic_1164.all;

entity mux8_1_16bit is 
 port( A,B,C,D,E,F,G,H: in std_logic_vector(15 downto 0);sel0,sel1,sel2 : in std_logic; Y: out std_logic_vector(15 downto 0));
end entity;

architecture struct of mux8_1_16bit is 
 component mux8_1 is 
	  port( 
		 A,B,C,D,E,F,G,H,sel0,sel1,sel2: in std_logic;Y: out std_logic);
 end component;

 
begin 
 gen: for i in 0 to 15 generate
  mux: mux8_1
   port map( A => A(i), B => B(i),C => C(i),D => D(i),E => E(i),F => F(i),G => G(i),H => H(i), sel0 => sel0,sel1 => sel1,sel2 => sel2, Y => Y(i));
 end generate;	

end struct;  