LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity Physical_In is
	port(
		Clock					: in 			std_logic;
		Reset					: in 			std_logic;
		CE						: in			std_logic;
		
		
		dplus_in				: in	  		std_logic;
		dminus_in				: in			std_logic;
		
		
		status_full				: out			std_logic;
		status_low				: out			std_logic;
		status_connect			: out			std_logic;
		
		
		DataR_Wr				: out			std_logic;
		DataR_out				: out	   		std_logic;
		DataR_Full				: in			std_logic;
		DataR_AFull				: in			std_logic	
	);	
end entity;




architecture A_Physical_In of Physical_In is
	
	component Transceiver_in is
		port(
			Clock	  			: in			std_logic;
			Reset				: in			std_logic;
			DataR_out			: out			std_logic;
			dplus				: in			std_logic;
			dminus				: in			std_logic;
			status_full				: out			std_logic;
			status_low				: out			std_logic;
			status_connect			: out			std_logic
			
		);
	end component;
	
   	componenT BitStuff_in
	    port(
			Clock				: in			std_logic;
			Reset				: in			std_logic;
			CE					: in			std_logic;
			DataR_in				: in			std_logic;
			DataR_out			: out			std_logic;
			DataR_Wr					: out			std_logic
		);
	end component;
	

	signal TR_Dir				: std_logic;
	signal TR_Data_in			: std_logic;
	signal TR_Data_out			: std_logic;
	signal TR_dplus				: std_logic;
	signal TR_dminus			: std_logic;

	signal BS_CE				: std_logic;
	signal BS_DataR_in			: std_logic;
	signal BS_DataR_out			: std_logic;
	signal BS_Wr				: std_logic;

begin
	
	TR_Dir						<= '1';  -- in only 
	TR_dplus					<= dplus_in;
	TR_dminus					<= dminus_in;

	BS_DataR_in					<= TR_Data_out;
	DataR_out					<= BS_DataR_out;
	
	-- TEMP for Test
	BS_CE <= CE;
	
	
	u_Transceiver_in : Transceiver_in
	port map(
		Clock					=> Clock,
		Reset					=> Reset,
--		Dir						=> TR_Dir,
--		Data_in					=> TR_Data_in,
		DataR_out				=> TR_Data_out,
		dplus					=> TR_dplus,
		dminus					=> TR_dminus,
		  status_full => status_full,
		  status_low => status_low,
		  status_connect => status_connect
	);
	
	u_BitStuff_in : BitStuff_in
	port map(
		Clock					=> Clock,
		Reset					=> Reset,
		CE						=> BS_CE,
		DataR_in				=> BS_DataR_in,
		DataR_out				=> BS_DataR_out,
		DataR_Wr   				=> BS_Wr
	);



end architecture;