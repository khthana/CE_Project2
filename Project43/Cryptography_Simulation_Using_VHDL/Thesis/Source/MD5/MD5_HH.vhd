LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.ALL;

ENTITY MD5_HH IS
   PORT (
	Clk			: IN	std_logic;
	HH_ON			: IN	std_logic;
	M_Block			: IN	std_logic_vector(0 TO 511);
	RegA			: IN	std_logic_vector(31 DOWNTO 0);
	RegB			: IN	std_logic_vector(31 DOWNTO 0);
	RegC			: IN	std_logic_vector(31 DOWNTO 0);
	RegD			: IN	std_logic_vector(31 DOWNTO 0);
	RegAA			: OUT	std_logic_vector(31 DOWNTO 0);
	RegBB			: OUT	std_logic_vector(31 DOWNTO 0);
	RegCC			: OUT	std_logic_vector(31 DOWNTO 0);
	RegDD			: OUT	std_logic_vector(31 DOWNTO 0);
	HH_Completed		: OUT	std_logic -- to MD5_II
   );
END MD5_HH;

ARCHITECTURE MD5_HH_arch OF MD5_HH IS

SIGNAL k_Counter : unsigned(3 DOWNTO 0);

SUBTYPE bound16 IS NATURAL RANGE 0 TO 16;
SIGNAL i, k	: bound16;

SUBTYPE bound4 IS NATURAL RANGE 0 TO 4;
SIGNAL s	: bound4;

TYPE Ti IS ARRAY(0 TO 15) OF std_logic_vector(31 DOWNTO 0);
CONSTANT Ti_F : Ti := (
			"11111111111110100011100101000010",	"10000111011100011111011010000001",
			"01101101100111010110000100100010",	"11111101111001010011100000001100",
			"10100100101111101110101001000100",	"01001011110111101100111110101001",
			"11110110101110110100101101100000",	"10111110101111111011110001110000",
			"00101000100110110111111011000110",	"11101010101000010010011111111010",
			"11010100111011110011000010000101",	"00000100100010000001110100000101",
			"11011001110101001101000000111001",	"11100110110110111001100111100101",
			"00011111101000100111110011111000",	"11000100101011000101011001100101"
		      );

SIGNAL Xj	: Ti;

TYPE REG32_ABCD IS ARRAY(0 TO 3) OF std_logic_vector(31 DOWNTO 0);

SIGNAL REG			: REG32_ABCD;
SIGNAL A, B, C, D		: std_logic_vector(31 DOWNTO 0);
SIGNAL hhState			: std_logic_vector(2 DOWNTO 0);

SIGNAL H_BCD, ADD_G1, Shift_RSLT : std_logic_vector(31 DOWNTO 0);
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


REG(0)    <= RegA WHEN hhState = "001" --INITIALIZE_REGISTER
	ELSE D WHEN hhState = "100" --Write_Result_to_REG
	ELSE REG(0);
REG(1) <= RegB WHEN hhState = "001" --INITIALIZE_REGISTER
	ELSE A WHEN hhState = "100" --Write_Result_to_REG
	ELSE REG(1);
REG(2) <= RegC WHEN hhState = "001" --INITIALIZE_REGISTER
	ELSE B WHEN hhState = "100" --Write_Result_to_REG
	ELSE REG(2);
REG(3) <= RegD WHEN hhState = "001" --INITIALIZE_REGISTER
	ELSE C WHEN hhState = "100" --Write_Result_to_REG
	ELSE REG(3);

H_BCD <= REG(1) XOR REG(2) XOR REG(3);

k <= to_integer(k_Counter);

ADD_G1 <= REG(0) + H_BCD + Xj(k) + Ti_F(i) WHEN i /= 16
	ELSE ADD_G1;

Shift_RSLT <= ADD_G1(27 DOWNTO 0) & ADD_G1(31 DOWNTO 28) WHEN s = 0
	 ELSE ADD_G1(20 DOWNTO 0) & ADD_G1(31 DOWNTO 21) WHEN s = 1
	 ELSE ADD_G1(15 DOWNTO 0) & ADD_G1(31 DOWNTO 16) WHEN s = 2
	 ELSE ADD_G1(8 DOWNTO 0)  & ADD_G1(31 DOWNTO 9) WHEN s = 3
	 ELSE Shift_RSLT;

A <= REG(0) WHEN hhState = "010" --READ_REGISTER
ELSE REG(1) + Shift_RSLT WHEN hhState = "011" --ADDITION_2
ELSE A;

B <= REG(1) WHEN hhState = "010" --READ_REGISTER
ELSE B;

C <= REG(2) WHEN hhState = "010" --READ_REGISTER
ELSE C;

D <= REG(3) WHEN hhState = "010" --READ_REGISTER
ELSE D;

PROCESS(Clk, hhState)
BEGIN
IF HH_ON = '0' THEN
   hhState <= "000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE hhState IS
WHEN "000" => --IDLE =>
   IF HH_ON = '1' THEN
      hhState <= "001"; --INITIALIZE_REGISTER;
   END IF;

WHEN "001" => --INITIALIZE_REGISTER =>
   hhState <= "010"; --READ_REGISTER;

WHEN "010" => --READ_REGISTER => -- A <= REG(0), B <= REG(1), C <= REG(2), D <= REG(3)
   hhState <= "011"; --DET_H_BCD;

WHEN "011" => --ADDITION_2 =>
   hhState <= "100"; --Write_Result_to_REG;

WHEN "100" => --Write_Result_to_REG => --save result into register REG(0) <= D, REG(1) <= A, REG(2) <= B, REG(3) <= C
   hhState <= "101"; --INCREMENT_i;

WHEN "101" => --INCREMENT_i =>
   hhState <= "110"; --CHECK_i;

WHEN "110" => --CHECK_i =>
   IF i = 16 THEN
      hhState <= "111"; --hh_Completed;
   ELSE
      hhState <= "010"; --READ_REGISTER;
   END IF;

WHEN "111" => --hh_Completed =>
   hhState <= "111"; --hh_Completed;

WHEN OTHERS =>
   hhState <= "000";

END CASE;
END IF;
END PROCESS;

PROCESS(Clk, hhState)
BEGIN
IF hh_ON = '0' THEN
   i <= 0;
   s <= 0;
   k_Counter <= "0101";
ELSIF Clk'EVENT AND Clk = '1' THEN
   IF hhState = "101" THEN
      i <= i + 1;
      s <= s + 1;
   ELSIF hhState = "110" THEN
      k_Counter <= k_Counter + "0011";
   ELSIF s = 4 THEN
      s <= 0;
   END IF;
END IF;
END PROCESS;

RegAA <= REG(0);
REGBB <= REG(1);
REGCC <= REG(2);
REGDD <= REG(3);

HH_Completed <= '1' WHEN hhState = "111"
	ELSE '0';

END MD5_HH_arch;