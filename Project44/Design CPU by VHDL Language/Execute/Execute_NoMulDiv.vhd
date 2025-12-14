Library IEEE;
Use IEEE.std_logic_1164.all,IEEE.Numeric_STD.all;
Entity ALU_Alpha is
	port(
		input_a		: in signed (15 downto 0);
		input_b		: in signed (15 downto 0);
		opcode		: in unsigned(7 downto 0);
		inflag		: in unsigned(4 downto 0);
		out_put		: out signed(31 downto 0); 
		EFlag		: out unsigned(7 downto 0);
		reset		: in std_logic;
		clk			: in std_logic
		);
end ALU_Alpha;

Architecture rtl of ALU_Alpha is

	signal psw			: unsigned(7 downto 0) := (others => '0');
	alias  p			: std_logic is psw(0);
	alias  cy			: std_logic is psw(1);
	alias  s			: std_logic is psw(2);
	alias  z			: std_logic is psw(3);
	alias  ov			: std_logic is psw(4);

	signal temp : signed (31 downto 0);
	alias  high : signed (15 downto 0) is temp (31 downto 16);
	alias  low  : signed (15 downto 0) is temp (15 downto 0);

	constant opcode_add1		: unsigned(7 downto 0) := "00000000";
	constant opcode_add2		: unsigned(7 downto 0) := "10000000";
	constant opcode_adc1		: unsigned(7 downto 0) := "00000001";
	constant opcode_adc2		: unsigned(7 downto 0) := "10000100";
	constant opcode_sub1		: unsigned(7 downto 0) := "00000010";
	constant opcode_sub2		: unsigned(7 downto 0) := "10001000";
	constant opcode_sbb1		: unsigned(7 downto 0) := "00000011";
	constant opcode_sbb2		: unsigned(7 downto 0) := "10001100";
	constant opcode_and1		: unsigned(7 downto 0) := "00010000";
	constant opcode_and2		: unsigned(7 downto 0) := "11000000";
	constant opcode_or1			: unsigned(7 downto 0) := "00010001";
	constant opcode_or2			: unsigned(7 downto 0) := "11000100";
	constant opcode_xor1		: unsigned(7 downto 0) := "00010010";
	constant opcode_xor2		: unsigned(7 downto 0) := "11001000";
	constant opcode_test1		: unsigned(7 downto 0) := "00010011";
	constant opcode_test2		: unsigned(7 downto 0) := "11001100";
	constant opcode_not			: unsigned(7 downto 0) := "01011000";
	constant opcode_inc			: unsigned(7 downto 0) := "01011001";
	constant opcode_dec			: unsigned(7 downto 0) := "01011010";
	constant opcode_neg			: unsigned(7 downto 0) := "01011011";
	constant opcode_cmp1		: unsigned(7 downto 0) := "00001000";
	constant opcode_cmp2		: unsigned(7 downto 0) := "10100000";
	constant opcode_rcl1		: unsigned(7 downto 0) := "00011000";
	constant opcode_rcl2		: unsigned(7 downto 0) := "00111000";
	constant opcode_rcr1		: unsigned(7 downto 0) := "00011001";
	constant opcode_rcr2		: unsigned(7 downto 0) := "00111001";
	constant opcode_rol1		: unsigned(7 downto 0) := "00011010";
	constant opcode_rol2		: unsigned(7 downto 0) := "00111010";
	constant opcode_ror1		: unsigned(7 downto 0) := "00011011";
	constant opcode_ror2		: unsigned(7 downto 0) := "00111011";
	constant opcode_shl1		: unsigned(7 downto 0) := "00011100";
	constant opcode_shl2		: unsigned(7 downto 0) := "00111100";
	constant opcode_shr1		: unsigned(7 downto 0) := "00011101";
	constant opcode_shr2		: unsigned(7 downto 0) := "00111101";
	constant opcode_sar1		: unsigned(7 downto 0) := "00011110";
	constant opcode_sar2		: unsigned(7 downto 0) := "00111110";
	constant opcode_stc			: unsigned(7 downto 0) := "01100000";
	constant opcode_clc			: unsigned(7 downto 0) := "01100001";
	constant opcode_cmc			: unsigned(7 downto 0) := "01100010";
	constant opcode_bt1			: unsigned(7 downto 0) := "00010100";
	constant opcode_bt2			: unsigned(7 downto 0) := "11010000";
	constant opcode_btc1		: unsigned(7 downto 0) := "00010101";
	constant opcode_btc2		: unsigned(7 downto 0) := "11010100";
	constant opcode_btr1		: unsigned(7 downto 0) := "00010110";
	constant opcode_btr2		: unsigned(7 downto 0) := "11011000";
	constant opcode_bts1		: unsigned(7 downto 0) := "00010111";
	constant opcode_bts2		: unsigned(7 downto 0) := "11011100";

	constant opcode_nop			: unsigned(7 downto 0) := "01111111";
	--	update flag : change opcode!!!!!!!!	
	constant opcode_updateflag	: unsigned(7 downto 0) := "01110000";	

	function sign_ext( input : signed; i : integer ) return signed is
	        variable ext		: signed (i-1 downto 0);
	        variable non_ext	: signed (input'length-1 downto 0);
	begin
		non_ext := input;
        
		if i < input'length then
			ext := non_ext(i-1 downto non_ext'right);
	        elsif i > input'length then
			ext := (others=>input(input'length -1));
			ext := ext((i-input'length-1) downto 0) & non_ext;
	        else
		    ext := non_ext;
	        end if;

		return ext;
	end sign_ext;

	function zero_ext( input : unsigned; i : integer ) return unsigned is
		variable ext		: unsigned (i-1 downto 0);
	        variable non_ext	: unsigned (input'length-1 downto 0);
	begin
		non_ext := input;

	        if i < input'length then
			ext := non_ext(i-1 downto non_ext'right);
	        elsif i > input'length then
			ext := (others=>'0');
			ext := ext((i-input'length-1) downto 0) & non_ext;
		else
			ext := non_ext;
	        end if;

		return ext;
	end zero_ext;

	Function count_parity(a : in signed(15 downto 0)) return std_logic is
		variable sum : std_logic;
	begin
		sum := a(15) xor a(14) xor a(13) xor a(12)
		   xor a(11) xor a(10) xor a(9) xor a(8)
		   xor a(7) xor a(6) xor a(5) xor a(4)
		   xor a(3) xor a(2) xor a(1) xor a(0);
		return sum;
	end count_parity;

begin
	process(clk)
		variable tmp			: signed(15 downto 0);
		variable num1			: integer:=0;
		variable num2			: integer:=0;
		variable num3			: integer:=0;
		variable num4			: integer:=0;
		variable cy_int			: integer range 0 to 100 := 0;
		variable parity_bit			: std_logic;
		variable tmp_test			: signed(15 downto 0);
		variable int,num_S			: integer range 0 to 100000 := 0;
		variable tmp_unsigned		: unsigned(15 downto 0);
		variable tmp_rot			: signed(16 downto 0);
		variable finish				: signed(16 downto 0);

		begin
			num1	:= to_integer(input_a);
			num2	:= to_integer(input_b);
	 		num3	:= to_integer(input_a(13 downto 0));
			num4	:= to_integer(input_b(13 downto 0));
			int	:= abs(to_integer(input_b));

			if reset ='1' then
				temp <=  (others=>'0');
				psw <= (others =>'0');
			elsif clk'event and clk = '0' then
				case opcode is
				 when opcode_add1 | opcode_add2 =>
					tmp	:= input_a + input_b;
					if (num1 + num2) > 32767 then
						cy <='1';
					else
						cy <='0';
					end if;
					if  (num3 + num4) > 16383 then
		   		  		if (num1 + num2) > 32767 then
							ov <= '0';
						else
							ov <= '1';
						end if;
					else
		    		  	if (num1 + num2) > 32767 then
							ov <= '1';
					   else
							ov <= '0';
					   end if;
					end if;

					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_adc1	 | opcode_adc2 =>
					if cy ='1' then
						cy_int := 1;
					else
						cy_int := 0;
					end if;
					tmp := input_a + input_b + cy_int;
					if (num1 + num2 + cy_int) > 32767 then
						cy <='1';
					else
						cy <='0';
					end if;
					if  (num3 + num4 + cy_int > 16383) then
	   		  			if (num1 + num2 + cy_int > 32767) then
							ov <= '0';
						else
							ov <= '1';
						end if;
					else
		    			  	if (num1 + num2 + cy_int > 32767) then
							ov <= '1';
					   else
							ov <= '0';
					   end if;
					end if;
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				 when opcode_sub1 | opcode_sub2 =>
					tmp := input_a - input_b;
					if (input_a < input_b) then
						cy <='1';
					end if;
					if (input_a = input_b) then
						cy <='0';
					end if;
					if (input_a > input_b) then
						cy <='0';
					end if;
					if num3 < num4 then
						if ( input_a > input_b) then
							ov <= '1';
						else
							ov <= '0';
						end if;
					else
						if (input_a > input_b) then
							ov <= '0';
						else
							ov <= '1';
						end if;
					end if;
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				 when opcode_sbb1 | opcode_sbb2 =>
					if cy ='1' then
						cy_int := 1;
					else
						cy_int := 0;
					end if;
					tmp := input_a - (input_b + cy_int);
					if ( input_a < input_b + cy_int) then
						cy <='1';
					end if;
					if (input_a = input_b + cy_int) then
						cy <='0';
					end if;
					if (input_a > input_b + cy_int) then
						cy <='0';
					end if;
					if num3 < num4 then
						if ( input_a > input_b + cy_int) then
							ov <= '1';
						else
							ov <= '0';
						end if;
					else
						if (input_a > input_b + cy_int) then
							ov <= '0';
						else
							ov <= '1';
						end if;
					end if;
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_and1 | opcode_and2 =>
					tmp := input_a and input_b;
					cy <= '0';
					ov <= '0';
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				 when opcode_or1 | opcode_or2 =>
					tmp := input_a or input_b;
					cy <= '0';
					ov <= '0';
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				 when opcode_xor1 | opcode_xor2 =>
					tmp := input_a xor input_b;
					cy <= '0';
					ov <= '0';
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_cmp1 | opcode_cmp2 =>
					if (input_a > input_b) then
						z <='0';
						s <= ov;
					end if;
					if (input_a = input_b) then
						z <='1';
					end if;
					if (input_a < input_b) then
						z <='0';
						s <= not(ov);
					end if;

				when opcode_inc =>
					tmp := input_a + 1;
					cy <='0';
					if input_a + 1 > 32767 then 
						ov <='1';
					else
						ov <='0';
					end if;
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_dec =>
					tmp := input_a - 1;
					cy <='0';
					if input_a - 1 < -32767 then 
						ov <='1';
					else
						ov <='0';
					end if;
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_neg =>
					tmp := (0 - input_a);
					cy <='0';
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_not =>
				    tmp := not (input_a);
					cy <= '0';
					ov <= '0';
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				 when opcode_test1 | opcode_test2 =>
					tmp_test := input_a and input_b;
					if tmp_test = "0000000000000000" then
						cy <='0';
					else
						cy <='1';
					end if;
					ov <= '0';

				when opcode_stc =>
					cy <='1';
				when opcode_clc =>
					cy <='0';
				when opcode_cmc =>
					cy <= not(cy);
				when opcode_updateflag =>
					psw <=	"000" & inflag;

				when opcode_bt1 | opcode_bt2 =>
					cy <= input_a(num2);
					tmp := input_a;
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_btc1 | opcode_btc2 =>
					cy <= input_a(num2);
					tmp := input_a;
					tmp(num2) := not tmp(num2);
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_btr1 | opcode_btr2 =>
					cy <= input_a(num2);
					tmp := input_a;
					tmp(num2) := '0';
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_bts1 | opcode_bts2 =>
					cy <= input_a(num2);
					tmp := input_a;
					tmp(num2) := '1';
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_shl1 | opcode_shl2 =>
					tmp_unsigned := shift_left(unsigned(input_a),int);
					num_s := abs(15-int);
					cy <= input_a(num_s);
					tmp := signed(tmp_unsigned);
					if int =1  then
						ov <= '1';
					else
						if input_a(15) = cy then
							ov <='0';
						else
							ov <='1';
						end if;
					end if;
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_shr1 | opcode_shr2 =>
					tmp_unsigned := shift_right(unsigned(input_a),int);
					cy <= input_a(int - 1);
					tmp := signed(tmp_unsigned);
					if int =1  then
						ov <= '1';
					else
						ov <= '0';
					end if;
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_sar1 | opcode_sar2 =>
					tmp	:= shift_right(input_a,int);
					cy <= input_a(int-1);
					if int =1  then
					ov <= '1';
					else
						if input_a(15) = cy then
							ov <='0';
						else
							ov <='1';
						end if;
					end if;
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_rcl1 | opcode_rcl2 =>
					tmp_rot := cy & input_a;
					finish := rotate_left(tmp_rot,int);
					tmp := finish(15 downto 0);
					cy <= finish(16);
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_rcr1 | opcode_rcr2 =>
					tmp_rot := input_a & cy;
					finish := rotate_right(tmp_rot,int);
					tmp := finish(16 downto 1);
					cy <= finish(0);
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_rol1 | opcode_rol2 =>
					tmp := rotate_left(input_a,int);
					cy <= tmp(15);
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_ror1 | opcode_ror2 =>
					tmp := rotate_right(input_a,int);
					cy <= tmp(0);
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_nop =>
				when others =>	temp <=  (others => 'Z');
				end case;

			end if;
	end process;

	out_put <= temp;
	EFlag <= psw;
end rtl;

Library IEEE;
Use IEEE.std_logic_1164.all,IEEE.Numeric_STD.all;
Entity ALU_Omega is
	port(
		input_a		: in signed (15 downto 0);
		input_b		: in signed (15 downto 0);
		opcode		: in unsigned (7 downto 0);
		inflag		: in unsigned(4 downto 0);
		out_put		: out signed(31 downto 0);
		EFlag		: out unsigned(7 downto 0);
		reset		: in std_logic;
		clk		: in std_logic;
		jmp		: out std_logic
	     );
end ALU_Omega;

Architecture rtl of ALU_Omega is

	signal psw			: unsigned(7 downto 0) := (others => '0');
	alias  p			: std_logic is psw(0);
	alias  cy			: std_logic is psw(1);
	alias  s			: std_logic is psw(2);
	alias  z			: std_logic is psw(3);
	alias  ov			: std_logic is psw(4);

	signal temp : signed (31 downto 0);
	alias  high : signed (15 downto 0) is temp (31 downto 16);
	alias  low  : signed (15 downto 0) is temp (15 downto 0);

	constant opcode_add1		: unsigned(7 downto 0) := "00000000";
	constant opcode_add2		: unsigned(7 downto 0) := "10000000";
	constant opcode_adc1		: unsigned(7 downto 0) := "00000001";
	constant opcode_adc2		: unsigned(7 downto 0) := "10000100";
	constant opcode_sub1		: unsigned(7 downto 0) := "00000010";
	constant opcode_sub2		: unsigned(7 downto 0) := "10001000";
	constant opcode_sbb1		: unsigned(7 downto 0) := "00000011";
	constant opcode_sbb2		: unsigned(7 downto 0) := "10001100";
	constant opcode_and1		: unsigned(7 downto 0) := "00010000";
	constant opcode_and2		: unsigned(7 downto 0) := "11000000";
	constant opcode_or1			: unsigned(7 downto 0) := "00010001";
	constant opcode_or2			: unsigned(7 downto 0) := "11000100";
	constant opcode_xor1		: unsigned(7 downto 0) := "00010010";
	constant opcode_xor2		: unsigned(7 downto 0) := "11001000";
	constant opcode_test1		: unsigned(7 downto 0) := "00010011";
	constant opcode_test2		: unsigned(7 downto 0) := "11001100";
	constant opcode_not			: unsigned(7 downto 0) := "01011000";
	constant opcode_inc			: unsigned(7 downto 0) := "01011001";
	constant opcode_dec			: unsigned(7 downto 0) := "01011010";
	constant opcode_neg			: unsigned(7 downto 0) := "01011011";
	constant opcode_cmp1		: unsigned(7 downto 0) := "00001000";
	constant opcode_cmp2		: unsigned(7 downto 0) := "10100000";
	constant opcode_rcl1		: unsigned(7 downto 0) := "00011000";
	constant opcode_rcl2		: unsigned(7 downto 0) := "00111000";
	constant opcode_rcr1		: unsigned(7 downto 0) := "00011001";
	constant opcode_rcr2		: unsigned(7 downto 0) := "00111001";
	constant opcode_rol1		: unsigned(7 downto 0) := "00011010";
	constant opcode_rol2		: unsigned(7 downto 0) := "00111010";
	constant opcode_ror1		: unsigned(7 downto 0) := "00011011";
	constant opcode_ror2		: unsigned(7 downto 0) := "00111011";
	constant opcode_shl1		: unsigned(7 downto 0) := "00011100";
	constant opcode_shl2		: unsigned(7 downto 0) := "00111100";
	constant opcode_shr1		: unsigned(7 downto 0) := "00011101";
	constant opcode_shr2		: unsigned(7 downto 0) := "00111101";
	constant opcode_sar1		: unsigned(7 downto 0) := "00011110";
	constant opcode_sar2		: unsigned(7 downto 0) := "00111110";
	constant opcode_stc			: unsigned(7 downto 0) := "01100000";
	constant opcode_clc			: unsigned(7 downto 0) := "01100001";
	constant opcode_cmc			: unsigned(7 downto 0) := "01100010";
	constant opcode_bt1			: unsigned(7 downto 0) := "00010100";
	constant opcode_bt2			: unsigned(7 downto 0) := "11010000";
	constant opcode_btc1		: unsigned(7 downto 0) := "00010101";
	constant opcode_btc2		: unsigned(7 downto 0) := "11010100";
	constant opcode_btr1		: unsigned(7 downto 0) := "00010110";
	constant opcode_btr2		: unsigned(7 downto 0) := "11011000";
	constant opcode_bts1		: unsigned(7 downto 0) := "00010111";
	constant opcode_bts2		: unsigned(7 downto 0) := "11011100";
	constant opcode_jump		: unsigned(7 downto 0) := "01010000";
	constant opcode_jo			: unsigned(7 downto 0) := "01000000";
	constant opcode_jno			: unsigned(7 downto 0) := "01000001";
	constant opcode_jb_jnae		: unsigned(7 downto 0) := "01000010";
	constant opcode_jae_jnb		: unsigned(7 downto 0) := "01000011";
	constant opcode_jne_jnz		: unsigned(7 downto 0) := "01000100";
	constant opcode_je_jz		: unsigned(7 downto 0) := "01000101";
	constant opcode_jbe_jna		: unsigned(7 downto 0) := "01000110";
	constant opcode_jnbe_ja		: unsigned(7 downto 0) := "01000111";
	constant opcode_js			: unsigned(7 downto 0) := "01001000";
	constant opcode_jns			: unsigned(7 downto 0) := "01001001";
	constant opcode_jp_jpe		: unsigned(7 downto 0) := "01001010";
	constant opcode_jnp_jpo		: unsigned(7 downto 0) := "01001011";
	constant opcode_jl_jnge		: unsigned(7 downto 0) := "01001100";
	constant opcode_jge_jnl		: unsigned(7 downto 0) := "01001101";
	constant opcode_jle_jng		: unsigned(7 downto 0) := "01001110";
	constant opcode_jg_jnle		: unsigned(7 downto 0) := "01001111";
	constant opcode_nop			: unsigned(7 downto 0) := "01111111";
	--	update flag : change opcode!!!!!!!!	
	constant opcode_updateflag	: unsigned(7 downto 0) := "01110000";	

	function sign_ext( input : signed; i : integer ) return signed is
	        variable ext		: signed (i-1 downto 0);
	        variable non_ext	: signed (input'length-1 downto 0);
	begin
		non_ext := input;
        
		if i < input'length then
			ext := non_ext(i-1 downto non_ext'right);
	        elsif i > input'length then
			ext := (others=>input(input'length -1));
			ext := ext((i-input'length-1) downto 0) & non_ext;
	        else
		    ext := non_ext;
	        end if;

		return ext;
	end sign_ext;

	function zero_ext( input : unsigned; i : integer ) return unsigned is
		variable ext		: unsigned (i-1 downto 0);
	        variable non_ext	: unsigned (input'length-1 downto 0);
	begin
		non_ext := input;

	        if i < input'length then
			ext := non_ext(i-1 downto non_ext'right);
	        elsif i > input'length then
			ext := (others=>'0');
			ext := ext((i-input'length-1) downto 0) & non_ext;
		else
			ext := non_ext;
	        end if;

		return ext;
	end zero_ext;

	Function count_parity(a : in signed(15 downto 0)) return std_logic is
		variable sum : std_logic;
	begin
		sum := a(15) xor a(14) xor a(13) xor a(12)
		   xor a(11) xor a(10) xor a(9) xor a(8)
		   xor a(7) xor a(6) xor a(5) xor a(4)
		   xor a(3) xor a(2) xor a(1) xor a(0);
		return sum;
	end count_parity;

begin

	process(clk)
		variable tmp			: signed(15 downto 0);
		variable num1			: integer:=0;
		variable num2			: integer:=0;
		variable num3			: integer:=0;
		variable num4			: integer:=0;
		variable cy_int			: integer range 0 to 100 := 0;
		variable parity_bit			: std_logic;
		variable tmp_test			: signed(15 downto 0);
		variable int,num_s			: integer range 0 to 100000 := 0;
		variable tmp_unsigned		: unsigned(15 downto 0);
		variable tmp_rot			: signed(16 downto 0);
		variable finish			: signed(16 downto 0);

		begin
			num1	:= to_integer(input_a);
			num2	:= to_integer(input_b);
	 		num3	:= to_integer(input_a(13 downto 0));
			num4	:= to_integer(input_b(13 downto 0));
			int	:= abs(to_integer(input_b));

			if reset ='1' then
				temp <=  (others=>'0');
				psw <= (others =>'0');
				jmp <= '0';
			elsif clk'event and clk = '0' then
				jmp	<= '0';
				case opcode is
				 when opcode_add1 | opcode_add2 =>
					tmp	:= input_a + input_b;
					if (num1 + num2) > 32767 then
						cy <='1';
					else
						cy <='0';
					end if;
					if  (num3 + num4) > 16383 then
		   		  		if (num1 + num2) > 32767 then
							ov <= '0';
						else
							ov <= '1';
						end if;
					else
		    		  	if (num1 + num2) > 32767 then
							ov <= '1';
					   else
							ov <= '0';
					   end if;
					end if;

					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_adc1	 | opcode_adc2 =>
					if cy ='1' then
						cy_int := 1;
					else
						cy_int := 0;
					end if;
					tmp := input_a + input_b + cy_int;
					if (num1 + num2 + cy_int) > 32767 then
						cy <='1';
					else
						cy <='0';
					end if;
					if  (num3 + num4 + cy_int > 16383) then
	   		  			if (num1 + num2 + cy_int > 32767) then
							ov <= '0';
						else
							ov <= '1';
						end if;
					else
		    			  	if (num1 + num2 + cy_int > 32767) then
							ov <= '1';
					   else
							ov <= '0';
					   end if;
					end if;
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				 when opcode_sub1 | opcode_sub2 =>
					tmp := input_a - input_b;
					if (input_a < input_b) then
						cy <='1';
					end if;
					if (input_a = input_b) then
						cy <='0';
					end if;
					if (input_a > input_b) then
						cy <='0';
					end if;
					if num3 < num4 then
						if ( input_a > input_b) then
							ov <= '1';
						else
							ov <= '0';
						end if;
					else
						if (input_a > input_b) then
							ov <= '0';
						else
							ov <= '1';
						end if;
					end if;
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				 when opcode_sbb1 | opcode_sbb2 =>
					if cy ='1' then
						cy_int := 1;
					else
						cy_int := 0;
					end if;
					tmp := input_a - (input_b + cy_int);
					if ( input_a < input_b + cy_int) then
						cy <='1';
					end if;
					if (input_a = input_b + cy_int) then
						cy <='0';
					end if;
					if (input_a > input_b + cy_int) then
						cy <='0';
					end if;
					if num3 < num4 then
						if ( input_a > input_b + cy_int) then
							ov <= '1';
						else
							ov <= '0';
						end if;
					else
						if (input_a > input_b + cy_int) then
							ov <= '0';
						else
							ov <= '1';
						end if;
					end if;
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_and1 | opcode_and2 =>
					tmp := input_a and input_b;
					cy <= '0';
					ov <= '0';
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				 when opcode_or1 | opcode_or2 =>
					tmp := input_a or input_b;
					cy <= '0';
					ov <= '0';
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				 when opcode_xor1 | opcode_xor2 =>
					tmp := input_a xor input_b;
					cy <= '0';
					ov <= '0';
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_cmp1 | opcode_cmp2 =>
					if (input_a > input_b) then
						z <='0';
						s <= ov;
					end if;
					if (input_a = input_b) then
						z <='1';
					end if;
					if (input_a < input_b) then
						z <='0';
						s <= not(ov);
					end if;

				when opcode_inc =>
					tmp := input_a + 1;
					cy <='0';
					if input_a + 1 > 32767 then 
						ov <='1';
					else
						ov <='0';
					end if;
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_dec =>
					tmp := input_a - 1;
					cy <='0';
					if input_a - 1 < -32767 then 
						ov <='1';
					else
						ov <='0';
					end if;
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_neg =>
					tmp := (0 - input_a);
					cy <='0';
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_not =>
				    tmp := not (input_a);
					cy <= '0';
					ov <= '0';
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				 when opcode_test1 | opcode_test2 =>
					tmp_test := input_a and input_b;
					if tmp_test = "0000000000000000" then
						cy <='0';
					else
						cy <='1';
					end if;
					ov <= '0';

				when opcode_stc =>
					cy <='1';
				when opcode_clc =>
					cy <='0';
				when opcode_cmc =>
					cy <= not(cy);
				when opcode_updateflag =>
					psw <=	"000" & inflag;

				when opcode_bt1 | opcode_bt2 =>
					cy <= input_a(num2);
					tmp := input_a;
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_btc1 | opcode_btc2 =>
					cy <= input_a(num2);
					tmp := input_a;
					tmp(num2) := not tmp(num2);
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_btr1 | opcode_btr2 =>
					cy <= input_a(num2);
					tmp := input_a;
					tmp(num2) := '0';
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_bts1 | opcode_bts2 =>
					cy <= input_a(num2);
					tmp := input_a;
					tmp(num2) := '1';
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_shl1 | opcode_shl2 =>
					tmp_unsigned := shift_left(unsigned(input_a),int);
					num_s := abs(15-int);
					cy <= input_a(num_s);
					tmp := signed(tmp_unsigned);
					if int =1  then
						ov <= '1';
					else
						if input_a(15) = cy then
							ov <='0';
						else
							ov <='1';
						end if;
					end if;
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_shr1 | opcode_shr2 =>
					tmp_unsigned := shift_right(unsigned(input_a),int);
					cy <= input_a(int - 1);
					tmp := signed(tmp_unsigned);
					if int =1  then
						ov <= '1';
					else
						ov <= '0';
					end if;
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_sar1 | opcode_sar2 =>
					tmp	:= shift_right(input_a,int);
					cy <= input_a(int-1);
					if int =1  then
					ov <= '1';
					else
						if input_a(15) = cy then
							ov <='0';
						else
							ov <='1';
						end if;
					end if;
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_rcl1 | opcode_rcl2 =>
					tmp_rot := cy & input_a;
					finish := rotate_left(tmp_rot,int);
					tmp := finish(15 downto 0);
					cy <= finish(16);
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_rcr1 | opcode_rcr2 =>
					tmp_rot := input_a & cy;
					finish := rotate_right(tmp_rot,int);
					tmp := finish(16 downto 1);
					cy <= finish(0);
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_rol1 | opcode_rol2 =>
					tmp := rotate_left(input_a,int);
					cy <= tmp(15);
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_ror1 | opcode_ror2 =>
					tmp := rotate_right(input_a,int);
					cy <= tmp(0);
					if (tmp < 0) then
						s <='1';
						z <='0';
					end if;
					if (tmp = 0) then
						s <='0';
						z <='1';
					end if;
					if tmp > 0 then
						s <='0';
						z <='0';
					end if;
					p <= count_parity(tmp);
					temp <= sign_ext(tmp,32);

				when opcode_jump =>
					jmp <= '1';
					low <= input_a;
				when opcode_jo =>
					if ov = '1' then
						jmp <= '1';
						low <= input_a;
					end if;
				when opcode_jno =>
					if ov = '0' then
						jmp <= '1';
						low <= input_a;
					end if;
				when opcode_jb_jnae =>
					if cy = '1' then
						jmp <= '1';
						low <= input_a;
					end if;
				when opcode_jae_jnb =>
					if cy = '0' then
						jmp <= '1';
						low <= input_a;
					end if;
				when opcode_je_jz =>
					if z = '1' then
						jmp <= '1';
						low <= input_a;
					end if;
				when opcode_jne_jnz =>
					if z = '0' then
						jmp <= '1';
						low <= input_a;
					end if;
				when opcode_jbe_jna =>
					if (cy or z) = '1' then
						jmp <= '1';
						low <= input_a;
					end if;
				when opcode_jnbe_ja =>
					if (cy or z) = '0' then
						jmp <= '1';
						low <= input_a;
					end if;
				when opcode_js =>
					if s = '1' then
						jmp <= '1';
						low <= input_a;
					end if;
				when opcode_jns =>
					if s = '0' then
						jmp <= '1';
						low <= input_a;
					end if;
				when opcode_jp_jpe =>
					if p = '1' then
						jmp <= '1';
						low <= input_a;
					end if;
				when opcode_jnp_jpo =>
					if p = '0' then
						jmp <= '1';
						low <= input_a;
					end if;
				when opcode_jl_jnge =>
					if (s xor ov) = '1'   then
						jmp <= '1';
						low <= input_a;
					end if;
				when opcode_jge_jnl =>
					if (s xor ov) = '0'   then
						jmp <= '1';
						low <= input_a;
					end if;
				when opcode_jle_jng =>
					if ((s xor ov) or z) = '1'     then
						jmp <= '1';
						low <= input_a;
					end if;
				when opcode_jg_jnle =>
					if ((s xor ov) or z) = '0'   then
						jmp <= '1';
						low <= input_a;
					end if;

				when opcode_nop =>
				when others =>	temp <=  (others => 'Z');
				end case;

			end if;
	end process;

	out_put <= temp;
	EFlag <= psw;
end rtl;

library ieee;
use ieee.std_logic_1164.all,IEEE.Numeric_STD.all;

entity Mux is
    port(	
	in_reg_buf	: in signed(15 downto 0);
	in_forw_a	: in signed(15 downto 0);
	in_forw_b	: in signed(15 downto 0);
	dir		: in unsigned(1 downto 0);
	output		: out signed(15 downto 0);
	clk		: in std_logic
	);
end Mux;

architecture rtl of Mux is

begin
	process(dir,clk,in_reg_buf,in_forw_a,in_forw_b)		-- modify
	begin
		if clk'event and clk = '1' then
			case dir is
			when "00" =>	
				output <= in_reg_buf;
			when "01" =>	
				output <= in_forw_a;
			when "10" =>	
				output <= in_forw_b;
			when "11" =>	
				output <= in_reg_buf;
			when others => 
				output <= in_reg_buf;
			end case;
		end if;
	end process;
end rtl;


library ieee;
use ieee.std_logic_1164.all,IEEE.Numeric_STD.all;

entity Forward is
    port(
	inst1		: in unsigned(26 downto 0);
	inst2		: in unsigned(26 downto 0);
	next_inst1	: in unsigned(26 downto 0);
	next_inst2	: in unsigned(26 downto 0);
	dir1		: out unsigned(1 downto 0);
	dir2		: out unsigned(1 downto 0);
	dir3		: out unsigned(1 downto 0);
	dir4		: out unsigned(1 downto 0);
	clk		: in std_logic;
	reset		: in std_logic
	);
end Forward;

architecture rtl of Forward is
	alias	op1	: unsigned(2 downto 0) is inst1(26 downto 24);
	alias	op2	: unsigned(2 downto 0) is inst2(26 downto 24);
	alias	op3	: unsigned(2 downto 0) is next_inst1(26 downto 24);
	alias	op4	: unsigned(2 downto 0) is next_inst2(26 downto 24);
	alias	opr1	: unsigned(4 downto 0) is inst1(4 downto 0);
	alias	opr2	: unsigned(4 downto 0) is inst2(4 downto 0);
	alias	opr3	: unsigned(4 downto 0) is next_inst1(4 downto 0);
	alias	opr4	: unsigned(4 downto 0) is next_inst1(9 downto 5);
	alias	opr5	: unsigned(4 downto 0) is next_inst2(4 downto 0);
	alias	opr6	: unsigned(4 downto 0) is next_inst2(9 downto 5);

begin

	process(reset,clk)
	begin
		if reset ='1' then
			dir1	<= "ZZ";
			dir2	<= "ZZ";
			dir3	<= "ZZ";
			dir4	<= "ZZ";

		elsif clk'event and clk = '0' then
			dir1	<= "00";
			dir2	<= "00";
			dir3	<= "00";
			dir4	<= "00";
			if (op1 = "000") or (op1 ="100") or (op1 ="001") or (op1 ="010") then
				if (op3 = "000") then
					if (opr4 = opr1) then
						dir2	<= "01";
					elsif (opr3 = opr1) then
						dir1	<= "01";
					end if;
				elsif (op3 ="100") or (op3 ="001") or (op3 ="010")  then
					if (opr3 = opr1) then
						dir1	<= "01";
					end if;
				end if;
			end if;

			if (op2 = "000") or (op2 ="100") or (op2 ="001") or (op2 ="010") then
				if (op3 = "000") then
					if (opr4 = opr2) then
						dir2	<= "10";
					elsif (opr3 = opr2) then
						dir1	<= "10";
					end if;
				elsif (op3 ="100") or (op3 ="001") or (op3 ="010")  then
					if (opr3 = opr2) then
						dir1	<= "10";
					end if;
				end if;
			end if;

			if (op1 = "000") or (op1 ="100") or (op1 ="001") or (op1 ="010") then
				if (op4 = "000") then
					if (opr6 = opr1) then
						dir4	<= "01";
					elsif (opr5 = opr1) then
						dir3	<= "01";
					end if;
				elsif (op4 ="100") or (op4 ="001") or (op4 ="010")  then
					if (opr5 = opr1) then
						dir3	<= "01";
					end if;
				else dir3	<="11";
				end if;
			end if;

			if (op2 = "000") or (op2 ="100") or (op2 ="001") or (op2 ="010") then
				if (op4 = "000") then
					if (opr6 = opr2) then
						dir4	<= "10";
					elsif (opr5 = opr2) then
						dir3	<= "10";
					end if;
				elsif (op4 ="100") or (op4 ="001") or (op4 ="010")  then
					if (opr5 = opr2) then
						dir3	<= "10";
					end if;
				else dir4	<="11";
				end if;
			end if;
		end if;
	end process;
end rtl;


library ieee;
use ieee.std_logic_1164.all,IEEE.Numeric_STD.all;

Entity execute is
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
		jmp			: out std_logic;
		inst1		: in unsigned(26 downto 0);
		inst2		: in unsigned(26 downto 0);
		next_inst1	: in unsigned(26 downto 0);
		next_inst2	: in unsigned(26 downto 0);
		reset		: in std_logic;
		clk_big_one	: in std_logic
--		clk_small_one	: in std_logic
	     );
end execute;

Architecture rtl of execute is

component ALU_Alpha 
	port(
		input_a		: in signed (15 downto 0);
		input_b		: in signed (15 downto 0);
		opcode		: in unsigned (7 downto 0);
		inflag		: in unsigned(4 downto 0);
		out_put		: out signed(31 downto 0); 
		EFlag		: out unsigned(7 downto 0);
		reset		: in std_logic;
		clk		: in std_logic
		);
end component;

component ALU_Omega
	port(
		input_a		: in signed (15 downto 0);
		input_b		: in signed (15 downto 0);
		opcode		: in unsigned (7 downto 0);
		inflag		: in unsigned(4 downto 0);
		out_put		: out signed(31 downto 0); 
		EFlag		: out unsigned(7 downto 0);
		reset		: std_logic;
		clk		: in std_logic;
		jmp		: out std_logic
	     );
end component;

component Forward
    port(	
	inst1		: in unsigned(26 downto 0);
	inst2		: in unsigned(26 downto 0);
	next_inst1	: in unsigned(26 downto 0);
	next_inst2	: in unsigned(26 downto 0);
	dir1		: out unsigned(1 downto 0);
	dir2		: out unsigned(1 downto 0);
	dir3		: out unsigned(1 downto 0);
	dir4		: out unsigned(1 downto 0);
	clk			: in std_logic;
	reset		: in std_logic
	);
end component;

component Mux
    port(	
	in_reg_buf	: in signed(15 downto 0);
	in_forw_a	: in signed(15 downto 0);
	in_forw_b	: in signed(15 downto 0);
	dir		: in unsigned(1 downto 0);
	output		: out signed(15 downto 0);
	clk		: in std_logic
	);
end component;

	signal  s_a1		: signed(15 downto 0);
	signal  s_b1		: signed(15 downto 0);
	signal  s_output1	: signed(31 downto 0);
	signal  s_a2		: signed(15 downto 0);
	signal  s_b2		: signed(15 downto 0);
	signal  s_output2	: signed(31 downto 0);

	signal	s_dir1		: unsigned(1 downto 0);
	signal	s_dir2		: unsigned(1 downto 0);
	signal	s_dir3		: unsigned(1 downto 0);
	signal	s_dir4		: unsigned(1 downto 0);

	signal s_alu_a1		: signed(15 downto 0);
	signal s_alu_b1		: signed(15 downto 0);
	signal s_alu_a2		: signed(15 downto 0);
	signal s_alu_b2		: signed(15 downto 0);

	alias  s_low1		: signed (15 downto 0) is s_output1 (15 downto 0);
	alias  s_low2		: signed (15 downto 0) is s_output2 (15 downto 0);
	
	begin
		ALU1 : ALU_Alpha port map(s_a1,s_b1,opcode1,inflag1,s_output1,flag1,reset,clk_big_one);
		ALU2 : ALU_Omega port map(s_a2,s_b2,opcode2,inflag2,s_output2,flag2,reset,clk_big_one,jmp);
		FORW : Forward	 port map(inst1,inst2,next_inst1,next_inst2,s_dir1,s_dir2,s_dir3,s_dir4,clk_big_one,reset);
		MUX1 : Mux	 port map(s_alu_a1,s_low1,s_low2,s_dir1,s_a1,clk_big_one);
		MUX2 : Mux	 port map(s_alu_b1,s_low1,s_low2,s_dir2,s_b1,clk_big_one);
		MUX3 : Mux	 port map(s_alu_a2,s_low1,s_low2,s_dir3,s_a2,clk_big_one);
		MUX4 : Mux	 port map(s_alu_b2,s_low1,s_low2,s_dir4,s_b2,clk_big_one);
		s_alu_a1	<= signed(input_a1);
		s_alu_b1	<= signed(input_b1);
		s_alu_a2	<= signed(input_a2);
		s_alu_b2	<= signed(input_b2);
		output1		<= unsigned(s_output1);
		output2		<= unsigned(s_output2);	
end rtl;
