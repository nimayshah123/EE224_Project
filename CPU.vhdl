library ieee;
use ieee.std_logic_1164.all;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU is
	port(Clk, reset: in std_logic;
			PC_final, IR_final: out std_logic_vector(15 downto 0);
			state_final: out integer;
			RF_final0, RF_final1, RF_final2, RF_final3, RF_final4, RF_final5, RF_final6: out std_logic_vector(15 downto 0));
end entity;

architecture struct of CPU is
	component Register_16 is
		port(clk, rw: in std_logic; 
			data_in: in std_logic_vector(15 downto 0);
			data_out: out std_logic_vector(15 downto 0));
	end component;
	
	component Reg_file is
		port(RF_A1,RF_A2,RF_A3: in std_logic_vector(2 downto 0);
				RF_D3, PC: in std_logic_vector(15 downto 0);
				rw, Clk: in std_logic;
				RF_D1,RF_D2: out std_logic_vector(15 downto 0);
				RF_all0, RF_all1, RF_all2, RF_all3, RF_all4, RF_all5, RF_all6: out std_logic_vector(15 downto 0));
	end component;
	
	component ALU is
		port (A: in std_logic_vector(15 downto 0);
				B: in std_logic_vector(15 downto 0);
				state: in std_logic_vector(4 downto 0);
				C: out std_logic_vector(15 downto 0);
				Z: out std_logic
				);
	end component;
	
	component FSM is
		port(Clk, reset: in std_logic;
			opcode: in std_logic_vector(3 downto 0);
			opcode_mem: in std_logic_vector(3 downto 0);
			state: out integer);
	end component;
	
	component data_path is
    port(state : in integer;alu_z : in std_logic; m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,pc_w,mw,ir_w,rf_w,t1_w,t2_w,t3_w : out std_logic);
	end component;
	
	component Memory is 
	port (add,data_in: in std_logic_vector(15 downto 0); 
			clk,rw: in std_logic;
			data_out: out std_logic_vector(15 downto 0));
	end component;

---------------------------------------------------------------------------------------
	component mux8_1_16bit is 
		port(A,B,C,D,E,F,G,H: in std_logic_vector(15 downto 0); sel0,sel1,sel2: in std_logic; Y: out std_logic_vector(15 downto 0));
	end component;
	
	component mux8_1_3bit is
		port(A,B,C,D,E,F,G,H: in std_logic_vector(2 downto 0); sel0,sel1,sel2: in std_logic; Y: out std_logic_vector(2 downto 0));
	end component;
	
	component mux8_1 is 
		port(A, B, C, D, E, F, G, H,sel0, sel1, sel2: in std_logic;Y: out std_logic);
	end component;
	
	component mux4_1_16bit is 
		port(A,B,C,D: in std_logic_vector(15 downto 0); sel0,sel1: in std_logic; Y: out std_logic_vector(15 downto 0));
	end component;
	
	component mux4_1_3bit is 
		port(A,B,C,D: in std_logic_vector(2 downto 0); sel0,sel1: in std_logic; Y: out std_logic_vector(2 downto 0));
	end component;
	
	component mux4_1 is 
		port(A,B,C,D,sel0,sel1: in std_logic; Y: out std_logic);
	end component;
	
	component mux2_1_16bit is 
		port(A,B: in std_logic_vector(15 downto 0); sel: in std_logic; Y: out std_logic_vector(15 downto 0));
	end component;
	
	component mux2_1_3bit is 
		port(A,B: in std_logic_vector(2 downto 0); sel: in std_logic; Y: out std_logic_vector(2 downto 0));
	end component;
	
	component mux2_1 is 
		port(A,B,sel: in std_logic; Y: out std_logic);
	end component;
---------------------------------------------------------------------------------------

	component concat1 is
		port (A: in std_logic_vector(7 downto 0);
				C: out std_logic_vector(15 downto 0));
	end component;
	
	component concat2 is
		port (A: in std_logic_vector(7 downto 0);
				C: out std_logic_vector(15 downto 0));
	end component;
	
	component sign_ext_9to16 is
		port (A: in std_logic_vector(8 downto 0);
				C: out std_logic_vector(15 downto 0));
	end component;
	
	component sign_ext_6to16 is
		port (A: in std_logic_vector(5 downto 0);
				C: out std_logic_vector(15 downto 0));
	end component;
---------------------------------------------------------------------------------------
	signal IR_out, PC_out, mem_out, RF_D1, RF_D2 : std_logic_vector(15 downto 0);
	signal M1_out, M2_out,M56_out, M78_out, M910_out, M11_out, M12_out: std_logic_vector(15 downto 0);
	signal M34_out: std_logic_vector(2 downto 0);
	signal ALU_C, T1_out, T2_out, T3_out, sign_ext9_out, sign_ext6_out, concat1_out, concat2_out: std_logic_vector(15 downto 0);
	signal PC_W, IR_W, T1_W, T2_W, T3_W, RF_W, MW: std_logic;
	signal M1, M2, M3, M4, M5, M6, M7, M8, M9, M10, M11, M12, ALU_Z: std_logic;
	signal state: integer;
	signal state_5: std_logic_vector(4 downto 0);
	signal RF_all0, RF_all1, RF_all2, RF_all3, RF_all4, RF_all5, RF_all6: std_logic_vector(15 downto 0);
	begin
	
	FSM_instance: FSM port map (clk,Reset,IR_out(15 downto 12), mem_out(15 downto 12), state);
	--Datapath_instance: 
	Datapath_instance: data_path port map(state, ALU_Z, M1, M2, M3, M4, M5, M6, M7, M8, M9, M10, M11, M12, PC_W, MW, IR_W, RF_W, T1_W, T2_W, T3_W); 
	-- Naming convention: Mux x ==> inputs Mx_0,Mx_1,etc; output Mx_out; control signal Mx
		
	Program_counter: Register_16 port map (clk, PC_W, M1_out, PC_out);
	Memory_inst: Memory port map (M2_out, T1_out, Clk, MW, mem_out);
	IR: Register_16 port map (clk, IR_W, mem_out, IR_out);
	Register_file: Reg_file port map (IR_out(11 downto 9), IR_out(8 downto 6), M34_out, M56_out, PC_out, RF_W, Clk, RF_D1, RF_D2, RF_all0, RF_all1, RF_all2, RF_all3, RF_all4, RF_all5, RF_all6);
	state_5 <= std_logic_vector(to_unsigned(state, 5));
	ALU_inst: ALU port map (M78_out, M910_out, state_5, ALU_C, ALU_Z);
	
	T1: Register_16 port map (clk, T1_W, RF_D1, T1_out);
	T2: Register_16 port map (clk, T2_W, RF_D2, T2_out);
	T3: Register_16 port map (clk, T3_W, M11_out, T3_out);
	
	Sign_extend1: sign_ext_9to16 port map (IR_out(8 downto 0), sign_ext9_out);
	Sign_extend2: sign_ext_6to16 port map (IR_out(5 downto 0), sign_ext6_out);
	Concat_msb: concat1 port map (IR_out(7 downto 0), concat1_out);
	Concat_lsb: concat2 port map (IR_out(7 downto 0), concat2_out);
	
	M1_inst: mux2_1_16bit port map (M12_out, RF_D2, M1, M1_out);
	M2_inst: mux2_1_16bit port map (PC_out, T3_out, M2, M2_out);
	M34_inst: mux4_1_3bit port map (IR_out(11 downto 9), IR_out(5 downto 3), IR_out(8 downto 6), "000", M4, M3, M34_out);
	M56_inst: mux4_1_16bit port map (T3_out, concat1_out, concat2_out, PC_out, M6, M5, M56_out);
	M78_inst: mux4_1_16bit port map (PC_out, T1_out, T1_out, T2_out, M8, M7, M78_out);
	M910_inst: mux4_1_16bit port map ("0000000000000001", T2_out, sign_ext6_out, sign_ext9_out, M10, M9, M910_out);
	M11_inst: mux2_1_16bit port map (ALU_C, mem_out, M11, M11_out);
	M12_inst: mux2_1_16bit port map (PC_out, ALU_C, M12, M12_out);
	
	IR_final<= IR_out;
	PC_final<= PC_out;
	state_final<=state;
	
	RF_final0<= RF_all0;
	RF_final1<= RF_all1;
	RF_final2<= RF_all2;
	RF_final3<= RF_all3;
	RF_final4<= RF_all4;
	RF_final5<= RF_all5;
	RF_final6<= RF_all6;

end struct;