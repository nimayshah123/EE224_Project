library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Testbench is
end entity;

architecture Struct of Testbench is
    component CPU is
	 port(Clk, reset: in std_logic;
			PC_final, IR_final: out std_logic_vector(15 downto 0);
			state_final: out integer;
			RF_final0, RF_final1, RF_final2, RF_final3, RF_final4, RF_final5, RF_final6: out std_logic_vector(15 downto 0));
    end component;

    signal Clk, Reset: std_logic:='0';
	 signal PC_final, IR_final: std_logic_vector(15 downto 0);
	 signal state_final: integer;
	 signal RF_final0, RF_final1, RF_final2, RF_final3, RF_final4, RF_final5, RF_final6: std_logic_vector(15 downto 0);

begin
    DUT: CPU port map (Clk, Reset, PC_final, IR_final,state_final,RF_final0, RF_final1, RF_final2, RF_final3, RF_final4, RF_final5, RF_final6);

		 Reset <= '0';
	 Clk<= not Clk after 100 ns;

end architecture Struct;