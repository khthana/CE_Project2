library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Transceiver_out is
	port(
		Clock	  			: in			std_logic;
		Reset				: in			std_logic;
		CE					: in			std_logic;
		DataNRZI			: out			std_logic;		
		DataS_in			: in			std_logic;
		dplus				: out			std_logic;
		dminus				: out			std_logic
	);
end entity;



architecture A_Transceiver_out of Transceiver_out is


	signal rNrzi			: std_logic;
	signal rCE_lat			: std_logic;
	signal rNrzi_rst		: std_logic;
	signal plus				: std_logic;
	signal minus			: std_logic;

begin
	

	rNrzi_rst				<= CE and (not rCE_lat);
	dplus 					<= rNrzi;
	dminus 					<= not rNrzi;
	DataNRZI				<= rNrzi;


	u_rNrzi : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rNrzi <= '1';
		elsif(rising_edge(Clock) and Reset = '0' and ((rCE_lat or CE) = '1')) then
			if(rNrzi_rst = '1') then
				rNrzi <= '1';
			elsif(DataS_In = '1') then
				rNrzi <= rNrzi;
			elsif(DataS_In = '0') then
				rNrzi <= not rNrzi;
			else
				rNrzi <= rNrzi;
			end if;
		else
			rNrzi <= rNrzi;
		end if;
	end process;
	
	u_rCE_lat : process(Clock,Reset)
	begin
		if(rising_edge(Clock) and Reset = '0') then
			rCE_lat <= CE;
		else
			rCE_lat <= rCE_lat;
		end if;
	end process;
	
end architecture;

