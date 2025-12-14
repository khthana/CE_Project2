LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY MD5_CTRL IS
   PORT( 
	Clk			: IN	std_logic;
	MD5_ON			: IN	std_logic;
	RegAA			: IN	std_logic_vector(31 DOWNTO 0);
	RegBB			: IN	std_logic_vector(31 DOWNTO 0);
	RegCC			: IN	std_logic_vector(31 DOWNTO 0);
	RegDD			: IN	std_logic_vector(31 DOWNTO 0);
	II_Completed		: IN	std_logic;	-------------------
	LAST_Block		: IN	std_logic;	--		  |
	DXtIN			: IN	std_logic_vector(0 TO 511); --	  |
	DXtIN_Completed		: IN	std_logic; -- from HASH_IMPORT	  |==> calculate from FF until II_Completed
	DXtOUT_Completed	: IN	std_logic; -- from HASH_EXPORT	  |
	DXtIN_REQ		: OUT	std_logic; -- to HASH_IMPORT	  |
	DXtOUT_ON		: OUT	std_logic;	--		  |
	FF_ON			: OUT	std_logic;	-------------------
	M_Block			: OUT	std_logic_vector(0 TO 511);
	RegA			: OUT	std_logic_vector(31 DOWNTO 0);
	RegB			: OUT	std_logic_vector(31 DOWNTO 0);
	RegC			: OUT	std_logic_vector(31 DOWNTO 0);
	RegD			: OUT	std_logic_vector(31 DOWNTO 0);
	End_Operate		: OUT	std_logic;
	MD5_RUNNING		: OUT	std_logic
   );
END MD5_CTRL;


LIBRARY CryptoChip;

ARCHITECTURE MD5_CTRL_arch OF MD5_CTRL IS

SIGNAL ctrlState		: std_logic_vector(2 DOWNTO 0);

TYPE REG32_ABCD IS ARRAY(0 TO 3) OF std_logic_vector(31 DOWNTO 0);

SIGNAL REG			: REG32_ABCD;
SIGNAL A, B, C, D		: std_logic_vector(31 DOWNTO 0);

SIGNAL MSG			: std_logic_vector(0 TO 511);
BEGIN

REG(0) <= "01100111010001010010001100000001" WHEN ctrlState = "000" --IDLE 1234567 / 67452301
	ELSE A + RegAA WHEN ctrlState = "011" --ADD_RESULT A56007F4
	ELSE REG(0);
REG(1) <= "11101111110011011010101110001001" WHEN ctrlState = "000" --IDLE 89ABCDEF / efcdab89
	ELSE B + RegBB WHEN ctrlState = "011" --ADD_RESULT
	ELSE REG(1);
REG(2) <= "10011000101110101101110011111110" WHEN ctrlState = "000" --IDLE FEDCBA98 / 98badcfe
	ELSE C + RegCC WHEN ctrlState = "011" --ADD_RESULT
	ELSE REG(2);
REG(3) <= "00010000001100100101010001110110" WHEN ctrlState = "000" --IDLE 76543210 / 10325476
	ELSE D + RegDD WHEN ctrlState = "011" --ADD_RESULT
	ELSE REG(3);

A <= REG(0) WHEN ctrlState = "001" --READ_M_Block
	ELSE A;
B <= REG(1) WHEN ctrlState = "001" --READ_M_Block
	ELSE B;
C <= REG(2) WHEN ctrlState = "001" --READ_M_Block
	ELSE C;
D <= REG(3) WHEN ctrlState = "001" --READ_M_Block
	ELSE D;

FF_ON <= '1' WHEN ctrlState = "010"
	ELSE '0';

MSG <= DXtIN WHEN DXtIN_Completed = '1'
	ELSE MSG;

M_Block <= MSG;

RegA <= REG(0) WHEN ctrlState >= "100"
	ELSE A;
RegB <= REG(1) WHEN ctrlState >= "100"
	ELSE B;
RegC <= REG(2) WHEN ctrlState >= "100"
	ELSE C;
RegD <= REG(3) WHEN ctrlState >= "100"
	ELSE D;

PROCESS(clk, MD5_ON, ctrlState)
BEGIN
IF MD5_ON = '0' THEN
   ctrlState <= "000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE ctrlState IS
WHEN "000" => --IDLE =>
   IF MD5_ON = '1' THEN
      ctrlState <= "001"; --READ_M_Block;
   END IF;

WHEN "001" => --READ_M_Block =>
   IF DXtIN_Completed = '1' THEN
      ctrlState <= "010"; --Start_MD5_FF;
   END IF;

WHEN "010" => --Start_MD5_FF =>
   IF II_Completed = '1' THEN
      ctrlState <= "011"; --ADD_RESULT;
   END IF;

WHEN "011" => --ADD_RESULT =>
   IF LAST_Block = '0' THEN
      ctrlState <= "001"; --READ_M_BLOCK;
   ELSE
      ctrlState <= "100"; --WRITE_OUTPUT;
   END IF;

WHEN "100" => --WRITE_OUTPUT =>
   IF DXtOUT_Completed = '1' THEN
      ctrlState <= "101"; --End_Operation;
   END IF;

WHEN "101" => --End_Operation =>
   ctrlState <= "101"; --End_Operation;

WHEN OTHERS =>
   ctrlState <= "000";

END CASE;
END IF;
END PROCESS;

End_Operate <= '1' WHEN ctrlState = "101" --End_Operation
	ELSE '0';

MD5_RUNNING <= MD5_ON;

DXtIN_REQ <= '1' WHEN ctrlState = "001"
	ELSE '0';

DXtOUT_ON <= '1' WHEN ctrlState = "100"
	ELSE '0';

END MD5_CTRL_arch;