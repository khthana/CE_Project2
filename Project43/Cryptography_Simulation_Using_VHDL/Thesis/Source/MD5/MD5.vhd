LIBRARY ieee;	-- 36.8 MHz (about 58 Mbps) on 4000XL technology
		-- 139 Mbps on VIRTEX
		-- 21327 gates
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.ALL;

ENTITY MD5 IS
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
END MD5;


LIBRARY CryptoChip;

ARCHITECTURE MD5_arch OF MD5 IS

COMPONENT MD5_CTRL
   PORT( 
	Clk			: IN	std_logic;
	MD5_ON			: IN	std_logic;
	RegAA			: IN	std_logic_vector(31 DOWNTO 0);
	RegBB			: IN	std_logic_vector(31 DOWNTO 0);
	RegCC			: IN	std_logic_vector(31 DOWNTO 0);
	RegDD			: IN	std_logic_vector(31 DOWNTO 0);
	II_Completed		: IN	std_logic;
	LAST_Block		: IN	std_logic;
	DXtIN			: IN	std_logic_vector(0 TO 511);
	DXtIN_Completed		: IN	std_logic;
	DXtOUT_Completed	: IN	std_logic;
	DXtIN_REQ		: OUT	std_logic;
	DXtOUT_ON		: OUT	std_logic;
	FF_ON			: OUT	std_logic;
	M_Block			: OUT	std_logic_vector(0 TO 511);
	RegA			: OUT	std_logic_vector(31 DOWNTO 0);
	RegB			: OUT	std_logic_vector(31 DOWNTO 0);
	RegC			: OUT	std_logic_vector(31 DOWNTO 0);
	RegD			: OUT	std_logic_vector(31 DOWNTO 0);
	End_Operate		: OUT	std_logic;
	MD5_RUNNING		: OUT	std_logic
   );
END COMPONENT;

COMPONENT MD5_FF
   PORT (
	Clk			: IN	std_logic;
	FF_ON			: IN	std_logic;
	M_Block			: IN	std_logic_vector(0 TO 511);
	RegA			: IN	std_logic_vector(31 DOWNTO 0);
	RegB			: IN	std_logic_vector(31 DOWNTO 0);
	RegC			: IN	std_logic_vector(31 DOWNTO 0);
	RegD			: IN	std_logic_vector(31 DOWNTO 0);
	RegAA			: OUT	std_logic_vector(31 DOWNTO 0);
	RegBB			: OUT	std_logic_vector(31 DOWNTO 0);
	RegCC			: OUT	std_logic_vector(31 DOWNTO 0);
	RegDD			: OUT	std_logic_vector(31 DOWNTO 0);
	FF_Completed		: OUT	std_logic -- to MD5_GG
   );
END COMPONENT;

COMPONENT MD5_GG
   PORT (
	Clk			: IN	std_logic;
	GG_ON			: IN	std_logic;
	M_Block			: IN	std_logic_vector(0 TO 511);
	RegA			: IN	std_logic_vector(31 DOWNTO 0);
	RegB			: IN	std_logic_vector(31 DOWNTO 0);
	RegC			: IN	std_logic_vector(31 DOWNTO 0);
	RegD			: IN	std_logic_vector(31 DOWNTO 0);
	RegAA			: OUT	std_logic_vector(31 DOWNTO 0);
	RegBB			: OUT	std_logic_vector(31 DOWNTO 0);
	RegCC			: OUT	std_logic_vector(31 DOWNTO 0);
	RegDD			: OUT	std_logic_vector(31 DOWNTO 0);
	GG_Completed		: OUT	std_logic -- to MD5_HH
   );
END COMPONENT;

COMPONENT MD5_HH
   PORT (
	Clk			: IN	std_logic;
	HH_ON			: IN	std_logic;
	M_Block			: IN	std_logic_vector(0 TO 511);
	RegA			: IN	std_logic_vector(31 DOWNTO 0);
	RegB			: IN	std_logic_vector(31 DOWNTO 0);
	RegC			: IN	std_logic_vector(31 DOWNTO 0);
	RegD			: IN	std_logic_vector(31 DOWNTO 0);
	RegAA			: OUT	std_logic_vector(31 DOWNTO 0);
	RegBB			: OUT	std_logic_vector(31 DOWNTO 0);
	RegCC			: OUT	std_logic_vector(31 DOWNTO 0);
	RegDD			: OUT	std_logic_vector(31 DOWNTO 0);
	HH_Completed		: OUT	std_logic -- to MD5_II
   );
END COMPONENT;

COMPONENT MD5_II
   PORT (
	Clk			: IN	std_logic;
	II_ON			: IN	std_logic;
	M_Block			: IN	std_logic_vector(0 TO 511);
	RegA			: IN	std_logic_vector(31 DOWNTO 0);
	RegB			: IN	std_logic_vector(31 DOWNTO 0);
	RegC			: IN	std_logic_vector(31 DOWNTO 0);
	RegD			: IN	std_logic_vector(31 DOWNTO 0);
	RegAA			: OUT	std_logic_vector(31 DOWNTO 0);
	RegBB			: OUT	std_logic_vector(31 DOWNTO 0);
	RegCC			: OUT	std_logic_vector(31 DOWNTO 0);
	RegDD			: OUT	std_logic_vector(31 DOWNTO 0);
	II_Completed		: OUT	std_logic -- to MD5_CTRL
   );
END COMPONENT;

SIGNAL RegAs, RegBs, RegCs, RegDs		: std_logic_vector(31 DOWNTO 0);
SIGNAL RegAA_f, RegBB_f, RegCC_f, RegDD_f	: std_logic_vector(31 DOWNTO 0);
SIGNAL RegAA_g, RegBB_g, RegCC_g, RegDD_g	: std_logic_vector(31 DOWNTO 0);
SIGNAL RegAA_h, RegBB_h, RegCC_h, RegDD_h	: std_logic_vector(31 DOWNTO 0);
SIGNAL RegAA_i, RegBB_i, RegCC_i, RegDD_i	: std_logic_vector(31 DOWNTO 0);

SIGNAL FF_ON, FF_Completed				: std_logic;
SIGNAL GG_Completed, HH_Completed, II_Completed		: std_logic;
SIGNAL M_Block						: std_logic_vector(0 TO 511);

BEGIN

MD5_OUTPUT <= RegAs(7 DOWNTO 0) & RegAs(15 DOWNTO 8) & RegAs(23 DOWNTO 16) & RegAs(31 DOWNTO 24) & RegBs(7 DOWNTO 0) & RegBs(15 DOWNTO 8) & RegBs(23 DOWNTO 16) & RegBs(31 DOWNTO 24) & RegCs(7 DOWNTO 0) & RegCs(15 DOWNTO 8) & RegCs(23 DOWNTO 16) & RegCs(31 DOWNTO 24) & RegDs(7 DOWNTO 0) & RegDs(15 DOWNTO 8) & RegDs(23 DOWNTO 16) & RegDs(31 DOWNTO 24);

MD5_CTRL_01 : MD5_CTRL
   PORT MAP ( 
	Clk			=> Clk,
	MD5_ON			=> MD5_ON,
	RegAA			=> RegAA_i,
	RegBB			=> RegBB_i,
	RegCC			=> RegCC_i,
	RegDD			=> RegDD_i,
	II_Completed		=> II_Completed,
	LAST_Block		=> LAST_Block,
	DXtIN			=> DXtIN,
	DXtIN_Completed		=> DXtIN_Completed,
	DXtOUT_Completed	=> DXtOUT_Completed,
	DXtIN_REQ		=> DXtIN_REQ,
	DXtOUT_ON		=> DXtOUT_ON,
	FF_ON			=> FF_ON,
	M_Block			=> M_Block,
	RegA			=> RegAs,
	RegB			=> RegBs,
	RegC			=> RegCs,
	RegD			=> RegDs,
	End_Operate		=> End_Operate,
	MD5_RUNNING		=> MD5_RUNNING
   );

MD5_FF_01 : MD5_FF
   PORT MAP (
	Clk			=> Clk,
	FF_ON			=> FF_ON,
	M_Block			=> M_Block,
	RegA			=> RegAs,
	RegB			=> RegBs,
	RegC			=> RegCs,
	RegD			=> RegDs,
	RegAA			=> RegAA_f,
	RegBB			=> RegBB_f,
	RegCC			=> RegCC_f,
	RegDD			=> RegDD_f,
	FF_Completed		=> FF_Completed
   );

MD5_GG_01 : MD5_GG
   PORT MAP(
	Clk			=> Clk,
	GG_ON			=> FF_Completed,
	M_Block			=> M_Block,
	RegA			=> RegAA_f,
	RegB			=> RegBB_f,
	RegC			=> RegCC_f,
	RegD			=> RegDD_f,
	RegAA			=> RegAA_g,
	RegBB			=> RegBB_g,
	RegCC			=> RegCC_g,
	RegDD			=> RegDD_g,
	GG_Completed		=> GG_Completed
   );

MD5_HH_01 : MD5_HH
   PORT MAP(
	Clk			=> Clk,
	HH_ON			=> GG_Completed,
	M_Block			=> M_Block,
	RegA			=> RegAA_g,
	RegB			=> RegBB_g,
	RegC			=> RegCC_g,
	RegD			=> RegDD_g,
	RegAA			=> RegAA_h,
	RegBB			=> RegBB_h,
	RegCC			=> RegCC_h,
	RegDD			=> RegDD_h,
	HH_Completed		=> HH_Completed
   );

MD5_II_01 : MD5_II
   PORT MAP(
	Clk			=> Clk,
	II_ON			=> HH_Completed,
	M_Block			=> M_Block,
	RegA			=> RegAA_h,
	RegB			=> RegBB_h,
	RegC			=> RegCC_h,
	RegD			=> RegDD_h,
	RegAA			=> RegAA_i,
	RegBB			=> RegBB_i,
	RegCC			=> RegCC_i,
	RegDD			=> RegDD_i,
	II_Completed		=> II_Completed
   );

END MD5_arch;