LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY ENCRYPT_TOP IS
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
END ENCRYPT_TOP;

ARCHITECTURE ENCRYPT_TOP OF ENCRYPT_TOP IS

COMPONENT Triple_DES
   PORT(
      Clk			: IN	std_logic;
      TDES_ON			: IN	std_logic;
      Modes			: IN	std_logic_vector (2 DOWNTO 0);
      TDES_ENC_DEC		: IN	std_logic;
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
      End_Operate		: OUT	std_logic;
      TDES_RUNNING		: OUT	std_logic
   );
END COMPONENT;

COMPONENT RNG
   PORT (
      Clk			: IN	std_logic;
      RNG_REQ			: IN	std_logic;
      Byte_IN			: IN	std_logic_vector(7 DOWNTO 0);
      Rnd_OUT			: OUT	std_logic_vector (0 TO 63);
      Returned			: OUT	std_logic
   );
END COMPONENT;

SIGNAL IV_READY			:	std_logic;
SIGNAL IV_INPUT			:	std_logic_vector(0 TO 63);
SIGNAL IV_REQ			:	std_logic;

BEGIN

Triple_DES_01 : Triple_DES
   PORT MAP (
      Clk			=> Clk,
      TDES_ON			=> TDES_ON,
      Modes			=> Modes,
      TDES_ENC_DEC		=> TDES_ENC_DEC,
      IV_READY			=> IV_READY,
      IV_INPUT			=> IV_INPUT,
      READ_Byte_ENABLE		=> READ_Byte_ENABLE,
      Byte_IN			=> Byte_IN,
      LAST_Byte			=> LAST_Byte,
      Byte_TRANSFER_ENABLE	=> Byte_TRANSFER_ENABLE,
      Byte_TRANSFER		=> Byte_TRANSFER,
      Byte_OUT			=> Byte_OUT,
      READ_Key			=> READ_Key,
      READ_BYTE			=> READ_BYTE,
      IV_REQ			=> IV_REQ,
      End_Operate		=> End_Operate,
      TDES_RUNNING		=> TDES_RUNNING
   );

TRNG_01 : RNG
   PORT MAP(
      Clk			=> Clk,
      RNG_REQ			=> IV_REQ,
      Byte_IN			=> Byte_IN,
      Rnd_OUT			=> IV_INPUT,
      Returned			=> IV_READY
   );

END ENCRYPT_TOP;