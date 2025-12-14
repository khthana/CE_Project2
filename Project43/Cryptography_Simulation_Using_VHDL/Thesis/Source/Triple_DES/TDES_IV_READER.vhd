LIBRARY ieee ; -- 102.8 MHz
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY TDES_IV_READER IS
   PORT (
	Clk			: IN std_logic;
	IVIN_ON			: IN std_logic;
	IV_Mode			: IN std_logic;
	IV_READY		: IN std_logic;
	IV_INPUT		: IN std_logic_vector(0 TO 63);
	Byte_IN			: IN std_logic_vector(7 DOWNTO 0);
	READ_Byte_ENABLE	: IN std_logic;
	READ_BYTE		: OUT std_logic;
	IV_REQ			: OUT std_logic;
	IV			: OUT std_logic_vector(0 TO 63);
	IV_Completed		: OUT std_logic
   );
END TDES_IV_READER;

ARCHITECTURE TDES_IV_READER_arch OF TDES_IV_READER IS

-- TYPE stateREAD_IV IS (IDLE, Check_READ_IV, Check_READ_ENABLE, READ_BYTE_req, Collect_BYTE, BYTE_VALID, Check_readCounter, SET_IV);
-- TYPE stateGET_RNG IS (IDLE, Check_GET_RNG, IV_REQUEST, SET_IV, IV_AVAILABLE);
SIGNAL read_ivState : std_logic_vector(2 DOWNTO 0); --stateREAD_IV;
SIGNAL get_rngState : std_logic_vector(2 DOWNTO 0); --stateGET_RNG;
SIGNAL bool_Read_IV_READY, bool_Check_READ_IV, bool_BYTE_VALID : boolean;
SIGNAL read_ivCounter, tmp_ivCounter : std_logic_vector(3 DOWNTO 0);
SIGNAL IV_buff, tmpIV : std_logic_vector(0 TO 63);
BEGIN

READ_BYTE <= '1' WHEN read_ivState = "011" OR read_ivState = "100"--READ_BYTE_req
	ELSE '0';-- WHEN bool_BYTE_VALID --BYTE_VALID
	--ELSE 'Z';

IV_Completed <= '1' WHEN read_ivState = "111" OR get_rngState = "011"
	   ELSE '0';

-- ==================================================================================== --
--				READ IV STATE MACHINE					--
-- ==================================================================================== --

IV_buff(0 TO  7) <= Byte_IN WHEN (read_ivState = "100") AND (read_ivCounter = "1000")
		ELSE IV_buff(0 TO 7);
IV_buff(8 TO  15) <= Byte_IN WHEN (read_ivState = "100") AND (read_ivCounter = "0111")
		ELSE IV_buff(8 TO 15);
IV_buff(16 TO  23) <= Byte_IN WHEN (read_ivState = "100") AND (read_ivCounter = "0110")
		ELSE IV_buff(16 TO 23);
IV_buff(24 TO  31) <= Byte_IN WHEN (read_ivState = "100") AND (read_ivCounter = "0101")
		ELSE IV_buff(24 TO 31);
IV_buff(32 TO  39) <= Byte_IN WHEN (read_ivState = "100") AND (read_ivCounter = "0100")
		ELSE IV_buff(32 TO 39);
IV_buff(40 TO  47) <= Byte_IN WHEN (read_ivState = "100") AND (read_ivCounter = "0011")
		ELSE IV_buff(40 TO 47);
IV_buff(48 TO  55) <= Byte_IN WHEN (read_ivState = "100") AND (read_ivCounter = "0010")
		ELSE IV_buff(48 TO 55);
IV_buff(56 TO  63) <= Byte_IN WHEN (read_ivState = "100") AND (read_ivCounter = "0001")
		ELSE IV_buff(56 TO 63);

PROCESS (Clk, IVIN_ON)
BEGIN
IF IVIN_ON = '0' THEN
   read_ivState <= "000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE read_ivState IS
WHEN "000" => --IDLE =>
   IF IVIN_ON = '1' THEN
      read_ivState <= "001"; --Check_READ_IV;
   END IF;

WHEN "001" => --Check_READ_IV =>
   IF IV_MODE = '1' THEN
      read_ivState <= "010"; --Check_READ_ENABLE;
   ELSE
      read_ivState <= "111"; --SET_IV;
   END IF;

WHEN "010" => --Check_READ_ENABLE =>
   IF READ_Byte_ENABLE = '1' THEN
      read_ivState <= "011"; --READ_BYTE_req;
   END IF;

WHEN "011" => --READ_BYTE_req =>
   IF READ_Byte_ENABLE = '0' THEN
      read_ivState <= "100"; --Collect_BYTE;
   END IF;

WHEN "100" => --Collect_BYTE =>
   read_ivState <= "101"; --BYTE_VALID;

WHEN "101" => --BYTE_VALID =>
   read_ivState <= "110"; --Check_readCounter;

WHEN "110" => --Check_readCounter =>
   IF read_ivCounter /= "0000" THEN
      read_ivState <= "010"; --Check_READ_ENABLE;
   ELSE
      read_ivState <= "111"; --SET_IV;
   END IF;

WHEN "111" => --SET_IV =>
   read_ivState <= "111"; --SET_IV;

WHEN OTHERS =>
   read_ivState <= "000";

END CASE;
END IF;
END PROCESS;
-- **************************

tmp_ivCounter <= "1000" WHEN read_ivState = "001"
	ELSE read_ivCounter WHEN read_ivState = "110"
	ELSE tmp_ivCounter;

read_ivCounter <= "1000" WHEN read_ivState = "001"
	ELSE tmp_ivCounter - 1 WHEN read_ivState = "101"
	ELSE read_ivCounter;

-- ==================================================================================== --
--				GET RNG STATE MACHINE					--
-- ==================================================================================== --
IV_REQ    <= '1' WHEN get_rngState = "010" --IV_REQUEST
	ELSE '0'; --'Z';

bool_Read_IV_READY <= read_ivState = "110" AND read_ivCounter = "0000";

tmpIV	  <= IV_INPUT WHEN get_rngState = "011" --SET_IV
	ELSE IV_buff WHEN bool_Read_IV_READY
 	ELSE tmpIV;

IV <= tmpIV; --"0100000101000001010000010100000101000001010000010100000101000001"

PROCESS (Clk, IVIN_ON)
BEGIN
IF IVIN_ON ='0' THEN
   get_rngState <= "000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE get_rngState IS
WHEN "000" => --IDLE =>
   IF IVIN_ON = '1' THEN
      get_rngState <= "001"; --Check_GET_RNG;
   END IF;

WHEN "001" => --Check_GET_RNG =>
   IF IV_MODE = '0' THEN
      get_rngState <= "010"; --IV_REQUEST;
   END IF;

WHEN "010" => --IV_REQUEST =>
   IF IV_READY = '1' THEN
      get_rngState <= "011"; --SET_IV;
   END IF;

WHEN "011" => --SET_IV =>
   get_rngState <= "100"; --SEt_IV;

WHEN "100" =>
   get_rngState <= "100";

WHEN OTHERS =>
   get_rngState(0) <= '0';

END CASE;
END IF;
END PROCESS;

END TDES_IV_READER_arch;