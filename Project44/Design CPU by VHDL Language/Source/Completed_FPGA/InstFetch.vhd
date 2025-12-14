
-- Control Instruction Fetch

Library IEEE;
Use IEEE.std_logic_1164.all;
Use IEEE.numeric_std.all;

Entity InstFetch is
generic (inst_width	: integer := 100;
		 bit_addr	: integer := 16);

port (inst_d	: out unsigned(inst_width-1 downto 0);
	  inst_x	: out unsigned(inst_width-1 downto 0);
	  inst_w	: out unsigned(inst_width-1 downto 0);
	  ip_in		: in unsigned(15 downto 0);
	  ip_out	: out unsigned(15 downto 0);
	  jmp_addr	: in unsigned(15 downto 0);
	  jmp		: in std_logic;
	  clk		: in std_logic;
	  reset		: in std_logic);
End InstFetch;
Architecture rtl of InstFetch is
	component InstMem
	port (oe	: in std_logic;
		  cs	: in std_logic;
		  addr	: in unsigned(bit_addr-1 downto 0);
		  data	: inout unsigned(inst_width-1 downto 0));
	end component;

	type state_type is (init, update, fetch, next_inst, shift);
	signal state	: state_type;
	signal ip		: unsigned(15 downto 0);
	signal tmp_d	: unsigned(inst_width-1 downto 0);
	signal tmp_x	: unsigned(inst_width-1 downto 0);
	signal tmp_w	: unsigned(inst_width-1 downto 0);
	signal inst_oe	: std_logic;
	signal data		: unsigned(inst_width-1 downto 0);
	signal address	: unsigned(15 downto 0);

begin
	ic : InstMem port map(inst_oe,inst_oe,address,data);
	process(clk)	-- control state
	begin
		if clk'event and clk = '1' then
			if reset = '1' then state <= init; else
				case state is
					when init =>
						state <= update;
					when update =>
						state <= fetch;
					when fetch =>
						state <= next_inst;
					when next_inst =>
						state <= shift;
					when shift => state <= update;
				end case;
			end if;
		end if;
	end process;
	process(clk)	-- control signal at the middle of state
	begin
		if clk'event and clk = '0' then
			case state is
				when init =>
					ip <= "1111111111111111";	-- initialize IP
					tmp_d <= "0111100000000000000000001100000000000000000000011111110000000000000000000011111110000000000000000000";
					tmp_x <= "0111100000000000000000001100000000000000000000011111110000000000000000000011111110000000000000000000";
					tmp_w <= "0111100000000000000000001100000000000000000000011111110000000000000000000011111110000000000000000000";
				when update =>
					if (jmp = '1') then
						ip <= jmp_addr;
					elsif (jmp = '0') then
						if tmp_x(99 downto 95) = "01011" then
							ip <= ip_in;	-- POP IP (opcode)
						else
							ip <= ip + 1;
						end if;
					end if;
				when fetch =>
					tmp_d <= data;	-- read instruction from memory to IR
				when next_inst =>
				when shift =>
					tmp_w <= tmp_x;
					tmp_x <= tmp_d;
			end case;
		end if;
	end process;
	process(state)	-- control read instruction memory signal (cs,oe)
	begin
		if state = fetch then inst_oe <= '0';
		else inst_oe <= '1'; end if;
	end process;

	-- real time update
	inst_d <= tmp_d;
	inst_x <= tmp_x;
	inst_w <= tmp_w;
	ip_out <= ip;
	address <= ip;
End rtl;

