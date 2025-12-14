-- Total accumulated area : 
-- Number of BUFG :                        1
-- Number of CLB Flip Flops :             20
-- Number of CLB Latches :               341
-- Number of FG Function Generators :    916
-- Number of H Function Generators :     192
-- Number of IBUF :                       78
-- Number of IOB Input Flip Flops :        3
-- Number of OBUF :                       14
-- Number of Packed CLBs :               467

--***********************************************
--Device Utilization for 4013xlPQ160
--***********************************************
--Resource                Used    Avail   Utilization
-------------------------------------------------
--IOs                     96      112      85.71%
--FG Function Generators  916     1152     79.51%
--H Function Generators   192     576      33.33%
--CLB Flip Flops          20      1152      1.74%

-------------------------------------------------
--                        Clock Frequency Report

--	Clock                : Frequency
      ------------------------------------

--	Clk                  : 36.3 MHz
--	8194 gates
LIBRARY ieee ; -- 131 Mbps on device 4013XL-PQ160 speed -3
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Triple_DES IS
   PORT(
      Clk			: IN	std_logic; -- Clock signal
      TDES_ON			: IN	std_logic; -- interact with Algorithm Decoder
      Modes			: IN	std_logic_vector (2 DOWNTO 0); -- interact with Algorithm Decoder
      TDES_ENC_DEC		: IN	std_logic; -- interact with Algorithm Decoder
      IV_READY			: IN	std_logic;
      IV_INPUT			: IN	std_logic_vector(0 TO 63);
      READ_Byte_ENABLE		: IN	std_logic;
      Byte_IN			: IN	std_logic_vector(7 DOWNTO 0);
      LAST_Byte			: IN	std_logic;
      Byte_TRANSFER_ENABLE	: IN	std_logic;
      Byte_TRANSFER		: OUT	std_logic;
      Byte_OUT			: OUT	std_logic_vector(7 DOWNTO 0);
      READ_Key			: OUT	std_logic;
      READ_BYTE			: OUT	std_logic;
      IV_REQ			: OUT	std_logic;
      End_Operate		: OUT	std_logic; -- interact with external system
      TDES_RUNNING		: OUT	std_logic  -- interact with external system
   );

-- Declarations

END Triple_DES;

-- renoir interface_end

--LIBRARY ieee ;
--USE ieee.std_logic_1164.ALL;
--USE ieee.std_logic_arith.ALL;

LIBRARY CryptoChip;

ARCHITECTURE Triple_DES_arch OF Triple_DES IS

COMPONENT Triple_DES_CTRL
   PORT(
      Clk			: IN	std_logic; -- Clock signal
      TDES_ON			: IN	std_logic; -- interact with Algorithm Decoder
      Modes			: IN	std_logic_vector (2 DOWNTO 0); -- interact with Algorithm Decoder
      TDES_ENC_DEC		: IN	std_logic; -- interact with Algorithm Decoder
      TCore_Completed		: IN	std_logic; -- control for TDES_Core
      Keys_Completed		: IN	std_logic;
      IV_Completed		: IN	std_logic;
      DBUS_IN_Completed		: IN	std_logic; -- control for DATA_IMPORT
      LAST_Data			: IN	std_logic; -- control for DATA_IMPORT
      TCore_ON			: OUT	std_logic; -- control for TDES_Core
      TRANSFORM_ON		: OUT	std_logic; -- control for TDES_Core
      CoreMode			: OUT	std_logic_vector(2 DOWNTO 0); -- control for TDES_Core
      KIN_ON			: OUT	std_logic; -- control for TDES_KEY_READER
      IVIN_ON			: OUT	std_logic;
      DIN_ON			: OUT	std_logic; -- control for DATA_IMPORT
      IV_Mode			: OUT	std_logic;
      DBUS_Mode			: OUT	std_logic_vector(2 DOWNTO 0); -- control for DATA_IMPORT & DATA_EXPORT (key/data selected)
      End_Operate		: OUT	std_logic; -- interact with external system "3DES has finished operation!!!"
      TDES_RUNNING		: OUT	std_logic  -- interact with external system
   );
END COMPONENT;

COMPONENT TDES_KEY_SCHEDULER
   PORT (
      Clk			: IN	std_logic;
      TKEY_ON			: IN	std_logic; -- connect to Keys_Completed of TDES_KEY_READER
      SUBKEY_REQ		: IN	std_logic; -- connect to TDES_TRANSFORMER
      TDES_ENC_DEC		: IN	std_logic; 			-- interact with Algorithm Decoder
      KMode			: IN	std_logic_vector(1 DOWNTO 0);
      Key1			: IN	std_logic_vector(0 TO 63);
      Key2			: IN	std_logic_vector(0 TO 63);
      Key3			: IN	std_logic_vector(0 TO 63);
      Ki			: OUT	std_logic_vector(0 TO 47); 	-- connected to Data Bus of DATA_EXPORT
      SUBKEY_Completed		: OUT	std_logic
   );
END COMPONENT;

COMPONENT TDES_KEY_READER
   PORT (
      Clk			: IN	std_logic;
      KIN_ON			: IN	std_logic; -- connect to 3DES_CTRL
      Byte_IN			: IN	std_logic_vector(7 DOWNTO 0);
      READ_Byte_ENABLE		: IN	std_logic;
      READ_Key			: OUT	std_logic;
      Key1			: OUT	std_logic_vector(0 TO 63);
      Key2			: OUT	std_logic_vector(0 TO 63);
      Key3			: OUT	std_logic_vector(0 TO 63);
      Keys_Completed		: OUT	std_logic
   );
END COMPONENT;

COMPONENT TDES_Core
   PORT (
      Clk			: IN	std_logic;
      TCore_ON			: IN	std_logic;
      TRANSFORM_ON		: IN	std_logic;
      TDES_ENC_DEC		: IN	std_logic; 			-- interact with Algorithm Decoder
      CoreMode			: IN	std_logic_vector(2 DOWNTO 0);
      Data			: IN	std_logic_vector(0 TO 63); 	-- connected to Data Bus of DATA_IMPORT
      IV			: IN	std_logic_vector(0 TO 63);
      Ki			: IN	std_logic_vector(0 TO 47);
      SUBKEY_Completed		: IN	std_logic;
      DOUT_Completed		: IN	std_logic;
      DOUT_ON			: OUT	std_logic;
      DOUT_Mode			: OUT	std_logic_vector(2 DOWNTO 0);
      SUBKEY_REQ		: OUT	std_logic;
      CryptOUT			: OUT	std_logic_vector(0 TO 63); 	-- connected to Data Bus of DATA_EXPORT
      TCore_Completed		: OUT	std_logic
   );
END COMPONENT;

COMPONENT TDES_IV_READER
   PORT (
	Clk			: IN	std_logic;
	IVIN_ON			: IN	std_logic;
	IV_Mode			: IN	std_logic;
	IV_READY		: IN	std_logic;
	IV_INPUT		: IN	std_logic_vector(0 TO 63);
	Byte_IN			: IN	std_logic_vector(7 DOWNTO 0);
	READ_Byte_ENABLE	: IN	std_logic;
	READ_BYTE		: OUT	std_logic;
	IV_REQ			: OUT	std_logic;
	IV			: OUT	std_logic_vector(0 TO 63);
	IV_Completed		: OUT	std_logic
   );
END COMPONENT;

COMPONENT DATA_IMPORT
   PORT (
	Clk			: IN	std_logic;
	DIN_ON			: IN	std_logic;
	Byte_IN			: IN	std_logic_vector(7 DOWNTO 0);
	LAST_Byte		: IN	std_logic;
	DBUS_Mode		: IN	std_logic_vector(2 DOWNTO 0); -- xyy => x : Read instruction | yy : 8/16/32/64 bits
	READ_Byte_ENABLE	: IN	std_logic;
	READ_Byte		: OUT	std_logic;
	DBUS_IN			: OUT	std_logic_vector(0 TO 63);
	LAST_Data		: OUT	std_logic;
	DBUS_IN_Completed	: OUT	std_logic
   );
END COMPONENT;

COMPONENT DATA_EXPORT
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
END COMPONENT;

SIGNAL TCore_Completed		: std_logic;
SIGNAL Key1, Key2, Key3		: std_logic_vector(0 TO 63);
SIGNAL Ki			: std_logic_vector(0 TO 47);
SIGNAL Keys_Completed		: std_logic;
SIGNAL SUBKEY_REQ		: std_logic;
SIGNAL SUBKEY_Completed		: std_logic;
SIGNAL IV			: std_logic_vector(0 TO 63);
SIGNAL IV_Completed		: std_logic;
SIGNAL READ_BYTE1, READ_BYTE2	: std_logic;
SIGNAL DBUS_IN_Completed	: std_logic;
SIGNAL DBUS_IN			: std_logic_vector(0 TO 63);
SIGNAL DBUS_OUT			: std_logic_vector(0 TO 63);
SIGNAL DOUT_Completed		: std_logic;
SIGNAL LAST_Data		: std_logic;
SIGNAL TCore_ON			: std_logic;
SIGNAL TRANSFORM_ON		: std_logic;
SIGNAL CoreMode			: std_logic_vector(2 DOWNTO 0);
SIGNAL KIN_ON			: std_logic;
SIGNAL IVIN_ON			: std_logic;
SIGNAL DIN_ON			: std_logic;
SIGNAL DOUT_ON			: std_logic;
SIGNAL IV_Mode			: std_logic;
SIGNAL DBUS_Mode		: std_logic_vector(2 DOWNTO 0);
SIGNAL DOUT_Mode		: std_logic_vector(2 DOWNTO 0);

BEGIN

READ_BYTE <= READ_BYTE1 OR READ_BYTE2;

Triple_DES_CTRL_01 : Triple_DES_CTRL
   PORT MAP (
      Clk			=> Clk,
      TDES_ON			=> TDES_ON,
      Modes			=> Modes,
      TDES_ENC_DEC		=> TDES_ENC_DEC,
      TCore_Completed		=> TCore_Completed,
      Keys_Completed		=> Keys_Completed,
      IV_Completed		=> IV_Completed,
      DBUS_IN_Completed		=> DBUS_IN_Completed,
      LAST_Data			=> LAST_Data,
      TCore_ON			=> TCore_ON,
      TRANSFORM_ON		=> TRANSFORM_ON,
      CoreMode			=> CoreMode,
      KIN_ON			=> KIN_ON,
      IVIN_ON			=> IVIN_ON,
      DIN_ON			=> DIN_ON,
      IV_Mode			=> IV_Mode,
      DBUS_Mode			=> DBUS_Mode,
      End_Operate		=> End_Operate,
      TDES_RUNNING		=> TDES_RUNNING
   );
TDES_KEY_SCHEDULER_01 : TDES_KEY_SCHEDULER
   PORT MAP (
      Clk			=> Clk,
      TKEY_ON			=> Keys_Completed,
      SUBKEY_REQ		=> SUBKEY_REQ,
      TDES_ENC_DEC		=> TDES_ENC_DEC,
      KMode			=> Modes(2 DOWNTO 1),
      Key1			=> Key1,
      Key2			=> Key2,
      Key3			=> Key3,
      Ki			=> Ki,
      SUBKEY_Completed		=> SUBKEY_Completed
   );

TDES_KEY_READER_01 : TDES_KEY_READER
   PORT MAP (
      Clk			=> Clk,
      KIN_ON			=> KIN_ON,
      Byte_IN			=> Byte_IN,
      READ_Byte_ENABLE		=> READ_Byte_ENABLE,
      READ_Key			=> READ_Key,
      Key1			=> Key1,
      Key2			=> Key2,
      Key3			=> Key3,
      Keys_Completed		=> Keys_Completed
   );

TDES_Core_01 : TDES_Core
   PORT MAP (
      Clk			=> Clk,
      TCore_ON			=> TCore_ON,
      TRANSFORM_ON		=> TRANSFORM_ON,
      TDES_ENC_DEC		=> TDES_ENC_DEC,
      CoreMode			=> CoreMode,
      Data			=> DBUS_IN,
      IV			=> IV,
      Ki			=> Ki,
      SUBKEY_Completed		=> SUBKEY_Completed,
      DOUT_Completed		=> DOUT_Completed,
      DOUT_ON			=> DOUT_ON,
      DOUT_Mode			=> DOUT_Mode,
      SUBKEY_REQ		=> SUBKEY_REQ,
      CryptOUT			=> DBUS_OUT,
      TCore_Completed		=> TCore_Completed
   );

TDES_IV_READER_01 : TDES_IV_READER
   PORT MAP (
	Clk			=> Clk,
	IVIN_ON			=> IVIN_ON,
	IV_Mode			=> IV_Mode,
	IV_READY		=> IV_READY,
	IV_INPUT		=> IV_INPUT,
	Byte_IN			=> Byte_IN,
	READ_Byte_ENABLE	=> READ_Byte_ENABLE,
	READ_BYTE		=> READ_BYTE1,
	IV_REQ			=> IV_REQ,
	IV			=> IV,
	IV_Completed		=> IV_Completed
   );

DATA_IMPORT_01 : DATA_IMPORT
   PORT MAP (
	Clk			=> Clk,
	DIN_ON			=> DIN_ON,
	Byte_IN			=> Byte_IN,
	LAST_Byte		=> LAST_Byte,
	DBUS_Mode		=> DBUS_Mode,
	READ_Byte_ENABLE	=> READ_Byte_ENABLE,
	READ_BYTE		=> READ_BYTE2,
	DBUS_IN			=> DBUS_IN,
	LAST_Data		=> LAST_Data,
	DBUS_IN_Completed	=> DBUS_IN_Completed
   );

DATA_EXPORT_01 : DATA_EXPORT
   PORT MAP (
      Clk			=> Clk,
      DOUT_ON			=> DOUT_ON,
      DBUS_OUT			=> DBUS_OUT,
      DOUT_Mode			=> DOUT_Mode,
      Byte_TRANSFER_ENABLE	=> Byte_TRANSFER_ENABLE,
      Byte_TRANSFER		=> Byte_TRANSFER,
      Byte_OUT			=> Byte_OUT,
      DOUT_Completed		=> DOUT_Completed
   );

END Triple_DES_arch;