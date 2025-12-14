LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity Protocol is
	port(
		Clock				: in		std_logic;
		Reset				: in		std_logic;
		
		TD_WrClk			: in		std_logic;		
		TD_Wr				: in		std_logic;
--		TD_Din				: in		std_logic_vector(31 downto 0);
		TD_Din				: in		std_logic_vector(15 downto 0);
		TD_Full				: out		std_logic;
		
--		MemData_Addr		: out		std_logic_vector(11 downto 0);
--		MemDataS			: in		std_logic_vector(0 downto 0);
--		MemDataR			: out		std_logic_vector(0 downto 0);
--		MemData_Rd			: out		std_logic;
--		MemData_Wr			: out		std_logic;
		
		DataS_Rd			: out	   	std_logic;
		DataS				: in		std_logic_vector(7 downto 0);
		
		
		
		
		BUS_Data			: out		std_logic;
		BUS_SE0				: out		std_logic;
		BUS_EOP				: out		std_logic;
		BUS_SOP				: out		std_logic;
		
		Data_SHClk			: in		std_logic;		
		Data_Out			: out		std_logic;
		Data_SHout			: in		std_logic;
		Data_Empty			: out		std_logic;
		Data_AEmpty			: out		std_logic
		
	);
end entity;


architecture A_Protocol of Protocol is


	type PROTOCOL_STATE_TYPE is(
		ST_RESET,
		ST_INIT,
		ST_IDLE,


		ST_TD_W1,
		ST_TD_W2,

		
		
		ST_SYNC,
		ST_PID,
		ST_FRAMENO,
		ST_ADDRESS,
		ST_ENDPOINT,
		
		ST_DATA,
		
		ST_RDDATA,
--		ST_WRDATA1,		
		

		ST_WD_W1,
		ST_WD_W2,
		ST_WD,
		

		ST_CRC_W1,
		ST_CRC_W2,
		ST_CRC5,
		ST_CRC16,
		
		
		ST_HANDSHAKE,
		ST_EOP,
		ST_ERROR
	);
	signal PTC_STATE : PROTOCOL_STATE_TYPE;



	

	
	component USBCrc is
		port(
			Clock				: in 			std_logic;
			Reset				: in 			std_logic;
			Data_in				: in 			std_logic;
			
			crc5_en				: in 			std_logic;
			crc5_clr			: in			std_logic;
			crc5				: out			std_logic_vector(4 downto 0);

			crc16_en			: in 			std_logic;
			crc16_clr			: in			std_logic;
			crc16				: out			std_logic_vector(15 downto 0)
		);	
	end component;


--	component TDQue is
--		port(
--			din: IN std_logic_VECTOR(31 downto 0);
--			rd_clk: IN std_logic;
--			rd_en: IN std_logic;
--			rst: IN std_logic;
--			wr_clk: IN std_logic;
--			wr_en: IN std_logic;
--			almost_empty: OUT std_logic;
--			almost_full: OUT std_logic;
--			dout: OUT std_logic_VECTOR(31 downto 0);
--			empty: OUT std_logic;
--			full: OUT std_logic
--		);
--	end component;

	component TDQue2 is
		port(
			din: IN std_logic_VECTOR(15 downto 0);
--			rd_clk: IN std_logic;
			rd_en: IN std_logic;
			rst: IN std_logic;
--			wr_clk: IN std_logic;
			clk : in std_logic;
			wr_en: IN std_logic;
			almost_empty: OUT std_logic;
			almost_full: OUT std_logic;
			dout: OUT std_logic_VECTOR(15 downto 0);
			empty: OUT std_logic;
			full: OUT std_logic
		);
	end component;

	component fifo1bit
		port(
		 	din: IN std_logic_VECTOR(0 downto 0);
			rd_clk: IN std_logic;
			rd_en: IN std_logic;
			rst: IN std_logic;
			wr_clk: IN std_logic;
			wr_en: IN std_logic;
			almost_empty: OUT std_logic;
			almost_full: OUT std_logic;
			dout: OUT std_logic_VECTOR(0 downto 0);
			empty: OUT std_logic;
			full: OUT std_logic
	); 
	end component;




--	signal TD_STATE				: State_ReadTD;
signal test : std_logic_vector(3 downto 0);


	
	signal rSync			: std_logic_vector(7 downto 0);
	signal rPid				: std_logic_vector(7 downto 0);
	signal rFrameno			: std_logic_vector(10 downto 0);
	signal rAddress			: std_logic_vector(6 downto 0);
	signal rEndpoint 		: std_logic_vector(3 downto 0);
	signal rCrc5			: std_logic_vector(4 downto 0);
	signal rCrc16			: std_logic_vector(15 downto 0);


--	signal rGenCrc5	  		: std_logic_vector(4 downto 0);
--	signal rGenCrc16		: std_logic_vector(15 downto 0);
	
	
	signal CRC_Din			: std_logic;	
	signal CRC_5en			: std_logic;
	signal CRC_5clr			: std_logic;
	signal CRC_5			: std_logic_vector(4 downto 0);
	signal CRC_16en			: std_logic;
	signal CRC_16clr		: std_logic;
	signal CRC_16			: std_logic_vector(15 downto 0);
	 
								  
	signal FF_RdEn			: std_logic;
	
--	signal TD_Dout			: std_logic
--	signal TD_Dout			: std_logic_vector(31 downto 0);
	signal TD_Dout			: std_logic_vector(15 downto 0);
	signal TD_Rd			: std_logic;
	signal TD_Empty			: std_logic;
--	signal TD_Din			: std_logic_vector(31 downto 0);
--	signal TD_Wr			: std_logic;
--	signal TD_Full			: std_logic;
	
	
	
	signal FF_Din			: std_logic_vector(0 downto 0);
	signal FF_Dout			: std_logic_vector(0 downto 0);
	signal FF_Wr			: std_logic;
	signal FF_Rd			: std_logic;
	signal FF_AFull			: std_logic;
	signal FF_Full			: std_logic;
	signal FF_AEmpty		: std_logic;
	signal FF_Empty			: std_logic;
	
	signal rbus_data				: std_logic;
	signal rbus_se0				: std_logic;
	signal rbus_eop				: std_logic;
	signal rbus_sof				: std_logic;
	
	
	
	
	signal Clock1K			: std_logic;
	signal Clock12M			: std_logic;
	
	signal DataCount		: integer;


	signal DataDir			: std_logic;


	----- MEMORY INTERFACE -----
	signal rMemData_Addr		: std_logic_vector(11 downto 0);
	signal rMemDataR			: std_logic;
	signal rMemData_Rd			: std_logic;
	signal rMemData_Wr			: std_logic;














signal rdatas_rd : std_logic;
signal rdata : std_logic_vector(7 downto 0);

	type BUS_TYPE is(
		ST_RESET,
		ST_Z,
		ST_Z2,
		ST_Z3,
		ST_SYNC1,		
		ST_SYNC,
		ST_PID,
		ST_ADDRESS,
		ST_FRAMENO,
		ST_ENDPOINT,
		ST_CRC5,
		ST_ENDCRC,
		ST_CRC16,
		ST_RDDATA,
		ST_WD,
		ST_SE0,
		ST_EOP,
		ST_IDLE,
		ST_ERROR,
		
		
		ST_SOP
	);
	signal DATA_STATE			: BUS_TYPE;


------------------------------------------------------	
	signal newsop : std_logic;
	signal rFF_RdEn				: std_logic;
	signal rTD_Dout				: std_logic_vector(31 downto 0);
	
begin

newsop <= '1' when DATA_STATE = ST_SOP else '0';

--TD_Dout <= X"D0000000";

u_DATA_STATE : process(Clock12M,Reset,Data_SHout)
		type PACKET_TYPE is(
			PK_SOF,
			PK_SETUP,
			PK_OUT,
			PK_IN,
			PK_DATA0,
			PK_DATA1,
			PK_ACK,
			PK_NAK,
			PK_STALL
		);
		variable packet : PACKET_TYPE;
		type DIR_TYPE is (DIR_IN,DIR_OUT);
		variable dir : DIR_TYPE;
		variable count : integer;
		variable pid : std_logic_vector(3 downto 0);
	begin
		if(Reset = '1') then
			DATA_STATE <= ST_RESET;
			count := 0;
			pid := "0000";
--		elsif(rising_edge(Clock12M) and Reset = '0') then
		elsif(Clock12M = '1' and Reset = '0') then
			
			case DATA_STATE is
			
				-------------------------------------------
				when ST_RESET =>
					if(count < 1) then
						DATA_STATE <= DATA_STATE;
						count := count + 1;
					else
						DATA_STATE <= ST_Z;
						count := 0;
						
					end if;
				-------------------------------------------


				when ST_Z =>
					if(Data_SHOut = '1') then
--						DATA_STATE <= ST_SYNC1;
--						DATA_STATE <= ST_SYNC;
						DATA_STATE <= ST_SOP;
					else
--						DATA_STATE <= ST_Z2;
						DATA_STATE <= DATA_STATE;
					end if;
					count := 0;


				when ST_Z2 =>
					if(Data_SHOut = '1') then
--						DATA_STATE <= ST_SYNC1;
--						DATA_STATE <= ST_SYNC;
						DATA_STATE <= ST_SOP;
					else
						DATA_STATE <= DATA_STATE;
					end if;
					count := 0;

				when ST_Z3 =>
					if(Data_SHOut = '1') then
--						DATA_STATE <= ST_SYNC1;
--						DATA_STATE <= ST_SYNC;
						DATA_STATE <= ST_SOP;
					else
						DATA_STATE <= DATA_STATE;
					end if;
					count := 0;

			 
			 
			 	when ST_SYNC1 =>
					DATA_STATE <= ST_SYNC;
			 
					
				
--				when ST_TD_W1 =>
--					DATA_STATE <= ST_TD_W2;
--
--					
--				when ST_TD_W2 =>
--					DATA_STATE <= ST_TD_W2;
--
--				when ST_TD_W2 =>
--					DATA_STATE <= ST_SYNC;

				
			

				
			  	
					
					
--					end if;
				
				
				when ST_FRAMENO =>
					if(count < 10) then
						DATA_STATE <= DATA_STATE;
						count := count + 1;
					else
						DATA_STATE <= ST_CRC5;
						count := 0;
					end if;
					
				
				when ST_ADDRESS =>
					if(count < 6) then
						DATA_STATE <= DATA_STATE;
						count := count + 1;
					else
						DATA_STATE <= ST_ENDPOINT;
						count := 0;
					end if;
				
				
				when ST_ENDPOINT =>
					if(count < 3) then
						DATA_STATE <= DATA_STATE;
						count := count + 1;
					else
						DATA_STATE <= ST_CRC5;
						count := 0;
					end if;
				
--				when ST_DATA =>
--					if(DataCount - 1 > 0) then
--						DATA_STATE <= DATA_STATE;
----						count := count + 1;
--					else
--						DATA_STATE <= ST_CRC_W1;
----						count := 0;
--					end if;

				when ST_RDDATA | ST_WD =>
					if(count < 63) then
						DATA_STATE <= DATA_STATE;
						count := count + 1;
					else
						DATA_STATE <= ST_CRC16;
						count := 0;
					end if;					
					
				
--				when ST_CRC_W1 =>
--					DATA_STATE <= ST_CRC_W2;
--					count := 0;
--					
--					
--				when ST_CRC_W2 =>
--					if(packet = PK_DATA0 or packet = PK_DATA1) then
--						DATA_STATE <= ST_CRC16;
--					else
--						DATA_STATE <= ST_CRC5;
--					end if;
--					count := 0;
					
					
				when ST_CRC5 =>
					if(count < 3) then
--					if(count < 4) then
						DATA_STATE <= DATA_STATE;
						count := count + 1;
					else
						DATA_STATE <= ST_ENDCRC;
						count := 0;
					end if;
					

				when ST_CRC16 =>
--					if(count < 14) then
					if(count < 15) then					
						DATA_STATE <= DATA_STATE;
						count := count + 1;
					else
						DATA_STATE <= ST_ENDCRC;
						count := 0;
					end if;				


				
				when ST_ENDCRC =>
					DATA_STATE <= ST_SE0;



				when ST_SE0 =>
					if(count < 1) then
						DATA_STATE <= DATA_STATE;
						count := count + 1;
					else
						DATA_STATE <= ST_EOP;
						count := 0;
					end if;


				when ST_EOP =>
					if(count < 15) then
						DATA_STATE <= DATA_STATE;
						count := count + 1;
					else
						DATA_STATE <= ST_IDLE;
						count := 0;
					end if;
								
 
 				when ST_IDLE =>
--					if(count < 1) then
--						DATA_STATE <= DATA_STATE;
--						count := count + 1;
--					else
--						DATA_STATE <= ST_Z;
--						count := 0;
--					end if;
--					DATA_STATE <= ST_Z;
					if(FF_EMPTY = '0') then
						DATA_STATE <= ST_SOP;
					else
						DATA_STATE <= ST_Z;
					end if;

					count := 0;




-------------------------------------------------------------------------------
				when ST_SYNC =>
					if(count < 7) then
						DATA_STATE <= DATA_STATE;
						count := count + 1;
					else
						DATA_STATE <= ST_PID;
						count := 0;
					end if;
					
				
				when ST_PID =>
--					if(count = 0) then
--						DATA_STATE <= DATA_STATE;
--						count := count + 1;
--					elsif(count < 5) then
					if(count < 4) then
						pid := FF_Dout & pid(3 downto 1);
						test <= FF_Dout & test(3 downto 1);
						DATA_STATE <= DATA_STATE;
						count := count + 1;
					elsif(count < 7) then
						DATA_STATE <= DATA_STATE;
						count := count + 1;
					else
						case pid is
							when "0101" =>
								-- Packet SOF --
								packet := PK_SOF;
							when "1101" =>
								-- Packet SETUP --
								packet := PK_SETUP;
								dir := DIR_OUT;
							when "0001" =>
								-- Packet OUT --
								packet := PK_OUT;
								dir := DIR_OUT;
							when "1001" =>
								-- Packet IN --
								packet := PK_IN;
								dir := DIR_IN;
							when "0011" =>
								-- Packet DATA0 --
								packet := PK_DATA0;
							when "1011" =>
								-- Packet DATA1 --
								packet := PK_DATA1;
							when "0010" =>
								-- Packet ACK --
								packet := PK_ACK;
							when "1010" =>
								-- Packet NAK --
								packet := PK_NAK;
							when "1110" =>
								-- Packet STALL --
								packet := PK_STALL;
							when others =>
   								DATA_STATE <= ST_ERROR;
						end case;


						if(packet = PK_SOF) then
							DATA_STATE <= ST_FRAMENO;
						elsif(packet = PK_OUT or packet = PK_IN or packet = PK_SETUP) then
							DATA_STATE <= ST_ADDRESS;
						elsif(packet = PK_DATA0 or packet = PK_DATA1) then -- or packet = PK_SETUP) then
							if(dir = DIR_OUT) then
								DATA_STATE <= ST_WD;
							elsif(dir = DIR_IN) then
								DATA_STATE <= ST_RDDATA;
							else
								DATA_STATE <= ST_ERROR;
							end if;
						elsif(packet = PK_ACK or packet = PK_NAK or packet = PK_STALL) then
							DATA_STATE <= ST_EOP;
						else
							DATA_STATE <= ST_EOP;
						end if;
						count := 0;
					end if;


				when ST_SOP =>
					DATA_STATE <= ST_SYNC;


--------------------------------------------------------------------------------
				when others =>
					DATA_STATE <= ST_SE0;
					count := 0;
					
			
			end case;
		else
			DATA_STATE <= DATA_STATE;
		end if;
	end process;















	
	
	----- MEMORY INTERFACE -----
--	MemData_Addr				<= rMemData_Addr;
--	MemDataR(0)					<= rMemDataR;
--	MemData_Rd					<= rMemData_Rd;
--	MemData_Wr					<= rMemData_Wr;
	
	
	
	

	-- Signal Assignment --
	BUS_DATA				<= rbus_data and (not DataDir);
	BUS_SE0					<= rbus_se0;
	BUS_EOP					<= rbus_eop;
--	BUS_SOP					<= rbus_sof;
	BUS_SOP					<= newsop;
	



--	Data_out				<= '1' when (DATA_STATE = ST_Z3 or DATA_STATE = ST_Z or DATA_STATE = ST_IDLE)
--									else FF_Dout(0);
	Data_out				<= FF_Dout(0);


	
--	FF_RD <= Data_Shout and FF_RDEn and newsop;


	CRC_Din <= FF_Din(0);
	
	
	
	Clock1K <= Data_SHClk;
	Clock12M <= Data_SHClk;

----------------
	FF_Rd						<= data_shout and rFF_RDEn;
--	ff_rd <= data_shout;
	
	

	-- Entity IO --
	Data_Empty					<= FF_Empty;
	Data_AEmpty					<= FF_AEmpty;


	
	u_USBCrc : USBCrc
	port map(
		Clock				=> Clock,
		Reset				=> Reset,
		Data_in				=> CRC_Din,
		crc5_en				=> CRC_5en,
		crc5_clr			=> CRC_5clr,
		crc5				=> CRC_5,

		crc16_en			=> CRC_16en,
		crc16_clr			=> CRC_16clr,
		crc16				=> CRC_16
	);
	
	
	
--	u_TDQue_out : TDQue
--	port map(
--		Rd_Clk 				=> Clock,
--		rst					=> Reset,
--		Wr_Clk				=> TD_WrClk,		
--		dout				=> TD_Dout,
--		wr_en				=> TD_Wr,
--		rd_en				=> TD_Rd,
--		din					=> TD_Din,
--		empty				=> TD_Empty,
--		full				=> TD_Full
--	);
	

	u_TDQue_out : TDQue2
	port map(
--		Rd_Clk 				=> Clock,
		rst					=> Reset,
--		Wr_Clk				=> TD_WrClk,		
		Clk					=> Clock,
		dout				=> TD_Dout,
		wr_en				=> TD_Wr,
		rd_en				=> TD_Rd,
		din					=> TD_Din,
		empty				=> TD_Empty,
		full				=> TD_Full
	);
	
	u_fifo1bit : fifo1bit
	port map(
		Wr_Clk				=> Clock,
		rst					=> Reset,
		Rd_Clk				=> Data_SHClk,
		din					=> FF_Din,
		dout				=> FF_Dout,
		Almost_Full			=> FF_AFull,
		Full				=> FF_Full,
		Almost_Empty		=> FF_AEmpty,
		Empty				=> FF_Empty,
		Rd_en				=> FF_Rd,
		Wr_en				=> FF_Wr
	);
		
	
	
--	u_DATA_STATE : process(Clock12M,Reset)
--		type PACKET_TYPE is(
--			PK_SOF,
--			PK_SETUP,
--			PK_OUT,
--			PK_IN,
--			PK_DATA0,
--			PK_DATA1,
--			PK_ACK,
--			PK_NAK,
--			PK_STALL
--		);
--		variable packet : PACKET_TYPE;
--		type DIR_TYPE is (DIR_IN,DIR_OUT);
--		variable dir : DIR_TYPE;
--		variable bitcount : integer;
--		variable pid : std_logic_vector(3 downto 0);
--	begin
--		if(Reset = '1') then
--			DATA_STATE <= ST_Z;
--			pid <= "0000";
--		elsif(rising_edge(Clock12M) and Reset = '0') then
--			case DATA_STATE is
--												
--				when ST_Z =>
--					if(Data_SHOut = '1') then
--						DATA_STATE <= ST_SYNC;
--						bitcount := 0;
--					else
--						DATA_STATE <= ST_Z2;
--					end if;
--
--				when ST_Z2 =>
--					if(Data_SHOut = '1') then
--						DATA_STATE <= ST_SYNC;
--						bitcount := 0;
--					else
--						DATA_STATE <= DATA_STATE;
--					end if;
--
--				
--				when ST_SYNC =>
--					if(bitcount < 7) then
--						DATA_STATE <= DATA_STATE;
--						bitcount := bitcount + 1;
--					else
----						case rPid(3 downto 0) is
----							when "0101" =>
----								-- Packet SOF --
----								packet := PK_SOF;
----							   --	PTC_STATE <= ST_FRAMENO;
----							when "1101" =>
----								-- Packet SETUP --
----								packet := PK_SETUP;
----								dir := DIR_OUT;
----							when "0001" =>
----								-- Packet OUT --
----								packet := PK_OUT;
----								dir := DIR_OUT;
----							when "1001" =>
----								-- Packet IN --
----								packet := PK_IN;
----								dir := DIR_IN;
----							when "0011" =>
----								-- Packet DATA0 --
----								packet := PK_DATA0;
----							when "1011" =>
----								-- Packet DATA1 --
----								packet := PK_DATA1;
----							when "0010" =>
----								-- Packet ACK --
----								packet := PK_ACK;
----							when "1010" =>
----								-- Packet NAK --
----								packet := PK_NAK;
----							when "1110" =>
----								-- Packet STALL --
----								packet := PK_STALL;
----							when others =>
----   								DATA_STATE <= ST_ERROR;
----						end case;
--					
--						DATA_STATE <= ST_PID;
--						bitcount := 0;
--					end if;
--					
--					
--									
--				when ST_PID =>
--					if(bitcount < 7) then
--						DATA_STATE <= DATA_STATE;
--						bitcount := bitcount + 1;
--					else
--						if(packet = PK_SOF) then
-- 							DATA_STATE <= ST_FRAMENO;
--						elsif(packet = PK_OUT or packet = PK_IN or packet = PK_SETUP) then
--							DATA_STATE <= ST_ADDRESS;
--						elsif(packet = PK_DATA0 or packet = PK_DATA1) then -- or packet = PK_SETUP) then
--							if(dir = DIR_OUT) then
--								DATA_STATE <= ST_WD;
--							elsif(dir = DIR_IN) then
--								DATA_STATE <= ST_RDDATA;
--							else
--								DATA_STATE <= ST_ERROR;
--							end if;
--						elsif(packet = PK_ACK or packet = PK_NAK or packet = PK_STALL) then
--							DATA_STATE <= ST_EOP;
--						else
--							DATA_STATE <= ST_EOP;
--						end if;
--						bitcount := 0;
--					end if;
--
--				when ST_FRAMENO =>
--					if(bitcount < 10) then
--						DATA_STATE <= DATA_STATE;
--						bitcount := bitcount + 1;
--					else
--						DATA_STATE <= ST_CRC5;
--						bitcount := 0;
--					end if;
--						
--
--					
--				when ST_ADDRESS =>
--					if(bitcount < 6) then
--						DATA_STATE <= ST_ADDRESS;
--						bitcount := bitcount + 1;
--					else
--						DATA_STATE <= ST_ENDPOINT;
--						bitcount := 0;
--					end if;
--							
--				when ST_ENDPOINT =>
--					if(bitcount < 3) then
--						DATA_STATE <= ST_ENDPOINT;
--						bitcount := bitcount + 1;
--					else
--						DATA_STATE <= ST_CRC5;
--						bitcount := 0;
--					end if;
--
--
--				when ST_CRC5 =>
--					if(bitcount < 4) then
--						DATA_STATE <= ST_CRC5;
--						bitcount := bitcount + 1;
--					else
--						DATA_STATE <= ST_EOP;
--						bitcount := 0;
--					end if;
--
--				when ST_EOP =>
--					if(bitcount < 1) then
--						DATA_STATE <= ST_EOP;
--						bitcount := bitcount + 1;
--					else
--						DATA_STATE <= ST_IDLE;
--						bitcount := 0;
--					end if;
--
--				when ST_IDLE =>
--					DATA_STATE <= ST_Z;
--				
--				
--					
--				
--				when others =>
--					DATA_STATE <= DATA_STATE;
--					
--					
--			end case;
--		else
--			DATA_STATE <= DATA_STATE;
--		end if;
--	end process;	

	
	
--	u_PTC_STATE : process(Clock,Reset)
--		variable bitcount : integer;
--		type PACKET_TYPE is(
--			PK_SOF,
--			PK_SETUP,
--			PK_OUT,
--			PK_IN,
--			PK_DATA0,
--			PK_DATA1,
--			PK_ACK,
--			PK_NAK,
--			PK_STALL
--		);
--		variable packet : PACKET_TYPE;
--	begin
--		if(Reset = '1') then
--			PTC_STATE <= ST_RESET;
--
--		elsif(rising_edge(Clock) and Reset = '0') then
--			case PTC_STATE is
--			
--				when ST_RESET =>
--					PTC_STATE <= ST_IDLE;
--					
--				when ST_IDLE =>
--					if(TD_Empty = '0') then
--						PTC_STATE <= ST_TD_W1;
--					else
--						PTC_STATE <= PTC_STATE;
--					end if;
--			
--				when ST_TD_W1 =>
--					PTC_STATE <= ST_TD_W2;
--					
--				when ST_TD_W2 =>
--					PTC_STATE <= ST_TD_W2;
--					
--				when ST_TD_W2 =>
--					PTC_STATE <= ST_SYNC;
--					bitcount := 0;
--
--				when ST_SYNC =>
--					if(bitcount < 7) then
--						PTC_STATE <= ST_SYNC;
--						bitcount := bitcount + 1;
--					else
--						PTC_STATE <= ST_PID;
--						bitcount := 0;
--						case rPid(3 downto 0) is
--							when "0101" =>
--								-- Packet SOF --
--								packet := PK_SOF;
--							when "1101" =>
--								-- Packet SETUP --
--								packet := PK_SETUP;
--							when "0001" =>
--								-- Packet OUT --
--								packet := PK_OUT;
--							when "1001" =>
--								-- Packet IN --
--								packet := PK_IN;
--							when "0011" =>
--								-- Packet DATA0 --
--								packet := PK_DATA0;
--							when "1011" =>
--								-- Packet DATA1 --
--								packet := PK_DATA1;
--							when "0010" =>
--								-- Packet ACK --
--								packet := PK_ACK;
--							when "1010" =>
--								-- Packet NAK --
--								packet := PK_NAK;
--							when "1110" =>
--								-- Packet STALL --
--								packet := PK_STALL;
--							when others =>
--								PTC_STATE <= ST_ERROR;
--						end case;
--					end if;
--					
--				when ST_PID =>
--					if(bitcount < 7) then
--						PTC_STATE <= ST_PID;
--						bitcount := bitcount + 1;
--					else
--						case packet is
--						
--							when PK_SOF =>
--								-- Packet SOF --
--								PTC_STATE <= ST_FRAMENO;
--
--							when PK_SETUP | PK_IN | PK_OUT =>
--								-- Packet SETUP --
--								PTC_STATE <= ST_ADDRESS;
--
--							when PK_DATA0 | PK_DATA1 =>
--								-- Packet DATA0 --
--								PTC_STATE <= ST_DATA;
--
--							when PK_ACK | PK_NAK | PK_STALL =>
--								-- Packet ACK --
--								PTC_STATE <= ST_EOP;
--
--							when others =>
--								PTC_STATE <= ST_ERROR;
--						
--						end case;
--						bitcount := 0;
--					end if;
--				
--				when ST_FRAMENO =>
--					if(bitcount < 10) then
--						PTC_STATE <= ST_FRAMENO;
--						bitcount := bitcount + 1;
--					else
----						PTC_STATE <= ST_CRC5;
--						PTC_STATE <= ST_CRC_W1;
--						bitcount := 0;
--					end if;
--					
--					
--				when ST_ADDRESS =>
--					if(bitcount < 6) then
--						PTC_STATE <= ST_ADDRESS;
--						bitcount := bitcount + 1;
--					else
--						PTC_STATE <= ST_ENDPOINT;
--						bitcount := 0;
--					end if;
--								
--				when ST_ENDPOINT =>
--					if(bitcount < 3) then
--						PTC_STATE <= ST_ENDPOINT;
--						bitcount := bitcount + 1;
--					else
--						PTC_STATE <= ST_CRC5;
--						bitcount := 0;
--					end if;
--
--
--				when ST_CRC5 =>
--					if(bitcount < 4) then
--						PTC_STATE <= ST_CRC5;
--						bitcount := bitcount + 1;
--					else
--						PTC_STATE <= ST_EOP;
--						bitcount := 0;
--					end if;
--
--				when ST_EOP =>
--					if(bitcount < 1) then
--						PTC_STATE <= ST_EOP;
--						bitcount := bitcount + 1;
--					else
--						PTC_STATE <= ST_IDLE;
--						bitcount := 0;
--					end if;
--				
--				when ST_CRC_W1 =>
--					PTC_STATE <= ST_CRC_W2;
--					
--				when ST_CRC_W2 =>
--					PTC_STATE <= ST_CRC5;
--								
--				when others =>
--					PTC_STATE <= PTC_STATE;
--			end case;
--			
--		else
--			PTC_STATE <= PTC_STATE;
--		end if;
--	end process;		
	
	

	u_rTD_Rd : process(Clock,Reset,PTC_STATE)
	begin
		if(Reset = '1') then
			TD_Rd <= '0';
--		elsif(rising_edge(Clock) and Reset = '0') then
		elsif(Clock = '1' and Reset = '0') then
			if(PTC_STATE = ST_TD_W1 and TD_Rd = '0') then
				TD_Rd <= '1';
			elsif(TD_Rd = '1') then
				TD_Rd <= '0';
			else
				TD_Rd <= TD_Rd;
			end if;
		else
			TD_Rd <= TD_Rd;
		end if;
	end process;				



	u_FF_Din : process(Clock,Reset)
	begin
		if(Reset = '1') then
			FF_Din <= "1";
		elsif(rising_edge(Clock) and Reset = '0') then
--		elsif(Clock = '1' and Reset = '0') then
			case PTC_STATE is
			
				when ST_INIT =>
					FF_Din <= FF_Din;

				when ST_SYNC =>
					FF_Din <= rSync(0 downto 0);
				
				when ST_PID	=>
					FF_Din <= rPid(0 downto 0);
				
				when ST_FRAMENO	=>
					FF_Din <= rFrameno(0 downto 0);

				when ST_ADDRESS	=>
					FF_Din <= rAddress(0 downto 0);
				
				when ST_ENDPOINT =>
					FF_Din <= rEndpoint(0 downto 0);
				
				when ST_DATA =>
					FF_Din <= rdata(0 downto 0);


				when ST_WD =>
					FF_Din <= rdata(0 downto 0);
					
				
				when ST_CRC5 =>
					FF_Din <= rCrc5(0 downto 0);
					
				when ST_CRC16 =>
					FF_Din <= rCrc16(0 downto 0);
					
				when others =>
					FF_Din <= FF_Din;
			end case;
		else
			FF_Din <= FF_Din;
		end if;
	end process;	


	u_FF_RdEn : process(Clock12M,Reset)--,DATA_STATE)
	begin
		if(Reset = '1') then
			FF_RdEn <= '0';
		elsif(rising_edge(Clock12M) and Reset = '0') then
--		elsif(Clock12M = '1' and Reset = '0') then
			if(DATA_STATE = ST_SYNC1) then			
				FF_RdEn <= '1';
			elsif(DATA_STATE = ST_Z3) then
				FF_RdEn <= '1';
			elsif(DATA_STATE = ST_SYNC) then
				FF_RdEn <= '1';
			elsif(DATA_STATE = ST_PID) then
				FF_RdEn <= '1';			
			elsif(DATA_STATE = ST_FRAMENO) then
				FF_RdEn <= '1';			
			elsif(DATA_STATE = ST_ADDRESS) then
				FF_RdEn <= '1';			
			elsif(DATA_STATE = ST_ENDPOINT) then
				FF_RdEn <= '1';			
			elsif(DATA_STATE = ST_WD) then
				FF_RdEn <= '1';			
			elsif(DATA_STATE = ST_CRC5) then
				FF_RdEn <= '1';
			elsif(DATA_STATE = ST_CRC16) then
				FF_RdEn <= '1';
			else
				FF_RdEn <= '0';
			end if;
		else
			FF_RdEn <= FF_RdEn;
		end if;
	end process;				
--	u_rSync : process(Clock,Clock12M,Reset)
--	begin
--		if(Reset = '1') then
--			rSync <= "00000000";
--		elsif(rising_edge(Clock12M) and Reset = '0') then
--			if(DATA_STATE = ST_SYNC) then
--				rSync <= '0' & rSync(7 downto 1);
--			else
--				rSync <= rSync;
--			end if;		
--		elsif(rising_edge(Clock) and Reset = '0' and PTC_STATE = ST_TD_W2) then
--  			rSync <= "10000000";
--		else
--			rSync <= rSync;
--		end if;
--	end process;
--
--
--	u_rPid : process(Clock,Clock12M,Reset)
--	begin
--		if(Reset = '1') then
--			rPid <= "00000000";
--		elsif(rising_edge(Clock12M) and Reset = '0') then
--			if(DATA_STATE = ST_PID) then
--				rPid <= '0' & rPid(7 downto 1);
--			else
--				rPid <= rPid;
--			end if;		
--		elsif(rising_edge(Clock) and Reset = '0' and PTC_STATE = ST_TD_W2) then
--			rPid <= TD_Dout(31 downto 24);
--		else
--			rPid <= rPid;
--		end if;
--	end process;
--
--
--	u_rAddress : process(Clock,Clock12M,Reset)
--	begin
--		if(Reset = '1') then
--			rAddress <= "0000000";
--		elsif(rising_edge(Clock12M) and Reset = '0') then
--			if(DATA_STATE = ST_ADDRESS) then
--				rAddress <= '0' & rAddress(6 downto 1);
--			else
--				rAddress <= rAddress;
--			end if;		
--		elsif(rising_edge(Clock) and Reset = '0' and PTC_STATE = ST_TD_W2) then
--			rAddress <= TD_Dout(23 downto 17);
--		else
--			rAddress <= rAddress;
--		end if;
--	end process;
--
--
--	u_rEndpoint : process(Clock,Clock12M,Reset)
--	begin
--		if(Reset = '1') then
--			rEndpoint <= "0000";
--		elsif(rising_edge(Clock12M) and Reset = '0') then
--			if(DATA_STATE = ST_ENDPOINT) then
--				rEndpoint <= '0' & rEndpoint(3 downto 1);
--			else
--				rEndpoint <= rEndpoint;
--			end if;		
--		elsif(rising_edge(Clock) and Reset = '0' and PTC_STATE = ST_TD_W2) then
--			rEndpoint <= TD_Dout(16 downto 13);
--		else
--			rEndpoint <= rEndpoint;
--		end if;
--	end process;
--
--
--	u_rCrc5 : process(Clock,Clock12M,Reset)
--	begin
--		if(Reset = '1') then
--			rCrc5 <= "00000";
--		elsif(rising_edge(Clock12M) and Reset = '0') then
--			if(DATA_STATE = ST_CRC5) then
--				rCrc5 <= '0' & rCrc5(4 downto 1);
--			else
--				rCrc5 <= rCrc5;
--			end if;		
--		elsif(rising_edge(Clock) and Reset = '0' and PTC_STATE = ST_TD_W2) then
--			rCrc5 <= TD_Dout(12 downto 8);
--		else
--			rCrc5 <= rCrc5;
--		end if;
--	end process;


	u_rSync : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rSync <= "00000000";
		elsif(rising_edge(Clock) and Reset = '0') then
			if(PTC_STATE = ST_TD_W2) then
				rSync <= "10000000";
			elsif(PTC_STATE = ST_SYNC) then
				rSync <= '0' & rSync(7 downto 1);
			else
				rSync <= rSync;
			end if;
		else
			rSync <= rSync;
		end if;
	end process;



	u_rPid : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rPid <= "00000000";
		elsif(rising_edge(Clock) and Reset = '0') then
			if(PTC_STATE = ST_TD_W2) then
				--rPid <= TD_Dout(31 downto 24);
				rPid <= (not TD_Dout(15 downto 12)) & TD_Dout(15 downto 12);
			elsif(PTC_STATE = ST_PID) then
				rPid <= '0' & rPid(7 downto 1);
			else
				rPid <= rPid;
			end if;
		else
			rPid <= rPid;
		end if;
	end process;


	u_rFrameno : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rFrameno <= "00000000000";
		elsif(rising_edge(Clock) and Reset = '0') then
			if(PTC_STATE = ST_TD_W2) then
				rFrameno <= TD_Dout(11 downto 1);
			elsif(PTC_STATE = ST_FRAMENO) then
				rFrameno <= '0' & rFrameno(10 downto 1);
			else
				rFrameno <= rFrameno;
			end if;
		else
			rFrameno <= rFrameno;
		end if;
	end process;
	
					
	u_rAddress : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rAddress <= "0000000";
		elsif(rising_edge(Clock) and Reset = '0') then
			if(PTC_STATE = ST_TD_W2) then
				rAddress <= TD_Dout(11 downto 5);
			elsif(PTC_STATE = ST_ADDRESS) then
				rAddress <= '0' & rAddress(6 downto 1);
			else
				rAddress <= rAddress;
			end if;
		else
			rAddress <= rAddress;
		end if;
	end process;


	u_rEndpoint : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rEndpoint <= "0000";
		elsif(rising_edge(Clock) and Reset = '0') then
		-- Read Endpoint when Read Byte2 State --
			if(PTC_STATE = ST_TD_W2) then
				rEndpoint <= TD_Dout(4 downto 1);
			elsif(PTC_STATE = ST_ENDPOINT) then
				rEndpoint <= '0' & rEndpoint(3 downto 1);
			else
				rEndpoint <= rEndpoint;
			end if;
		else
			rEndpoint <= rEndpoint;
		end if;
	end process;				


--	u_rMemData_Addr : process(Clock,Reset)
--	begin
--		if(Reset = '1') then
--			rMemData_Addr <= "000000000000";
--		elsif(rising_edge(Clock) and Reset = '0') then
--			if(PTC_STATE = ST_TD_W2) then
--				rMemData_Addr <= TD_Dout(27 downto 16);
--			elsif(PTC_STATE = ST_DATA) then
--				rMemData_Addr <= CONV_STD_LOGIC_VECTOR(CONV_INTEGER(rMemData_Addr) + 1,12);
--			else
--				rMemData_Addr <= rMemData_Addr;
--			end if;
--		else
--			rMemData_Addr <= rMemData_Addr;
--		end if;
--	end process;
--	
					

	u_DataCount : process(Clock,Reset)
	begin
		if(Reset = '1') then
			DataCount <= 0;
		elsif(rising_edge(Clock) and Reset = '0') then
			if(PTC_STATE = ST_TD_W2) then
				--DataCount <= TD_Dout(31 downto 24);
				DataCount <= CONV_INTEGER(TD_DOut(11 downto 8));
--			elsif(PTC_STATE = ST_WD or PTC_STATE = ST_RDDATA) then
			elsif(PTC_STATE = ST_WD_W1) then
				DataCount <= DataCount - 1;
			else
				DataCount <= DataCount;
			end if;
		else
			DataCount <= DataCount;
		end if;
	end process;


	u_rCrc5 : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rCrc5 <= "00000";
		elsif(rising_edge(Clock) and Reset = '0') then
			if(PTC_STATE = ST_TD_W2) then
--				rCrc5 <= TD_Dout(12 downto 8);
				rCrc5 <= "11111";
			elsif(PTC_STATE = ST_CRC_W2) then
				rCrc5 <= CRC_5;
			elsif(PTC_STATE = ST_CRC5) then
				rCrc5 <= '0' & rCrc5(4 downto 1);
			else
				rCrc5 <= rCrc5;
			end if;
		else
			rCrc5 <= rCrc5;
		end if;
	end process;

	u_rCrc16 : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rCrc16 <= "0000000000000000";
		elsif(rising_edge(Clock) and Reset = '0') then
			if(PTC_STATE = ST_TD_W2) then
				rCrc16 <= X"FFFF";
			elsif(PTC_STATE = ST_CRC_W2) then
				rCrc16 <= CRC_16;
			elsif(PTC_STATE = ST_CRC16) then
				rCrc16 <= '0' & rCrc16(15 downto 1);
			else
				rCrc16 <= rCrc16;
			end if;
		else
			rCrc16 <= rCrc16;
		end if;
	end process;	
	
	
	u_FF_Wr : process(Clock,Reset)
	begin
		if(Reset = '1') then
			FF_Wr <= '0';
		elsif(rising_edge(Clock) and Reset = '0') then
			if(PTC_STATE = ST_SYNC) then
				FF_Wr <= '1';
			elsif(PTC_STATE = ST_PID) then
				FF_Wr <= '1';
			elsif(PTC_STATE = ST_FRAMENO) then
				FF_Wr <= '1';
			elsif(PTC_STATE = ST_ADDRESS) then
				FF_Wr <= '1';
			elsif(PTC_STATE = ST_ENDPOINT) then
				FF_Wr <= '1';
			elsif(PTC_STATE = ST_DATA) then
				FF_Wr <= '1';				
			elsif(PTC_STATE = ST_CRC5) then
				FF_Wr <= '1';				
--			elsif(PTC_STATE = ST_CRC16) then
--				FF_Wr <= '1';


				
			elsif(PTC_STATE = ST_TD_W1) then
				FF_Wr <= '0';
			elsif(PTC_STATE = ST_SYNC) then			
				FF_Wr <= '1';



			elsif(PTC_STATE = ST_WD_W1) then
				FF_Wr <= '0';
			elsif(PTC_STATE = ST_WD) then
				FF_Wr <= '1';
			elsif(PTC_STATE = ST_CRC_W1) then
				FF_Wr <= '0';
			elsif(PTC_STATE = ST_CRC5) then
				FF_Wr <= '1';
			elsif(PTC_STATE = ST_CRC16) then
				FF_Wr <= '1';
				
			elsif(PTC_STATE = ST_EOP) then
				FF_Wr <= '0';
			
			
				
			
			else
				FF_Wr <= FF_Wr;
			end if;
			
		else
			FF_Wr <= FF_Wr;
		end if;
	end process;
	

--	u_rbus_sof : process(Clock,Reset)
--	begin
--		if(Reset = '1') then
--			rbus_sof <= '0';
--		elsif(rising_edge(Clock) and Reset = '0') then
--			if(DATA_STATE = ST_Z3 and Data_SHOut = '1') then
--				rbus_sof <= '1';
--			--elsif(DATA_STATE = ST_IDLE) then
--			elsif(rbus_sof = '1') then
--				rbus_sof <= '0';
--			else
--				rbus_sof <= rbus_sof;
--			end if;
--		else
--			rbus_sof <= rbus_sof;
--		end if;
--	end process;
					

	u_rbus_data : process(Clock,Reset,DATA_STATE)
	begin
		if(Reset = '1') then
			rbus_data <= '0';
--		elsif(rising_edge(Clock) and Reset = '0') then
		elsif(Clock = '1' and Reset = '0') then
--			if(DATA_STATE = ST_Z2 or DATA_STATE = ST_SYNC1 or DATA_STATE = ST_RESET or DATA_STATE = ST_Z) then
			if(DATA_STATE = ST_SYNC) then
				rbus_data <= '1';
			elsif(DATA_STATE <= ST_Z) then
				rbus_data <= '0';
			else
				rbus_data <= rbus_data;
			end if;
		else
			rbus_data <= rbus_data;
		end if;
	end process;
	
	

	u_rbus_se0 : process(Clock,Reset,DATA_STATE)
	begin
		if(Reset = '1') then
			rbus_se0 <= '0';
--		elsif(rising_edge(Clock) and Reset = '0') then
		elsif(Clock = '1' and Reset = '0') then
			if(DATA_STATE = ST_SE0) then
				rbus_se0 <= '1';
			else
				rbus_se0 <= '0';
			end if;
		else
			rbus_se0 <= rbus_se0;
		end if;
	end process;				


	u_CRC_5en : process(Clock,Reset)
	begin
		if(Reset = '1') then
			CRC_5en <= '0';
		elsif(rising_edge(Clock) and Reset = '0') then
			if(PTC_STATE = ST_FRAMENO) then
				CRC_5en <= '1';
			elsif(PTC_STATE = ST_ADDRESS) then
				CRC_5en <= '1';
			elsif(PTC_STATE = ST_ENDPOINT) then
				CRC_5en <= '1';
			else
				CRC_5en <= '0';
			end if;
		else
			CRC_5en <= CRC_5en;
		end if;
	end process;				
	
	u_CRC_5clr : process(Clock,Reset)
	begin
		if(Reset = '1') then
			CRC_5clr <= '0';
		elsif(rising_edge(Clock) and Reset = '0') then
			if(PTC_STATE = ST_TD_W1) then
				CRC_5clr <= '1';
			elsif(PTC_STATE = ST_TD_W2) then
				CRC_5clr <= '0';
			else
				CRC_5clr <= CRC_5clr;
			end if;
		else
			CRC_5clr <= CRC_5clr;
		end if;
	end process;
	
	
	u_CRC_16en : process(Clock,Reset)
	begin
		if(Reset = '1') then
			CRC_16en <= '0';
		elsif(rising_edge(Clock) and Reset = '0') then
			if(PTC_STATE = ST_WD) then
				CRC_16en <= '1';
			else
				CRC_16en <= '0';
			end if;
		else
			CRC_16en <= CRC_16en;
		end if;
	end process;				
	
	u_CRC_16clr : process(Clock,Reset)
	begin
		if(Reset = '1') then
			CRC_16clr <= '0';
		elsif(rising_edge(Clock) and Reset = '0') then
			if(PTC_STATE = ST_TD_W1) then
				CRC_16clr <= '1';
			elsif(PTC_STATE = ST_TD_W2) then
				CRC_16clr <= '0';
			else
				CRC_16clr <= CRC_16clr;
			end if;
		else
			CRC_16clr <= CRC_16clr;
		end if;
	end process;
	































	
	u_PTC_STATE : process(Clock,Reset)
		type PACKET_TYPE is(
			PK_SOF,
			PK_SETUP,
			PK_OUT,
			PK_IN,
			PK_DATA0,
			PK_DATA1,
			PK_ACK,
			PK_NAK,
			PK_STALL
		);
		variable packet : PACKET_TYPE;
		type DIR_TYPE is (DIR_IN,DIR_OUT);
		variable dir : DIR_TYPE;
		variable count : integer;
	begin
		if(Reset = '1') then
			PTC_STATE <= ST_RESET;
			count := 0;
		elsif(rising_edge(Clock) and Reset = '0') then
			
			case PTC_STATE is
			
				-------------------------------------------
				when ST_RESET =>
					if(count < 10) then
						PTC_STATE <= PTC_STATE;
						count := count + 1;
					else
						PTC_STATE <= ST_INIT;
						count := 0;
						
					end if;
				-------------------------------------------


				when ST_INIT =>
					PTC_STATE <= ST_IDLE;
					

				when ST_IDLE =>
					if(TD_Empty = '0') then
						PTC_STATE <= ST_TD_W1;
					else
						PTC_STATE <= PTC_STATE;
					end if;
					
				
				when ST_TD_W1 =>
					PTC_STATE <= ST_TD_W2;

					
				when ST_TD_W2 =>
					PTC_STATE <= ST_SYNC;


				when ST_SYNC =>
					if(count < 7) then
						PTC_STATE <= PTC_STATE;
						count := count + 1;
					else
						case rPid(3 downto 0) is
							when "0101" =>
								-- Packet SOF --
								packet := PK_SOF;
							   --	PTC_STATE <= ST_FRAMENO;
							when "1101" =>
								-- Packet SETUP --
								packet := PK_SETUP;
								dir := DIR_OUT;
							when "0001" =>
								-- Packet OUT --
								packet := PK_OUT;
								dir := DIR_OUT;
							when "1001" =>
								-- Packet IN --
								packet := PK_IN;
								dir := DIR_IN;
							when "0011" =>
								-- Packet DATA0 --
								packet := PK_DATA0;
							when "1011" =>
								-- Packet DATA1 --
								packet := PK_DATA1;
							when "0010" =>
								-- Packet ACK --
								packet := PK_ACK;
							when "1010" =>
								-- Packet NAK --
								packet := PK_NAK;
							when "1110" =>
								-- Packet STALL --
								packet := PK_STALL;
							when others =>
   								PTC_STATE <= ST_ERROR;
						end case;
					
						PTC_STATE <= ST_PID;
						count := 0;
					end if;				


				
				when ST_PID =>
					if(count < 7) then
						PTC_STATE <= PTC_STATE;
						count := count + 1;
					else
						if(packet = PK_SOF) then
 							PTC_STATE <= ST_FRAMENO;
						elsif(packet = PK_OUT or packet = PK_IN or packet = PK_SETUP) then
							PTC_STATE <= ST_ADDRESS;
						elsif(packet = PK_DATA0 or packet = PK_DATA1) then -- or packet = PK_SETUP) then
							if(dir = DIR_OUT) then
								PTC_STATE <= ST_WD_W1;
							elsif(dir = DIR_IN) then
								PTC_STATE <= ST_RDDATA;
							else
								PTC_STATE <= ST_ERROR;
							end if;
						elsif(packet = PK_ACK or packet = PK_NAK or packet = PK_STALL) then
							PTC_STATE <= ST_EOP;
						else
							PTC_STATE <= ST_EOP;
						end if;
						count := 0;
					end if;
				
					
				when ST_WD_W1 =>
					PTC_STATE <= ST_WD_W2;
					count := 0;
					
					
				when ST_WD_W2 =>
					PTC_STATE <= ST_WD;
					count := 0;
				
				
					
								
				when ST_FRAMENO =>
					if(count < 10) then
						PTC_STATE <= PTC_STATE;
						count := count + 1;
					else
						PTC_STATE <= ST_CRC_W1;
						count := 0;
					end if;
					
				
				when ST_ADDRESS =>
					if(count < 6) then
						PTC_STATE <= PTC_STATE;
						count := count + 1;
					else
						PTC_STATE <= ST_ENDPOINT;
						count := 0;
					end if;
				
				
				when ST_ENDPOINT =>
					if(count < 3) then
						PTC_STATE <= PTC_STATE;
						count := count + 1;
					else
						PTC_STATE <= ST_CRC_W1;
						count := 0;
					end if;
				
--				when ST_DATA =>
--					if(DataCount - 1 > 0) then
--						PTC_STATE <= PTC_STATE;
--					else
--						PTC_STATE <= ST_CRC_W1;
--
--					end if;

				when ST_RDDATA =>
					if(DataCount - 1 > 0) then
						PTC_STATE <= PTC_STATE;
					else
						PTC_STATE <= ST_CRC_W1;
					end if;					
					

				when ST_WD =>
					if(count < 7) then
						PTC_STATE <= PTC_STATE;
						count := count + 1;
					else
						if(DataCount = 0) then
							PTC_STATE <= ST_CRC_W1;
						else
							PTC_STATE <= ST_WD_W1;
						end if;
						count := 0;
					end if; 
						
--					if(DataCount - 1 > 0) then
--						PTC_STATE <= PTC_STATE;
--					else
--						PTC_STATE <= ST_CRC_W1;
--					end if;
				
				
				when ST_CRC_W1 =>
					PTC_STATE <= ST_CRC_W2;
					count := 0;
					
					
				when ST_CRC_W2 =>
					if(packet = PK_DATA0 or packet = PK_DATA1) then
						PTC_STATE <= ST_CRC16;
					else
						PTC_STATE <= ST_CRC5;
					end if;
					count := 0;
					
					
				when ST_CRC5 =>
					if(count < 4) then
						PTC_STATE <= PTC_STATE;
						count := count + 1;
					else
						PTC_STATE <= ST_EOP;
						count := 0;
					end if;
					

				when ST_CRC16 =>
					if(count < 15) then
						PTC_STATE <= PTC_STATE;
						count := count + 1;
					else
						PTC_STATE <= ST_EOP;
						count := 0;
					end if;				
				

				when ST_EOP =>
					PTC_STATE <= ST_IDLE;
					count := 0;
								
				when others =>
					PTC_STATE <= ST_EOP;
					count := 0;
					
			
			end case;
		else
			PTC_STATE <= PTC_STATE;
		end if;
	end process;
	

 	
--	u_rTD_Rd : process(Clock,Reset)
--	begin
--		if(Reset = '1') then
--			TD_Rd <= '0';
--		elsif(rising_edge(Clock) and Reset = '0') then
--			if(State = ST_READ1 or State = ST_READ2) then
--				TD_Rd <= '1';
--			else
--				TD_Rd <= '0';
--			end if;
--		else
--			TD_Rd <= TD_Rd;
--		end if;
--	end process;
	
			
	u_DataDir : process(Clock12M,Reset)
	begin
		if(Reset = '1') then
			DataDir <= '0';
		elsif(rising_edge(Clock12M) and Reset = '0') then
			if(DATA_STATE = ST_RDDATA) then
				DataDir <= '1';
			else
				DataDir <= '0';
			end if;
		else
			DataDir <= DataDir;
		end if;
	end process;				

			


			


	
					

--	u_FF_Rd : process(Clock,Reset)
--	begin
--		if(Reset = '1') then
--			FF_Rd <= '0';
--		elsif(rising_edge(Clock) and Reset = '0') then
--		else
--			FF_Rd <= FF_Rd;
--		end if;
--	end process;

	u_rMemData_Rd : process(Clock,Reset,PTC_STATE)
	begin
		if(Reset = '1') then
			rMemData_Rd <= '0';
--		elsif(rising_edge(Clock) and Reset = '0') then
		elsif(Clock = '1' and Reset = '0') then
			if(PTC_STATE = ST_WD) then
				rMemData_Rd <= '1';
			else
				rMemData_Rd <= '0';
			end if;
		else
			rMemData_Rd <= rMemData_Rd;
		end if;
	end process;				
	

	
	u_rMemData_Wr : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rMemData_Wr <= '0';
		elsif(rising_edge(Clock) and Reset = '0') then
			rMemData_Wr <= '0';
		else
			rMemData_Wr <= '0';
		end if;
	end process;				

	
	u_rbus_eop : process(Clock12M,Reset)
	begin
		if(Reset = '1') then
			rbus_eop <= '0';
		elsif(rising_edge(Clock12M) and Reset = '0') then
			if(DATA_STATE = ST_EOP) then
				rbus_eop <= '1';
			else
				rbus_eop <= '0';
			end if;
		else
			rbus_eop <= rbus_eop;
		end if;
	end process;											
					

















		  dataS_rd <= rdatas_rd;
		  
		  
		  
		u_rDataS_Rd : process(Clock,Reset,PTC_STATE)
	begin
		if(Reset = '1') then
			rDataS_Rd <= '0';
--		elsif(rising_edge(Clock) and Reset = '0') then
		elsif(Clock = '1' and Reset = '0') then
			if(PTC_STATE = ST_WD_W1) then
				rDataS_Rd <= '1';
			elsif(PTC_STATE = ST_WD_W2) then
				rDataS_Rd <= '0';
			else
				rDataS_Rd <= rDataS_Rd;
			end if;
		else
			rDataS_Rd <= rDataS_Rd;
		end if;
	end process;
	
	
	u_rdata : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rdata <= "00000000";
		elsif(rising_edge(Clock) and Reset = '0') then
			if(PTC_STATE = ST_WD) then
				rdata <= '0' & rdata(7 downto 1);
			elsif(PTC_STATE = ST_WD_W2) then
				rdata <= datas;
			else
			end if;
		else
			rdata <= rdata;
		end if;
	end process;				

----------------------------------------------------------------------	


	u_rFF_RdEn : process(Clock12M,Reset,DATA_STATE)
	begin
		if(Reset = '1') then
			rFF_RdEn <= '0';
--		elsif(rising_edge(Clock12M) and Reset = '0') then
		elsif(Clock12M = '1' and Reset = '0') then
			if(DATA_STATE = ST_SOP) then
				rFF_RdEn <= '1';
			elsif(DATA_STATE = ST_ENDCRC) then
				rFF_RdEn <= '0';
			elsif(DATA_STATE = ST_SE0) then
				rFF_RdEn <= '0';
			else
				rFF_RdEn <= rFF_RdEn;
			end if;
		else
			rFF_RdEn <= rFF_RdEn;
		end if;
	end process;				
	








--u_FF_RdEn : process(Clock12M,Reset)--,DATA_STATE)
--	begin
--		if(Reset = '1') then
--			FF_RdEn <= '0';
--		elsif(rising_edge(Clock12M) and Reset = '0') then
----		elsif(Clock12M = '1' and Reset = '0') then
--			if(DATA_STATE = ST_SYNC1) then			
--				FF_RdEn <= '1';
--			elsif(DATA_STATE = ST_Z3) then
--				FF_RdEn <= '1';
--			elsif(DATA_STATE = ST_SYNC) then
--				FF_RdEn <= '1';
--			elsif(DATA_STATE = ST_PID) then
--				FF_RdEn <= '1';			
--			elsif(DATA_STATE = ST_FRAMENO) then
--				FF_RdEn <= '1';			
--			elsif(DATA_STATE = ST_ADDRESS) then
--				FF_RdEn <= '1';			
--			elsif(DATA_STATE = ST_ENDPOINT) then
--				FF_RdEn <= '1';			
--			elsif(DATA_STATE = ST_WD) then
--				FF_RdEn <= '1';			
--			elsif(DATA_STATE = ST_CRC5) then
--				FF_RdEn <= '1';
--			elsif(DATA_STATE = ST_CRC16) then
--				FF_RdEn <= '1';
--			else
--				FF_RdEn <= '0';
--			end if;
--		else
--			FF_RdEn <= FF_RdEn;
--		end if;
--	end process;				
	
	
	
end architecture;







-- Transaction Structure
-- |  3                   2                   1                   0|
-- |1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0|
-- |7 6 5 4 3 2 1 0 7 6 5 4 3 2 1 0 7 6 5 4 3 2 1 0 7 6 5 4 3 2 1 0|
-- |- - Sync  - - -|- - - Pid - - -|- - address -|- endp-|- - crc -|

