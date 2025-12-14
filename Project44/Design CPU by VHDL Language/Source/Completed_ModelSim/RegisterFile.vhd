Library IEEE;
Use IEEE.std_logic_1164.all;
Use IEEE.numeric_std.all;
Entity RegisterFile is
port (p0,p1,p2,p4,p5,p6,p7			: inout unsigned(15 downto 0);
	  s0,s1,s2,s4,s5,s6,s7			: in unsigned(4 downto 0);
	  oe							: in std_logic;
	  we0,we2,we4,we5,we6,we7		: in std_logic;
	  clk							: in std_logic;
	  port0							: out unsigned(15 downto 0));
end RegisterFile;
Architecture rtl of RegisterFile is
	type Reg_Type is array(integer range 0 to 31) of unsigned(15 downto 0);
	signal reg : Reg_Type;
	signal tmp0,tmp1,tmp2,tmp4,tmp5,tmp6,tmp7	: integer range 0 to 31;

	Function conv_reg(a : in unsigned(4 downto 0)) return integer is
		variable sum	: integer range 0 to 31 := 0;
		variable tmp	: integer range 0 to 31;
		variable tmp2	: integer range 0 to 31;
	begin
		for i in 4 downto 0 loop
			tmp := 2**i;
			if (a(i) = '0') then tmp2 := 0;
			elsif (a(i) = '1') then tmp2 := 1; end if;
			sum := sum + (tmp * tmp2);
		end loop;
		return sum;
	end conv_reg;

begin
	port0 <= reg(0);

	process(s0,s1,s2,s4,s5,s6,s7)
	begin
		tmp0 <= conv_reg(s0);
		tmp1 <= conv_reg(s1);
		tmp2 <= conv_reg(s2);
		tmp4 <= conv_reg(s4);
		tmp5 <= conv_reg(s5);
		tmp6 <= conv_reg(s6);
		tmp7 <= conv_reg(s7);
	end process;
	process(oe)
	begin
		if (oe = '0') then		-- read
			p0 <= reg(tmp0);
			p1 <= reg(tmp1);
			p2 <= reg(tmp2);
			p4 <= reg(tmp4);
			p5 <= reg(tmp5);
			p6 <= reg(tmp6);
			p7 <= reg(tmp7);
		else
			p0 <= "ZZZZZZZZZZZZZZZZ";
			p1 <= "ZZZZZZZZZZZZZZZZ";
			p2 <= "ZZZZZZZZZZZZZZZZ";
			p4 <= "ZZZZZZZZZZZZZZZZ";
			p5 <= "ZZZZZZZZZZZZZZZZ";
			p6 <= "ZZZZZZZZZZZZZZZZ";
			p7 <= "ZZZZZZZZZZZZZZZZ";
		end if;
	end process;
	process(clk)
	begin
		if clk'event and clk = '0' then
			if (we0 = '0') then
				reg(tmp0) <= p0;
			end if;
			if (we2 = '0') then
				reg(tmp2) <= p2;
			end if;
			if (we4 = '0') then
				reg(tmp4) <= p4;
			end if;
			if (we5 = '0') then
				reg(tmp5) <= p5;
			end if;
			if (we6 = '0') then
				reg(tmp6) <= p6;
			end if;
			if (we7 = '0') then
				reg(tmp7) <= p7;
			end if;
		end if;
	end process;
end rtl;