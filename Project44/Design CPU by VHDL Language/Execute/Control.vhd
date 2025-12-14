-- Control --
Library IEEE;
Use IEEE.std_logic_1164.all;
Use IEEE.numeric_std.all;

Entity Control is
generic (inst_width	: integer := 100;
		 width		: integer := 16;
		 bit_addr	: integer := 16);

port (in_clk	: in std_logic;
	  reset		: in std_logic;
	  port_a	: out unsigned(15 downto 0);
	  port_e	: out unsigned(9 downto 0));
End Control;
Architecture rtl of Control is
-- Clock
	component clock
	port (clk		: in std_logic;
			p		: out std_logic);
	end component;
	signal clk	: std_logic;
-- Clock
-- InstFetch
	component InstFetch
	port (inst_d	: out unsigned(inst_width-1 downto 0);
		  inst_x	: out unsigned(inst_width-1 downto 0);
		  inst_w	: out unsigned(inst_width-1 downto 0);
		  ip_in		: in unsigned(15 downto 0);
		  ip_out	: out unsigned(15 downto 0);
		  jmp_addr	: in unsigned(15 downto 0);
		  jmp		: in std_logic;
		  clk		: in std_logic;
		  reset		: in std_logic);
	end component;
	signal inst_d	: unsigned(inst_width-1 downto 0);
	signal inst_x	: unsigned(inst_width-1 downto 0);
	signal inst_w	: unsigned(inst_width-1 downto 0);
	signal jmp_addr	: unsigned(15 downto 0);
	signal ip_in	: unsigned(15 downto 0);
	signal ip_out	: unsigned(15 downto 0);
-- InstFetch
-- RegisterFile
	component RegisterFile
	port (p0,p1,p2,p4,p5,p6,p7			: inout unsigned(15 downto 0);
		  s0,s1,s2,s4,s5,s6,s7			: in unsigned(4 downto 0);
		  oe							: in std_logic;
		  we0,we2,we4,we5,we6,we7		: in std_logic;
		  clk							: in std_logic;
		  port0							: out unsigned(15 downto 0));
	end component;
	signal rdata0	: unsigned(15 downto 0);
	signal rdata1	: unsigned(15 downto 0);
	signal rdata2	: unsigned(15 downto 0);
	signal rdata4	: unsigned(15 downto 0);
	signal rdata5	: unsigned(15 downto 0);
	signal rdata6	: unsigned(15 downto 0);
	signal rdata7	: unsigned(15 downto 0);
	signal rs0		: unsigned(4 downto 0);
	signal rs1		: unsigned(4 downto 0);
	signal rs2		: unsigned(4 downto 0);
	signal rs4		: unsigned(4 downto 0);
	signal rs5		: unsigned(4 downto 0);
	signal rs6		: unsigned(4 downto 0);
	signal rs7		: unsigned(4 downto 0);
	signal reg_oe	: std_logic;
	signal reg_we0	: std_logic;
	signal reg_we2	: std_logic;
	signal reg_we4	: std_logic;
	signal reg_we5	: std_logic;
	signal reg_we6	: std_logic;
	signal reg_we7	: std_logic;
-- RegisterFile
-- Execute
	component execute
	port(
		input_a1	: in unsigned(15 downto 0);
		input_b1	: in unsigned(15 downto 0);
		input_a2	: in unsigned(15 downto 0);
		input_b2	: in unsigned(15 downto 0);
		opcode1		: in unsigned(7 downto 0);
		opcode2		: in unsigned(7 downto 0);
		inflag1		: in unsigned(4 downto 0);
		inflag2		: in unsigned(4 downto 0);
		flag1		: out unsigned(7 downto 0);
		flag2		: out unsigned(7 downto 0);
		output1		: out unsigned(31 downto 0);
		output2		: out unsigned(31 downto 0);
		inst1		: in unsigned(26 downto 0);
		inst2		: in unsigned(26 downto 0);
		next_inst1	: in unsigned(26 downto 0);
		next_inst2	: in unsigned(26 downto 0);
		reset		: in std_logic;
		jmp			: out std_logic;
		clk_big_one	: in std_logic
--		clk_small	: in std_logic;
	     );
	end component;
--	component execute
--	port(
--		input_a1	: in unsigned(15 downto 0);
--		input_b1	: in unsigned(15 downto 0);
--		input_a2	: in unsigned(15 downto 0);
--		input_b2	: in unsigned(15 downto 0);
--		opcode1		: in unsigned(7 downto 0);
--		opcode2		: in unsigned(7 downto 0);
--		flag1		: out unsigned(7 downto 0);
--		flag2		: out unsigned(7 downto 0);
--		output1		: out unsigned(31 downto 0);
--		output2		: out unsigned(31 downto 0);
--		reset		: in std_logic;
--		jmp			: out std_logic;
--		clk			: in std_logic
--	     );
--	end component;
	signal flag_tmp	: unsigned(9 downto 0);
-- Execute

-- Load/Store
	type queue is array(2 downto 0) of unsigned(15 downto 0);
	signal dataq_a,dataq_b,addrq	: queue;
	signal addr_buf		: unsigned(15 downto 0);
	signal sp			: unsigned(15 downto 0);
-- Load/Store

	type state_type is (init, wb1, wb2, dec1, dec2);
	signal state	: state_type;

-- FPGA
	signal write0	: std_logic;
	signal write2	: std_logic;
	signal write4	: std_logic;
	signal write5	: std_logic;
	signal write6	: std_logic;
	signal write7	: std_logic;
	signal s_wb2	: std_logic;
	signal a_clk	: std_logic;
-- FPGA
-- ALU
	signal a1_ina		: unsigned(15 downto 0);
	signal a1_inb		: unsigned(15 downto 0);
	signal a2_ina		: unsigned(15 downto 0);
	signal a2_inb		: unsigned(15 downto 0);
	signal aout1		: unsigned(31 downto 0);
	signal aout2		: unsigned(31 downto 0);
	signal flag			: unsigned(15 downto 0);
	signal jmp			: std_logic;
	signal tmpx_1		: unsigned(7 downto 0);
	signal tmpx_2		: unsigned(7 downto 0);
-- ALU
-- DataMemory
	component DataMem
	port (cs		: in std_logic;
		  oe		: in std_logic;
		  we		: in std_logic;
		  addr		: in unsigned(bit_addr-1 downto 0);
		  data		: inout unsigned(width-1 downto 0));
	end component;
	signal mem_data	: unsigned(15 downto 0);
	signal mem_addr	: unsigned(15 downto 0);
	signal mem_oe	: std_logic;
	signal mem_we	: std_logic;
-- DataMemory


	alias inst_d1d		: unsigned(23 downto 0) is inst_d(99 downto 76);
	alias inst_d1w		: unsigned(23 downto 0) is inst_w(99 downto 76);
	alias inst_d2d		: unsigned(21 downto 0) is inst_d(75 downto 54);
	alias inst_d2w		: unsigned(21 downto 0) is inst_w(75 downto 54);
	alias inst_a1d		: unsigned(26 downto 0) is inst_d(53 downto 27);
	alias inst_a1w		: unsigned(26 downto 0) is inst_w(53 downto 27);
	alias inst_a2d		: unsigned(26 downto 0) is inst_d(26 downto 0);
	alias inst_a2w		: unsigned(26 downto 0) is inst_w(26 downto 0);
	alias flag1			: unsigned(7 downto 0) is flag(15 downto 8);
	alias flag2			: unsigned(7 downto 0) is flag(7 downto 0);

begin
	c1 : clock port map(in_clk, clk);
	fetch : InstFetch port map(inst_d,inst_x,inst_w,ip_in,ip_out,jmp_addr,jmp,clk,reset);
	exe : execute port map(a1_ina,a1_inb,a2_ina,a2_inb,tmpx_1,tmpx_2,flag_tmp(9 downto 5),flag_tmp(4 downto 0),flag1,flag2,aout1,aout2,inst_x(53 downto 27),inst_x(26 downto 0),inst_d(53 downto 27),inst_d(26 downto 0),reset,jmp,a_clk);
--	exe : execute port map(a1_ina,a1_inb,a2_ina,a2_inb,tmpx_1,tmpx_2,flag1,flag2,aout1,aout2,reset,jmp,a_clk);
	regs : RegisterFile port map(rdata0,rdata1,rdata2,rdata4,rdata5,rdata6,rdata7,rs0,rs1,rs2,rs4,rs5,rs6,rs7,reg_oe,write0,write2,write4,write5,write6,write7,in_clk,port_a);
	mem : DataMem port map(reset,mem_oe,mem_we,mem_addr,mem_data);

-- update flag
	process(state)
	begin
		if state = wb1 then
			flag_tmp(9 downto 5) <= mem_data(12 downto 8);
			flag_tmp(4 downto 0) <= mem_data(4 downto 0);
		end if;
	end process;
-- update flag
-- FPGA
	port_e(9 downto 5) <= flag1(4 downto 0);
	port_e(4 downto 0) <= flag2(4 downto 0);
---------------------------------
	
	process(state)
	begin
		if state = wb2 then
			s_wb2 <= '0';
		else
			s_wb2 <= '1';
		end if;
	end process;
	write0 <= not((not s_wb2) and (not reg_we0));
	write2 <= not((not s_wb2) and (not reg_we2));
	write4 <= not((not s_wb2) and (not reg_we4));
	write5 <= not((not s_wb2) and (not reg_we5));
	write6 <= not((not s_wb2) and (not reg_we6));
	write7 <= not((not s_wb2) and (not reg_we7));
---------------------------------
-- FPGA

-- control state
	process(state)
	begin
		if state = wb1 or state = wb2 then
			a_clk <= '1';
		else
			a_clk <= '0';
		end if;
	end process;
	process(clk)
	begin
		if clk'event and clk = '1' then
			if reset = '1' then state <= init; else
				case state is
					when init =>
						state <= wb1;
					when wb1 =>
						state <= wb2;
					when wb2 =>
						state <= dec1;
					when dec1 =>
						state <= dec2;
					when dec2 =>
						state <= wb1;
				end case;
			end if;
		end if;
	end process;
-- control state
-- instruction for alu
	process(inst_x(53 downto 46),inst_x(26 downto 19))
	begin
		if inst_x(53) = '1' then
			tmpx_1(1 downto 0) <= "00";
			tmpx_1(7 downto 2) <= inst_x(53 downto 48);
		else
			tmpx_1 <= inst_x(53 downto 46);
		end if;
		if inst_x(26) = '1' then
			tmpx_2(1 downto 0) <= "00";
			tmpx_2(7 downto 2) <= inst_x(26 downto 21);
		else
			tmpx_2 <= inst_x(26 downto 19);
		end if;
	end process;
-- instruction for alu
---------------------------- control reg_oe (register output enable) ----------------------------
	process(clk,reset)
	begin
		if reset = '1' then
			reg_oe <= '1';
		else
			if clk'event and clk = '0' then
				if state = dec1 or state = dec2 then
					if inst_d1d(23 downto 19) = "00100"			-- mov rd,rs
						or inst_d1d(23 downto 19) = "00001"		-- mov rd,[rs]
						or inst_d1d(23 downto 19) = "00010"		-- mov [rd],rs
						or inst_d1d(23 downto 21) = "101"		-- mov [#address],rs
						or inst_d1d(23 downto 21) = "111"		-- mov [rd],#data
						or inst_d1d(23 downto 19) = "01000"		-- push rs
						or inst_d2d(21 downto 20) /= "11"		-- read register for Load/Store Unit(2)
						or inst_a1d(26 downto 24) /= "011"		-- read register for ALU(1)
						or inst_a2d(26 downto 24) /= "011"		-- read register for ALU(2)
					then
						reg_oe <= '0';
					end if;
				else
					reg_oe <= '1';			
				end if;
			end if;
		end if;
	end process;
---------------------------- control reg_oe (register output enable) ----------------------------
----------------------------------------  Load/Store Unit (1)  ----------------------------------
	-- control signal
	mem_addr <= addr_buf;
	process(state)		-- select register rs0,rs1 (decode) / prepare register and memory for write back (write back)
	begin
		if state = dec1 or state = dec2 or state = wb1 then		-- decode
		-- clear register port and data bus before read data
			rdata0 <= "ZZZZZZZZZZZZZZZZ";
			rdata1 <= "ZZZZZZZZZZZZZZZZ";
			mem_data <= "ZZZZZZZZZZZZZZZZ";
			if inst_d1d(23 downto 19) = "00100" then		-- mov rd,rs
				rs0 <= inst_d1d(9 downto 5);
				rs1 <= "00000";
			elsif inst_d1d(23 downto 19) = "00001" then		-- mov rd,[rs]
				rs0 <= inst_d1d(9 downto 5);
				rs1 <= "00000";
			elsif inst_d1d(23 downto 19) = "00010" then		-- mov [rd],rs
				rs0 <= inst_d1d(9 downto 5);
				rs1 <= inst_d1d(4 downto 0);
			elsif inst_d1d(23 downto 21) = "100" then		-- mov rd,[#address]
				rs0 <= "00000";
				rs1 <= "00000";
			elsif inst_d1d(23 downto 21) = "101" then		-- mov [#address],rs
				rs0 <= inst_d1d(4 downto 0);
				rs1 <= "00000";
			elsif inst_d1d(23 downto 21) = "110" then		-- mov rd,#data
				rs0 <= "00000";
				rs1 <= "00000";
			elsif inst_d1d(23 downto 21) = "111" then		-- mov [rd],#data
				rs0 <= "00000";
				rs1 <= inst_d1d(4 downto 0);
			elsif inst_d1d(23 downto 19) = "01000" then		-- push rs
				rs0 <= inst_d1d(4 downto 0);
				rs1 <= "00000";
			elsif inst_d1d(23 downto 19) = "01001" then		-- pop rs
				rs0 <= "00000";
				rs1 <= "00000";
			elsif inst_d1d(23 downto 19) = "01010" then		-- push ip
				rs0 <= "00000";
				rs1 <= "00000";
			elsif inst_d1d(23 downto 19) = "01011" then		-- pop ip
				rs0 <= "00000";
				rs1 <= "00000";
			elsif inst_d1d(23 downto 19) = "01100" then		-- pushf
				rs0 <= "00000";
				rs1 <= "00000";
			elsif inst_d1d(23 downto 19) = "01101" then		-- popf
				rs0 <= "00000";
				rs1 <= "00000";
			else
				rs0 <= "00000";
				rs1 <= "00000";
			end if;
		elsif state = wb2 then									-- write back
			if inst_d1w(23 downto 19) = "00100" then		-- mov rd,rs
				rdata0 <= dataq_a(0);
				rs0 <= inst_d1w(4 downto 0);
			elsif inst_d1w(23 downto 19) = "00001" then		-- mov rd,[rs]
				rdata0 <= dataq_a(0);
				rs0 <= inst_d1w(4 downto 0);
			elsif inst_d1w(23 downto 19) = "00010" then		-- mov [rd],rs
				mem_data <= dataq_a(0);
				-- addr_buf control by other process
			elsif inst_d1w(23 downto 21) = "100" then		-- mov rd,[#address]
--				rdata0 <= inst_d1w(20 downto 5);
				rdata0 <= dataq_a(0);
				rs0 <= inst_d1w(4 downto 0);
			elsif inst_d1w(23 downto 21) = "101" then		-- mov [#address],rs
				mem_data <= dataq_a(0);
				-- addr_buf control by other process
			elsif inst_d1w(23 downto 21) = "110" then		-- mov rd,#data
				rdata0 <= dataq_a(0);
				rs0 <= inst_d1w(4 downto 0);
			elsif inst_d1w(23 downto 21) = "111" then		-- mov [rd],#data
				mem_data <= inst_d1w(20 downto 5);
				-- addr_buf control by other process
			elsif inst_d1w(23 downto 19) = "01000" then		-- push rs
				mem_data <= dataq_a(0);
				-- addr_buf control by other process
			elsif inst_d1w(23 downto 19) = "01001" then		-- pop rs			-- debuging
				rdata0 <= dataq_a(0);
				rs0 <= inst_d1w(4 downto 0);
			elsif inst_d1w(23 downto 19) = "01010" then		-- push ip
				mem_data <= dataq_a(0);
			elsif inst_d1w(23 downto 19) = "01011" then		-- pop ip			-- too late
--				ip_in <= dataq_a(0);												-- move to state wb1 at next cycle
			elsif inst_d1w(23 downto 19) = "01100" then		-- pushf
				mem_data(15 downto 8) <= flag1;
				mem_data(7 downto 0) <= flag2;
			elsif inst_d1w(23 downto 19) = "01101" then		-- popf
			else
			end if;
		else
		end if;
	end process;
	process(state)		-- control memory address buffer (addr_buf) 
	begin
		if state = dec2 or state = wb1 then			-- decode
			addr_buf <= "ZZZZZZZZZZZZZZZZ";
			if inst_d1d(23 downto 19) = "00001" then		-- mov rd,[rs]
				addr_buf <= rdata0;
			elsif inst_d1d(23 downto 21) = "100" then		-- mov rd,[#address]
				addr_buf <= inst_d1d(20 downto 5);
			elsif inst_d1d(23 downto 19) = "01001" then		-- pop rs
				addr_buf <= sp;
			elsif inst_d1d(23 downto 19) = "01011" then		-- pop ip
				addr_buf <= sp;
			elsif inst_d1d(23 downto 19) = "01101" then		-- popf
				addr_buf <= sp;
			else
			end if;
		elsif state = wb2 or state = dec1 then		-- write back
			if inst_d1w(23 downto 19) = "00010" then		-- mov [rd],rs
				addr_buf <= addrq(0);
			elsif inst_d1w(23 downto 21) = "101" then		-- mov [#address],rs
				addr_buf <= inst_d1w(20 downto 5);
			elsif inst_d1w(23 downto 21) = "111" then		-- mov [rd],#data
				addr_buf <= addrq(0);
			elsif inst_d1w(23 downto 19) = "01000" then		-- push rs
				addr_buf <= sp;
			elsif inst_d1w(23 downto 19) = "01010" then		-- push ip
				addr_buf <= sp;
			elsif inst_d1w(23 downto 19) = "01100" then		-- pushf
				addr_buf <= sp;
			else
			end if;
--		else
--			addr_buf <= "ZZZZZZZZZZZZZZZZ";
		end if;
	end process;
	process(state)		-- move data from register (rdata0, rdata1) and memory (mem_data) to data queue
	begin
		if state = wb1 then		-- decode
			if inst_d1d(23 downto 19) = "00100" then		-- mov rd,rs
				dataq_a(2) <= rdata0;
			elsif inst_d1d(23 downto 19) = "00001" then		-- mov rd,[rs]
				dataq_a(2) <= mem_data;
			elsif inst_d1d(23 downto 19) = "00010" then		-- mov [rd],rs
				dataq_a(2) <= rdata0;
				addrq(2) <= rdata1;
			elsif inst_d1d(23 downto 21) = "100" then		-- mov rd,[#address]
				dataq_a(2) <= mem_data;
			elsif inst_d1d(23 downto 21) = "101" then		-- mov [#address],rs
				dataq_a(2) <= rdata0;
			elsif inst_d1d(23 downto 21) = "110" then		-- mov rd,#data
				dataq_a(2) <= inst_d1d(20 downto 5);
			elsif inst_d1d(23 downto 21) = "111" then		-- mov [rd],#data
				dataq_a(2) <= inst_d1d(20 downto 5);
				addrq(2) <= rdata1;		-- debuging
			elsif inst_d1d(23 downto 19) = "01000" then		-- push rs
				dataq_a(2) <= rdata0;
				addrq(2) <= sp;
			elsif inst_d1d(23 downto 19) = "01001" then		-- pop rs
				dataq_a(2) <= mem_data;
			elsif inst_d1d(23 downto 19) = "01010" then		-- push ip
				dataq_a(2) <= ip_out + 1;		-- store next ip in memory
				addrq(2) <= sp;
			elsif inst_d1d(23 downto 19) = "01011" then		-- pop ip
				dataq_a(2) <= mem_data;		-- not use
				ip_in <= mem_data;
			elsif inst_d1d(23 downto 19) = "01100" then		-- pushf
				dataq_a(2) <= flag;
				addrq(2) <= sp;
			elsif inst_d1d(23 downto 19) = "01101" then		-- popf
				dataq_a(2) <= mem_data;
			else
			end if;
		end if;
	end process;
	process(clk)		-- shift data queue and destination queue
	begin
		if clk'event and clk = '0' then
			if state = wb1 then
				dataq_a(0) <= dataq_a(1);
				dataq_a(1) <= dataq_a(2);
				addrq(0) <= addrq(1);
				addrq(1) <= addrq(2);
			end if;
		end if;
	end process;
	process(clk,reset)	-- control reg_we0 (register write enable port 0)
	begin
		if reset = '1' then
			reg_we0 <= '1';
		else
			if clk'event and clk = '0' then
				if state = wb2 then
					if inst_d1w(23 downto 19) = "00100"			-- mov rd,rs
						or inst_d1w(23 downto 19) = "00001"		-- mov rd,[rs]
--						or inst_d1w(23 downto 19) = "00010"		-- mov [rd],rs
						or inst_d1w(23 downto 21) = "100"		-- mov rd,[#address]
--						or inst_d1w(23 downto 21) = "101"		-- mov [#address],rs
						or inst_d1w(23 downto 21) = "110"		-- mov rd,#data
--						or inst_d1w(23 downto 21) = "111"		-- mov [rd],#data
--						or inst_d1w(23 downto 19) = "01000"		-- push rs
						or inst_d1w(23 downto 19) = "01001"		-- pop rs
--						or inst_d1w(23 downto 19) = "01010"		-- push ip
--						or inst_d1w(23 downto 19) = "01011"		-- pop ip
--						or inst_d1w(23 downto 19) = "01100"		-- pushf
--						or inst_d1w(23 downto 19) = "01101"		-- popf
					then
						reg_we0 <= '0';
					end if;
				else
					reg_we0 <= '1';
				end if;
			end if;
		end if;
	end process;
	process(clk,reset)	-- control mem_oe (memory output enable)
	begin
		if reset = '1' then
			mem_oe <= '1';
		else
			if clk'event and clk = '0' then
				if state = dec2 then
--				if inst_d1d(23 downto 19) = "00100"			-- mov rd,rs
					if inst_d1d(23 downto 19) = "00001"			-- mov rd,[rs]
--					or inst_d1d(23 downto 19) = "00010"		-- mov [rd],rs
						or inst_d1d(23 downto 21) = "100"		-- mov rd,[#address]
--					or inst_d1d(23 downto 21) = "101"		-- mov [#address],rs
--					or inst_d1d(23 downto 21) = "110"		-- mov rd,#data
--					or inst_d1d(23 downto 21) = "111"		-- mov [rd],#data
--					or inst_d1d(23 downto 19) = "01000"		-- push rs
						or inst_d1d(23 downto 19) = "01001"		-- pop rs
--					or inst_d1d(23 downto 19) = "01010"		-- push ip
						or inst_d1d(23 downto 19) = "01011"		-- pop ip
--					or inst_d1d(23 downto 19) = "01100"		-- pushf
						or inst_d1d(23 downto 19) = "01101"		-- popf
					then
						mem_oe <= '0';
					end if;
				else
					mem_oe <= '1';
				end if;
			end if;
		end if;
	end process;
	process(clk,reset)	-- control mem_we (memory write enable)
	begin
		if reset = '1' then
			mem_we <= '1';
		else
			if clk'event and clk = '0' then
				if state = wb2 then
--					if inst_d1w(23 downto 19) = "00100"			-- mov rd,rs
--						or inst_d1w(23 downto 19) = "00001"		-- mov rd,[rs]
					if inst_d1w(23 downto 19) = "00010"			-- mov [rd],rs
--						or inst_d1w(23 downto 21) = "100"		-- mov rd,[#address]
						or inst_d1w(23 downto 21) = "101"		-- mov [#address],rs
--						or inst_d1w(23 downto 21) = "110"		-- mov rd,#data
						or inst_d1w(23 downto 21) = "111"		-- mov [rd],#data
						or inst_d1w(23 downto 19) = "01000"		-- push rs
--						or inst_d1w(23 downto 19) = "01001"		-- pop rs
						or inst_d1w(23 downto 19) = "01010"		-- push ip
--						or inst_d1w(23 downto 19) = "01011"		-- pop ip
						or inst_d1w(23 downto 19) = "01100"		-- pushf
--						or inst_d1w(23 downto 19) = "01101"		-- popf
					then
						mem_we <= '0';
					end if;
				else
					mem_we <= '1';			
				end if;
			end if;
		end if;
	end process;
	process(clk,reset)	-- update sp (stack pointer)
	begin
		if clk'event and clk = '0' then
			if reset = '1' then
				sp <= "0000000000001111";
			else
				if state = dec1 then
					if inst_d1w(23 downto 19) = "01000"			-- push rs
						or inst_d1w(23 downto 19) = "01010"		-- push ip
						or inst_d1w(23 downto 19) = "01100"		-- pushf
					then
						sp <= sp - 1;
					elsif inst_d1d(23 downto 19) = "01001"		-- pop rs
						or inst_d1d(23 downto 19) = "01011"		-- pop ip
						or inst_d1d(23 downto 19) = "01101"		-- popf
					then
						sp <= sp + 1;
					end if;
				end if;
			end if;
		end if;
	end process;
----------------------------------------  Load/Store Unit (1)  ----------------------------------
-----------------------------------------------  Load/Store Unit (2)  ----------------------------------------

	process(state)		-- select register rs2 (decode) / prepare register and memory for write back (write back)
	begin
		if state = dec1 or state = dec2 or state = wb1 then		-- decode
			rdata2 <= "ZZZZZZZZZZZZZZZZ";
			if inst_d2d(21 downto 20) = "10" then		-- mov rd,rs
				rs2 <= inst_d2d(9 downto 5);
			elsif inst_d2d(21) = '0' then				-- mov rd,#data
				rs2 <= "00000";
			else
				rs2 <= "00000";
			end if;
		elsif state = wb2 then									-- write back
			if inst_d2w(21 downto 20) = "10" then		-- mov rd,rs
				rdata2 <= dataq_b(0);
				rs2 <= inst_d2w(4 downto 0);
			elsif inst_d2w(21) = '0' then				-- mov rd,#data
				rdata2 <= dataq_b(0);
				rs2 <= inst_d2w(4 downto 0);
			else
			end if;
		else
		end if;
	end process;
	process(state)		-- move data from register (rdata2) to data queue
	begin
		if state = wb1 then		-- decode
			if inst_d2d(21 downto 20) = "10" then		-- mov rd,rs
				dataq_b(2) <= rdata2;
			elsif inst_d2d(21) = '0' then				-- mov rd,#data
				dataq_b(2) <= inst_d2d(20 downto 5);
			else
			end if;
		end if;
	end process;
	process(clk)		-- shift data queue and destination queue
	begin
		if clk'event and clk = '0' then
			if state = wb1 then
				dataq_b(0) <= dataq_b(1);
				dataq_b(1) <= dataq_b(2);
			end if;
		end if;
	end process;
	process(clk,reset)	-- control reg_we2 (register write enable port 2)
	begin
		if reset = '1' then
			reg_we2 <= '1';
		else
			if clk'event and clk = '0' then
				if state = wb2 then
					if inst_d2w(21 downto 20) /= "11"	-- mov rd,rs and mov rd,#data
					then
						reg_we2 <= '0';
					end if;
				else
					reg_we2 <= '1';
				end if;
			end if;
		end if;
	end process;
-----------------------------------------------  Load/Store Unit (2)  ----------------------------------------
-----------------------------------------------  ALU (1)  ----------------------------------------
	process(state)			-- select register rs4,rs5 (decode) / prepare register for write back (write back)
	begin
		if state = dec1 or state = dec2 or state = wb1 then	-- decode
			rdata4 <= "ZZZZZZZZZZZZZZZZ";
			rdata5 <= "ZZZZZZZZZZZZZZZZ";
			rs4 <= inst_a1d(9 downto 5);						-- rs4 (rs) read
			rs5 <= inst_a1d(4 downto 0);						-- rs5 (rd) read
		elsif state = wb2 then								-- write back
			rs4 <= inst_a1w(4 downto 0) or "00001";				-- rs4 (rdx) write (only mul,imul,div,idiv instruction)
			rs5 <= inst_a1w(4 downto 0);						-- rs5 (rd) write
			rdata4 <= aout1(31 downto 16);
			rdata5 <= aout1(15 downto 0);
		else
		end if;
	end process;
	process(state)		-- move data from register or instuction to alu buffer
	begin
		if state = dec2 then
			if inst_a1d(26 downto 24) = "000" then		-- rd,rs
				a1_ina <= rdata5;
				a1_inb <= rdata4;
			end if;
			if inst_a1d(26) = '1' then					-- rd,#data
				a1_ina <= rdata5;
				a1_inb <= inst_a1d(20 downto 5);
			end if;
			if inst_a1d(26 downto 24) = "001" then		-- imm,rd
				a1_ina <= rdata5;
				a1_inb(3 downto 0) <= inst_a1d(8 downto 5);
				a1_inb(15 downto 4) <= (others => '0');
			end if;
			if inst_a1d(26 downto 24) = "010" then		-- rd
				a1_ina <= rdata5;
				a1_inb <= "ZZZZZZZZZZZZZZZZ";	-- for debug only
			end if;
--		elsif state = wb1 then
--			if inst_a1d(26 downto 19) = "01110000" then		-- flag (update flag) [debuging]
--				a1_ina(7 downto 0) <= mem_data(15 downto 8);
--			end if;
		end if;
	end process;
	process(clk,reset)	-- control reg_we4,reg_we5 (register write enable port 4,5)
	begin
		if reset = '1' then
			reg_we4 <= '1';
			reg_we5 <= '1';
		else
			if clk'event and clk = '0' then
				if state = wb2 then								-- write rd
					if inst_a1w(26 downto 24) /= "011"				-- STC, CLC, CMC, FLAG, NOP
						and inst_a1w(26 downto 19) /= "00001000"	-- CMP rd,rs
						and inst_a1w(26 downto 19) /= "00010011"	-- TEST rd,rs
						and inst_a1w(26 downto 21) /= "101000"		-- CMP rd,#data
						and inst_a1w(26 downto 21) /= "110011"		-- TEST rd,#data
						and inst_a1w(26 downto 22) /= "01000"		-- JUMP
						and inst_a1w(26 downto 22) /= "01001"		-- JUMP
						and inst_a1w(26 downto 22) /= "01010"		-- JUMP
						then
							reg_we5 <= '0';
					end if;
					if inst_a1w(26 downto 19) = "00000100"			-- write rdx (only mul,imul,div,idiv instruction)
						or inst_a1w(26 downto 19) = "00000101"
						or inst_a1w(26 downto 19) = "00000110"
						or inst_a1w(26 downto 19) = "00000111"
						or inst_a1w(26 downto 21) = "100100"
						or inst_a1w(26 downto 21) = "100101"
						or inst_a1w(26 downto 21) = "100110"
						or inst_a1w(26 downto 21) = "100111"
					then
						reg_we4 <= '0';
					end if;
				else
					reg_we4 <= '1';
					reg_we5 <= '1';
				end if;
			end if;
		end if;
	end process;
-----------------------------------------------  ALU (1)  ----------------------------------------
-----------------------------------------------  ALU (2)  ----------------------------------------
	process(state)			-- select register rs6,rs7 (decode) / prepare register for write back (write back)
	begin
		if state = dec1 or state = dec2 or state = wb1 then	-- decode
			rdata6 <= "ZZZZZZZZZZZZZZZZ";
			rdata7 <= "ZZZZZZZZZZZZZZZZ";
			rs6 <= inst_a2d(9 downto 5);						-- rs6 (rs) read
			rs7 <= inst_a2d(4 downto 0);						-- rs7 (rd) read
		elsif state = wb2 then								-- write back
			rs6 <= inst_a2w(4 downto 0) or "00001";				-- rs6 (rdx) write (only mul,imul,div,idiv instruction)
			rs7 <= inst_a2w(4 downto 0);						-- rs7 (rd) write
			rdata6 <= aout2(31 downto 16);
			rdata7 <= aout2(15 downto 0);
		else
		end if;
	end process;
	process(state)		-- move data from register or instuction to alu buffer
	begin
		if state = dec2 then
			if inst_a2d(26 downto 24) = "000" then		-- rd,rs
				a2_ina <= rdata7;
				a2_inb <= rdata6;
			end if;
			if inst_a2d(26) = '1' then					-- rd,#data
				a2_ina <= rdata7;
				a2_inb <= inst_a2d(20 downto 5);
			end if;
			if inst_a2d(26 downto 24) = "001" then		-- imm,rd
				a2_ina <= rdata7;
				a2_inb(3 downto 0) <= inst_a2d(8 downto 5);
				a2_inb(15 downto 4) <= (others => '0');
			end if;
			if inst_a2d(26 downto 22) = "01011" then		-- rd (not, neg, inc, dec only)
				a2_ina <= rdata7;
				a2_inb <= "ZZZZZZZZZZZZZZZZ";	-- for debug
			end if;
			if inst_a2d(26 downto 19) = "01110000" then		-- debuging
--				a2_ina <= dataq_a(0);
--				a2_inb <= dataq_a(0);
			end if;
			if inst_a2d(26 downto 22) = "01000"				-- for debug only (jump and condition jump)
				or inst_a2d(26 downto 22) = "01001"
				or inst_a2d(26 downto 22) = "01010"
			then
				if inst_a2d(18) = '0' then jmp_addr <= rdata7;		-- register
				else jmp_addr <= inst_a2d(15 downto 0); end if;		-- direct addressing
			end if;
--		elsif state = wb1 then
--			if inst_a2d(26 downto 19) = "01110000" then		-- flag (update flag) [debuging]
--				a2_ina(15 downto 8) <= (others => 'Z');
--				a2_ina(7 downto 0) <= mem_data(7 downto 0);
--			end if;
		end if;
	end process;
	process(clk,reset)	-- control reg_we6,reg_we7 (register write enable port 4,5)
	begin
		if reset = '1' then
			reg_we6 <= '1';
			reg_we7 <= '1';
		else
			if clk'event and clk = '0' then
				if state = wb2 then								-- write rd
					if inst_a2w(26 downto 24) /= "011"				-- STC, CLC, CMC, FLAG, NOP
						and inst_a2w(26 downto 19) /= "00001000"	-- CMP rd,rs
						and inst_a2w(26 downto 19) /= "00010011"	-- TEST rd,rs
						and inst_a2w(26 downto 21) /= "101000"		-- CMP rd,#data
						and inst_a2w(26 downto 21) /= "110011"		-- TEST rd,#data
						and inst_a2w(26 downto 22) /= "01000"		-- JUMP
						and inst_a2w(26 downto 22) /= "01001"		-- JUMP
						and inst_a2w(26 downto 22) /= "01010"		-- JUMP
						then
							reg_we7 <= '0';
					end if;
					if inst_a2w(26 downto 19) = "00000100"			-- write rdx (only mul,imul,div,idiv instruction)
						or inst_a2w(26 downto 19) = "00000101"
						or inst_a2w(26 downto 19) = "00000110"
						or inst_a2w(26 downto 19) = "00000111"
						or inst_a2w(26 downto 21) = "100100"
						or inst_a2w(26 downto 21) = "100101"
						or inst_a2w(26 downto 21) = "100110"
						or inst_a2w(26 downto 21) = "100111"
					then
						reg_we6 <= '0';
					end if;
				else
					reg_we6 <= '1';
					reg_we7 <= '1';
				end if;
			end if;
		end if;
	end process;
-----------------------------------------------  ALU (2)  ----------------------------------------
end rtl;