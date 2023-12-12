library ieee;
use ieee.std_logic_1164.all;

entity data_path is
    port(state : in integer;alu_z: in std_logic; m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,pc_w,mw,ir_w,rf_w,t1_w,t2_w,t3_w : out std_logic);
end entity;

architecture struct of data_path is
    signal m1_var, m2_var, m3_var, m4_var, m5_var, m6_var, m7_var, m8_var, m9_var, m10_var, m11_var, m12_var,pc_w_var, mw_var, ir_w_var, rf_w_var, t1_w_var, t2_w_var, t3_w_var: std_logic;


    begin 
        process(state)
        begin
		  
			 -- Initialize all signals to '0'
			 m1_var    <= '0';
			 m2_var    <= '0';
			 m3_var    <= '0';
			 m4_var    <= '0';
			 m5_var    <= '0';
			 m6_var    <= '0';
			 m7_var    <= '0';
			 m8_var    <= '0';
			 m9_var    <= '0';
			 m10_var   <= '0';
			 m11_var   <= '0';
			 m12_var   <= '0';
			 pc_w_var  <= '0';
			 mw_var    <= '0';
			 ir_w_var  <= '0';
			 rf_w_var  <= '0';
			 t1_w_var  <= '0';
			 t2_w_var  <= '0';
			 t3_w_var  <= '0';
			 
			  case state is 

					when 0 => 
						 ir_w_var <= '1';

					when 1 =>
						 m12_var <= '1';
						 pc_w_var <= '1';

					when 2 =>
						 t1_w_var <= '1';
						 t2_w_var <= '1';

					when 3 =>
						 m8_var <= '1';
						 m10_var <= '1';
						 t3_w_var <= '1';

					when 4 =>
						 m4_var <= '1';
						 rf_w_var <= '1';
						 ir_w_var <= '1';

					when 5 =>
						 m8_var <= '1';
						 m10_var <= '1';
						 t3_w_var <= '1';

					when 6 =>
						 m8_var <= '1';
						 m10_var <= '1';
						 t3_w_var <= '1';

					when 7 =>
						 m8_var <= '1';
						 m9_var <= '1';
						 t3_w_var <= '1';

					when 8 =>
						 m3_var <= '1';
						 rf_w_var <= '1';
						 ir_w_var <= '1';

					when 9 =>
						 m8_var <= '1';
						 m10_var <= '1';
						 t3_w_var <= '1';

					when 10 =>
						 m8_var <= '1';
						 m10_var <= '1';
						 t3_w_var <= '1';

					when 11 =>
						 m8_var <= '1';
						 m10_var <= '1';
						 t3_w_var <= '1';

					when 12 =>
						 m6_var <= '1';
						 rf_w_var <= '1';
						 ir_w_var <= '1';

					when 13 =>
						 m5_var <= '1';
						 rf_w_var <= '1';
						 ir_w_var <= '1';

					when 14 =>
						 m7_var <= '1';
						 m8_var <= '1';
						 m9_var <= '1';
						 t3_w_var <= '1';

					when 15 =>
						 m2_var <= '1';
						 m11_var <= '1';
						 t3_w_var<= '1';

					when 16 =>
						 m2_var <= '1';
						 mw_var <= '1';
						 ir_w_var <= '1';

					when 17 =>
						 m8_var <= '1';
						 m10_var <= '1';
						 t3_w_var <= '1';

					when 18 =>
						 m9_var <= '1';
						 pc_w_var <= '1';
						 m12_var <= alu_z;
						 ir_w_var <= '1';

					when 19 =>
						 m5_var <= '1';
						 m6_var <= '1';
						 rf_w_var <= '1';

					when 20 =>
						 m9_var <= '1';
						 m10_var <= '1';
						 m12_var <= '1';
						 pc_w_var <= '1';
						 ir_w_var <= '1';

					when 21 =>
						 m1_var <= '1';
						 pc_w_var <= '1';
						 ir_w_var <= '1';
					
					when 22 =>
						 rf_w_var <= '1';
						 ir_w_var <= '1';
					
					when others =>
						 m1_var    <= '0';
						 m2_var    <= '0';
						 m3_var    <= '0';
						 m4_var    <= '0';
						 m5_var    <= '0';
						 m6_var    <= '0';
						 m7_var    <= '0';
						 m8_var    <= '0';
						 m9_var    <= '0';
						 m10_var   <= '0';
						 pc_w_var  <= '0';
						 mw_var    <= '0';
						 ir_w_var  <= '0';
						 rf_w_var  <= '0';
						 t1_w_var  <= '0';
						 t2_w_var  <= '0';
						 t3_w_var  <= '0';
			  end case;

			  -- Assign the values to the output signals
		 end process;
		 
		 m1 <= m1_var;
		 m2 <= m2_var;
		 m3 <= m3_var;
		 m4 <= m4_var;
		 m5 <= m5_var;
		 m6 <= m6_var;
		 m7 <= m7_var;
		 m8 <= m8_var;
		 m9 <= m9_var;
		 m10 <= m10_var;
		 m11 <=m11_var;
		 m12 <= m12_var;
		 pc_w <= pc_w_var;
		 mw <= mw_var;
		 ir_w <= ir_w_var;
		 rf_w <= rf_w_var;
		 t1_w <= t1_w_var;
		 t2_w <= t2_w_var;
		 t3_w <= t3_w_var;
    
end struct;