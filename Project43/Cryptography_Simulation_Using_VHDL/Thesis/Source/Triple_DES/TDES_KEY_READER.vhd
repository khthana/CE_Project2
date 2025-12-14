LIBRARY ieee ; -- 97.2 MHz
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY TDES_KEY_READER IS
   PORT (
	Clk			: IN std_logic;
	KIN_ON			: IN std_logic;
	Byte_IN			: IN std_logic_vector(7 DOWNTO 0);
	READ_Byte_ENABLE	: IN std_logic;
	READ_Key		: OUT std_logic;
	Key1			: OUT std_logic_vector(0 TO 63);
	Key2			: OUT std_logic_vector(0 TO 63);
	Key3			: OUT std_logic_vector(0 TO 63);
	Keys_Completed		: OUT std_logic
   );
END TDES_KEY_READER;

ARCHITECTURE TDES_KEY_READER_arch OF TDES_KEY_READER IS

--TYPE stateREAD_KEY IS (IDLE, Check_READ_ENABLE, READ_KEY_req, Collect_KEY, KEY_VALID, Check_keyCounter, KEYS_AVAILABLE);
SIGNAL keyState : std_logic_vector(2 DOWNTO 0);--stateREAD_KEY;  doing like this it'll have much high performance!!

SIGNAL keyCounter, tmpCounter : std_logic_vector(4 DOWNTO 0); -- "11000"
SIGNAL Keys_buff  : std_logic_vector(0 TO 191);

BEGIN
-- ==================================================================================== --
--				READ KEY STATE MACHINE					--
-- ==================================================================================== --
Keys_Completed <= '1' WHEN keyState = "110" --KEYS_AVAILABLE
	 ELSE '0';
READ_Key <= '1' WHEN keyState = "010" OR keyState = "011" --READ_Key_req
	ELSE '0';-- WHEN keyState = "100"
	--ELSE 'Z';

Keys_buff(0 TO 7)	  <= Byte_IN WHEN (keyState = "011" AND keyCounter = "11000")
 		ELSE Keys_buff(0 TO 7);
Keys_buff(8 TO 15)	  <= Byte_IN WHEN (keyState = "011" AND keyCounter = "10111")
		ELSE Keys_buff(8 TO 15);
Keys_buff(16 TO 23)  <= Byte_IN WHEN (keyState = "011" AND keyCounter = "10110")
		ELSE Keys_buff(16 TO 23);
Keys_buff(24 TO 31)  <= Byte_IN WHEN (keyState = "011" AND keyCounter = "10101")
		ELSE Keys_buff(24 TO 31);
Keys_buff(32 TO 39)  <= Byte_IN WHEN (keyState = "011" AND keyCounter = "10100")
		ELSE Keys_buff(32 TO 39);
Keys_buff(40 TO 47)  <= Byte_IN WHEN (keyState = "011" AND keyCounter = "10011")
		ELSE Keys_buff(40 TO 47);
Keys_buff(48 TO 55)  <= Byte_IN WHEN (keyState = "011" AND keyCounter = "10010")
		ELSE Keys_buff(48 TO 55);
Keys_buff(56 TO 63)  <= Byte_IN WHEN (keyState = "011" AND keyCounter = "10001")
		ELSE Keys_buff(56 TO 63);
Keys_buff(64 TO 71)  <= Byte_IN WHEN (keyState = "011" AND keyCounter = "10000")
		ELSE Keys_buff(64 TO 71);
Keys_buff(72 TO 79)  <= Byte_IN WHEN (keyState = "011" AND keyCounter = "01111")
		ELSE Keys_buff(72 TO 79);
Keys_buff(80 TO 87)  <= Byte_IN WHEN (keyState = "011" AND keyCounter = "01110")
		ELSE Keys_buff(80 TO 87);
Keys_buff(88 TO 95)  <= Byte_IN WHEN (keyState = "011" AND keyCounter = "01101")
		ELSE Keys_buff(88 TO 95);
Keys_buff(96 TO 103) <= Byte_IN WHEN (keyState = "011" AND keyCounter = "01100")
		ELSE Keys_buff(96 TO 103);
Keys_buff(104 TO 111) <= Byte_IN WHEN (keyState = "011" AND keyCounter = "01011")
		 ELSE Keys_buff(104 TO 111);
Keys_buff(112 TO 119) <= Byte_IN WHEN (keyState = "011" AND keyCounter = "01010")
		 ELSE Keys_buff(112 TO 119);
Keys_buff(120 TO 127) <= Byte_IN WHEN (keyState = "011" AND keyCounter = "01001")
		 ELSE Keys_buff(120 TO 127);
Keys_buff(128 TO 135) <= Byte_IN WHEN (keyState = "011" AND keyCounter = "01000")
		 ELSE Keys_buff(128 TO 135);
Keys_buff(136 TO 143) <= Byte_IN WHEN (keyState = "011" AND keyCounter = "00111")
		 ELSE Keys_buff(136 TO 143);
Keys_buff(144 TO 151) <= Byte_IN WHEN (keyState = "011" AND keyCounter = "00110")
		 ELSE Keys_buff(144 TO 151);
Keys_buff(152 TO 159) <= Byte_IN WHEN (keyState = "011" AND keyCounter = "00101")
		 ELSE Keys_buff(152 TO 159);
Keys_buff(160 TO 167) <= Byte_IN WHEN (keyState = "011" AND keyCounter = "00100")
		 ELSE Keys_buff(160 TO 167);
Keys_buff(168 TO 175) <= Byte_IN WHEN (keyState = "011" AND keyCounter = "00011")
		 ELSE Keys_buff(168 TO 175);
Keys_buff(176 TO 183) <= Byte_IN WHEN (keyState = "011" AND keyCounter = "00010")
		 ELSE Keys_buff(176 TO 183);
Keys_buff(184 TO 191) <= Byte_IN WHEN (keyState = "011" AND keyCounter = "00001")
		 ELSE Keys_buff(184 TO 191);

--preKeys <= Keys_buff;
Key1 <= Keys_buff(0 TO 63) WHEN keyState = "110" --KEYS_AVAILABLE
	ELSE (OTHERS => '0');
Key2 <= Keys_buff(64 TO 127) WHEN keyState = "110" --KEYS_AVAILABLE
	ELSE (OTHERS => '0');
Key3 <= Keys_buff(128 TO 191) WHEN keyState = "110" --KEYS_AVAILABLE
	ELSE (OTHERS => '0');

PROCESS (Clk, KIN_ON)
BEGIN
IF KIN_ON = '0' THEN
   keyState <= "000";--IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN

CASE keyState IS
WHEN "000" => --IDLE =>
   IF KIN_ON = '1' THEN
      keyState <= "001";--Check_READ_ENABLE;
   END IF;

WHEN "001" => --Check_READ_ENABLE =>
   IF READ_Byte_ENABLE = '1' THEN
      keyState <= "010"; --READ_KEY_req;
   END IF;

WHEN "010" => --READ_KEY_req =>
   IF READ_Byte_ENABLE = '0' THEN
      keyState <= "011"; --Collect_KEY;
   END IF;

WHEN "011" => --Collect_KEY =>
   --IF READ_Byte_ENABLE = '1' THEN
      keyState <= "100"; --KEY_VALID;
   --END IF;

WHEN "100" => --KEY_VALID =>
   keyState <= "101"; --Check_keyCounter;

WHEN "101" => --Check_keyCounter =>
   IF keyCounter /= "00000" THEN
      keyState <= "001"; --Check_READ_ENABLE;
   ELSE
      keyState <= "110"; --KEYS_AVAILABLE;
   END IF;

WHEN "110" => --KEYS_AVAILABLE =>
   keyState <= "110"; --KEYS_AVAILABLE;

WHEN OTHERS =>
   keyState(0) <= '0';

END CASE;
END IF;
END PROCESS;

keyCounter <= "11000" WHEN keyState = "000"
ELSE tmpCounter - 1 WHEN keyState = "100"
ELSE keyCounter;

tmpCounter <= "11000" WHEN keyState = "000"
ELSE tmpCounter WHEN keyState = "100"
ELSE keyCounter;

END TDES_KEY_READER_arch;