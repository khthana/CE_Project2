library ieee;
use ieee.std_logic_1164.all;


entity BitStuff_out is
	port(
		Clock				: in		std_logic;
		Reset				: in		std_logic;
		CE					: in		std_logic;
		DataS_in			: in		std_logic;
		DataS_Rd 			: out		std_logic;
		DataS_out			: out		std_logic
	);
end entity;




architecture A_BitStuff_out of BitStuff_out is


	signal rDataS_out		: std_logic;
	signal rStuff_EN		: std_logic;
	signal rStuff_EN_lat	: std_logic;
	signal rRd				: std_logic;
	signal rRd_lat			: std_logic;	
	
	
	--------------------------
	signal dout				: std_logic;
	

	
begin


	-- Signal Assignment --
--	DataS_out				<= rDataS_out when ((CE and rRd_lat) or rStuff_EN_lat) = '1' else 'Z';
--	Rd						<= rRd and CE and (not rStuff_EN) after Delay;	
--	Rd						<= rRd and CE and (not rStuff_EN);
--	DataS_Rd 				<= rRd and CE and (not rStuff_EN);
--	DataS_Rd				<= rRd;	
--	Data_out				<= rData_out after Delay when Ce = '1' and rRd_lat = '1' else 'Z' after Delay;


	DataS_out				<= dout;
	DataS_Rd				<= rRd and (not rStuff_EN);
	



	u_rStuff_EN : process(Clock,Reset)
		variable count_one : integer;
	begin
		if(Reset = '1') then
			rStuff_EN <= '0';
			count_one := 0;
		elsif(rising_edge(Clock) and Reset = '0' and CE = '1' and rRd = '1') then
			if(rStuff_EN = '1') then
				rStuff_EN <= '0';
				count_one := 0;
			elsif(dataS_in = '1') then
				if(count_one = (6 - 1)) then
					rStuff_EN <= '1';
				else
					count_one := count_one + 1;
					rStuff_EN <= rStuff_EN;
				end if;
			elsif(dataS_in = '0') then
				count_one := 0;
			else
				count_one := count_one;
			end if;
		else
			rStuff_EN <= rStuff_EN;
		end if;
	end process;


	u_rStuff_EN_lat : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rStuff_EN_lat <= '0';
		elsif(rising_edge(Clock) and Reset = '0') then
			rStuff_EN_lat <= rStuff_EN;
		else
			rStuff_EN_lat <= rStuff_EN_lat;
		end if;
	end process;				

		   
	u_rDataS_out : process(Clock,Reset)
	begin
		if(Reset = '1') then
			-- TODO when reset
			rDataS_out <= '0';
		elsif(rising_edge(Clock) and Reset = '0' and CE = '1' and rRd = '1') then
			if(rStuff_EN = '1') then
				rDataS_out <= '0';
			else
				rDataS_out <= DataS_in;
			end if;
		else
			rDataS_out <= rDataS_out;
		end if;
	end process;
			

	u_rRd : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rRd <= '0';
		elsif(rising_edge(Clock) and Reset = '0') then
			if(CE = '1') then
				rRd <= '1';
			elsif(CE = '0') then
				rRd <= '0';
			else
				rRd <= rRd;
			end if;
		else
			rRd <= rRd;
		end if;
	end process;


	
	
	u_rRd_lat : process(Clock,Reset)
		variable previous_rd : std_logic;
	begin
		if(Reset = '1') then
			rRd_lat <= '0';
			previous_Rd := '0';
		elsif(rising_edge(Clock) and Reset = '0') then
			rRd_lat <= previous_Rd;
			previous_Rd := rRd;
			
		else
			rRd_lat <= rRd_lat;
		end if; 
	end process;
	


	u_dout : process(Clock,Reset)
	begin
		if(Reset = '1') then
			dout <= '0';
		elsif(rising_edge(Clock) and Reset = '0' and CE = '1' and rRd = '1') then
			if(rStuff_EN = '1') then
				dout <= '0';
			elsif(DataS_In = '1') then
				dout <= '1';
			elsif(DataS_In = '0') then
				dout <= '0';
			else
				dout <= dout;
			end if;
		else
			dout <= dout;
		end if;
	end process;
					

end architecture;
	









