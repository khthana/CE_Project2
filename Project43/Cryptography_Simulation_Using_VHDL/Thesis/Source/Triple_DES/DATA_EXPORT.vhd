LIBRARY ieee ; -- 82.9 MHz
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY DATA_EXPORT IS
   PORT (
      Clk			: IN	std_logic;
      DOUT_ON			: IN	std_logic;
      DBUS_OUT			: IN	std_logic_vector(0 TO 63);
      DOUT_Mode			: IN	std_logic_vector(2 DOWNTO 0);
      Byte_TRANSFER_ENABLE	: IN	std_logic;
      Byte_TRANSFER		: OUT	std_logic;
      Byte_OUT			: OUT	std_logic_vector(7 DOWNTO 0);
      DOUT_Completed		: OUT	std_logic
   );
END DATA_EXPORT;

LIBRARY ieee ;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

LIBRARY CryptoChip;

ARCHITECTURE DATA_EXPORT_arch OF DATA_EXPORT IS

--TYPE stateWRITE_DATA IS (IDLE, INIT_writeCounter, Check_WRITE_ENABLE, WRITE_BYTE_req, Export_BYTE, BYTE_VALID, Check_writeCounter, END_OF_SERVICE);
SIGNAL exportState : std_logic_vector(2 DOWNTO 0); --stateWRITE_DATA;
-- ***************************************************************************
SIGNAL writeCounter, initCounter, tmpCounter	: std_logic_vector(3 DOWNTO 0);

SIGNAL bool_Holding_BUS				: boolean;

BEGIN

-- ==================================================================== --
--		WRITE STATE MACHINE
-- ==================================================================== --
PROCESS (Clk, DOUT_ON)
BEGIN
IF DOUT_ON /= '1' THEN
   exportState <= "000";--IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN

CASE exportState IS
WHEN "000" => --IDLE =>
   IF DOUT_ON = '1' THEN
      exportState <= "010";--INIT_writeCounter;
   END IF;

WHEN "010" => -- Check_WRITE_ENABLE =>
   IF Byte_TRANSFER_ENABLE = '1' THEN
      exportState <= "011";--WRITE_BYTE_req;
   END IF;

WHEN "011" => -- WRITE_BYTE_req =>
   IF Byte_TRANSFER_ENABLE = '0' THEN
      exportState <= "100";--Export_BYTE;
   END IF;

WHEN "100" => -- Export_BYTE =>
--   IF Byte_TRANSFER_ENABLE = '1' THEN
      exportState <= "101";--BYTE_VALID;
--   END IF;

WHEN "101" => -- BYTE_VALID =>
   exportState <= "110";--Check_writeCounter;

WHEN "110" => -- Check_writeCounter =>
   IF writeCounter /= initCounter THEN
      exportState <= "010";--Check_WRITE_ENABLE;
   ELSE
      exportState <= "111"; --END_OF_SERVICE;
   END IF;

WHEN "111" => -- END_OF_SERVICE =>
      exportState <= "111";--SET_DBUS_IN;

WHEN OTHERS =>
   exportState <= "000";

END CASE;
END IF;
END PROCESS;

--PROCESS (exportState, writeCounter, tmpCounter, initCounter)
--BEGIN
--IF exportState = "000" THEN
--   tmpCounter <= "0000";
--ELSIF exportState = "101" THEN
--   writeCounter <= tmpCounter + 1;
--ELSE
--   tmpCounter <= writeCounter;
--END IF;
--END PROCESS;

tmpCounter <= "0000" WHEN exportState = "000"
	ELSE tmpCounter WHEN exportState = "101"
	ELSE writeCounter;

writeCounter <= "0000" WHEN exportState = "000"
	ELSE tmpCounter + 1 WHEN exportState = "101"
	ELSE writeCounter;

-- ==================================================================================== --
--					BUFFER STATE MACHINE				--
-- ==================================================================================== --

--bool_Mode8 <= DOUT_Mode(1 DOWNTO 0) = "00";
--bool_Mode16 <= DOUT_Mode(1 DOWNTO 0) = "01";
--bool_Mode32 <= DOUT_Mode(1 DOWNTO 0) = "10";

initCounter <= "0001" WHEN DOUT_Mode(1 DOWNTO 0) = "00" --bool_Mode8
	ELSE "0010" WHEN DOUT_Mode(1 DOWNTO 0) = "01" --bool_Mode16
	ELSE "0100" WHEN DOUT_Mode(1 DOWNTO 0) = "10" --bool_Mode32
	ELSE "1000";

Byte_TRANSFER <= '1' WHEN exportState = "011" OR exportState = "100"
	ELSE '0';

bool_Holding_BUS <= exportState = "011" OR exportState = "100";

Byte_OUT  <= DBUS_OUT(0  TO 7)  WHEN (bool_Holding_BUS AND writeCounter = "0000")
	ELSE DBUS_OUT(8  TO 15) WHEN (bool_Holding_BUS AND writeCounter = "0001")
	ELSE DBUS_OUT(16 TO 23) WHEN (bool_Holding_BUS AND writeCounter = "0010")
	ELSE DBUS_OUT(24 TO 31) WHEN (bool_Holding_BUS AND writeCounter = "0011")
	ELSE DBUS_OUT(32 TO 39) WHEN (bool_Holding_BUS AND writeCounter = "0100")
	ELSE DBUS_OUT(40 TO 47) WHEN (bool_Holding_BUS AND writeCounter = "0101")
	ELSE DBUS_OUT(48 TO 55) WHEN (bool_Holding_BUS AND writeCounter = "0110")
	ELSE DBUS_OUT(56 TO 63) WHEN (bool_Holding_BUS AND writeCounter = "0111")
	ELSE (OTHERS => '0');

DOUT_Completed <= '1' WHEN exportState = "111"
		ELSE '0';

END DATA_EXPORT_arch;