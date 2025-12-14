library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


-- BitStuff_D  :  BitStuff Decoder
entity BitStuff_in is
	port(
		Clock				: in		std_logic;
		Reset				: in		std_logic;
		CE					: in		std_logic;
		DataR_in  			: in		std_logic;
		DataR_out			: out		std_logic;
		DataR_Wr  			: out		std_logic
	);
end entity;




architecture A_BitStuff_in of BitStuff_in is

	constant	Delay			: time := 1 ns;

	signal		rData_out		: std_logic;
	signal		rStuff_EN		: std_logic;
	signal		rRd				: std_logic;
	signal		rRd_lat			: std_logic;	

	signal		rWr				: std_logic;  
	shared variable Count_one	: integer := 0;

	
begin

-- Combination Signal Assignment
	DataR_out			<= rData_out after Delay when Ce = '1' and rWr = '1' else 'Z' after Delay;
--	Rd					<= rRd and CE and (not rStuff_EN) after Delay;
	DataR_Wr		 	<= rWr and CE and (not rStuff_EN) after Delay;
	


	u_rStuff_EN : process(Clock,Reset)
--		variable count_one : integer;
	begin
		if(Reset = '1') then
			rStuff_EN <= '0';
			count_one := 0;
		elsif(rising_edge(Clock) and Reset = '0' and CE = '1') then
			if(rStuff_EN = '1') then
				rStuff_EN <= '0';
				count_one := 0;
			elsif(DataR_in = '1') then
				if(count_one = (6 - 1)) then
					rStuff_EN <= '1';
				else
					count_one := count_one + 1;
					rStuff_EN <= rStuff_EN;
				end if;
			elsif(DataR_In = '0') then
				count_one := 0;
			else
				count_one := count_one;
			end if;
		else
			rStuff_EN <= rStuff_EN;
		end if;
	end process;



	u_rData_out : process(Clock,Reset)
	begin
		if(Reset = '1') then
			-- TODO when reset
			rData_out <= '0';
--		elsif(rising_edge(Clock) and Reset = '0' and CE = '1' and rRd_lat = '1') then
		elsif(rising_edge(Clock) and Reset = '0' and CE = '1') then
			if(rStuff_EN = '1') then
				--rData_out <= '0';
				rData_out <= rData_out;
			else
				rData_out <= DataR_in;
			end if;
		else
			rData_out <= rData_out;
		end if;
	end process u_rData_out;
	


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
	
	u_rWr : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rWr <= '0';
		elsif(rising_edge(Clock) and Reset = '0') then
			if(CE = '1') then
				rWr <= '1';
			elsif(CE = '0') then
				rWr <= '0';
			else
				rWr <= rWr;
			end if;
		else
			rWr <= rWr;
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
--	u_rDout : process(Clock)
--	begin
--		if(Reset = '1') then
--			rDout <= '1';
--		elsif(rising_edge(Clock)) then
--			-- Insert Action of BitStuff here.
--			if(Stuff_lat = '1') then
--				rDout <= '0';
--			else
--				rDout <= rDin;
--			end if;
--		else
--			rDout <= rDout;
--		end if;
--	end process u_rDout;
--
--	
--	u_rRead : process(clock)
--	begin
--		if(Reset = '1') then
--			rRead <= '0';
--		elsif(rising_edge(Clock)) then
--			-- Insert Read Signal Here
--			if(Stuff = '1') then
--				rRead <= '0';
--			else
--				rRead <= '1';
--			end if;
--		else
--			rRead <= rRead;
--		end if;
--	end process u_rRead;
--
--	
--	
--	u_Count_Bit1 : process(Clock)
--	begin
--		if(Reset = '1') then
--			Count_Bit1 := 0;
--		elsif(rising_edge(Clock)) then
--			if(Count_Bit1 = 5) then
--				Count_Bit1 := 0;
--			elsif(Din = '1') then
--				Count_Bit1 := Count_Bit1 + 1;
--			else
--				Count_Bit1 := 0;
--			end if;
--		else
--			Count_Bit1 := Count_Bit1;
--		end if;
--	end process u_Count_Bit1;
--
--
--	
--	
--	u_Stuff : process(clock)
--	begin
--		if(Reset = '1') then
--			Stuff <= '0';
--		elsif(rising_edge(Clock)) then
--			if(Count_Bit1 = 5) then
--				Stuff <= '1';
--			else
--				Stuff <= '0';
--			end if;
--		else
--			Stuff <= Stuff;
--		end if;
--	end process u_Stuff;
--
--		
--	u_Stuff_lat : process(clock)
--	begin
--		if(Reset = '1') then
--			Stuff_lat <= '0';
--		elsif(rising_edge(Clock)) then
--			Stuff_lat <= Stuff;
--		else
--			Stuff_lat <= Stuff_lat;
--		end if;
--	end process u_Stuff_lat;
		
	-- Process templete
--	u_ : process(clock)
--	begin
--		if(Reset = '1') then
--		elsif(rising_edge(Clock)) then
--		else
--		end if;
--	end process u_;
	
end architecture;
	