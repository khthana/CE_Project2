library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity clock is
port (clk		: in std_logic;
		p		: out std_logic);
end clock;
architecture rtl of clock is
	signal i : integer range 0 to 10;	-- freq
	signal tmp	: std_logic := '1';
begin
	p <= tmp;
	process(clk)
	begin
		if clk'event and clk = '1' then
			if i < 0 then			-- freq
				i <= i + 1;
			end if;
			if i = 0 then			-- freq
				i <= 0;
			end if;
		end if;
	end process;
	process(clk)
	begin
		if clk'event and clk = '1' then
			if i = 0 then
				tmp <= not tmp;
			end if;
		end if;
	end process;
end rtl;
