LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_textio.all;

LIBRARY std;
USE std.textio.ALL;

ENTITY TDES_tb IS
   PORT (
      Clk			: IN	std_logic;
      Reset			: IN	std_logic
   );
END TDES_tb;

ARCHITECTURE TDES_tb_arch OF TDES_tb IS

COMPONENT ENCRYPT_TOP
   PORT (
      Clk			: IN	std_logic;
      TDES_ON			: IN	std_logic;
      Modes			: IN	std_logic_vector (2 DOWNTO 0);
      TDES_ENC_DEC		: IN	std_logic;
      READ_Byte_ENABLE		: IN	std_logic;
      Byte_IN			: IN	std_logic_vector(7 DOWNTO 0);
      LAST_Byte			: IN	std_logic;
      Byte_TRANSFER_ENABLE	: IN	std_logic;
      Byte_TRANSFER		: OUT	std_logic;
      Byte_OUT			: OUT	std_logic_vector(7 DOWNTO 0);
      READ_Key			: OUT	std_logic;
      READ_BYTE			: OUT	std_logic;
      End_Operate		: OUT	std_logic;
      TDES_RUNNING		: OUT	std_logic
   );
END COMPONENT;


SIGNAL TDES_ON			:	std_logic;
SIGNAL Modes			:	std_logic_vector (2 DOWNTO 0);
SIGNAL TDES_ENC_DEC		:	std_logic;
SIGNAL READ_Byte_ENABLE		:	std_logic;
SIGNAL Byte_IN			:	std_logic_vector(7 DOWNTO 0);
SIGNAL LAST_Byte		:	std_logic;
SIGNAL Byte_TRANSFER_ENABLE	:	std_logic;
SIGNAL Byte_TRANSFER		:	std_logic;
SIGNAL Byte_OUT			:	std_logic_vector(7 DOWNTO 0);
SIGNAL READ_Key			:	std_logic;
SIGNAL READ_BYTE		:	std_logic;
SIGNAL End_Operate		:	std_logic; 
SIGNAL TDES_RUNNING		:	std_logic;

TYPE stateSYS IS (TURN_OFF, TURN_ON, END_SERVICE);
TYPE stateDATA IS (IDLE, CHECK_EOF, READ_LINE, READ_CHAR, WAIT_REQUEST, SET_DIN_BUSY, NOTIFY_LAST_BYTE);
TYPE stateKEY  IS (IDLE, CHECK_EOF, READ_LINE, READ_CHAR, CHECK_Read_OK, WAIT_REQUEST, SET_DIN_BUSY, NOTIFY_LAST_BYTE);
TYPE stateWRITING IS (IDLE, WAITING_REQ, WRITING, WRITELINE, END_WRITING);

SIGNAL sysState		: stateSYS;
SIGNAL dataState	: stateDATA;
SIGNAL keyState		: stateKEY;
SIGNAL writeState	: stateWRITING;

SIGNAL tmpByte, DATA_BYTE, KEY_BYTE : std_logic_vector(7 DOWNTO 0);

SIGNAL DATA_OUT : std_logic_vector(7 DOWNTO 0);
SIGNAL lfFlag		: boolean;
BEGIN

ENCRYPT_TOP_01 : ENCRYPT_TOP
   PORT MAP(
      Clk			=> Clk,
      TDES_ON			=> TDES_ON,
      Modes			=> Modes,
      TDES_ENC_DEC		=> TDES_ENC_DEC,
      READ_Byte_ENABLE		=> READ_Byte_ENABLE,
      Byte_IN			=> Byte_IN,
      LAST_Byte			=> LAST_Byte,
      Byte_TRANSFER_ENABLE	=> Byte_TRANSFER_ENABLE,
      Byte_TRANSFER		=> Byte_TRANSFER,
      Byte_OUT			=> Byte_OUT,
      READ_Key			=> READ_Key,
      READ_BYTE			=> READ_BYTE,
      End_Operate		=> End_Operate,
      TDES_RUNNING		=> TDES_RUNNING
   );

-- ============================================================ --
--				SYSTEM				--
-- ============================================================ --

TDES_ON <= '1' WHEN sysState = TURN_ON
	ELSE '0';

Modes <= "000";

TDES_ENC_DEC <= '0';

PROCESS(Clk, Reset)
BEGIN
IF Reset = '1' THEN
   sysState <= TURN_OFF;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE sysState IS
WHEN TURN_OFF =>
   sysState <= TURN_ON;

WHEN TURN_ON =>
   IF End_Operate = '1' THEN
      sysState <= END_SERVICE;
   END IF;

WHEN END_SERVICE =>
   sysState <= END_SERVICE;

END CASE;
END IF;
END PROCESS;

-- B95A0A84EF6E1C7E
-- ============================================================ --
--			     DATA INPUT				--
-- ============================================================ --

PROCESS(Clk, Reset)
FILE DATA : TEXT IS IN "data1.txt";
VARIABLE dataLine : line;
VARIABLE OK : boolean;
VARIABLE BYTE : character;

VARIABLE buf : string(1 to 1);
VARIABLE len : integer := 1;

BEGIN
IF Reset = '1' THEN
   dataState <= IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE dataState IS
WHEN IDLE =>
   IF keyState = NOTIFY_LAST_BYTE THEN
      dataState <= CHECK_EOF;
   END IF;

WHEN CHECK_EOF =>
   IF NOT endfile(data) THEN
      dataState <= READ_LINE;
   ELSE
      dataState <= NOTIFY_LAST_BYTE;
   END IF;

WHEN READ_LINE =>
   --readline(data, dataLine);
   READ(data, buf, len);
   dataLine := new string'(buf(1 to len));
   dataState <= READ_CHAR;

WHEN READ_CHAR =>
   --read(dataLine, BYTE);
   BYTE := dataLine(1);
   Deallocate(dataLine);
   dataState <= WAIT_REQUEST;

WHEN WAIT_REQUEST =>
   DATA_BYTE <= CONV_STD_LOGIC_VECTOR(character'pos(BYTE), 8);
   IF READ_BYTE = '1' THEN
--      IF DATA_BYTE = "00001010" AND NOT lfFlag THEN
--         lfFlag <= TRUE;
--         DATA_BYTE <= "00001101";
--      ELSE
--         lfFlag <= FALSE;
--      END IF;
      dataState <= SET_DIN_BUSY;
   END IF;

WHEN SET_DIN_BUSY =>
   IF READ_BYTE = '0' THEN
--      IF lfFlag THEN
--         DATA_BYTE <= "00001010";
--         dataState <= WAIT_REQUEST;
--      ELSE
         dataState <= CHECK_EOF; --READ_CHAR;
--      END IF;
   END IF;

WHEN NOTIFY_LAST_BYTE =>
   dataState <= NOTIFY_LAST_BYTE;

END CASE;
END IF;
END PROCESS;

--READ_Byte_ENABLE  <= '1' WHEN dataState = WAIT_REQUEST OR dataState = CHECK_READ_OK OR keyState = WAIT_REQUEST OR keyState = CHECK_Read_OK 
--		ELSE '0';

READ_Byte_ENABLE  <= '1' WHEN dataState = WAIT_REQUEST OR dataState = NOTIFY_LAST_BYTE OR keyState = WAIT_REQUEST OR keyState = CHECK_Read_OK 
		ELSE '0';

LAST_Byte <= '1' WHEN dataState = NOTIFY_LAST_BYTE
	ELSE '0';

tmpByte <= "00000000" WHEN dataState = IDLE AND keyState = IDLE
	ELSE DATA_BYTE WHEN dataState = SET_DIN_BUSY
	ELSE KEY_BYTE WHEN keyState = SET_DIN_BUSY
	ELSE tmpByte;

Byte_IN <= tmpByte;

-- ============================================================ --
--				KEYS				--
-- ============================================================ --

PROCESS(Clk, Reset)
FILE key : TEXT IS IN "key.txt";
VARIABLE keyLine : line;
VARIABLE OK : boolean;
VARIABLE BYTE : character;
BEGIN
IF Reset = '1' THEN
   keyState <= IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE keyState IS
WHEN IDLE =>
   keyState <= CHECK_EOF;

WHEN CHECK_EOF =>
   IF NOT endfile(key) THEN
      keyState <= READ_LINE;
   ELSE
      keyState <= NOTIFY_LAST_BYTE;
   END IF;

WHEN READ_LINE =>
   readline(key, keyLine);
   keyState <= READ_CHAR;

WHEN READ_CHAR =>
   read(keyLine, BYTE, OK);
   keyState <= CHECK_Read_OK;

WHEN CHECK_Read_OK =>
   IF OK THEN
      keyState <= WAIT_REQUEST;
   ELSE
      keyState <= CHECK_EOF;
   END IF;

WHEN WAIT_REQUEST =>
   KEY_BYTE <= CONV_STD_LOGIC_VECTOR(character'pos(BYTE), 8);
   IF READ_KEY = '1' THEN
      keyState <= SET_DIN_BUSY;
   END IF;

WHEN SET_DIN_BUSY =>
   IF READ_KEY = '0' THEN
      keyState <= READ_CHAR;
   END IF;

WHEN NOTIFY_LAST_BYTE =>
   keyState <= NOTIFY_LAST_BYTE;

END CASE;
END IF;
END PROCESS;

-- ============================================================ --
--			     DATA OUTPUT			--
-- ============================================================ --

DATA_OUT <= BYTE_OUT;

PROCESS(Clk, Reset)
FILE OUTPUT : TEXT IS OUT "out.txt";
VARIABLE line_out: LINE;
VARIABLE wbuf : STRING(1 to 1);
BEGIN
IF Reset = '1' THEN
   writeState <= IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE writeState IS
WHEN IDLE =>
   writeState <= WAITING_REQ;

WHEN WAITING_REQ =>
   IF Byte_TRANSFER = '1' THEN
      --write(line_out, string'(character'val(conv_integer(DATA_OUT))));
      wbuf(1) := character'val(conv_integer(DATA_OUT));
      line_out := new string'(wbuf(1 to 1));
      write(OUTPUT, line_out.all);
      Deallocate(line_out);
      writeState <= WRITING;
   ELSIF sysState = END_SERVICE THEN
      writeState <= WRITELINE;
   END IF;

WHEN WRITING =>
   IF Byte_TRANSFER = '0' THEN
      writeState <= WAITING_REQ;
   END IF;

WHEN WRITELINE =>
      --writeline(OUTPUT, line_out);
      writeState <= END_WRITING;

WHEN END_WRITING =>
      writeState <= END_WRITING;

END CASE;
END IF;
END PROCESS;

Byte_TRANSFER_ENABLE <= '1' WHEN writeState = WAITING_REQ
	ELSE '0';

END TDES_tb_arch;