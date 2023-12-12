library ieee;
use ieee.std_logic_1164.all;

entity mux8_1 is 
  port( 
    A, B, C, D, E, F, G, H,sel0, sel1, sel2: in std_logic;Y: out std_logic);
end entity;

architecture struct of mux8_1 is 
begin 
  Y <= (((not sel0) and (not sel1) and (not sel2) and A) or 
        (sel0 and (not sel1) and (not sel2) and B) or 
        ((not sel0) and sel1 and (not sel2) and C) or 
        (sel1 and sel0 and (not sel2) and D) or 
        ((not sel0) and (not sel1) and sel2 and E) or 
        (sel0 and (not sel1) and sel2 and F) or 
        ((not sel0) and sel1 and sel2 and G) or 
		  (sel1 and sel0 and sel2 and H));
		  
end struct;
