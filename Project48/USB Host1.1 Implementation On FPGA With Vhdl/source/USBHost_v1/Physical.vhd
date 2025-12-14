LIBRARY ieee;
USE ieee.std_logic_1164.ALL;



entity Physical is
	port(
		-- Control Signal --
		Clock						: in   		std_logic;
		Reset						: in   		std_logic;
		CE							: in   		std_logic;
		-- USB Data Bus Signal --
		dplus						: inout		std_logic;	
		dminus						: inout		std_logic;
		-- Data Send Signal --
		DataS_Rd 					: out  		std_logic;
		DataS_In					: in   		std_logic;
		DataS_Empty					: in   		std_logic;
		DataS_AEmpty				: in   		std_logic;
		-- Data Receive signal --
		DataR_Wr					: out  		std_logic;
		DataR_Out					: out  		std_logic;
		DataR_Full					: in   		std_logic;
		DataR_AFull					: in   		std_logic;
		-- Data Control Signal --
		DataDir						: in		std_logic;
		BUS_Data					: in   		std_logic;
		BUS_SE0						: in   		std_logic;
		BUS_EOP						: in		std_logic;
		BUS_SOP						: in		std_logic;
		
		
		status_full				: out			std_logic;
		status_low				: out			std_logic;
		status_connect			: out			std_logic

		
		
	);
end entity;




architecture A_Physical of Physical is
		

	component Physical_in is
		port(
			Clock					: in 		std_logic;
			Reset					: in 		std_logic;
			CE						: in		std_logic;
			dplus_in				: in	  	std_logic;
			dminus_in				: in		std_logic;
			DataR_Wr				: out	   	std_logic;
			DataR_out				: out	   	std_logic;
			DataR_Full				: in	   	std_logic;
			DataR_AFull				: in	   	std_logic;
			status_full				: out			std_logic;
			status_low				: out			std_logic;
			status_connect			: out			std_logic
			
		);
	end component;

	component Physical_out is
		port(
			Clock					: in 		std_logic;
			Reset					: in 		std_logic;
			CE						: in		std_logic;
			dplus_out				: out	  	std_logic;
			dminus_out				: out		std_logic;
			DataS_Rd   				: out		std_logic;			
			DataS_in				: in		std_logic;
			DataS_Empty				: in		std_logic;
			DataS_AEmpty			: in		std_logic
--			BUS_Data				: in		std_logic;
--			BUS_SE0					: in		std_logic;
--			BUS_EOP					: in		std_logic;
--			BUS_SOP					: in		std_logic
		);
	end component;


	signal rdplus_out				: std_logic;
	signal rdminus_out				: std_logic;	
	signal rdplus_in				: std_logic;
	signal rdminus_in				: std_logic;


	signal PO_CE					: std_logic;
	
--	signal BUS_SOP_delay				: std_logic;
	signal BUS_SE0_delay				: std_logic;
	signal BUS_EOP_delay				: std_logic;
	signal BUS_DATA_delay				: std_logic;

--	signal plus_out						: std_logic;
--	signal minus_out					: std_logic;
	
	
begin
	
	-- Output Signal Assignment --	
--	dplus							<= rdplus_out;-- when PHY_BUS_DATA = '1' else 'Z';--(rdplus_out and Clock);
--	dminus							<= rdminus_out;-- when PHY_BUS_DATA = '1' else 'Z';--(rdminus_out and Clock);

	-- Input Signal Assignment --	
	rdplus_in						<= dplus;
	rdminus_in						<= dminus;

--	PHY_BUS_SE0						<= BUS_SE0;
--	PHY_BUS_EOP						<= BUS_EOP;
--	PHY_BUS_DATA					<= BUS_DATA;
--	PHY_BUS_SOP						<= BUS_SOP;

--	PHY_BUS_SOP <= BUS_SOP;

	

	dplus							<=	'0' when Reset = '1' else
										'1' when BUS_EOP_delay = '1' else
										'0' when BUS_SE0_delay = '1' else
										rdplus_out when BUS_DATA_delay = '1' else
--										plus_out when BUS_DATA_delay = '1' else
										'Z';

	dminus							<=	'0' when Reset = '1' else
										'0' when BUS_EOP_delay = '1' else
										'0' when BUS_SE0_delay = '1' else
										rdminus_out when BUS_DATA_delay = '1' else
--										minus_out when BUS_DATA_delay = '1' else										
										'Z';
										
--	dplus							<=	'1' when BUS_EOP = '1' else
--										'0' when BUS_SE0 = '1' else
--										rdplus_out when BUS_DATA = '1' else
--										'Z';
--	dminus							<=	'0' when BUS_EOP = '1' else
--										'0' when BUS_SE0 = '1' else
--										rdminus_out when BUS_DATA = '1' else
--										'Z';										

	PO_CE							<= CE and (not DataS_AEmpty);

		

	u_Physical_in : Physical_in
	port map(
		Clock						=> Clock,
		Reset						=> Reset,
		CE							=> CE,
		dplus_in					=> rdplus_in,
		dminus_in					=> rdminus_in,
		DataR_Wr					=> DataR_Wr,
		DataR_out					=> DataR_Out,
		DataR_Full					=> DataR_Full,
		DataR_AFull					=> DataR_AFull,


		status_full => status_full,
		status_low => status_low,
		status_connect => status_connect
		
	);

	
	u_Physical_out : Physical_out
	port map(
		Clock						=> Clock,
		Reset						=> Reset,
		CE							=> PO_CE,
		dplus_out					=> rdplus_out,
		dminus_out					=> rdminus_out,
		DataS_Rd 					=> DataS_Rd,
		DataS_in					=> DataS_In,
		DataS_Empty					=> DataS_Empty,
		DataS_AEmpty				=> DataS_AEmpty
--		BUS_DATA					=> BUS_DATA_delay,
--		BUS_SE0						=> BUS_SE0_delay,
--		BUS_EOP						=> BUS_EOP_delay,
--		BUS_SOP						=> BUS_SOP_delay
	);	
	
	


	-- Delay From BUS_DATA 1 Clock --
	u_BUS_DATA_delay : process(Clock,Reset)
 --		variable prev1 : std_logic;
 --		variable prev2 : std_logic;
	begin
		if(Reset = '1') then
			BUS_DATA_delay <= '0';
--			prev1 := '0';
--			prev2 := '0';
		elsif(rising_edge(Clock) and Reset = '0') then
--			BUS_DATA_delay <= prev2;
			BUS_DATA_delay <= BUS_DATA;
--			prev2 := prev1;
--			prev1 := BUS_DATA;
		else
			BUS_DATA_delay <= BUS_DATA_delay;
		end if;
	end process;					
	

	-- Delay From BUS_SE0 2 Clock --
	u_BUS_SE0_delay : process(Clock,Reset)
		variable prev : std_logic;
--		variable prev2 : std_logic;
	begin
		if(Reset = '1') then
			BUS_SE0_delay <= '0';
			prev := '0';
--			prev2 := '0';
		elsif(rising_edge(Clock) and Reset = '0') then
			BUS_SE0_delay <= prev;
--			prev2 := prev1;
			prev := BUS_SE0;
		else
			BUS_SE0_delay <= BUS_SE0_delay;
		end if;
	end process;	

	-- Delay From BUS_EOP 1 Clock --
	u_BUS_EOP_delay : process(Clock,Reset)
--		variable prev : std_logic;
--		variable prev2 : std_logic;
	begin
		if(Reset = '1') then
			BUS_EOP_delay <= '0';
--			prev := '0';
--			prev2 := '0';
		elsif(rising_edge(Clock) and Reset = '0') then
--			BUS_SE0_delay <= prev;
			BUS_EOP_delay <= BUS_EOP;
--			prev2 := prev1;
--			prev := BUS_SE0;
		else
			BUS_EOP_delay <= BUS_EOP_delay;
		end if;
	end process;
		

end architecture;