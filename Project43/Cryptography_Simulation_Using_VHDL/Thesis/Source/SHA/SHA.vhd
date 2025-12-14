LIBRARY ieee ;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

-- ENTITY declarations
-- Area 15262 gates

ENTITY SHA IS
   PORT( 
	Clk			: IN	std_logic;
	SHA_ON			: IN	std_logic;
	LAST_Block		: IN	std_logic;
	DXtIN			: IN	std_logic_vector(0 TO 511);
	DXtIN_Completed		: IN	std_logic;
	DXtOUT_Completed	: IN	std_logic; -- from HASH_EXPORT
	DXtIN_REQ		: OUT	std_logic;
	DXtOUT_ON		: OUT	std_logic;
	DXtOUT			: OUT	std_logic_vector(0 TO 159);
	End_Operate		: OUT	std_logic;
	SHA_RUNNING		: OUT	std_logic
   );
END SHA;


-- Architecture space --

LIBRARY CryptoChip;

ARCHITECTURE SHA_arch OF SHA IS

COMPONENT SHA_EXECUTIVE
   PORT( 
      Clk			: IN	std_logic; -- from Ext System
      SHA_ON			: IN	std_logic; -- from Algorithm Decoder
      HASH_Completed		: IN	std_logic; -- from SHA_HASH_Core
      LAST_Block		: IN	std_logic; -- from HASH_IMPORT
      DXtOUT_Completed		: IN	std_logic; -- from HASH_EXPORT
      DXtOUT_ON			: OUT	std_logic; -- to HASH_EXPORT
      INIT_ON			: OUT	std_logic; -- to SHA_WORD_INITIALIZER
      CORE_ON			: OUT	std_logic; -- to SHA_HASH_CORE
      End_Operate		: OUT	std_logic; -- to External System
      SHA_RUNNING		: OUT	std_logic  -- to External System
   );
END COMPONENT;

COMPONENT SHA_Ft
   PORT(
	Arg_REQ			: IN	std_logic;			-- from SHA_HASH_Core
	F_K_Times		: IN	std_logic_vector(4 DOWNTO 0);	-- from SHA_HASH_Core
	Buff_B			: IN	std_logic_vector(31 DOWNTO 0);	-- from SHA_HASH_Core
	Buff_C			: IN	std_logic_vector(31 DOWNTO 0);	-- from SHA_HASH_Core
	Buff_D			: IN	std_logic_vector(31 DOWNTO 0);	-- from SHA_HASH_Core
	Ft			: OUT	std_logic_vector(31 DOWNTO 0);	-- to SHA_HASH_Core
	Ft_READY		: OUT	std_logic			-- to SHA_HASH_Core
   );
END COMPONENT;

COMPONENT SHA_HASH_Core
   PORT( 
	Clk			: IN	std_logic;
	SHA_HASH_ON		: IN	std_logic; -- from SHA_ON
	CORE_ON			: IN	std_logic;
	Wt			: IN	std_logic_vector(31 DOWNTO 0); -- from SHA_WORD_INITIALIZER
	Wt_READY		: IN	std_logic; -- from SHA_WORD_INITIALIZER
	Kt			: IN	std_logic_vector(31 DOWNTO 0); -- from SHA_Kt
	Kt_READY		: IN	std_logic; -- from SHA_Kt
	Ft			: IN	std_logic_vector(31 DOWNTO 0); -- from SHA_Ft
	Ft_READY		: IN	std_logic; -- from SHA_Ft
	Arg_REQ			: OUT	std_logic; -- Wt_REQ, Ft_REQ, Kt_REQ
	W_Times			: OUT	std_logic_vector(3 DOWNTO 0); -- to SHA_WORD_INITIALIZER
	F_K_Times		: OUT	std_logic_vector(4 DOWNTO 0); -- 0 to 4, 5 to 9, 10 to 14, 15 to 19
	Buff_B			: OUT	std_logic_vector(31 DOWNTO 0); -- to SHA_Ft
	Buff_C			: OUT	std_logic_vector(31 DOWNTO 0); -- to SHA_Ft
	Buff_D			: OUT	std_logic_vector(31 DOWNTO 0); -- to SHA_Ft
	HASH_OUTPUT		: OUT	std_logic_vector(0 TO 159); -- to HASH_EXPORT
	HASH_Completed		: OUT	std_logic -- to SHA_EXECUTIVE;
   );
END COMPONENT;

COMPONENT SHA_Kt
   PORT(
	Arg_REQ			: IN	std_logic; -- from SHA_HASH_Core
	F_K_Times		: IN	std_logic_vector(4 DOWNTO 0);  -- from SHA_HASH_Core
	Kt			: OUT	std_logic_vector(31 DOWNTO 0); -- to SHA_HASH_Core
	Kt_READY		: OUT	std_logic   -- to SHA_HASH_Core
   );
END COMPONENT;

COMPONENT SHA_WORD_INITIALIZER
   PORT( 
	Clk			: IN	std_logic;
	INIT_ON			: IN	std_logic; -- connect to INIT_ON of SHA_EXECUTIVE
	Wt_REQ			: IN	std_logic; -- Request from HASH_Core
	Times			: IN	std_logic_vector(3 DOWNTO 0);
	DXtIN_Completed		: IN	std_logic; -- from HASH_IMPORT
	DXtIN			: IN	std_logic_vector(0 TO 511); -- from HASH_IMPORT
	DXtIN_REQ		: OUT	std_logic; -- to HASH_IMPORT
	Wt			: OUT	std_logic_vector(31 DOWNTO 0); -- to SHA_HASH_Core
	Wt_READY		: OUT	std_logic  -- to SHA_HASH_Core
   );
END COMPONENT;

SIGNAL HASH_Completed		:	std_logic;
SIGNAL INIT_ON			:	std_logic;
SIGNAL CORE_ON			:	std_logic;
SIGNAL Arg_REQ			:	std_logic;
SIGNAL Wt_READY			:	std_logic;
SIGNAL Ft_READY			:	std_logic;
SIGNAL Kt_READY			:	std_logic;
SIGNAL Wt			:	std_logic_vector(31 DOWNTO 0);
SIGNAL Ft			:	std_logic_vector(31 DOWNTO 0);
SIGNAL Kt			:	std_logic_vector(31 DOWNTO 0);
SIGNAL W_Times			:	std_logic_vector(3 DOWNTO 0);
SIGNAL F_K_Times		:	std_logic_vector(4 DOWNTO 0);
SIGNAL Buff_B			:	std_logic_vector(31 DOWNTO 0);
SIGNAL Buff_C			:	std_logic_vector(31 DOWNTO 0);
SIGNAL Buff_D			:	std_logic_vector(31 DOWNTO 0);

BEGIN

SHA_EXECUTIVE_01 : SHA_EXECUTIVE
   PORT MAP ( 
      Clk			=> Clk,
      SHA_ON			=> SHA_ON,
      HASH_Completed		=> HASH_Completed,
      LAST_Block		=> LAST_Block,
      DXtOUT_Completed		=> DXtOUT_Completed,
      DXtOUT_ON			=> DXtOUT_ON,
      INIT_ON			=> INIT_ON,
      CORE_ON			=> CORE_ON,
      End_Operate		=> End_Operate,
      SHA_RUNNING		=> SHA_RUNNING
   );

SHA_Ft_01 : SHA_Ft
   PORT MAP(
	Arg_REQ			=> Arg_REQ,
	F_K_Times		=> F_K_Times,
	Buff_B			=> Buff_B,
	Buff_C			=> Buff_C,
	Buff_D			=> Buff_D,
	Ft			=> Ft,
	Ft_READY		=> Ft_READY
   );

SHA_HASH_Core_01 : SHA_HASH_Core
   PORT MAP( 
	Clk			=> Clk,
	SHA_HASH_ON		=> SHA_ON,
	CORE_ON			=> CORE_ON,
	Wt			=> Wt,
	Wt_READY		=> Wt_READY,
	Kt			=> Kt,
	Kt_READY		=> Kt_READY,
	Ft			=> Ft,
	Ft_READY		=> Ft_READY,
	Arg_REQ			=> Arg_REQ,
	W_Times			=> W_Times,
	F_K_Times		=> F_K_Times,
	Buff_B			=> Buff_B,
	Buff_C			=> Buff_C,
	Buff_D			=> Buff_D,
	HASH_OUTPUT		=> DXtOUT,
	HASH_Completed		=> HASH_Completed
   );

SHA_Kt_01 : SHA_Kt
   PORT MAP(
	Arg_REQ			=> Arg_REQ,
	F_K_Times		=> F_K_Times,
	Kt			=> Kt,
	Kt_READY		=> Kt_READY
   );

SHA_WORD_INITIALIZER_01 : SHA_WORD_INITIALIZER
   PORT MAP( 
	Clk			=> Clk,
	INIT_ON			=> INIT_ON,
	Wt_REQ			=> Arg_REQ,
	Times			=> W_Times,
	DXtIN_Completed		=> DXtIN_Completed,
	DXtIN			=> DXtIN,
	DXtIN_REQ		=> DXtIN_REQ,
	Wt			=> Wt,
	Wt_READY		=> Wt_READY
   );

END SHA_arch;