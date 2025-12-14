LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY MD5_FF IS
   PORT (
	Clk			: IN	std_logic;
	FF_ON			: IN	std_logic;
	M_Block			: IN	std_logic_vector(0 TO 511);
	RegA			: IN	std_logic_vector(31 DOWNTO 0);
	RegB			: IN	std_logic_vector(31 DOWNTO 0);
	RegC			: IN	std_logic_vector(31 DOWNTO 0);
	RegD			: IN	std_logic_vector(31 DOWNTO 0);
	RegAA			: OUT	std_logic_vector(31 DOWNTO 0);
	RegBB			: OUT	std_logic_vector(31 DOWNTO 0);
	RegCC			: OUT	std_logic_vector(31 DOWNTO 0);
	RegDD			: OUT	std_logic_vector(31 DOWNTO 0);
	FF_Completed		: OUT	std_logic -- to MD5_GG
   );
END MD5_FF;

ARCHITECTURE MD5_FF_arch OF MD5_FF IS

SUBTYPE bound16 IS NATURAL RANGE 0 TO 16;
SIGNAL i	: bound16;

SUBTYPE bound4 IS NATURAL RANGE 0 TO 4;
SIGNAL s	: bound4;

TYPE Ti IS ARRAY(0 TO 15) OF std_logic_vector(31 DOWNTO 0);
CONSTANT Ti_F : Ti := (
			"11010111011010101010010001111000",	"11101000110001111011011101010110",
			"00100100001000000111000011011011",	"11000001101111011100111011101110",
			"11110101011111000000111110101111",	"01000111100001111100011000101010",
			"10101000001100000100011000010011",	"11111101010001101001010100000001",
			"01101001100000001001100011011000",	"10001011010001001111011110101111",
			"11111111111111110101101110110001",	"10001001010111001101011110111110",
			"01101011100100000001000100100010",	"11111101100110000111000110010011",
			"10100110011110010100001110001110",	"01001001101101000000100000100001"
		      );

SIGNAL Xj	: Ti;

TYPE REG32_ABCD IS ARRAY(0 TO 3) OF std_logic_vector(31 DOWNTO 0);

SIGNAL REG			: REG32_ABCD;
SIGNAL A, B, C, D		: std_logic_vector(31 DOWNTO 0);
SIGNAL ffState			: std_logic_vector(2 DOWNTO 0);

SIGNAL F_BCD, ADD_G1, Shift_RSLT : std_logic_vector(31 DOWNTO 0);
BEGIN

Xj(0)  <= M_Block(0 TO 31);
Xj(1)  <= M_Block(32 TO 63);
Xj(2)  <= M_Block(64 TO 95);
Xj(3)  <= M_Block(96 TO 127);
Xj(4)  <= M_Block(128 TO 159);
Xj(5)  <= M_Block(160 TO 191);
Xj(6)  <= M_Block(192 TO 223);
Xj(7)  <= M_Block(224 TO 255);
Xj(8)  <= M_Block(256 TO 287);
Xj(9)  <= M_Block(288 TO 319);
Xj(10) <= M_Block(320 TO 351);
Xj(11) <= M_Block(352 TO 383);
Xj(12) <= M_Block(384 TO 415);
Xj(13) <= M_Block(416 TO 447);
Xj(14) <= M_Block(448 TO 479);
Xj(15) <= M_Block(480 TO 511);


REG(0)    <= RegA WHEN ffState = "001" --INITIALIZE_REGISTER
	ELSE D WHEN ffState = "100" --Write_Result_to_REG
	ELSE REG(0);
REG(1) <= RegB WHEN ffState = "001" --INITIALIZE_REGISTER
	ELSE A WHEN ffState = "100" --Write_Result_to_REG
	ELSE REG(1);
REG(2) <= RegC WHEN ffState = "001" --INITIALIZE_REGISTER
	ELSE B WHEN ffState = "100" --Write_Result_to_REG
	ELSE REG(2);
REG(3) <= RegD WHEN ffState = "001" --INITIALIZE_REGISTER
	ELSE C WHEN ffState = "100" --Write_Result_to_REG
	ELSE REG(3);

F_BCD <= (REG(1) AND REG(2)) OR (NOT REG(1) AND REG(3));

ADD_G1 <= REG(0) + F_BCD + Xj(i) + Ti_F(i) WHEN i /= 16
	ELSE ADD_G1;

Shift_RSLT <= ADD_G1(24 DOWNTO 0) & ADD_G1(31 DOWNTO 25) WHEN s = 0  -- 01111010000010001101011001111100
	 ELSE ADD_G1(19 DOWNTO 0) & ADD_G1(31 DOWNTO 20) WHEN s = 1
	 ELSE ADD_G1(14 DOWNTO 0) & ADD_G1(31 DOWNTO 15) WHEN s = 2
	 ELSE ADD_G1(9 DOWNTO 0)  & ADD_G1(31 DOWNTO 10) WHEN s = 3
	 ELSE Shift_RSLT;	-- 01000110001001011111010101100111

A <= REG(0) WHEN ffState = "010" --READ_REGISTER
ELSE REG(1) + Shift_RSLT WHEN ffState = "011" --ADDITION_2
ELSE A;

B <= REG(1) WHEN ffState = "010" --READ_REGISTER
ELSE B;

C <= REG(2) WHEN ffState = "010" --READ_REGISTER
ELSE C;

D <= REG(3) WHEN ffState = "010" --READ_REGISTER
ELSE D;

PROCESS(Clk, ffState)
BEGIN
IF FF_ON = '0' THEN
   ffState <= "000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE ffState IS
WHEN "000" => --IDLE =>
   IF FF_ON = '1' THEN
      ffState <= "001"; --INITIALIZE_REGISTER;
   END IF;

WHEN "001" => --INITIALIZE_REGISTER =>
   ffState <= "010"; --READ_REGISTER;

WHEN "010" => --READ_REGISTER => -- A <= REG(0), B <= REG(1), C <= REG(2), D <= REG(3)
   ffState <= "011"; --DET_F_BCD;

WHEN "011" => --ADDITION_2 =>
   ffState <= "100"; --Write_Result_to_REG;

WHEN "100" => --Write_Result_to_REG => --save result into register REG(0) <= D, REG(1) <= A, REG(2) <= B, REG(3) <= C
   ffState <= "101"; --INCREMENT_i;

WHEN "101" => --INCREMENT_i =>
   ffState <= "110"; --CHECK_i;

WHEN "110" => --CHECK_i =>
   IF i = 16 THEN
      ffState <= "111"; --FF_Completed;
   ELSE
      ffState <= "010"; --READ_REGISTER;
   END IF;

WHEN "111" => --FF_Completed =>
   ffState <= "111"; --FF_Completed;

WHEN OTHERS =>
   ffState <= "000";

END CASE;
END IF;
END PROCESS;

PROCESS(Clk, ffState)
BEGIN
IF FF_ON = '0' THEN
   i <= 0;
   s <= 0;
ELSIF Clk'EVENT AND Clk = '1' THEN
   IF ffState = "101" THEN
      i <= i + 1;
      s <= s + 1;
   ELSIF s = 4 THEN
      s <= 0;
   END IF;
END IF;
END PROCESS;

RegAA <= REG(0);
REGBB <= REG(1);
REGCC <= REG(2);
REGDD <= REG(3);

FF_Completed <= '1' WHEN ffState = "111"
	ELSE '0';
END MD5_FF_arch;