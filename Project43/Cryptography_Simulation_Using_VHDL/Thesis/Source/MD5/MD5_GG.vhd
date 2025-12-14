LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.ALL;

ENTITY MD5_GG IS
   PORT (
	Clk			: IN	std_logic;
	GG_ON			: IN	std_logic;
	M_Block			: IN	std_logic_vector(0 TO 511);
	RegA			: IN	std_logic_vector(31 DOWNTO 0);
	RegB			: IN	std_logic_vector(31 DOWNTO 0);
	RegC			: IN	std_logic_vector(31 DOWNTO 0);
	RegD			: IN	std_logic_vector(31 DOWNTO 0);
	RegAA			: OUT	std_logic_vector(31 DOWNTO 0);
	RegBB			: OUT	std_logic_vector(31 DOWNTO 0);
	RegCC			: OUT	std_logic_vector(31 DOWNTO 0);
	RegDD			: OUT	std_logic_vector(31 DOWNTO 0);
	GG_Completed		: OUT	std_logic -- to MD5_HH
   );
END MD5_GG;

ARCHITECTURE MD5_GG_arch OF MD5_GG IS

SIGNAL k_Counter : unsigned(3 DOWNTO 0);

SUBTYPE bound16 IS NATURAL RANGE 0 TO 16;
SIGNAL i, k	: bound16;

SUBTYPE bound4 IS NATURAL RANGE 0 TO 4;
SIGNAL s	: bound4;

TYPE Ti IS ARRAY(0 TO 15) OF std_logic_vector(31 DOWNTO 0);
CONSTANT Ti_F : Ti := (
			"11110110000111100010010101100010",	"11000000010000001011001101000000",
			"00100110010111100101101001010001",	"11101001101101101100011110101010",
			"11010110001011110001000001011101",	"00000010010001000001010001010011",
			"11011000101000011110011010000001",	"11100111110100111111101111001000",
			"00100001111000011100110111100110",	"11000011001101110000011111010110",
			"11110100110101010000110110000111",	"01000101010110100001010011101101",
			"10101001111000111110100100000101",	"11111100111011111010001111111000",
			"01100111011011110000001011011001",	"10001101001010100100110010001010"
		      );

SIGNAL Xj	: Ti;

TYPE REG32_ABCD IS ARRAY(0 TO 3) OF std_logic_vector(31 DOWNTO 0);

SIGNAL REG			: REG32_ABCD;
SIGNAL A, B, C, D		: std_logic_vector(31 DOWNTO 0);
SIGNAL ggState			: std_logic_vector(2 DOWNTO 0);

SIGNAL G_BCD, ADD_G1, Shift_RSLT : std_logic_vector(31 DOWNTO 0);
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


REG(0)    <= RegA WHEN ggState = "001" --INITIALIZE_REGISTER
	ELSE D WHEN ggState = "100" --Write_Result_to_REG
	ELSE REG(0);
REG(1) <= RegB WHEN ggState = "001" --INITIALIZE_REGISTER
	ELSE A WHEN ggState = "100" --Write_Result_to_REG
	ELSE REG(1);
REG(2) <= RegC WHEN ggState = "001" --INITIALIZE_REGISTER
	ELSE B WHEN ggState = "100" --Write_Result_to_REG
	ELSE REG(2);
REG(3) <= RegD WHEN ggState = "001" --INITIALIZE_REGISTER
	ELSE C WHEN ggState = "100" --Write_Result_to_REG
	ELSE REG(3);

G_BCD <= (REG(1) AND REG(3)) OR (REG(2) AND NOT REG(3));

k <= to_integer(k_Counter);

ADD_G1 <= REG(0) + G_BCD + Xj(k) + Ti_F(i) WHEN i /= 16
	ELSE ADD_G1;

Shift_RSLT <= ADD_G1(26 DOWNTO 0) & ADD_G1(31 DOWNTO 27) WHEN s = 0
	 ELSE ADD_G1(22 DOWNTO 0) & ADD_G1(31 DOWNTO 23) WHEN s = 1
	 ELSE ADD_G1(17 DOWNTO 0) & ADD_G1(31 DOWNTO 18) WHEN s = 2
	 ELSE ADD_G1(11 DOWNTO 0) & ADD_G1(31 DOWNTO 12) WHEN s = 3
	 ELSE Shift_RSLT;

A <= REG(0) WHEN ggState = "010" --READ_REGISTER
ELSE REG(1) + Shift_RSLT WHEN ggState = "011" --ADDITION_2
ELSE A;

B <= REG(1) WHEN ggState = "010" --READ_REGISTER
ELSE B;

C <= REG(2) WHEN ggState = "010" --READ_REGISTER
ELSE C;

D <= REG(3) WHEN ggState = "010" --READ_REGISTER
ELSE D;

PROCESS(Clk, ggState)
BEGIN
IF GG_ON = '0' THEN
   ggState <= "000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE ggState IS
WHEN "000" => --IDLE =>
   IF GG_ON = '1' THEN
      ggState <= "001"; --INITIALIZE_REGISTER;
   END IF;

WHEN "001" => --INITIALIZE_REGISTER =>
   ggState <= "010"; --READ_REGISTER;

WHEN "010" => --READ_REGISTER => -- A <= REG(0), B <= REG(1), C <= REG(2), D <= REG(3)
   ggState <= "011"; --DET_G_BCD;

WHEN "011" => --ADDITION_2 =>
   ggState <= "100"; --Write_Result_to_REG;

WHEN "100" => --Write_Result_to_REG => --save result into register REG(0) <= D, REG(1) <= A, REG(2) <= B, REG(3) <= C
   ggState <= "101"; --INCREMENT_i;

WHEN "101" => --INCREMENT_i =>
   ggState <= "110"; --CHECK_i;

WHEN "110" => --CHECK_i =>
   IF i = 16 THEN
      ggState <= "111"; --gg_Completed;
   ELSE
      ggState <= "010"; --READ_REGISTER;
   END IF;

WHEN "111" => --gg_Completed =>
   ggState <= "111"; --gg_Completed;

WHEN OTHERS =>
   ggState <= "000";

END CASE;
END IF;
END PROCESS;

PROCESS(Clk, ggState)
BEGIN
IF GG_ON = '0' THEN
   i <= 0;
   s <= 0;
   k_Counter <= "0001";
ELSIF Clk'EVENT AND Clk = '1' THEN
   IF ggState = "101" THEN
      i <= i + 1;
      s <= s + 1;
   ELSIF ggState = "110" THEN
      k_Counter <= k_Counter + "0101";
   ELSIF s = 4 THEN
      s <= 0;
   END IF;
END IF;
END PROCESS;

RegAA <= REG(0);
REGBB <= REG(1);
REGCC <= REG(2);
REGDD <= REG(3);

GG_Completed <= '1' WHEN ggState = "111"
	ELSE '0';

END MD5_GG_arch;