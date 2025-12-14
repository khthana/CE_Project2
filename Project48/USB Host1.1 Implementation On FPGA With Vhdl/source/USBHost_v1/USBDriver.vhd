LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;


entity USBDriver is
	port(
		Clock				: in 			std_logic;
		Clock1K				: in			std_logic;
		Reset				: in 			std_logic;
		
		TD_Wr				: out			std_logic;
--		TD_Din				: out			std_logic_vector(31 downto 0);
		TD_Din				: out			std_logic_vector(15 downto 0);
		TD_Full				: in			std_logic;
		
		
		UserWr				: in			std_logic;
		UserRd				: in			std_logic;
		
		DataS_Wr			: out			std_logic;
		DataS				: out			std_logic_vector(7 downto 0)
	);
end entity;




architecture A_USBDriver of USBDriver is

	-- Constant Parameter --
	signal CONST_ADDRESS	: std_logic_vector(6 downto 0)		:= "0000001";
	signal CONST_ENDPOINT	: std_logic_vector(3 downto 0)		:= "0001";


	-- Transaction Descriptor Queue Interface --
	signal rTD_Wr			: std_logic;
--	signal rTD_Wr_Lat		: std_logic;
--	signal rTD_Din			: std_logic_vector(31 downto 0);
	signal rTD_Din			: std_logic_vector(15 downto 0);
	
	-- USB Parameter --
--	signal rPid				: std_logic_vector(3 downto 0);	
--	signal rAddress			: std_logic_vector(6 downto 0);
--	signal rEndpoint 		: std_logic_vector(3 downto 0);
--	signal rFrameno			: std_logic_vector(10 downto 0);
--
--
--	signal WR_Signal		: std_logic;
--	signal WR_sig1			: std_logic;
--	signal WR_sig2			: std_logic;
--	
--	signal RD_signal		: std_logic;
--	signal RD_sig1			: std_logic;
--	signal RD_sig2			: std_logic;
--	
--	signal SOF_Signal		: std_logic;
--	signal SOF_sig1			: std_logic;
--	signal SOF_sig2			: std_logic;
--	
	
	
	signal Int_Flag 		: std_logic;

	type PACKET_TYPE is(
		PK_RESET,
		PK_INIT,
		PK_IDLE,
		PK_SOF,
		PK_IN,
		PK_OUT,
		PK_RDWRWAIT,
		PK_RD,
		PK_WR,
		PK_EOF,
		PK_DATA0,
		PK_DATA1,
		PK_RDDATA,
		PK_ACK,
		PK_NAK,
		PK_STALL,
		PK_HANDSHAKE,
		PK_WAIT1,
		PK_TEST
	);
	
	signal PACKET : PACKET_TYPE;
	
	type write_state_type is(
		t_init,
		t_rst,
		t_wait,
		t_wdata,
		t_write,
		t_unwrite,
		t_setup,
		t_pout,
		t_end
	);
	
	signal write_state : write_state_type;
	
	


	signal rDataS			: std_logic_vector(7 downto 0);
	signal rDataS_Wr		: std_logic;
	
	signal wsig				: std_logic;
	
begin

	TD_Wr					<= rTD_Wr;
	TD_Din					<= rTD_Din;
	
	wsig <= not UserWr;
	
	

--	SOF_Signal				<= SOF_sig1 and (not SOF_sig2);
--	WR_Signal				<= WR_sig1 and (not WR_sig2);
--	WR_Signal <= '1';
--	RD_Signal				<= RD_sig1 and (not RD_sig2);



 --	DataS					<= rDataS;
 --	DataS_Wr				<= rDataS_Wr;
	
	

	u_write_state : process(Clock,Reset)
		variable count : integer;
	begin
		if(Reset = '1') then
			write_state <= t_rst;
			count := 0;
		elsif(rising_edge(Clock) and Reset = '0') then
			case write_state is
				when t_rst =>
--					if(count < 100) then
--						write_state <= write_state;
--						count := count + 1;
--					else
--						write_state <= t_setup;
--						count := 0;
--					end if;
					write_state <= t_wait;
					
				when t_wait =>
					if(wsig = '1') then
--						write_state <= t_write;
						write_state <= t_setup;
					else
						write_state <= write_state;
					end if;
					
				when t_setup =>
--					write_state <= t_pout;
					write_state <= t_wdata;
					
				when t_pout =>
					write_state <= t_unwrite;
					
				when t_write =>
--					write_state <= t_setup;
					
				when t_unwrite =>
					if(wsig = '0') then
						write_state <= t_end;
					else
						write_state <= write_state;
					end if;
				
				when t_wdata =>
					if(count < 7) then
						count := count + 1;
						write_state <= write_state;	
					else
						count := 0;
						write_state <= t_pout;
					end if;
				when others =>
					write_state <= write_state;
			end case;
		else
			write_state <= write_state;
		end if;
	end process;					


	u_td_din : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rtd_din <= X"0000";
		elsif(rising_edge(Clock) and Reset = '0') then
			if(write_state = t_setup) then
				rtd_din <= X"D000";
			elsif(write_state = t_pout) then
				rTD_Din <= X"3800";
			else
				rTD_Din <= rTD_din;  
			end if;
		else
			rtd_din <= rtd_din;
		end if;
	end process;				


	u_rtd_wr : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rtd_wr <= '0';
		elsif(rising_edge(Clock) and Reset = '0') then
			if(write_state = t_setup) then
				rtd_wr <= '1';
			elsif(write_state = t_pout) then
				rtd_wr <= '1';
			else
				rtd_wr <= '0';
			end if;
		else
			rtd_wr <= rtd_wr;
		end if;
	end process;				


	
	u_rDataS : process(Clock,Reset)
		variable step : integer;
	begin
		if(Reset = '1') then
			rDataS <= X"00";
			step := 0;
		elsif(rising_edge(Clock) and Reset = '0' and write_state = t_wdata) then
			case step is				  				
				when 0 =>
					rDataS <= X"00";
					step := step + 1;					
				when 1 =>
					rDataS <= X"00";
					step := step + 1;					
				when 2 =>					
					rDataS <= X"00";
					step := step + 1;					
				when 3 =>					
					rDataS <= X"00";
					step := step + 1;					
				when 4 =>					
					rDataS <= X"01";
					step := step + 1;					
				when 5 =>					
					rDataS <= X"00";
					step := step + 1;					
				when 6 =>					
					rDataS <= X"06";
					step := step + 1;					
				when 7 =>
					rDataS <= X"80";
					step := step + 1;					
				when others =>
					rDataS <= rDataS;

			end case;
		else
			rDataS <= rDataS;
		end if;
	end process;
	
	u_rDataS_Wr : process(Clock,Reset)
	begin
		if(Reset = '1') then
			rDataS_Wr <= '0';
		elsif(rising_edge(Clock) and Reset = '0') then
			if(write_state = t_wdata) then
				rDataS_Wr <= '1';
			else
				rDataS_Wr <= '0';
			end if;
		else
			rDataS_Wr <= rDataS_Wr;
		end if;
	end process;				
	
	

--	u_test : process(Clock,Reset)
--		variable step : integer;
--	begin
--		if(Reset = '1') then
--			step := 0;
--			datas_wr <= '0';
--			datas <= "00000000";
--			rtd_wr <= '0';
--			rtd_din <= "00000000000000000000000000000000";
--		elsif(rising_edge(Clock) and Reset = '0') then
--
--				case step is
--		  				
--					when 0 =>
--						datas_wr <= '1';
--						datas <= X"00";
--						step := step + 1;					
--					when 1 =>
--						datas <= X"00";
--						step := step + 1;					
--					when 2 =>					
--						datas <= X"00";
--						step := step + 1;					
--					when 3 =>					
--						datas <= X"00";
--						step := step + 1;					
--					when 4 =>					
--						datas <= X"01";
--						step := step + 1;					
--					when 5 =>					
--						datas <= X"00";
--						step := step + 1;					
--					when 6 =>					
--						datas <= X"06";
--						step := step + 1;					
--					when 7 =>
--						datas <= X"80";
--						step := step + 1;					
--					when 8 =>
--						datas_wr <= '0';
--						rtd_wr <= '1';
--						rtd_din <= "11010000000000000000000000000000";
--						step := step + 1;										
--					when 9 =>
--						rtd_din <= "00110000000000000000100000000000";
--						step := step + 1;				
--					when 10 =>
--						rtd_wr <= '0';
--						step := step + 1;				
--
--
--					when others =>
----						 datas_wr <= datas_wr;
--
--				end case;
--		else
--			--datas_wr <= datas_wr;
--		end if;
--	end process;				

	
	
	
	
	
--	u_PACKET : process(Clock,Reset)
--		variable count : integer;
--		variable startup : bit;
--	begin
--		if(Reset = '1') then
--			PACKET <= PK_IDLE;
--			count := 0;
--			startup := '1';
--			
--		elsif(rising_edge(Clock) and Reset = '0') then
--			case PACKET is
--			
--				-- Reset FPGA --
--				when PK_RESET =>
--					if(count < 50) then
--						PACKET <= PACKET;
--						count := count + 1;
--					else
--						PACKET <= PK_INIT;
--						count := 0;
--					end if;
--
--				
--
--				when PK_IDLE =>
--					PACKET <= PK_EOF;
--
--				
--				-- Initial Device --
--				when PK_INIT =>
--					if(count > 0) then
----						PACKET <= PK_EOF;
--						PACKET <= PK_TEST;
--						count := 0;
--					else
--						PACKET <= PACKET;
--						count := count + 1;
--					end if;
--					
--					
--				when PK_EOF =>
--					if(SOF_Signal = '1') then
--						PACKET <= PK_INIT;
--					else
--						PACKET <= PACKET;
--					end if;
----					PACKET <= PK_INIT;
--
--					
--				when PK_SOF =>
--					if(startup = '1') then
--						PACKET <= PK_INIT;
--						startup := '0';
--					else
----						if(WR_Signal = '1') then
----							PACKET <= PK_WR;
----						elsif(RD_Signal = '1') then
----							PACKET <= PK_RD;
----						else
----							PACKET <= PK_WAIT1;
----						end if;
--						if(Int_Flag = '1') then
--							PACKET <= PK_IN;
--						else
--							PACKET <= PK_WAIT1;
--						end if;
--					end if;
--
--				
--				when PK_IN =>
--					PACKET <= PK_DATA0;
--				
--				
--				when PK_DATA0 | PK_DATA1 =>
--					PACKET <= PK_ACK;
--				
--				
--				when PK_ACK =>
--					PACKET <= PK_WAIT1;
--					
--	
--				when PK_WAIT1 =>
--					PACKET <= PK_IDLE;
--				
--
--				WHEN pk_TEST =>
--					PACKET <= PACKET;
--
--				when others =>
--					PACKET <= PACKET;	
--			end case;
--		else
--			PACKET <= PACKET;
--		end if;
--	end process;				

																						 

	
--	u_rTD_Din : process(Clock,Reset)
--		variable substate : integer;
--	begin
--		if(Reset = '1') then
--			rTD_Din <= X"00000000";
--			substate := 0;
--		elsif(Clock = '1' and Reset = '0') then
--			if(PACKET = PK_INIT) then
--				-- Configurtion Device --
--				case substate is
--					-- Set Device Address --
--					when 0 =>
--						-- Set Token : Setup --
--						rTD_Din(31 downto 28) <= "1101";
--						rTD_Din(27 downto 21) <= "0000000";
--						rTD_Din(20 downto 17) <= "0000";
--						rTD_Din(16 downto 0) <= "00000000000000000";
--					when 1 =>
--						-- Set Data : Set Address --
--						rTD_Din(31 downto 28) <= "0011";
--						rTD_Din(27 downto 16) <= "000000000000";	-- Data Pointer
--						rTD_Din(15 downto 8) <= "00001000";			-- Size of data 64 bits
--						rTD_Din(7 downto 0) <= "00000000";
--						substate := 10;
--					-- Set Device Configuration	--
--					when 2 =>
--						-- Set Token : Setup --
--						rTD_Din(31 downto 28) <= "1101";
--						rTD_Din(27 downto 21) <= rAddress;
--						rTD_Din(20 downto 17) <= "0000";
--						rTD_Din(16 downto 0) <= "00000000000000000";
--					when 3 =>
--						-- Set Data : Set Configuration --
--						rTD_Din(31 downto 28) <= "0011";
--						rTD_Din(27 downto 16) <= "000001000000";	-- Data Pointer
--						rTD_Din(15 downto 8) <= "01000000";			-- Size of data 64 bits
--						rTD_Din(7 downto 0) <= "00000000";
--					-- set Device Interface --
--					when 4 =>
--						-- Set Token : Setup --
--						rTD_Din(31 downto 28) <= "1101";
--						rTD_Din(27 downto 21) <= rAddress;
--						rTD_Din(20 downto 17) <= "0000";
--						rTD_Din(16 downto 0) <= "00000000000000000";
--					when 5 =>
--						-- Set Data : Set Interface --
--						rTD_Din(31 downto 28) <= "0011";
--						rTD_Din(27 downto 16) <= "000010000000";	-- Data Pointer
--						rTD_Din(15 downto 8) <= "01000000";			-- Size of data 64 bits
--						rTD_Din(7 downto 0) <= "00000000";
--					when others =>
--						-- ERROR --
--				end case;
--				substate := substate + 1;
--
--			elsif(PACKET = PK_SOF) then
--				rTD_Din(31 downto 28) <= rpid;
--				rTD_Din(27 downto 17) <= rFrameno;
--				rTD_Din(16 downto 0) <= "00000000000000000";
--			elsif(PACKET = PK_OUT or PACKET = PK_IN) then -- or PACKET = PK_INIT) then
--				rTD_Din(31 downto 28) <= rPid;
--				rTD_Din(27 downto 21) <= rAddress;
--				rTD_Din(20 downto 17) <= rEndpoint;
--				rTD_Din(16 downto 0) <= "00000000000000000";
--			elsif(PACKET = PK_DATA0 or PACKET = PK_DATA1) then
--				rTD_Din(31 downto 28) <= rPid;
--				rTD_Din(27 downto 16) <= "000011000000";	-- Data Pointer
--				rTD_Din(15 downto 8) <= "00010000";			-- Size of data
--				rTD_Din(7 downto 0) <= "00000000";
--			else
--				rTD_Din <= rTD_Din;
--			end if;
--		else
--			rTD_Din <= rTD_Din;
--		end if;
--	end process;				
--	
--
--
--	u_rTD_Wr : process(Clock,Reset)
--	begin
--		if(Reset = '1') then
--			rTD_Wr <= '0';
--		elsif(rising_edge(Clock) and Reset = '0') then
--			if(PACKET = PK_SOF) then
--				rTD_wr <= '1';
--			elsif(PACKET = PK_INIT) then
--				rTD_wr <= '1';
--			elsif(PACKET = PK_IN) then
--				rTD_wr <= '1';
----			elsif(PACKET = PK_DATA0) then
----				rTD_wr <= '1';
----			elsif(PACKET = PK_DATA1) then
----				rTD_wr <= '1';
--			else
--				rTD_Wr <= '0';
--			end if;
--		else
--			rTD_Wr <= rTD_Wr;
--		end if;
--	end process;
--
--	
--	u_TD_Wr_Lat : process(Clock,Reset)
--	begin
--		if(Reset = '1') then
--			rTD_Wr_Lat <= '0';
--		elsif(rising_edge(Clock) and Reset = '0') then
--			rTD_Wr_Lat <= rTD_Wr;
--		else
--			rTD_Wr_Lat <= rTD_Wr_Lat;
--		end if;
--	end process;				
--	
--
--
--
--
--
--
--	u_Test : process(Clock,Reset)
--		variable step : integer;
--	begin
--		if(Reset = '1') then
--			dataS_wr <= '0';
--			
--			step := 0;
--		elsif(rising_edge(Clock) and Reset = '0') then
--			case step is
--				when 0 | 1 | 2 | 3 =>
--
--				when 4 =>
--					datas_wr <= '1';
--					datas <= X"80";
--
--				when 5 =>
--					datas <= X"06";
--					
--				when 6 =>
--					datas <= X"00";					
--
--				when 7 =>
--					datas <= X"01";
--
--				when 8 =>
--					datas <= X"00";
--
--				when 9 =>
--					datas <= X"00";					
--
--				when 10 =>
--					datas <= X"00";
--				when 11 =>
--					datas <= X"00";
--				when 12 =>					
--					datas_wr <= '0';
--
--					
--				
--				when others =>
--					
--			end case;
--					step := step + 1;			
--		else
--		end if;
--	end process;
--
--
--	
--	
--	
--	
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--							
--	
--	
--	u_SOF_sig1 : process(Clock1K,Reset)
--	begin
--		if(Reset = '1') then
--			SOF_sig1 <= '0';
--		elsif(Reset = '0') then
--			SOF_sig1 <= Clock1K;
--		else
--			SOF_sig1 <= SOF_sig1;
--		end if;
--	end process;
--
--
--	u_SOF_sig2 : process(Clock,Reset)
--	begin
--		if(Reset = '1') then
--			SOF_sig2 <= '0';
--		elsif(rising_edge(Clock) and Reset = '0') then
--			SOF_sig2 <= SOF_sig1;
--		else
--			SOF_sig2 <= SOF_sig2;
--		end if;
--	end process;	
--	
--
--	u_WR_sig1 : process(Clock,Reset)
--	begin
--		if(Reset = '1') then
--			WR_sig1 <= '0';
--		elsif(rising_edge(Clock) and Reset = '0') then
--			if(UserWr = '1') then
--				WR_sig1 <= '1';
--			else
--				WR_sig1 <= '0';
--			end if;
--		else
--			WR_sig1 <= WR_sig1;
--		end if;
--	end process;
--	
--
--	u_WR_sig2 : process(Clock,Reset)
--	begin
--		if(Reset = '1') then
--			WR_sig2 <= '0';
--		elsif(rising_edge(Clock) and Reset = '0') then
--			WR_sig2 <= WR_sig1;
--		else
--			WR_sig2 <= WR_sig2;
--		end if;
--	end process;				
--
--
--	u_RD_sig1 : process(Clock,Reset)
--	begin
--		if(Reset = '1') then
--			RD_sig1 <= '0';
--		elsif(rising_edge(Clock) and Reset = '0') then
--			if(UserRd = '1') then
--				RD_sig1 <= '1';
--			else
--				RD_sig1 <= '0';
--			end if;
--		else
--			RD_sig1 <= RD_sig1;
--		end if;
--	end process;
--	
--
--	u_RD_sig2 : process(Clock,Reset)
--	begin
--		if(Reset = '1') then
--			RD_sig2 <= '0';
--		elsif(rising_edge(Clock) and Reset = '0') then
--			RD_sig2 <= RD_sig1;
--		else
--			RD_sig2 <= RD_sig2;
--		end if;
--	end process;
--	
--
--			
--	u_Int_Flag : process(Clock1K,Reset)
--		variable count : integer;
--	begin
--		if(Reset = '1') then
--			Int_Flag <= '0';
--			count := 0;
----		elsif(rising_edge(Clock) and PACKET = PK_IN) then
----			Int_Flag <= '0';
----			count := 0;
--		elsif(rising_edge(Clock1K) and Reset = '0') then
--			if(count < 9) then
--				Int_Flag <= Int_Flag;
--				count := count + 1;
--			elsif(Int_Flag = '0') then
--				Int_Flag <= '1';
--			elsif(PACKET = PK_IN) then
--				Int_Flag <= '0';
--				count := 0;
--			else
--				Int_Flag <= Int_Flag;
--			end if;
--		else
--			Int_Flag <= Int_Flag;
--		end if;
--	end process;				
--
--
--
--
--
--
--
--
--
--
--
--
--
--
---------------------------------------------------------------------------------------------------------
--
--
--	u_rPid : process(Clock,Reset,PACKET)
--	begin
--		if(Reset = '1') then
--			rPid <= "0000";
--		elsif(Clock = '1' and Reset = '0') then
--			if(PACKET = PK_SOF) then
--				rPid <= "0101";
--			elsif(PACKET = PK_IN) then
--				rPid <= "1001";
--			elsif(PACKET = PK_OUT) then
--				rPid <= "0001";
--			elsif(PACKET = PK_DATA0) then
--				rPid <= "0011";
--			elsif(PACKET = PK_DATA1) then
--				rPid <= "1011";
--			elsif(PACKET = PK_ACK) then
--				rPid <= "0010";
--			elsif(PACKET = PK_NAK) then
--				rPid <= "1010";
--			elsif(PACKET = PK_STALL) then
--				rPid <= "1110";
--			else
--				rPid <= rPid;
--			end if;
--		else
--			rPid <= rPid;
--		end if;
--	end process;
--
--
--	u_rFrameno : process(Clock1K,Reset)
--	begin
--		if(Reset = '1') then
--			rFrameno <= "00000000000";
--		elsif(rising_edge(Clock1K) and Reset = '0') then
--			rFrameno <= CONV_STD_LOGIC_VECTOR(CONV_INTEGER(rFrameno) + 1,11);
--		else
--			rFrameno <= rFrameno;
--		end if;
--	end process;
--	
--	
--	u_rAddress : process(Clock,Reset)
--	begin
--		if(Reset = '1') then
--			rAddress <= "0000000";
--		elsif(rising_edge(Clock) and Reset = '0') then
--			rAddress <= CONST_ADDRESS;
--		else
--			rAddress <= rAddress;
--		end if;
--	end process;
--	
--	
--	u_rEndpoint : process(Clock,Reset)
--	begin
--		if(Reset = '1') then
--			rEndpoint <= "0000";
--		elsif(rising_edge(Clock) and Reset = '0') then
--			rEndpoint <= CONST_ENDPOINT;  
--		else
--			rEndpoint <= rEndpoint;
--		end if;
--	end process;
	
	





end architecture;
