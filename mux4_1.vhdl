library ieee;
use ieee.std_logic_1164.all;

entity mux4_1 is 
 port( A,B,C,D,sel0,sel1: in std_logic; Y: out std_logic);
end entity;

architecture struct of mux4_1 is 
begin 
  Y <= (((not sel0) and (not sel1) and A) or ( sel0 and (not sel1) and B) or ((not sel0) and sel1 and C) or (sel1 and sel0 and D));
end struct;  