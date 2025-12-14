library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Transceiver_in is
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
end entity;



architecture A_Transceiver_in of Transceiver_in is

	signal rPrevState		: std_logic;
	signal rData_out		: std_logic;
	signal rData_in			: std_logic;


	type bus_state_type is(
		bus_init,
		bus_reset,
		bus_discon,
		bus_fs,
		bus_ls
	);
	signal bus_state : bus_state_type;
	
begin

	
	DataR_out				<= rData_out;
	status_full				<= '1' when bus_state = bus_fs else '0';
	status_low				<= '1' when bus_state = bus_ls else '0';	
	
	

	u_bus_state : process(Clock,Reset)
		variable count : integer;
		variable wait_fs : bit;
		variable wait_ls : bit;		
	begin
		if(Reset = '1') then
			bus_state <= bus_reset;
			count := 0;
			wait_fs := '0';
			wait_ls := '0';			
		elsif(rising_edge(Clock) and Reset = '0') then
			case bus_state is
				when bus_reset =>
					bus_state <= bus_discon;
					count := 0;
					wait_fs := '0';
					wait_ls := '0';			
					
				when bus_discon =>
					if(count < 100) then
						if(dplus = '1' and dminus = '0' and wait_ls = '0') then
							bus_state <= bus_state;
							wait_fs := '1';
							count := count + 1;
						elsif(dplus = '0' and dminus = '1' and wait_fs = '0') then
							bus_state <= bus_state;
							wait_ls := '1';
							count := count + 1;						
						else
							bus_state <= bus_state;
							count := 0;
							wait_fs := '0';
							wait_ls := '0';
						end if;
					else
						if(wait_ls = '1') then
							bus_state <= bus_ls;
						elsif(wait_fs = '1') then
							bus_state <= bus_fs;
						else
							bus_state <= bus_state;
						end if;
						count := 0;
					end if;

					
				when bus_fs | bus_ls =>
					if(dplus = '0' and dminus = '0') then
						if(count < 500) then
							bus_state <= bus_state;
							count := count + 1;
						else
							bus_state <= bus_discon;
							count := 0;
						end if;
					else
						bus_state <= bus_state;
						count := 0;
					end if;
			
				when others =>
					bus_state <= bus_state;
			end case;
		else
			bus_state <= bus_state;
		end if;
	end process;				

	u_rData_in : process(Reset,dplus,dminus)
	begin
		if(Reset = '1') then
			rData_in <= '1';
		elsif(dplus = '1' and dminus = '0') then
			rData_in <= '1';
		elsif(dplus = '0' and dminus = '1') then
			rData_in <= '0';
		else
			rData_in <= rData_in;
		end if;
	end process;

	
	u_rPrevState : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rPrevState <= '1';
		elsif(rising_edge(Clock) and Reset = '0') then
			rPrevState <= rData_in;
		else
			rPrevState <= rPrevState;
		end if;
	end process;
	
	
	u_rData_out : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rData_out <= '1';
		elsif(rising_edge(Clock) and Reset = '0') then
			if(rData_in = rPrevState) then
				rData_out <= '1';
			else
				rData_out <= '0';
			end if;
		else
			rData_out <= rData_out;
		end if;
	end process;
	
end architecture;

