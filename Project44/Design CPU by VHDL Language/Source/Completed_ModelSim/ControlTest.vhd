--  Test Bench for Control Unit  --

Library IEEE;
Use IEEE.std_logic_1164.all;
Use IEEE.numeric_std.all;

Entity Control_Test is
End Control_Test;
Architecture Test of Control_Test is
	component Control
	port (in_clk		: in std_logic;
		  reset			: in std_logic;
		  s0,s1,s2,s3	: out unsigned(6 downto 0);
		  e				: out unsigned(9 downto 0));
	end component;

	signal s_in_clk		: std_logic := '1';
	signal s_reset		: std_logic;
	signal s_s0			: unsigned(6 downto 0);
	signal s_s1			: unsigned(6 downto 0);
	signal s_s2			: unsigned(6 downto 0);
	signal s_s3			: unsigned(6 downto 0);
	signal s_e			: unsigned(9 downto 0);

begin
	ic : Control port map(s_in_clk,s_reset,s_s0,s_s1,s_s2,s_s3,s_e);

	s_in_clk <= not s_in_clk after 5 ns;
	
	process
	begin
		s_reset <= '1';
		wait for 25 ns;
		s_reset <= '0';
	
		wait for 500 ms;
	end process;
End Test;

