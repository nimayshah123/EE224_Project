library ieee;
use ieee.std_logic_1164.all;

entity Reg_file is
	port(RF_A1,RF_A2,RF_A3: in std_logic_vector(2 downto 0);
			RF_D3, PC: in std_logic_vector(15 downto 0);
			rw, Clk: in std_logic;
			RF_D1,RF_D2: out std_logic_vector(15 downto 0);
			RF_all0, RF_all1, RF_all2, RF_all3, RF_all4, RF_all5, RF_all6: out std_logic_vector(15 downto 0));
end entity;

-- To write: sync write; rw='1' and write data in RF_Din and address input RF_A1
-- To read: async read, doesn't depend on rw or anything else
			
architecture struct of Reg_file is
	signal R2,R3,R4,R5,R6: std_logic_vector(15 downto 0):="0000000000000000";
	signal R0: std_logic_vector(15 downto 0):="1111111111111111";
	signal R1: std_logic_vector(15 downto 0):="0000000000000011";
	
	component mux8_1_16bit is 
		port( A,B,C,D,E,F,G,H: in std_logic_vector(15 downto 0);sel0,sel1,sel2 : in std_logic; Y: out std_logic_vector(15 downto 0));
	end component;

	begin
	
	write_process: process(clk, RF_A1, RF_A2, RF_A3, RF_D3, rw)
	begin
		if (rw='1') then
			if (Clk'event and Clk='1') then
				case RF_A3 is
					when "000" =>
						R0 <= RF_D3;
					when "001" =>
						R1 <= RF_D3;
					when "010" =>
						R2 <= RF_D3;
					when "011" =>
						R3 <= RF_D3;
					when "100" =>
						R4 <= RF_D3;
					when "101" =>
						R5 <= RF_D3;
					when "110" =>
						R6 <= RF_D3;
					when others =>
				end case;
			end if;
		end if;
	end process write_process;
	
	Mux1: mux8_1_16bit port map (R0,R1,R2,R3,R4,R5,R6,PC,RF_A1(0),RF_A1(1),RF_A1(2),RF_D1);
	Mux2: mux8_1_16bit port map (R0,R1,R2,R3,R4,R5,R6,PC,RF_A2(0),RF_A2(1),RF_A2(2),RF_D2);
	
	RF_all0 <= R0;
	RF_all1 <= R1;
	RF_all2 <= R2;
	RF_all3 <= R3;
	RF_all4 <= R4;
	RF_all5 <= R5;
	RF_all6 <= R6;
end struct;