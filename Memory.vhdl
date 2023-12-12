library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;	 

entity Memory is 
	port (add,data_in: in std_logic_vector(15 downto 0); 
			clk,rw: in std_logic;
			data_out: out std_logic_vector(15 downto 0));
end entity;

architecture struct of Memory is 

	type regarray is array(31 downto 0) of std_logic_vector(15 downto 0);

	signal Memory: regarray:=(
		0 =>  "0000000001010000",--ADD
		1 =>  "0010000001010000",--SUB
		2 =>  "0011000001010000",--MUL
		3 =>  "0001000001000100",--ADI
		4 =>  "0100000000010000",--AND
		5 =>  "0101010001000000",--ORA
		6 =>  "0110000001010000",--IMP
		7 =>  "1000000000000111",--LHI
		8 =>  "1001000000000100",--LLI
		9 =>  "1010000110001110",--LW
		14=>  "0000000000000000",--ADD
		15 => "1100100110000010",--BEQ
		18 => "1111000001000000",--JLR
		27 => "1101000000000011",--JAL
		30 => "1011000001000101",--SW
		others => x"0000");

	begin
	
	data_out <= Memory(to_integer(unsigned(add)));
	
	mem_write: process (rw,data_in,add,clk)
		begin
		if(rw = '1') then
			if(rising_edge(clk)) then
				Memory(to_integer(unsigned(add))) <= data_in;
			end if;
		end if;
	end process;
	
end struct;
