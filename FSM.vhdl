library ieee;
use ieee.std_logic_1164.all;

entity FSM is
	port(Clk, reset: in std_logic;
			opcode: in std_logic_vector(3 downto 0);
			opcode_mem: in std_logic_vector(3 downto 0);
			state: out integer);
end entity;


			
architecture struct of FSM is
	type state_type is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22);
	signal curr_state, next_state: state_type:=s0;
	begin
	
	clock_proc:process(clk,reset, curr_state)
		begin
		if(clk='1' and clk' event) then
			if(reset='1') then
				curr_state <= s0; 
			else
				curr_state <= next_state;
			end if;
		end if;
	end process;
	
	
	fsm_process: process(clk, curr_state, opcode_mem, opcode)
		begin
		case curr_state is
		
			when s0=>
				if (opcode_mem(3 downto 2) = "00" or opcode_mem(3 downto 2) = "01" or opcode_mem(3 downto 2) = "10" or opcode_mem = "1100") then
					next_state <= s1;
				elsif (opcode_mem="1101" or opcode_mem="1111") then
					next_state <= s19;
				else
					next_state <= s0;
				end if;
				
				
			when s1=>
				if (opcode(3) ='0' or opcode="1010" or opcode="1011" or opcode = "1100") then
					next_state <= s2;
				elsif (opcode="1000") then
					next_state <= s12;
				elsif (opcode="1001") then
					next_state <= s13;
				else
					next_state <= s0;
				end if;
			
			when s2=>
				if (opcode="0000") then
					next_state <= s3;
				elsif (opcode="0010") then
					next_state <= s5;
				elsif (opcode="0011") then
					next_state <= s6;
				elsif (opcode="0001") then
					next_state <= s7;
				elsif (opcode="0100") then
					next_state <= s9;
				elsif (opcode="0101") then
					next_state <= s10;
				elsif (opcode="0110") then
					next_state <= s11;
				elsif (opcode="1010" or opcode="1011") then
					next_state <= s14;
				elsif (opcode="1100") then
					next_state <= s17;
				else
					next_state <= s0;
				end if;
				
			when s3=>
				next_state <= s4;
			when s5=>
				next_state <= s4;
			when s6=>
				next_state <= s4;
			when s7=>
				next_state <= s8;
			when s9=>
				next_state <= s4;
			when s10=>
				next_state <= s4;
			when s11=>
				next_state <= s4;
			when s15=>
				next_state <= s22;
			
			when s14=>
				if (opcode="1010") then
					next_state <= s15;
				elsif (opcode="1011") then
					next_state <= s16;
				else
					next_state <= s0;
				end if;
				
			when s17=>
				next_state <= s18;
				
			when s19=>
				if (opcode="1101") then
					next_state <= s20;
				elsif (opcode="1111") then
					next_state <= s21;
				else
					next_state <= s0;
				end if;
				
			when s4=>
				next_state <= s0;
			when s8=>
				next_state <= s0;
			when s12=>
				next_state <= s0;
			when s13=>
				next_state <= s0;
			when s16=>
				next_state <= s0;
			when s18=>
				next_state <= s0;
			when s20=>
				next_state <= s0;
			when s21=>
				next_state <= s0;
			when s22=>
				next_state <= s0;
				
		end case;
	end process;
	
	
	out_proc: process(clk, curr_state)
		begin
		case curr_state is
			when s0=>
				state<=0;
			when s1=>
				state<=1;
			when s2=>
				state<=2;
			when s3=>
				state<=3;
			when s4=>
				state<=4;
			when s5=>
				state<=5;
			when s6=>
				state<=6;
			when s7=>
				state<=7;
			when s8=>
				state<=8;
			when s9=>
				state<=9;
			when s10=>
				state<=10;
			when s11=>
				state<=11;
			when s12=>
				state<=12;
			when s13=>
				state<=13;
			when s14=>
				state<=14;
			when s15=>
				state<=15;
			when s16=>
				state<=16;
			when s17=>
				state<=17;
			when s18=>
				state<=18;
			when s19=>
				state<=19;
			when s20=>
				state<=20;
			when s21=>
				state<=21;
			when s22=>
				state<=22;
		end case;
	end process;				
		
end struct;