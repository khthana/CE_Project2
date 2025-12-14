LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_textio.all;

LIBRARY std;
USE std.textio.ALL;

ENTITY MD5_tb IS
   PORT (
      Clk			: IN	std_logic;
      Reset			: IN	std_logic
   );
END MD5_tb;

ARCHITECTURE MD5_tb_arch OF MD5_tb IS
COMPONENT HASH_IMPORT
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
END COMPONENT;

COMPONENT MD5
   PORT(
	Clk			: IN	std_logic;
	MD5_ON			: IN	std_logic;
	LAST_Block		: IN	std_logic;
	DXtIN			: IN	std_logic_vector(0 TO 511);
	DXtIN_Completed		: IN	std_logic;
	DXtOUT_Completed	: IN	std_logic;
	DXtIN_REQ		: OUT	std_logic;
	DXtOUT_ON		: OUT	std_logic;
	MD5_OUTPUT		: OUT	std_logic_vector(0 TO 127);
	End_Operate		: OUT	std_logic;
	MD5_RUNNING		: OUT	std_logic
   );
END COMPONENT;

COMPONENT HASH_EXPORT
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
END COMPONENT;

SIGNAL writeCounter		: std_logic_vector(4 DOWNTO 0);

SIGNAL DXtIN_REQ			:	std_logic;

SIGNAL LAST_Block			:	std_logic;
SIGNAL DXtIN				:	std_logic_vector(0 TO 511);
SIGNAL DXtIN_Completed			:	std_logic;
SIGNAL DXtOUT_Completed			:	std_logic;

SIGNAL DXtIN_ON, DXtOUT_ON		:	std_logic;

SIGNAL DXtOUT				:	std_logic_vector(0 TO 159);
SIGNAL DXtOUT_MD5			:	std_logic_vector(0 TO 127);

SIGNAL DXtOUT_MODE			:	std_logic;

SIGNAL MD5_RUNNING			:	std_logic;
SIGNAL MD5_ON			:	std_logic;
SIGNAL READ_Byte_ENABLE		:	std_logic;
SIGNAL Byte_IN			:	std_logic_vector(7 DOWNTO 0);
SIGNAL LAST_Byte		:	std_logic;
SIGNAL Byte_TRANSFER_ENABLE	:	std_logic;
SIGNAL Byte_TRANSFER		:	std_logic;
SIGNAL Byte_OUT			:	std_logic_vector(7 DOWNTO 0);
SIGNAL READ_BYTE		:	std_logic;
SIGNAL End_Operate		:	std_logic; 
SIGNAL HASH_RUNNING		:	std_logic;

TYPE stateSYS IS (TURN_OFF, TURN_ON, END_SERVICE);
TYPE stateDATA IS (IDLE, CHECK_EOF, READ_LINE, READ_CHAR, CHECK_Read_OK, WAIT_REQUEST, SET_DIN_BUSY, NOTIFY_LAST_BYTE);
TYPE stateWRITING IS (IDLE, WAITING_REQ, WRITING, Check_End_Operate, END_OPERATION);

SIGNAL sysState		: stateSYS;
SIGNAL dataState	: stateDATA;
SIGNAL writeState	: stateWRITING;

SIGNAL DATA_BYTE, KEY_BYTE : std_logic_vector(7 DOWNTO 0);

SIGNAL DATA_OUT : std_logic_vector(7 DOWNTO 0);
BEGIN

HASH_IMPORT_01 : HASH_IMPORT
   PORT MAP(
	Clk			=> Clk,
	DXtIN_ON		=> DXtIN_ON,
	DXtIN_REQ		=> DXtIN_REQ,
	READ_Byte_ENABLE	=> READ_Byte_ENABLE,
	Byte_IN			=> Byte_IN,
	LAST_Byte		=> LAST_Byte,
	READ_Byte		=> READ_Byte,
	LAST_Block		=> LAST_Block,
	DXtIN			=> DXtIN,
	DXtIN_Completed		=> DXtIN_Completed
   );

MD5_01 : MD5
   PORT MAP(
	Clk			=> Clk,
	MD5_ON			=> MD5_ON,
	LAST_Block		=> LAST_Block,
	DXtIN			=> DXtIN,
	DXtIN_Completed		=> DXtIN_Completed,
	DXtOUT_Completed	=> DXtOUT_Completed,
	DXtIN_REQ		=> DXtIN_REQ,
	DXtOUT_ON		=> DXtOUT_ON,
	MD5_OUTPUT		=> DXtOUT_MD5,
	End_Operate		=> End_Operate,
	MD5_RUNNING		=> MD5_RUNNING
   );

HASH_EXPORT_01 : HASH_EXPORT
   PORT MAP(
	Clk			=> Clk,
	DXtOUT_ON		=> DXtOUT_ON,
	DXtOUT			=> DXtOUT,
	DXtOUT_MODE		=> DXtOUT_MODE,
	Byte_TRANSFER_ENABLE	=> Byte_TRANSFER_ENABLE,
	Byte_TRANSFER		=> Byte_TRANSFER,
	Byte_OUT		=> Byte_OUT,
	DXtOUT_Completed	=> DXtOUT_Completed
   );


-- ============================================================ --
--				SYSTEM				--
-- ============================================================ --

MD5_ON <= '0' WHEN sysState = TURN_OFF
	ELSE '1';

DXtOUT_MODE <= '1';

DXtOUT		<= DXtOUT_MD5 & "00000000000000000000000000000000" WHEN MD5_ON = '1'
		ELSE (OTHERS => '0');

DXtIN_ON	<= MD5_ON;

HASH_RUNNING <= MD5_RUNNING;

PROCESS(Clk, Reset)
BEGIN
IF Reset = '1' THEN
   sysState <= TURN_OFF;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE sysState IS
WHEN TURN_OFF =>
   IF HASH_RUNNING = '0' THEN
      sysState <= TURN_ON;
   END IF;

WHEN TURN_ON =>
   IF End_Operate = '1' THEN
      sysState <= END_SERVICE;
   END IF;

WHEN END_SERVICE =>
   sysState <= END_SERVICE;

END CASE;
END IF;
END PROCESS;


-- ============================================================ --
--			     DATA INPUT				--
-- ============================================================ --

PROCESS(Clk, Reset)
FILE DATA : TEXT IS IN "1a.txt";
VARIABLE dataLine : line;
VARIABLE OK : boolean;
VARIABLE BYTE : character;
BEGIN
IF Reset = '1' THEN
   dataState <= IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE dataState IS
WHEN IDLE =>
   dataState <= CHECK_EOF;

WHEN CHECK_EOF =>
   IF NOT endfile(data) THEN
      dataState <= READ_LINE;
   ELSE
      dataState <= NOTIFY_LAST_BYTE;
   END IF;

WHEN READ_LINE =>
   readline(data, dataLine);
   dataState <= READ_CHAR;

WHEN READ_CHAR =>
   read(dataLine, BYTE, OK);
   dataState <= CHECK_Read_OK;

WHEN CHECK_Read_OK =>
   IF OK THEN
      dataState <= WAIT_REQUEST;
   ELSE
      dataState <= CHECK_EOF;
   END IF;

WHEN WAIT_REQUEST =>
   DATA_BYTE <= CONV_STD_LOGIC_VECTOR(character'pos(BYTE), 8);
   IF READ_BYTE = '1' THEN
      dataState <= SET_DIN_BUSY;
   END IF;

WHEN SET_DIN_BUSY =>
   IF READ_BYTE = '0' THEN
      dataState <= READ_CHAR;
   END IF;

WHEN NOTIFY_LAST_BYTE =>
   dataState <= NOTIFY_LAST_BYTE;

END CASE;
END IF;
END PROCESS;

READ_Byte_ENABLE  <= '1' WHEN dataState = WAIT_REQUEST OR dataState = CHECK_READ_OK
		ELSE '0';

LAST_Byte <= '1' WHEN dataState = NOTIFY_LAST_BYTE
	ELSE '0';

Byte_IN <= DATA_BYTE;-- WHEN dataState = SET_DIN_BUSY
	--ELSE (OTHERS => '0');

-- ============================================================ --
--			     DATA OUTPUT			--
-- ============================================================ --

DATA_OUT <= BYTE_OUT;

PROCESS(Clk, Reset)
FILE OUTPUT : TEXT IS OUT "out.txt";
VARIABLE line_out: Line;
BEGIN
IF Reset = '1' THEN
   writeState <= IDLE;
ELSIF Clk'EVENT AND Clk = '1' THEN
CASE writeState IS
WHEN IDLE =>
   writeCounter <= "00000";
   IF HASH_RUNNING = '1' THEN
      writeState <= WAITING_REQ;
   END IF;

WHEN WAITING_REQ =>
   IF Byte_TRANSFER = '1' THEN
      hwrite(line_out, DATA_OUT);
      writeCounter <= writeCounter + 1;
      writeState <= WRITING;
   END IF;

WHEN WRITING =>
   IF Byte_TRANSFER = '0' THEN
      writeState <= Check_End_Operate;
   END IF;

WHEN Check_End_Operate =>
   IF writeCounter /= "10000" THEN
      writeState <= WAITING_REQ;
   ELSE
      writeline(OUTPUT, line_out);
      writeState <= END_OPERATION;
   END IF;

WHEN END_OPERATION =>
   writeState <= END_OPERATION;
END CASE;
END IF;
END PROCESS;

Byte_TRANSFER_ENABLE <= '1' WHEN writeState = WAITING_REQ
	ELSE '0';

END MD5_tb_arch;