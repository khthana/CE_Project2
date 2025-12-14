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
			when "0000" => s0 <= "1111110";
			when "0001" => s0 <= "0110000";
			when "0010" => s0 <= "1101101";
			when "0011" => s0 <= "1111001";
			when "0100" => s0 <= "0110011";
			when "0101" => s0 <= "1011011";
			when "0110" => s0 <= "1011111";
			when "0111" => s0 <= "1110000";
			when "1000" => s0 <= "1111111";
			when "1001" => s0 <= "1111011";
			when "1010" => s0 <= "1110111";
			when "1011" => s0 <= "0011111";
			when "1100" => s0 <= "1001110";
			when "1101" => s0 <= "0111101";
			when "1110" => s0 <= "1001111";
			when "1111" => s0 <= "1000111";
			when others => s0 <= "0000001";
		end case;
	end process;
	process(i1)
	begin
		case i1 is
			when "0000" => s1 <= "1111110";
			when "0001" => s1 <= "0110000";
			when "0010" => s1 <= "1101101";
			when "0011" => s1 <= "1111001";
			when "0100" => s1 <= "0110011";
			when "0101" => s1 <= "1011011";
			when "0110" => s1 <= "1011111";
			when "0111" => s1 <= "1110000";
			when "1000" => s1 <= "1111111";
			when "1001" => s1 <= "1111011";
			when "1010" => s1 <= "1110111";
			when "1011" => s1 <= "0011111";
			when "1100" => s1 <= "1001110";
			when "1101" => s1 <= "0111101";
			when "1110" => s1 <= "1001111";
			when "1111" => s1 <= "1000111";
			when others => s1 <= "0000001";
		end case;
	end process;
	process(i2)
	begin
		case i2 is
			when "0000" => s2 <= "1111110";
			when "0001" => s2 <= "0110000";
			when "0010" => s2 <= "1101101";
			when "0011" => s2 <= "1111001";
			when "0100" => s2 <= "0110011";
			when "0101" => s2 <= "1011011";
			when "0110" => s2 <= "1011111";
			when "0111" => s2 <= "1110000";
			when "1000" => s2 <= "1111111";
			when "1001" => s2 <= "1111011";
			when "1010" => s2 <= "1110111";
			when "1011" => s2 <= "0011111";
			when "1100" => s2 <= "1001110";
			when "1101" => s2 <= "0111101";
			when "1110" => s2 <= "1001111";
			when "1111" => s2 <= "1000111";
			when others => s2 <= "0000001";
		end case;
	end process;
	process(i3)
	begin
		case i3 is
			when "0000" => s3 <= "1111110";
			when "0001" => s3 <= "0110000";
			when "0010" => s3 <= "1101101";
			when "0011" => s3 <= "1111001";
			when "0100" => s3 <= "0110011";
			when "0101" => s3 <= "1011011";
			when "0110" => s3 <= "1011111";
			when "0111" => s3 <= "1110000";
			when "1000" => s3 <= "1111111";
			when "1001" => s3 <= "1111011";
			when "1010" => s3 <= "1110111";
			when "1011" => s3 <= "0011111";
			when "1100" => s3 <= "1001110";
			when "1101" => s3 <= "0111101";
			when "1110" => s3 <= "1001111";
			when "1111" => s3 <= "1000111";
			when others => s3 <= "0000001";
		end case;
	end process;
end rtl;