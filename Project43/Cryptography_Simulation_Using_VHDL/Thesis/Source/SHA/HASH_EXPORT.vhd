LIBRARY ieee; -- 87.2
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY HASH_EXPORT IS
   PORT( 
	Clk			: IN	std_logic;
	DXtOUT_ON		: IN	std_logic; -- from Internal signal of top level (selected from SHA or MD5)
	DXtOUT			: IN	std_logic_vector(0 TO 159); -- from Internal bus of top level (selected for SHA or MD5)
	DXtOUT_MODE		: IN	std_logic; -- 160 bits / 128 bits from Internal signal of top level
	Byte_TRANSFER_ENABLE	: IN	std_logic; -- from External System
	Byte_TRANSFER		: OUT	std_logic; -- to External System
	Byte_OUT		: OUT	std_logic_vector(7 DOWNTO 0); -- to External System
	DXtOUT_Completed	: OUT	std_logic  -- to internal signal selected for SHA or MD5
   );
END HASH_EXPORT;


ARCHITECTURE HASH_EXPORT_arch OF HASH_EXPORT IS

SIGNAL exportState : std_logic_vector(2 DOWNTO 0); --stateWRITE_DATA;
-- ***************************************************************************
SIGNAL writeCounter, initCounter, tmpCounter	: std_logic_vector(4 DOWNTO 0);

SIGNAL bool_Holding_BUS				: boolean;

BEGIN

-- ==================================================================== --
--		WRITE STATE MACHINE
-- ==================================================================== --
PROCESS (Clk, DXtOUT_ON)
BEGIN
IF DXtOUT_ON /= '1' THEN
   exportState <= "000";--IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN

CASE exportState IS
WHEN "000" => --IDLE =>
   IF DXtOUT_ON = '1' THEN
      exportState <= "010";
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
   IF Byte_TRANSFER_ENABLE = '1' THEN
      exportState <= "101";--BYTE_VALID;
   END IF;

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

-- ==================================================================================== --
--					BUFFER STATE MACHINE				--
-- ==================================================================================== --
initCounter <= "10100" WHEN DXtOUT_MODE = '0'
	  ELSE "10000";

tmpCounter <= "00000" WHEN exportState = "000"
	ELSE tmpCounter WHEN exportState = "101"
	ELSE writeCounter;

writeCounter <= "00000" WHEN exportState = "000"
	ELSE tmpCounter + 1 WHEN exportState = "101"
	ELSE writeCounter;

Byte_TRANSFER <= '1' WHEN exportState = "011" --OR exportState = "100"
	ELSE '0';

bool_Holding_BUS <= exportState = "011" OR exportState = "100";

Byte_OUT  <= DXtOUT(0  TO 7)    WHEN (bool_Holding_BUS AND writeCounter = "00000")
	ELSE DXtOUT(8  TO 15)   WHEN (bool_Holding_BUS AND writeCounter = "00001")
	ELSE DXtOUT(16 TO 23)   WHEN (bool_Holding_BUS AND writeCounter = "00010")
	ELSE DXtOUT(24 TO 31)   WHEN (bool_Holding_BUS AND writeCounter = "00011")
	ELSE DXtOUT(32 TO 39)   WHEN (bool_Holding_BUS AND writeCounter = "00100")
	ELSE DXtOUT(40 TO 47)   WHEN (bool_Holding_BUS AND writeCounter = "00101")
	ELSE DXtOUT(48 TO 55)   WHEN (bool_Holding_BUS AND writeCounter = "00110")
	ELSE DXtOUT(56 TO 63)   WHEN (bool_Holding_BUS AND writeCounter = "00111")
	ELSE DXtOUT(64 TO 71)   WHEN (bool_Holding_BUS AND writeCounter = "01000")
	ELSE DXtOUT(72 TO 79)   WHEN (bool_Holding_BUS AND writeCounter = "01001")
	ELSE DXtOUT(80 TO 87)   WHEN (bool_Holding_BUS AND writeCounter = "01010")
	ELSE DXtOUT(88 TO 95)   WHEN (bool_Holding_BUS AND writeCounter = "01011")
	ELSE DXtOUT(96 TO 103)  WHEN (bool_Holding_BUS AND writeCounter = "01100")
	ELSE DXtOUT(104 TO 111) WHEN (bool_Holding_BUS AND writeCounter = "01101")
	ELSE DXtOUT(112 TO 119) WHEN (bool_Holding_BUS AND writeCounter = "01110")
	ELSE DXtOUT(120 TO 127) WHEN (bool_Holding_BUS AND writeCounter = "01111")
	ELSE DXtOUT(128 TO 135) WHEN (bool_Holding_BUS AND writeCounter = "10000")
	ELSE DXtOUT(136 TO 143) WHEN (bool_Holding_BUS AND writeCounter = "10001")
	ELSE DXtOUT(144 TO 151) WHEN (bool_Holding_BUS AND writeCounter = "10010")
	ELSE DXtOUT(152 TO 159) WHEN (bool_Holding_BUS AND writeCounter = "10011")
	ELSE (OTHERS => '0');

DXtOUT_Completed <= '1' WHEN exportState = "111"
		ELSE '0';

END HASH_EXPORT_arch;