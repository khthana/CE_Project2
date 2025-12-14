LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity USBCrc is
	port(
		Clock				: in 			std_logic;
		Reset				: in 			std_logic;
		Data_in				: in 			std_logic;
				
		crc5_en				: in 			std_logic;
		crc5_clr			: in			std_logic;
		crc5				: out			std_logic_vector(4 downto 0);
		crc5_res			: out			std_logic_vector(4 downto 0);
		
	   	crc16_en			: in 			std_logic;
		crc16_clr			: in			std_logic;
		crc16				: out			std_logic_vector(15 downto 0);
		crc16_res			: out			std_logic_vector(15 downto 0)
	);
end entity;


architecture A_USBCrc of USBCrc is


--	constant crc5_div		: std_logic_vector(4 downto 0) := "00101";
	constant crc5_div		: std_logic_vector(4 downto 0) := "10100";
	constant crc16_div		: std_logic_vector(15 downto 0) := "1010000000000001";

	signal rcrc5	 		: std_logic_vector(4 downto 0);
	signal rcrc5_load		: std_logic_vector(4 downto 0);
	signal rxor5_en			: std_logic;

	signal rcrc16			: std_logic_vector(15 downto 0);
	signal rcrc16_load		: std_logic_vector(15 downto 0);
	signal rxor16_en		: std_logic;


begin
	
--	rxor5_en				<= Data_in xor rcrc5(4);
--	rcrc5_load				<= rcrc5(3 downto 0) & '0';
--	crc5					<= not rcrc5;
	rxor5_en				<= Data_in xor rcrc5(0);
	rcrc5_load				<= '0' & rcrc5(4 downto 1);
	crc5					<= not rcrc5;
	crc5_res				<= rcrc5;
	
	rxor16_en				<= Data_in xor rcrc16(0);
	rcrc16_load				<= '0' & rcrc16(15 downto 1);
	crc16					<= not rcrc16;
	crc16_res				<= rcrc16;


	u_rcrc5 : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rcrc5 <= "11111";
		elsif(crc5_clr = '1') then
			rcrc5 <= "11111";
		elsif(rising_edge(Clock) and Reset = '0' and crc5_en = '1') then
			if(rxor5_en = '1') then
				rcrc5 <= (rcrc5_load xor crc5_div);
			elsif(rxor5_en = '0') then
				rcrc5 <= rcrc5_load;
			else
				rcrc5 <= rcrc5;
			end if;
		else
			rcrc5 <= rcrc5;
		end if;
	end process;


	u_rcrc16 : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rcrc16 <= "1111111111111111";
		elsif(crc16_clr = '1') then
			rcrc16 <= "1111111111111111";		
		elsif(rising_edge(Clock) and Reset = '0' and crc16_en = '1') then
			if(rxor16_en = '1') then
				rcrc16 <= (rcrc16_load xor crc16_div);
			elsif(rxor16_en = '0') then
				rcrc16 <= rcrc16_load;
			else
				rcrc16 <= rcrc16;
			end if;
		else
			rcrc16 <= rcrc16;
		end if;
	end process;

end architecture;