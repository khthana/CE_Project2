library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity segment is
port (s0,s1,s2,s3	: out std_logic_vector(6 downto 0);
		i0,i1,i2,i3	: in std_logic_vector(3 downto 0));
end segment;
architecture rtl of segment is
begin
	process(i0)
	begin
		case i0 is
			when "0000" => s <= "0000001";
			when "0001" => s <= "1001111";
			when "0010" => s <= "0010010";
			when "0011" => s <= "0000110";
			when "0100" => s <= "1001100";
			when "0101" => s <= "0100100";
			when "0110" => s <= "0100000";
			when "0111" => s <= "0001111";
			when "1000" => s <= "0000000";
			when "1001" => s <= "0000100";
			when "1010" => s <= "0001000";
			when "1011" => s <= "1100000";
			when "1100" => s <= "0110001";
			when "1101" => s <= "1100000";
			when "1110" => s <= "0110000";
			when "1111" => s <= "0111000";
			when others => s <= "1111110";
		end case;
	end process;
	process(i1)
	begin
		case i1 is
			when "0000" => s <= "0000001";
			when "0001" => s <= "1001111";
			when "0010" => s <= "0010010";
			when "0011" => s <= "0000110";
			when "0100" => s <= "1001100";
			when "0101" => s <= "0100100";
			when "0110" => s <= "0100000";
			when "0111" => s <= "0001111";
			when "1000" => s <= "0000000";
			when "1001" => s <= "0000100";
			when "1010" => s <= "0001000";
			when "1011" => s <= "1100000";
			when "1100" => s <= "0110001";
			when "1101" => s <= "1100000";
			when "1110" => s <= "0110000";
			when "1111" => s <= "0111000";
			when others => s <= "1111110";
		end case;
	end process;
	process(i2)
	begin
		case i2 is
			when "0000" => s <= "0000001";
			when "0001" => s <= "1001111";
			when "0010" => s <= "0010010";
			when "0011" => s <= "0000110";
			when "0100" => s <= "1001100";
			when "0101" => s <= "0100100";
			when "0110" => s <= "0100000";
			when "0111" => s <= "0001111";
			when "1000" => s <= "0000000";
			when "1001" => s <= "0000100";
			when "1010" => s <= "0001000";
			when "1011" => s <= "1100000";
			when "1100" => s <= "0110001";
			when "1101" => s <= "1100000";
			when "1110" => s <= "0110000";
			when "1111" => s <= "0111000";
			when others => s <= "1111110";
		end case;
	end process;
	process(i3)
	begin
		case i3 is
			when "0000" => s <= "0000001";
			when "0001" => s <= "1001111";
			when "0010" => s <= "0010010";
			when "0011" => s <= "0000110";
			when "0100" => s <= "1001100";
			when "0101" => s <= "0100100";
			when "0110" => s <= "0100000";
			when "0111" => s <= "0001111";
			when "1000" => s <= "0000000";
			when "1001" => s <= "0000100";
			when "1010" => s <= "0001000";
			when "1011" => s <= "1100000";
			when "1100" => s <= "0110001";
			when "1101" => s <= "1100000";
			when "1110" => s <= "0110000";
			when "1111" => s <= "0111000";
			when others => s <= "1111110";
		end case;
	end process;
end rtl;