LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY HASH_IMPORT IS
   PORT(
	Clk			: IN	std_logic;
	DXtIN_ON		: IN	std_logic; -- from SHA_ON or MD5_ON
	DXtIN_REQ		: IN	std_logic; -- from SHA or MD5
	READ_Byte_ENABLE	: IN	std_logic; -- from External System
	Byte_IN			: IN	std_logic_vector(7 DOWNTO 0); -- from External System
	LAST_Byte		: IN	std_logic; -- from External System
	READ_Byte		: OUT	std_logic; -- to External System
	LAST_Block		: OUT	std_logic; -- to SHA or MD5
	DXtIN			: OUT	std_logic_vector(0 TO 511); -- to SHA or MD5
	DXtIN_Completed		: OUT	std_logic -- to SHA or MD5
   );
END HASH_IMPORT;

ARCHITECTURE HASH_IMPORT_arch OF HASH_IMPORT IS
--TYPE stateMAIN IS (IDLE, DOWNLOADING_MESG, Check_LAST_Byte, PADDING_MESG, PAD_MESG_SIZE, WAIT_DXtIN_REQ, Throw_DXtIN_to_Initializer, WAIT_DXtIN_REQ_LAST, Throw_LAST_DXtIN_to_Initializer);
--TYPE stateDOWNLOAD IS (IDLE, Check_LAST_Byte, INIT_dwnldCounter, Check_READ_ENABLE, READ_BYTE_req, Collect_BYTE, BYTE_VALID, Check_dwnldCounter, DOWNLOAD_Completed);
--TYPE statePADDING IS (IDLE, Check_SIZE, Set_Normal_Counter, Set_Extra_Counter, Check_dwnldCounter, WAIT_DXtIN_REQ, Throw_DXtIN_to_Initializer, First_Padding, Check_dwnldCounter2, WAIT_DXtIN_REQ2, Throw_DXtIN_to_Initializer2, Padding_zero, Check_padCounter, END_OF_PAD_ZERO);
--TYPE statePADSIZE IS (IDLE, WAIT_New_Byte, Count_UP, Check_LAST_Byte, WAIT_PAD_SIZE_ON, PADDING_Size, END_OF_PAD_SIZE);
SIGNAL dxtState : std_logic_vector(3 DOWNTO 0); --stateMAIN;
SIGNAL dwnldState : std_logic_vector(3 DOWNTO 0); --stateDOWNLOAD;
SIGNAL padState : std_logic_vector(3 DOWNTO 0); --statePADDING;
SIGNAL padsizeState : std_logic_vector(2 DOWNTO 0); --statePADSIZE;
SIGNAL bool_dxtThrow1, bool_dxtThrow2, bool_padThrow1, bool_padThrow2	: boolean;
SIGNAL dwnldCounter, tmpDwnCounter, padCounter, tmpPadCounter			: std_logic_vector(6 DOWNTO 0);

SIGNAL bool_DOWNLOAD_ON, bool_PADING_ON, bool_PAD_SIZE_ON, bool_PadZero		: BOOLEAN;
SIGNAL bool_DOWNLOAD_Completed, bool_PAD_Completed, bool_PAD_SIZE_Completed	: BOOLEAN;

SIGNAL bool_SETUP_BYTE						: BOOLEAN;
SIGNAL Size, tmpSizeCounter					: std_logic_vector(63 DOWNTO 0);

SIGNAL tmpByte							: std_logic_vector(7 DOWNTO 0);
SIGNAL Msg_Buffer						: std_logic_vector(0 TO 511);

BEGIN

-- ==================================================================================== --
--					MAIN STATE MACHINE				--
-- ==================================================================================== --
PROCESS(Clk, DXtIN_ON)
BEGIN
IF DXtIN_ON = '0' THEN
   dxtState <= "0000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE dxtState IS
WHEN "0000" => --IDLE =>
   IF DXtIN_ON = '1' THEN
      dxtState <= "0001"; --DOWNLOADING_MESG;
   END IF;

WHEN "0001" => --DOWNLOADING_MESG =>
   IF bool_DOWNLOAD_Completed THEN
      dxtState <= "0010"; --Check_LAST_Byte;
   END IF;

WHEN "0010" => --Check_LAST_Byte =>
   IF LAST_Byte = '1' THEN
      dxtState <= "0011"; --PADDING_MESG;
   ELSE
      dxtState <= "0101"; --WAIT_DXtIN_REQ;
   END IF;

WHEN "0011" => --PADDING_MESG =>
   IF bool_PAD_Completed THEN
      dxtState <= "0100"; --PAD_MESG_SIZE;
   END IF;

WHEN "0100" => --PAD_MESG_SIZE =>
   IF bool_PAD_SIZE_Completed THEN
      dxtState <= "0111"; --WAIT_DXtIN_REQ_LAST;
   END IF;

WHEN "0101" => --WAIT_DXtIN_REQ =>
   IF DXtIN_REQ = '1' THEN
      dxtState <= "0110"; --Throw_DXtIN_to_Initializer;
   END IF;

WHEN "0110" => --Throw_DXtIN_to_Initializer =>
   IF DXtIN_REQ = '0' THEN
      dxtState <= "0001"; --DOWNLOADING_MESG;
   END IF;

WHEN "0111" => --WAIT_DXtIN_REQ_LAST =>
   IF DXtIN_REQ = '1' THEN
      dxtState <= "1000"; --Throw_LAST_DXtIN_to_Initializer;
   END IF;

WHEN "1000" => --Throw_LAST_DXtIN_to_Initializer =>
   IF DXtIN_ON = '0' THEN
      dxtState <= "0000"; --IDLE;
   END IF;

WHEN OTHERS =>
   dxtState <= "0000";

END CASE;
END IF;
END PROCESS;

-- ==================================================================================== --
--					DOWNLOAD STATE MACHINE				--
-- ==================================================================================== --
PROCESS(Clk, bool_DOWNLOAD_ON)
BEGIN
IF NOT bool_DOWNLOAD_ON THEN
   dwnldState <= "0000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE dwnldState IS
WHEN "0000" => --IDLE =>
   IF bool_DOWNLOAD_ON THEN
      dwnldState <= "0001"; --INIT_dwnldCounter;
   END IF;

WHEN "0001" => --INIT_dwnldCounter =>
   dwnldState <= "0010"; --Check_LAST_Byte;

WHEN "0010" => --Check_LAST_Byte =>
   IF LAST_Byte = '1' THEN
      dwnldState <= "1000"; --DOWNLOAD_Completed;
   ELSE
      dwnldState <= "0011"; --Check_READ_ENABLE;
   END IF;

WHEN "0011" => --Check_READ_ENABLE =>
   IF READ_Byte_ENABLE = '1' THEN
      dwnldState <= "0100"; --READ_BYTE_req;
   END IF;

WHEN "0100" => --READ_BYTE_req =>
   IF READ_Byte_ENABLE = '0' THEN
      dwnldState <= "0101"; --Collect_BYTE;
   END IF;

WHEN "0101" => --Collect_BYTE =>
   IF READ_Byte_ENABLE = '1' THEN
      dwnldState <= "0110"; --BYTE_VALID;
   END IF;

WHEN "0110" => --BYTE_VALID =>
   dwnldState <= "0111"; --Check_dwnldCounter;

WHEN "0111" => --Check_dwnldCounter =>
   IF dwnldCounter /= "0000000" THEN
      dwnldState <= "0010"; --Check_LAST_Byte;
   ELSE
      dwnldState <= "1000"; --DOWNLOAD_Completed;
   END IF;

WHEN "1000" => --DOWNLOAD_Completed =>
   dwnldState <= "1000";

WHEN OTHERS =>
   dwnldState <= "0000";

END CASE;
END IF;
END PROCESS;
-- oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo --
-- oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo --
PROCESS(dwnldState, padState, dwnldCounter, tmpDwnCounter)
BEGIN
IF dwnldState = "0001" THEN --INIT_dwnldCounter THEN
   dwnldCounter  <= "1000000";
   tmpDwnCounter <= "1000000";
ELSIF dwnldState = "0110" THEN
   dwnldCounter <= tmpDwnCounter - 1;
--ELSIF padState = "1011" THEN
--   dwnldCounter <= tmpDwnCounter - 1;
ELSE
   tmpDwnCounter <= dwnldCounter;
END IF;
END PROCESS;
-- ==================================================================================== --
--					PADDING STATE MACHINE				--
-- ==================================================================================== --
PROCESS(Clk, bool_PADING_ON)
BEGIN
IF NOT bool_PADING_ON THEN
   padState <= "0000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE padState IS
WHEN "0000" => --IDLE =>
   IF bool_PADING_ON THEN
      padState <= "0001"; --Check_SIZE;
   END IF;

WHEN "0001" => --Check_SIZE =>
   IF dwnldCounter < "0010000" THEN
      padState <= "0011"; --Set_Extra_Counter;
   ELSE
      padState <= "0010"; --Set_Normal_Counter;
   END IF;

WHEN "0010" => --Set_Normal_Counter =>
   padState <= "0100"; --Check_dwnldCounter;

WHEN "0011" => --Set_Extra_Counter =>
   padState <= "0100"; --Check_dwnldCounter;

WHEN "0100" => --Check_dwnldCounter =>
   IF dwnldCounter = "0000000" THEN
      padState <= "0101"; --WAIT_DXtIN_REQ;
   ELSE
      padState <= "0111"; --First_Padding;
   END IF;

WHEN "0101" => --WAIT_DXtIN_REQ =>
   IF DXtIN_REQ = '1' THEN
      padState <= "0110"; --Throw_DXtIN_to_Initializer;
   END IF;

WHEN "0110" => --Throw_DXtIN_to_Initializer =>
   IF DXtIN_REQ = '0' THEN
      padState <= "0111"; --First_Padding;
   END IF;

WHEN "0111" => --First_Padding =>
   padState <= "1000"; --Check_dwnldCounter2;

WHEN "1000" =>
   IF (padCounter = "0111001") THEN	-- IF padCounter = 56
      padState <= "1001"; --WAIT_DXtIN_REQ2;
   ELSE
      padState <= "1011"; --Padding_zero;
   END IF;

WHEN "1001" => --WAIT_DXtIN_REQ2 =>
   IF DXtIN_REQ = '1' THEN
      padState <= "1010"; --Throw_DXtIN_to_Initializer2;
   END IF;

WHEN "1010" => --Throw_DXtIN_to_Initializer2 =>
   IF DXtIN_REQ = '0' THEN
      padState <= "1011"; --Padding_zero;
   END IF;

WHEN "1011" => --Padding_zero =>
   padState <= "1100"; --Check_padCounter;

WHEN "1100" => --Check_padCounter =>
   IF padCounter = "0000000" THEN
      padState <= "1101"; --END_OF_PAD_ZERO;
   ELSE
      padState <= "1000"; --Check_dwnldCounter2;
   END IF;

WHEN "1101" => --END_OF_PAD_ZERO =>
   padState <= "1101"; --END_OF_PAD_ZERO;

WHEN OTHERS =>
   padState <= "0000";

END CASE;
END IF;
END PROCESS;

-- oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo --
-- oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo --
PROCESS(padState, padCounter, tmpPadCounter, dwnldCounter)
BEGIN
IF padState = "0010" THEN
   padCounter <= dwnldCounter - 7;
   tmpPadCounter <= dwnldCounter - 7;
ELSIF padState = "0011" THEN
   padCounter <= dwnldCounter + 57;
   tmpPadCounter <= dwnldCounter + 57;
ELSIF padState = "0111" OR padState = "1011" THEN
   padCounter <= tmpPadCounter - 1;
ELSE
   tmpPadCounter <= padCounter;
END IF;
END PROCESS;
-- ==================================================================================== --
--					PAD SIZE STATE MACHINE				--
-- ==================================================================================== --
PROCESS(Clk, DXtIN_ON)
BEGIN
IF DXtIN_ON = '0' THEN
   padsizeState <= "000"; --IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE padsizeState IS
WHEN "000" => --IDLE =>
   IF DXtIN_ON = '1' THEN
      padsizeState <= "001"; --WAIT_New_Byte;
   END IF;

WHEN "001" => --WAIT_New_Byte =>
   IF dwnldState = "0110" THEN
      padsizeState <= "010"; --Count_UP;
   ELSIF bool_PAD_SIZE_ON THEN
      padsizeState <= "101"; --PADDING_Size;
   END IF;

WHEN "010" => --Count_UP =>
   padsizeState <= "001"; --Check_LAST_Byte;

WHEN "101" => --PADDING_Size =>
   padsizeState <= "110"; --END_OF_PAD_SIZE;

WHEN "110" => --END_OF_PAD_SIZE =>
   IF DXtIN_ON = '0' THEN
      padsizeState <= "000"; --IDLE;
   END IF;

WHEN OTHERS =>
   padsizeState <= "000";

END CASE;
END IF;
END PROCESS;

PROCESS(padsizeState, Size, tmpSizeCounter)
BEGIN
IF padsizeState = "000" THEN --IDLE THEN
   Size <= (OTHERS => '0');
   tmpSizeCounter <= (OTHERS => '0');
ELSIF padsizeState = "010" THEN
   Size <= tmpSizeCounter + 8;
ELSE
   tmpSizeCounter <= Size;
END IF;
END PROCESS;

-- ==================================================================================== --
--					ASSIGNMENT SPACE				--
-- ==================================================================================== --

bool_DOWNLOAD_ON <= dxtState = "0001"; --DOWNLOADING_MESG;
bool_PADING_ON <= dxtState = "0011"; --PADDING_MESG;
bool_PAD_SIZE_ON <= dxtState = "0100"; --PAD_MESG_SIZE;
bool_SETUP_BYTE <= dwnldState = "0101";
bool_DOWNLOAD_Completed <= dwnldState = "1000"; --DOWNLOAD_Completed;
bool_PAD_Completed <= padState = "1101"; --END_OF_PAD_ZERO;
bool_PAD_SIZE_Completed <= padsizeState = "110"; --END_OF_PAD_SIZE ;

READ_Byte <= '1' WHEN dwnldState = "0100" --READ_BYTE_req
	ELSE '0';

LAST_Block <= '1' WHEN dxtState = "1000" --Throw_LAST_DXtIN_to_Initializer
	 ELSE '0';

DXtIN <= Msg_Buffer;-- WHEN dwnldCounter = "0000000"
	--ELSE (OTHERS => '0');

bool_dxtThrow1 <= dxtState = "0110";
bool_dxtThrow2 <= dxtState = "1000";
bool_padThrow1 <= padState = "0110";
bool_padThrow2 <= padState = "1010";

DXtIN_Completed   <= '1' WHEN bool_dxtThrow1 OR bool_dxtThrow2 OR bool_padThrow1 OR bool_padThrow2 --dxtState = "0110" OR dxtState = "1000" OR padState = "0110" OR padState <= "1010"
		ELSE '0';

tmpByte   <= "10000000" WHEN padState = "0111" OR padState = "1000"--First_Padding
	ELSE (OTHERS => '0');

bool_PadZero <= padState = "1100" OR padState = "0111";

Msg_Buffer(0 TO 7)   <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0111101"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0110101"
		 ELSE Msg_Buffer(0 TO 7);
Msg_Buffer(8 TO 15)  <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0111110"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0110110"
		 ELSE Msg_Buffer(8 TO 15);
Msg_Buffer(16 TO 23) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0111111"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0110111"
		 ELSE Msg_Buffer(16 TO 23);
Msg_Buffer(24 TO 31) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "1000000"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0111000"
		 ELSE Msg_Buffer(24 TO 31);
Msg_Buffer(32 TO 39) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0111001"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0110001"
		 ELSE Msg_Buffer(32 TO 39);
Msg_Buffer(40 TO 47) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0111010"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0110010"
		 ELSE Msg_Buffer(40 TO 47);
Msg_Buffer(48 TO 55) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0111011"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0110011"
		 ELSE Msg_Buffer(48 TO 55);
Msg_Buffer(56 TO 63) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0111100"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0110100"
		 ELSE Msg_Buffer(56 TO 63);
Msg_Buffer(64 TO 71) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0110101"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0101101"
		 ELSE Msg_Buffer(64 TO 71);
Msg_Buffer(72 TO 79) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0110110"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0101110"
		 ELSE Msg_Buffer(72 TO 79);
Msg_Buffer(80 TO 87) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0110111"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0101111"
		 ELSE Msg_Buffer(80 TO 87);
Msg_Buffer(88 TO 95) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0111000"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0110000"
		 ELSE Msg_Buffer(88 TO 95);
Msg_Buffer(96 TO 103) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0110001"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0101001"
		 ELSE Msg_Buffer(96 TO 103);
Msg_Buffer(104 TO 111) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0110010"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0101010"
		 ELSE Msg_Buffer(104 TO 111);
Msg_Buffer(112 TO 119) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0110011"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0101011"
		 ELSE Msg_Buffer(112 TO 119);
Msg_Buffer(120 TO 127) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0110100"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0101100"
		 ELSE Msg_Buffer(120 TO 127);
Msg_Buffer(128 TO 135) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0101101"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0100101"
		 ELSE Msg_Buffer(128 TO 135);
Msg_Buffer(136 TO 143) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0101110"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0100110"
		 ELSE Msg_Buffer(136 TO 143);
Msg_Buffer(144 TO 151) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0101111"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0100111"
		 ELSE Msg_Buffer(144 TO 151);
Msg_Buffer(152 TO 159) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0110000"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0101000"
		 ELSE Msg_Buffer(152 TO 159);
Msg_Buffer(160 TO 167) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0101001"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0100001"
		 ELSE Msg_Buffer(160 TO 167);
Msg_Buffer(168 TO 175) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0101010"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0100010"
		 ELSE Msg_Buffer(168 TO 175);
Msg_Buffer(176 TO 183) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0101011"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0100011"
		 ELSE Msg_Buffer(176 TO 183);
Msg_Buffer(184 TO 191) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0101100"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0100100"
		 ELSE Msg_Buffer(184 TO 191);
Msg_Buffer(192 TO 199) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0100101"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0011101"
		 ELSE Msg_Buffer(192 TO 199);
Msg_Buffer(200 TO 207) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0100110"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0011110"
		 ELSE Msg_Buffer(200 TO 207);
Msg_Buffer(208 TO 215) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0100111"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0011111"
		 ELSE Msg_Buffer(200 TO 207);
Msg_Buffer(216 TO 223) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0101000"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0100000"
		 ELSE Msg_Buffer(216 TO 223);
Msg_Buffer(224 TO 231) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0100001"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0011001"
		 ELSE Msg_Buffer(224 TO 231);
Msg_Buffer(232 TO 239) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0100010"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0011010"
		 ELSE Msg_Buffer(232 TO 239);
Msg_Buffer(240 TO 247) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0100011"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0011011"
		 ELSE Msg_Buffer(240 TO 247);
Msg_Buffer(248 TO 255) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0100100"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0011100"
		 ELSE Msg_Buffer(248 TO 255);
Msg_Buffer(256 TO 263) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0011101"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0010101"
		 ELSE Msg_Buffer(256 TO 263);
Msg_Buffer(264 TO 271) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0011110"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0010110"
		 ELSE Msg_Buffer(264 TO 271);
Msg_Buffer(272 TO 279) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0011111"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0010111"
		 ELSE Msg_Buffer(272 TO 279);
Msg_Buffer(280 TO 287) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0100000"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0011000"
		 ELSE Msg_Buffer(280 TO 287);
Msg_Buffer(288 TO 295) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0011001"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0010001"
		 ELSE Msg_Buffer(288 TO 295);
Msg_Buffer(296 TO 303) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0011010"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0010010"
		 ELSE Msg_Buffer(296 TO 303);
Msg_Buffer(304 TO 311) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0011011"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0010011"
		 ELSE Msg_Buffer(304 TO 311);
Msg_Buffer(312 TO 319) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0011100"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0010100"
		 ELSE Msg_Buffer(312 TO 319);
Msg_Buffer(320 TO 327) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0010101"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0001101"
		 ELSE Msg_Buffer(320 TO 327);
Msg_Buffer(328 TO 335) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0010110"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0001110"
		 ELSE Msg_Buffer(328 TO 335);
Msg_Buffer(336 TO 343) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0010111"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0001111"
		 ELSE Msg_Buffer(336 TO 343);
Msg_Buffer(344 TO 351) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0011000"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0010000"
		 ELSE Msg_Buffer(344 TO 351);
Msg_Buffer(352 TO 359) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0010001"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0001001"
		 ELSE Msg_Buffer(352 TO 359);
Msg_Buffer(360 TO 367) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0010010"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0001010"
		 ELSE Msg_Buffer(360 TO 367); 
Msg_Buffer(368 TO 375) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0010011"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0001011"
		 ELSE Msg_Buffer(368 TO 375);
Msg_Buffer(376 TO 383) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0010100"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0001100"
		 ELSE Msg_Buffer(376 TO 383);
Msg_Buffer(384 TO 391) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0001101"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0000101"
		 ELSE Msg_Buffer(384 TO 391);
Msg_Buffer(392 TO 399) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0001110"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0000110"
		 ELSE Msg_Buffer(392 TO 399);
Msg_Buffer(400 TO 407) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0001111"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0000111"
		 ELSE Msg_Buffer(400 TO 407);
Msg_Buffer(408 TO 415) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0010000"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0001000"
		 ELSE Msg_Buffer(408 TO 415);
Msg_Buffer(416 TO 423) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0001001"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0000001"
		 ELSE Msg_Buffer(416 TO 423);
Msg_Buffer(424 TO 431) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0001010"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0000010"
		 ELSE Msg_Buffer(424 TO 431);
Msg_Buffer(432 TO 439) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0001011"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0000011"
		 ELSE Msg_Buffer(432 TO 439);
Msg_Buffer(440 TO 447) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0001100"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0000100"
		 ELSE Msg_Buffer(440 TO 447);

Msg_Buffer(448 TO 455) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0000101"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0111101"
		 ELSE Size(63 DOWNTO 56) WHEN padsizeState = "101" --PADDING_Size
		 ELSE Msg_Buffer(448 TO 455);
Msg_Buffer(456 TO 463) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0000110"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0111110"
		 ELSE Size(55 DOWNTO 48) WHEN padsizeState = "101" --PADDING_Size
		 ELSE Msg_Buffer(456 TO 463);
Msg_Buffer(464 TO 471) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0000111"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0111111"
		 ELSE Size(47 DOWNTO 40) WHEN padsizeState = "101" --PADDING_Size
		 ELSE Msg_Buffer(464 TO 471);
Msg_Buffer(472 TO 479) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0001000"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "1000000"
		 ELSE Size(39 DOWNTO 32) WHEN padsizeState = "101" --PADDING_Size
		 ELSE Msg_Buffer(472 TO 479);
Msg_Buffer(480 TO 487) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0000001"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0111001"
		 ELSE Size(31 DOWNTO 24) WHEN padsizeState = "101" --PADDING_Size
		 ELSE Msg_Buffer(480 TO 487);
Msg_Buffer(488 TO 495) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0000010"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0111010"
		 ELSE Size(23 DOWNTO 16) WHEN padsizeState = "101" --PADDING_Size
		 ELSE Msg_Buffer(488 TO 495);
Msg_Buffer(496 TO 503) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0000011"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0111011"
		 ELSE Size(15 DOWNTO 8) WHEN padsizeState = "101" --PADDING_Size
		 ELSE Msg_Buffer(496 TO 503);
Msg_Buffer(504 TO 511) <= Byte_IN WHEN bool_SETUP_BYTE AND dwnldCounter = "0000100"
		 ELSE tmpByte WHEN bool_PadZero AND padCounter = "0111100"
		 ELSE Size(7 DOWNTO 0) WHEN padsizeState = "101" --PADDING_Size
		 ELSE Msg_Buffer(504 TO 511);

END HASH_IMPORT_arch;