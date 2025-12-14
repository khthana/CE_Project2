LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity ClockDiv is
	port(
		Clock24M			: in 		std_logic;
		Reset				: in 		std_logic;
		Clock12M			: out		std_logic;
		Clock1K				: out		std_logic
	);
end entity;



architecture A_ClockDiv of ClockDiv is

	signal rClock12M		: std_logic;
	signal rClock8M			: std_logic;
	signal rClock1K			: std_logic;
	signal rClock1M			: std_logic;

begin

	Clock12M				<= rClock12M;	
	Clock1K					<= rClock1K;


	u_rClock12M : process(Clock24M,Reset)
	begin
		if(Reset = '1') then
			rClock12M <= Clock24M;
		elsif(rising_edge(Clock24M) and Reset = '0') then
			rClock12M <= not rClock12M;
		else
			rClock12M <= rClock12M;
		end if;
	end process;
					

	
	u_rClock8M : process(Clock24M,Reset)
		variable clk_count : integer;
	begin
		if(Reset = '1') then
			rClock8M <= Clock24M;
			clk_count := 0;
			
		elsif(rising_edge(Clock24M) and Reset = '0') then
			if(rClock8M = '1') then
				rClock8M <= '0';
				clk_count := 0;
			elsif(rClock8M = '0') then
				if(clk_count = 1) then
					rClock8M <= '1';
					clk_count := 0;
				else
					clk_count := clk_count + 1;
					rClock8M <= '0';
				end if;
			else
				rClock8M <= rClock8M;
				clk_count := clk_count + 1;
			end if;
		else
			rClock8M <= rClock8M;
		end if;
	end process;


	u_rClock1M : process(Clock24M,Reset)
		variable clk_count : integer;
	begin
		if(Reset = '1') then
			rClock1M <= Clock24M;
			clk_count := 0;
		elsif(rising_edge(Clock24M) and Reset = '0') then
			if(clk_count = 12) then
				rClock1M <= not rClock1M;
				clk_count := 0;
			else
				rClock1M <= rClock1M;
				clk_count := clk_count + 1;
			end if;
		else
			rClock1M <= rClock1M;
		end if;
	end process;

	

	u_rClock1K : process(Clock24M,Reset)
		variable clk_count : integer;
	begin
		if(Reset = '1') then
			rClock1K <= Clock24M;
			clk_count := 0;
		elsif(rising_edge(Clock24M) and Reset = '0') then
			if(clk_count = 12000) then
				rClock1K <= not rClock1K;
				clk_count := 0;
			else
				rClock1K <= rClock1K;
				clk_count := clk_count + 1;
			end if;
		else
			rClock1K <= rClock1K;
		end if;
	end process;
	
end architecture;