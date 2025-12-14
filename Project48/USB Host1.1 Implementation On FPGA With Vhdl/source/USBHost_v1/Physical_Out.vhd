LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity Physical_out is
	port(
		Clock					: in 			std_logic;
		Reset					: in 			std_logic;
		CE						: in			std_logic;
		dplus_out		   		: out	  		std_logic;
		dminus_out		   		: out			std_logic;
		
		
		DataS_Rd 				: out			std_logic;
		DataS_in				: in			std_logic;
		DataS_Empty				: in			std_logic;
		DataS_AEmpty			: in			std_logic
		
--		BUS_Data				: in			std_logic;
--		BUS_SE0					: in			std_logic;
--		BUS_EOP					: in			std_logic;
--		BUS_SOP					: in			std_logic
	);
end entity;



architecture A_Physical_out of Physical_out is
	
	component Transceiver_out is
		port(
			Clock	  	   		: in			std_logic;
			Reset		   		: in			std_logic;
			CE			   		: in			std_logic;

--			BUS_Data			: in			std_logic;
--			BUS_SE0		   		: in			std_logic;
--			BUS_EOP		   		: in			std_logic;
--			BUS_SOP		   		: in			std_logic;
						   			
			DataS_in	   		: in			std_logic;
			dplus		   		: out			std_logic;
			dminus		   		: out			std_logic
		);
	end component;

	
  	component BitStuff_out
		port(
			Clock				: in			std_logic;
			Reset				: in			std_logic;
			CE					: in			std_logic;
			DataS_in			: in			std_logic;
			DataS_Rd			: out			std_logic;
			DataS_out			: out			std_logic
		);

	end component;
	   

	-- Transceiver Signal --
	signal TR_CE				: std_logic;
	signal TR_DataS_in			: std_logic;
	signal TR_dplus_out			: std_logic;
	signal TR_dminus_out		: std_logic;
--	signal TR_bus_data			: std_logic;
--	signal TR_bus_se0			: std_logic;
--	signal TR_bus_eop			: std_logic;
--	signal TR_bus_sop			: std_logic;



	-- BitStuff Signal --
	signal BS_CE				: std_logic;
	signal BS_DataS_in			: std_logic;
	signal BS_DataS_out			: std_logic;
	signal BS_Rd				: std_logic;
	

begin
	
	
	-- Entity IO --
	DataS_Rd 					<= BS_Rd;
	dplus_out				  	<= TR_dplus_out;
	dminus_out			  		<= TR_dminus_out;

	-- BitStuff IO --	
	BS_CE						<= CE;
	BS_DataS_In					<= DataS_In;
	
	-- Transceiver IO --
	TR_DataS_In					<= BS_DataS_Out;
		



	-- MAP Component --
	u_Transceiver_out : Transceiver_out
	port map(
		Clock					=> Clock,
		Reset					=> Reset,
		CE						=> TR_CE,

--		BUS_Data				=> TR_bus_data,
--		BUS_SE0					=> TR_bus_se0,
--		BUS_EOP					=> TR_bus_eop,
--		BUS_SOP					=> TR_bus_sop,


		DataS_in				=> TR_DataS_in,
		dplus					=> TR_dplus_out,
		dminus					=> TR_dminus_out
	);
	

	u_BitStuff_out : BitStuff_out
	port map(
		Clock					=> Clock,
		Reset					=> Reset,
		CE						=> BS_CE,
		DataS_in		  		=> BS_DataS_in,
		DataS_Rd 				=> BS_Rd,		
		DataS_out				=> BS_DataS_out
	);
	
	

	-- TR_CE Delay from BS_CE 2 Clock --
	u_TR_CE : process(Clock,Reset)
		variable prev : std_logic;
	begin
		if(Reset = '1') then
			TR_CE <= '0';
			prev := '0';
		elsif(rising_edge(Clock) and Reset = '0') then
			TR_CE <= prev;
			prev := BS_CE;
		else
			TR_CE <= TR_CE;
		end if;
	end process;
	
	
	
--	u_TR_bus_data : process(Clock,Reset)
--	begin
--		if(Reset = '1') then
--			TR_bus_data <= '0';
--		elsif(rising_edge(Clock) and Reset = '0') then
--			TR_bus_data <= BUS_DATA;
--		else
--			TR_bus_data <= TR_bus_data;		
--		end if;
--	end process;
--
--	
--	u_TR_bus_se0 : process(Clock,Reset)
--	begin
--		if(Reset = '1') then
--			TR_bus_se0 <= '0';
--		elsif(rising_edge(Clock) and Reset = '0') then
--			TR_bus_se0 <= BUS_SE0;
--		else
--			TR_bus_se0 <= TR_bus_se0;
--		end if;
--	end process;
--	
--u_TR_bus_sop : process(Clock,Reset)
--	begin
--		if(Reset = '1') then
--			TR_bus_sop <= '0';
--		elsif(rising_edge(Clock) and Reset = '0') then
--			TR_bus_sop <= BUS_SOP;
--		else
--			TR_bus_sop <= TR_bus_sop;
--		end if;
--	end process;
	
	
	
end architecture;