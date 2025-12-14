LIBRARY ieee ; -- 113.8 MHz
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY DATA_IMPORT IS
   PORT (
	Clk			: IN std_logic;
	DIN_ON			: IN std_logic;
	Byte_IN			: IN std_logic_vector(7 DOWNTO 0);
	LAST_Byte		: IN std_logic;
	DBUS_Mode		: IN std_logic_vector(2 DOWNTO 0); -- xyy => x : Read instruction | yy : 8/16/32/64 bits
	READ_Byte_ENABLE	: IN std_logic;
	READ_Byte		: OUT std_logic;
	DBUS_IN			: OUT std_logic_vector(0 TO 63);
	LAST_Data		: OUT std_logic;
	DBUS_IN_Completed	: OUT std_logic
   );
END DATA_IMPORT;

-- interface declaration end


LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY CryptoChip;

ARCHITECTURE DATA_IMPORT_arch OF DATA_IMPORT IS

-- State Definition --
--TYPE stateREAD_DATA IS (IDLE, INIT_readCounter, Check_READ_ENABLE, READ_BYTE_req, Collect_BYTE, BYTE_VALID, Check_readCounter, wait_READ_REQUEST);
SIGNAL buffState : std_logic_vector(3 DOWNTO 0); --stateREAD_DATA;
-- ***************************************************************************
SIGNAL readCounter, limitCounter, tmpCounter	: std_logic_vector(3 DOWNTO 0);
SIGNAL bool_Collect_BYTE, bool_DBUS_Sent : boolean;
SIGNAL bool_Mode8, bool_Mode16, bool_Mode32,bool_PADDING		 : boolean;
SIGNAL DBUS_buff, tmpDBUS_IN				: std_logic_vector(0 TO 63);

SIGNAL BYTE_PADDED		: std_logic_vector(7 DOWNTO 0);
BEGIN


-- ==================================================================================== --
--					BUFFER STATE MACHINE				--
-- ==================================================================================== --

bool_Mode8 <= DBUS_Mode(1 DOWNTO 0) = "00";
bool_Mode16 <= DBUS_Mode(1 DOWNTO 0) = "01";
bool_Mode32 <= DBUS_Mode(1 DOWNTO 0) = "10";

limitCounter <= "0001" WHEN bool_Mode8
	ELSE "0010" WHEN bool_Mode16
	ELSE "0100" WHEN bool_Mode32
	ELSE "1000";



READ_Byte <= '1' WHEN buffState = "0011" OR buffState = "0100"
	ELSE '0';

bool_Collect_BYTE <= buffState = "0100";--Collect_BYTE;

BYTE_PADDED(7) <= '1' WHEN buffState = "1001"
	ELSE '0' WHEN buffState = "1100"
	ELSE BYTE_PADDED(7);

BYTE_PADDED(6 DOWNTO 0) <= (OTHERS => '0');

bool_PADDING <= buffState = "1001" OR buffState = "1100";

DBUS_buff(0 TO 7)	  <= Byte_IN WHEN (bool_Collect_BYTE AND readCounter(2 DOWNTO 0) = "000")
			ELSE BYTE_PADDED WHEN bool_PADDING AND readCounter(2 DOWNTO 0) = "000"
	 		ELSE DBUS_buff(0 TO 7);
DBUS_buff(8 TO 15)	  <= Byte_IN WHEN (bool_Collect_BYTE AND readCounter(2 DOWNTO 0) = "001")
			ELSE BYTE_PADDED WHEN bool_PADDING AND readCounter(2 DOWNTO 0) = "001"
			ELSE DBUS_buff(8 TO 15);
DBUS_buff(16 TO 23)  <= Byte_IN WHEN (bool_Collect_BYTE AND readCounter(2 DOWNTO 0) = "010")
			ELSE BYTE_PADDED WHEN bool_PADDING AND readCounter(2 DOWNTO 0) = "010"
			ELSE DBUS_buff(16 TO 23);
DBUS_buff(24 TO 31)  <= Byte_IN WHEN (bool_Collect_BYTE AND readCounter(2 DOWNTO 0) = "011")
			ELSE BYTE_PADDED WHEN bool_PADDING AND readCounter(2 DOWNTO 0) = "011"
			ELSE DBUS_buff(24 TO 31);
DBUS_buff(32 TO 39)  <= Byte_IN WHEN (bool_Collect_BYTE AND readCounter(2 DOWNTO 0) = "100")
			ELSE BYTE_PADDED WHEN bool_PADDING AND readCounter(2 DOWNTO 0) = "100"
			ELSE DBUS_buff(32 TO 39);
DBUS_buff(40 TO 47)  <= Byte_IN WHEN (bool_Collect_BYTE AND readCounter(2 DOWNTO 0) = "101")
			ELSE BYTE_PADDED WHEN bool_PADDING AND readCounter(2 DOWNTO 0) = "101"
			ELSE DBUS_buff(40 TO 47);
DBUS_buff(48 TO 55)  <= Byte_IN WHEN (bool_Collect_BYTE AND readCounter(2 DOWNTO 0) = "110")
			ELSE BYTE_PADDED WHEN bool_PADDING AND readCounter(2 DOWNTO 0) = "110"
			ELSE DBUS_buff(48 TO 55);
DBUS_buff(56 TO 63)  <= Byte_IN WHEN (bool_Collect_BYTE AND readCounter(2 DOWNTO 0) = "111")
			ELSE BYTE_PADDED WHEN bool_PADDING AND readCounter(2 DOWNTO 0) = "111"
			ELSE DBUS_buff(56 TO 63);

tmpDBUS_IN <= DBUS_buff WHEN buffState = "1110"
	ELSE tmpDBUS_IN;

DBUS_IN <= tmpDBUS_IN;

LAST_Data <= '1' WHEN buffState = "1101"
	ELSE '0';

bool_DBUS_Sent <= (buffState = "0111" OR buffState = "1101") AND DBUS_Mode(2) = '1';

DBUS_IN_Completed <= '1' WHEN bool_DBUS_Sent
		ELSE '0';

PROCESS (Clk, DIN_ON)
BEGIN
IF DIN_ON = '0' THEN
   buffState <= "0000";--IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN

CASE buffState IS
WHEN "0000" => --IDLE =>
   IF DIN_ON = '1' THEN
      buffState <= "0001";--INIT_readCounter;
   END IF;

WHEN "0001" => -- INIT_readCounter =>
   buffState <= "0010";--Check_READ_ENABLE;

WHEN "0010" => -- Check_READ_ENABLE =>
   IF READ_Byte_ENABLE = '1' THEN
      buffState <= "0011";--READ_BYTE_req;
   END IF;

WHEN "0011" => -- READ_BYTE_req =>
   IF READ_Byte_ENABLE = '0' THEN
      buffState <= "0100";--Collect_BYTE;
   END IF;

WHEN "0100" => -- Collect_BYTE =>
      buffState <= "0101";--BYTE_VALID;

WHEN "0101" => -- BYTE_VALID =>
   IF READ_Byte_ENABLE = '1' THEN
      buffState <= "0110";--Check_readCounter;
   END IF;

WHEN "0110" => -- Check_readCounter =>
   IF readCounter = limitCounter THEN
      buffState <= "0111"; --wait_READ_REQUEST;
   ELSE
      buffState <= "1000"; --CHECK_LAST_Byte;
   END IF;

WHEN "1000" => --CHECK_LAST_Byte =>
   IF LAST_Byte = '1' THEN
      buffState <= "1001"; --PAD_80hex;
   ELSE
      buffState <= "0010";
   END IF;

WHEN "1001" => --PAD_80hex =>
   buffState <= "1010"; --Counting_DOWN;

WHEN "1010" => --Counting_DOWN =>
   buffState <= "1011"; --CHECK_readCounter2;

WHEN "1011" => --CHECK_readCounter2 =>
   IF readCounter = limitCounter THEN
      buffState <= "0111";
   ELSE
      buffState <= "1100"; --PAD_ZERO;
   END IF;

WHEN "1100" => --PAD_ZERO =>
   buffState <= "1010"; --Counting_DOWN;

WHEN "1101" => --END_SERVICE =>
   buffState <= "1101"; --END_SERVICE;

WHEN "0111" => -- wait_READ_REQUEST =>
   IF DBUS_Mode(2) = '1' THEN
      buffState <= "1110";
   END IF;

WHEN "1110" =>
   IF LAST_Byte = '1' THEN
      buffState <= "1101";
   ELSE
      buffState <= "0001";
   END IF;

WHEN OTHERS =>
   buffState <= "0000";

END CASE;
END IF;
END PROCESS;

--PROCESS (buffState, readCounter, tmpCounter)
--BEGIN
--IF buffState = "0001" THEN
--   tmpCounter <= "0000";
--   readCounter <= "0000";
--ELSIF buffState = "0101" OR buffState = "1010" THEN
--   readCounter <= tmpCounter + 1;
--ELSE
--   tmpCounter <= readCounter;
--END IF;
--END PROCESS;

readCounter <= "0000" WHEN buffState = "0001"
ELSE tmpCounter + 1 WHEN buffState = "0101" OR buffState = "1010"
ELSE readCounter;

tmpCounter <= "0000" WHEN buffState = "0001"
ELSE tmpCounter WHEN buffState = "0101" OR buffState = "1010"
ELSE readCounter;

END DATA_IMPORT_arch;