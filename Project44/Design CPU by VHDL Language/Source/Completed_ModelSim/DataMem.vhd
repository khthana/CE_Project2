Library IEEE;
Use IEEE.std_logic_1164.all;
Use IEEE.numeric_std.all;

Entity DataMem is
generic (width				: integer := 16;
		 bit_addr			: integer := 16;
		 size				: integer := 16);

port (cs	: in std_logic;
	  oe	: in std_logic;
	  we	: in std_logic;
	  addr	: in unsigned(bit_addr-1 downto 0);
	  data	: inout unsigned(width-1 downto 0));
End DataMem;

Architecture rtl of DataMem is

	type memory_array is array(integer range 0 to size - 1) of unsigned(width-1 downto 0);
	signal mem			: memory_array;
	signal address_n	: integer;

	Function to_integer(a : in unsigned(bit_addr-1 downto 0)) return integer is
		variable sum	: integer := 0;
		variable tmp	: integer;
		variable tmp2	: integer;
	begin
		for i in bit_addr-1 downto 0 loop
			tmp := 2**i;
			if (a(i) = '0') then tmp2 := 0;
			elsif (a(i) = '1') then tmp2 := 1; end if;
			sum := sum + (tmp * tmp2);
		end loop;
		return sum;
	end to_integer;

begin
	process(addr)
	begin
		address_n <= to_integer(addr);
	end process;
	process(oe)
	begin
		if oe = '0' then
			data <= mem(address_n);
		else
			data <= "ZZZZZZZZZZZZZZZZ";
		end if;
	end process;
	process(we)
	begin
		if we = '0' then
			mem(address_n) <= data;
		end if;
	end process;
End rtl;