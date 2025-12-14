LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.ALL;

ENTITY MD5_II IS
   PORT (
	Clk			: IN	std_logic;
	II_ON			: IN	std_logic;
	M_Block			: IN	std_logic_vector(0 TO 511);
	RegA			: IN	std_logic_vector(31 DOWNTO 0);
	RegB			: IN	std_logic_vector(31 DOWNTO 0);
	RegC			: IN	std_logic_vector(31 DOWNTO 0);
	RegD			: IN	std_logic_vector(31 DOWNTO 0);
	RegAA			: OUT	std_logic_vector(31 DOWNTO 0);
	RegBB			: OUT	std_logic_vector(31 DOWNTO 0);
	RegCC			: OUT	std_logic_vector(31 DOWNTO 0);
	RegDD			: OUT	std_logic_vector(31 DOWNTO 0);
	II_Completed		: OUT	std_logic -- to MD5_CTRL
   );
END MD5_II;

ARCHITECTURE MD5_II_arch OF MD5_II IS

SIGNAL k_Counter : unsigned(3 DOWNTO 0);

SUBTYPE bound16 IS NATURAL RANGE 0 TO 16;
SIGNAL i, k	: bound16;

SUBTYPE bound4 IS NATURAL RANGE 0 TO 4;
SIGNAL s	: bound4;

TYPE Ti IS ARRAY(0 TO 15) OF std_logic_vector(31 DOWNTO 0);
CONSTANT Ti_F : Ti := (
			"11110100001010010010001001000100",	"01000011001010101111111110010111",
			"10101011100101000010001110100111",	"11111100100100111010000000111001",
			"01100101010110110101100111000011",	"10001111000011001100110010010010",
			"11111111111011111111010001111101",	"10000101100001000101110111010001",
			"01101111101010000111111001001111",	"11111110001011001110011011100000",
			"10100011000000010100001100010100",	"01001110000010000001000110100001",
			"11110111010100110111111010000010",	"10111101001110101111001000110101",
			"00101010110101111101001010111011",	"11101011100001101101001110010001"
		      );

SIGNAL Xj	: Ti;

TYPE REG32_ABCD IS ARRAY(0 TO 3) OF std_logic_vector(31 DOWNTO 0);

SIGNAL REG			: REG32_ABCD;
SIGNAL A, B, C, D		: std_logic_vector(31 DOWNTO 0);
SIGNAL iiState			: std_logic_vector(2 DOWNTO 0);

SIGNAL I_BCD, ADD_G1, Shift_RSLT : std_logic_vector(31 DOWNTO 0);
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

REG(0)    <= RegA WHEN iiState = "001" --INITIALIZE_REGISTER
	ELSE D WHEN iiState = "100" --Write_Result_to_REG
	ELSE REG(0);
REG(1) <= RegB WHEN iiState = "001" --INITIALIZE_REGISTER
	ELSE A WHEN iiState = "100" --Write_Result_to_REG
	ELSE REG(1);
REG(2) <= RegC WHEN iiState = "001" --INITIALIZE_REGISTER
	ELSE B WHEN iiState = "100" --Write_Result_to_REG
	ELSE REG(2);
REG(3) <= RegD WHEN iiState = "001" --INITIALIZE_REGISTER
	ELSE C WHEN iiState = "100" --Write_Result_to_REG
	ELSE REG(3);

I_BCD <= REG(2) XOR (REG(1) OR NOT REG(3));

k <= to_integer(k_Counter);

ADD_G1 <= REG(0) + I_BCD + Xj(k) + Ti_F(i) WHEN i /= 16
	ELSE ADD_G1;

Shift_RSLT <= ADD_G1(25 DOWNTO 0) & ADD_G1(31 DOWNTO 26) WHEN s = 0
	 ELSE ADD_G1(21 DOWNTO 0) & ADD_G1(31 DOWNTO 22) WHEN s = 1
	 ELSE ADD_G1(16 DOWNTO 0) & ADD_G1(31 DOWNTO 17) WHEN s = 2
	 ELSE ADD_G1(10 DOWNTO 0)  & ADD_G1(31 DOWNTO 11) WHEN s = 3
	 ELSE Shift_RSLT;

A <= REG(0) WHEN iiState = "010" --READ_REGISTER
ELSE REG(1) + Shift_RSLT WHEN iiState = "011" --ADDITION_2
ELSE A;

B <= REG(1) WHEN iiState = "010" --READ_REGISTER
ELSE B;

C <= REG(2) WHEN iiState = "010" --READ_REGISTER
ELSE C;

D <= REG(3) WHEN iiState = "010" --READ_REGISTER
ELSE D;

PROCESS(Clk, iiState)
BEGIN
IF II_ON = '0' THEN
   iiState <= "000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE iiState IS
WHEN "000" => --IDLE =>
   IF II_ON = '1' THEN
      iiState <= "001"; --INITIALIZE_REGISTER;
   END IF;

WHEN "001" => --INITIALIZE_REGISTER =>
   iiState <= "010"; --READ_REGISTER;

WHEN "010" => --READ_REGISTER => -- A <= REG(0), B <= REG(1), C <= REG(2), D <= REG(3)
   iiState <= "011"; --DET_I_BCD;

WHEN "011" => --ADDITION_2 =>
   iiState <= "100"; --Write_Result_to_REG;

WHEN "100" => --Write_Result_to_REG => --save result into register REG(0) <= D, REG(1) <= A, REG(2) <= B, REG(3) <= C
   iiState <= "101"; --INCREMENT_i;

WHEN "101" => --INCREMENT_i =>
   iiState <= "110"; --CHECK_i;

WHEN "110" => --CHECK_i =>
   IF i = 16 THEN
      iiState <= "111"; --ii_Completed;
   ELSE
      iiState <= "010"; --READ_REGISTER;
   END IF;

WHEN "111" => --ii_Completed =>
   iiState <= "111"; --ii_Completed;

WHEN OTHERS =>
   iiState <= "000";

END CASE;
END IF;
END PROCESS;

PROCESS(Clk, iiState)
BEGIN
IF II_ON = '0' THEN
   i <= 0;
   s <= 0;
   k_Counter <= "0000";
ELSIF Clk'EVENT AND Clk = '1' THEN
   IF iiState = "101" THEN
      i <= i + 1;
      s <= s + 1;
   ELSIF iiState = "110" THEN
      k_Counter <= k_Counter + "0111";
   ELSIF s = 4 THEN
      s <= 0;
   END IF;
END IF;
END PROCESS;

RegAA <= REG(0);
REGBB <= REG(1);
REGCC <= REG(2);
REGDD <= REG(3);

II_Completed <= '1' WHEN iiState = "111"
	ELSE '0';

END MD5_II_arch;