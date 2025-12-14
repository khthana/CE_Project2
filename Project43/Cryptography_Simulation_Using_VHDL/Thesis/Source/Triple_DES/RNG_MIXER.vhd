LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.ALL;

ENTITY RNG_MIXER IS
   PORT (
      Clk			: IN	std_logic;
      Salt			: IN	std_logic_vector(7 DOWNTO 0);
      Secret_Salt		: IN	std_logic_vector (0 TO 63);
      Mixed_OUT			: OUT	std_logic_vector (63 DOWNTO 0);
      Dont_Change		: OUT	std_logic
   );
END RNG_MIXER;

ARCHITECTURE RNG_MIXER_arch OF RNG_MIXER IS

SIGNAL preState : std_logic_vector(1 DOWNTO 0);
SIGNAL E48	: std_logic_vector(47 DOWNTO 0);
SIGNAL DynScramble_L, DynScramble_R	: std_logic_vector(31 DOWNTO 0);

BEGIN

PROCESS(Clk)
BEGIN
IF Clk'EVENT AND Clk = '1' THEN
CASE preState IS
WHEN "00" => --Start =>
   preState <= "01";

WHEN "01" => --Scramble_R =>
   preState <= "10";

WHEN "10" => --Scramble_L =>
   preState <= "11";

WHEN "11" =>
   preState <= "01";

WHEN OTHERS =>
   preState <= "00";

END CASE;
END IF;
END PROCESS;

DynScramble_L <= Secret_Salt(13) & Secret_Salt(16) & Secret_Salt(10) & Salt(0) & Secret_Salt(0)  & Secret_Salt(4)  & Secret_Salt(2)  & Salt(6) &
		 Secret_Salt(14) & Secret_Salt(5)  & Secret_Salt(20) & Salt(1)  & Secret_Salt(22) & Secret_Salt(18) & Secret_Salt(11) & Salt(4) &
		 Secret_Salt(25) & Secret_Salt(7)  & Secret_Salt(15) & Salt(5) & Secret_Salt(40) & Secret_Salt(51) & Secret_Salt(44) & Salt(3) &
		 Secret_Salt(47) & Secret_Salt(44) & Secret_Salt(49) & Salt(7) & Secret_Salt(46) & Secret_Salt(42) & Secret_Salt(50) & Salt(2) WHEN preState = "00"
	    ELSE DynScramble_R + E48(39 DOWNTO 8) + Salt WHEN preState = "10"
	    ELSE DynScramble_L;

DynScramble_R <= DynScramble_L(12 DOWNTO 0) & DynScramble_L(19 DOWNTO 13) & DynScramble_L(31 DOWNTO 20) WHEN preState = "01"
	    ELSE DynScramble_L XOR Secret_Salt(18 TO 49) WHEN preState = "11"
	    ELSE DynScramble_R;

Dont_Change <= '1' WHEN preState(1) = '1'
	ELSE '0';

E48  <= DynScramble_L(31) & DynScramble_L(0)  & DynScramble_L(1)  & DynScramble_L(2)  & DynScramble_L(3)  & DynScramble_L(4) &
	DynScramble_L(3)  & DynScramble_L(4)  & DynScramble_L(5)  & DynScramble_L(6)  & DynScramble_L(7)  & DynScramble_L(8) &
	DynScramble_L(7)  & DynScramble_L(8)  & DynScramble_L(9)  & DynScramble_L(10) & DynScramble_L(11) & DynScramble_L(12) &
	DynScramble_L(11) & DynScramble_L(12) & DynScramble_L(13) & DynScramble_L(14) & DynScramble_L(15) & DynScramble_L(16) &
	DynScramble_L(15) & DynScramble_L(16) & DynScramble_L(17) & DynScramble_L(18) & DynScramble_L(19) & DynScramble_L(20) &
	DynScramble_L(19) & DynScramble_L(20) & DynScramble_L(21) & DynScramble_L(22) & DynScramble_L(23) & DynScramble_L(24) &
	DynScramble_L(23) & DynScramble_L(24) & DynScramble_L(25) & DynScramble_L(26) & DynScramble_L(27) & DynScramble_L(28) &
	DynScramble_L(27) & DynScramble_L(28) & DynScramble_L(29) & DynScramble_L(30) & DynScramble_L(31) & DynScramble_L(0) WHEN preState = "01"
	ELSE E48;

Mixed_OUT <= (DynScramble_L + DynScramble_R) & DynScramble_R(27 DOWNTO 12) & DynScramble_L(16 DOWNTO 1);

END RNG_MIXER_arch;