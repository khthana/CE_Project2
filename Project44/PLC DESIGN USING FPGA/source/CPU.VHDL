----------------------------------------------------------------------------------------------------
-- tplc14                                                                                         --
----------------------------------------------------------------------------------------------------
library IEEE;
use work.PLC.all;
use IEEE.STD_Logic_1164.all;
use IEEE.STD_Logic_Unsigned.all;

entity PLCCPU is
port( clk      : in std_logic;
      reset    : in std_logic;
      input    : in std_logic_vector(4 downto 0);
      output   : out std_logic_vector(6 downto 0);
      databus  : in DATA_BUS;
      address  : out ADDRESS_BUS;
      cs,oe,we : out std_logic);
end PLCCPU;

architecture RTL of PLCCPU is

component CLKDIV
port( clk_in  : in std_logic;      --clk input  10 MHz
      clk_out : out std_logic );   --clk output 10 Hz
end component;

component ALU
port( CS    : in std_logic;
      CTRL  : in ALU_OPERATIONS;
      src_a : in std_logic;
      src_b : in std_logic;
      acc   : out std_logic );
end component;

component PC_MANAGEMENT
port( PC_RESET : in std_logic;
      PC_INC   : in std_logic;
      addr     : out ADDRESS_BUS );
end component;

component IRREG
port( LD_BYTE1        : in std_logic;
      LD_BYTE2        : in std_logic;
      LD_BYTE3        : in std_logic;
      ir              : in DATA_BUS;
      segment1        : out DATA_BUS;
      segment2        : out DATA_BUS;
      segment3        : out DATA_BUS );
end component;

component DECODER
port( d_in  : in std_logic_vector(5 downto 0);
      d_out : out std_logic_vector(63 downto 0) );
end component;

component INPUT_BOX
port( clk   : in std_logic;
      en    : in std_logic_vector(4 downto 0);
      INPUT : in std_logic_vector(4 downto 0);
      IP_o  : out std_logic );
end component;

component AUX_BOX
port( WE     : in std_logic;     -- write = 1
      en     : in std_logic_vector(63 downto 0);
      RESET  : in std_logic;
      AUX_i  : in std_logic;
      AUX_o  : out std_logic );
end component;

component OUTPUT_BOX
port( WE     : in std_logic;     -- write = 1
      en     : in std_logic_vector(6 downto 0);
      RESET  : in std_logic;
      OP_i   : in std_logic;
      OP_o   : out std_logic;
      OUTPUT : out std_logic_vector(6 downto 0) );
end component;

component DEMUX
port( CTRL  : in std_logic;    
      CE    : in std_logic_vector(1 downto 0);
      d_in0 : in std_logic;    -- input
      d_in1 : in std_logic;    -- output
      d_in2 : in std_logic;    -- aux
      d_in3 : in std_logic;    -- tc
      d_in4 : in std_logic;    -- acc(A) , stack(B)
      d_out : out std_logic );
end component;

component STACK
port( CS    : in  std_logic;
      CTRL  : in  STACK_OPERATIONS;
      S_i   : in  std_logic;
      S_o   : out std_logic );
end component;

component TC_BOX
port( CS     : in std_logic;
      CTRL   : in TC_OPERATIONS; 
      TC_SET : in std_logic;
      en_set : in std_logic_vector(1 downto 0);
      en_use : in std_logic_vector(3 downto 0);
      RESET  : in std_logic;
      tick_i : in std_logic;     --tick input
      clk_i  : in std_logic;     --clk input 10Hz
      rst    : in std_logic;     --start of timer or counter
      N      : in NUMBER;        --number that you choose
      TC_o   : out std_logic );  --register out
end component;

component CUNIT
port( CLK          : in std_logic;
      RESET        : in std_logic;
      OPCODE       : in CPU_OPERATIONS;
      OPERAND_TYPE : in REG_TYPE;
      CSalu        : out std_logic;                     -- clk
      ALU_CTRL     : out ALU_OPERATIONS;
      PC_RESET     : out std_logic;
      PC_INC       : out std_logic;                     -- clk
      LD_BYTE1     : out std_logic;                     -- clk
      LD_BYTE2     : out std_logic;                     -- clk
      LD_BYTE3     : out std_logic;                     -- clk
      CSstack      : out std_logic;                     -- clk
      STACK_CTRL   : out STACK_OPERATIONS;
      CStcbx       : out std_logic;                     -- clk
      TC_CTRL      : out TC_OPERATIONS;
      TC_SET       : out std_logic;
      WEauxbx      : out std_logic;                     -- clk
      WEopbx       : out std_logic;                     -- clk
      A_CTRL       : out std_logic;
      B_CTRL       : out std_logic;
      OUTI         : out std_logic );
end component;

------------------------------------------------------
   signal reg_to_a        : std_logic;
   signal reg_to_b        : std_logic;
   signal alu_to_Reg      : std_logic;
   signal aux_o           : std_logic;
   signal op_o            : std_logic;
   signal ip_o            : std_logic;
   signal acc             : std_logic;
   signal en              : std_logic_vector(63 downto 0);
   signal s_output        : std_logic_vector(6 downto 0);
   signal s_o             : std_logic;
   signal tc_o            : std_logic;
   signal clk_i           : std_logic;
   signal n               : NUMBER;
   
   signal segment1        : DATA_BUS;
   signal segment2        : DATA_BUS;
   signal segment3        : DATA_BUS;

   signal CSalu           : std_logic;        
   signal ALU_CTRL        : ALU_OPERATIONS;   
   signal PC_RESET        : std_logic;        --RESET = 1 PC = (000000000000000)
   signal PC_INC          : std_logic;        --rising_edge = incress
   signal LD_BYTE1        : std_logic;        
   signal LD_BYTE2        : std_logic;        
   signal LD_BYTE3        : std_logic;        
   signal WEauxbx         : std_logic;        --rising_edge = write
   signal WEopbx          : std_logic;        --rising_edge = write
   signal A_CTRL          : std_logic;
   signal B_CTRL          : std_logic;
   signal OUTI            : std_logic;
   signal CSstack         : std_logic;
   signal STACK_CTRL      : STACK_OPERATIONS;
   signal CStcbx          : std_logic;
   signal TC_CTRL         : TC_OPERATIONS;
   signal TC_SET          : std_logic;

--------------------------------------------------------

begin
   cs <= '0';
   we <= '1';
   oe <= '0';
   output <= s_output;
   N <= segment2(5 downto 0) & segment3;
   acc <= (alu_to_Reg and not(OUTI)) or (not(alu_to_Reg) and OUTI);

   BX1  : CLKDIV        port map (clk,clk_i);
   BX2  : ALU           port map (CSALU,ALU_CTRL,reg_to_a,reg_to_b,alu_to_Reg);
   BX3  : PC_MANAGEMENT port map (PC_RESET,PC_INC,address);
   BX4  : IRREG         port map (LD_BYTE1,LD_BYTE2,LD_BYTE3,databus,segment1,segment2,segment3);
   BX5  : STACK         port map (CSSTACK,STACK_CTRL,acc,s_o);
   BX6  : DECODER       port map (segment2(5 downto 0),en);
   BX7  : TC_BOX        port map (CStcbx,TC_CTRL,TC_SET,segment2(7 downto 6),en(3 downto 0),
                                  reset,s_o,clk_i,acc,N,tc_o);
   BX8  : AUX_BOX       port map (WEauxbx,en,reset,acc,aux_o); --aux box
   BX9  : OUTPUT_BOX    port map (WEopbx,en(6 downto 0),reset,acc,op_o,s_output);  --out box
   BX10 : INPUT_BOX     port map (clk,en(4 downto 0),input,ip_o);
   BX12 : DEMUX         port map (A_CTRL,segment2(7 downto 6),ip_o,op_o,aux_o,tc_o,alu_to_Reg,reg_to_a);  --A
   BX13 : DEMUX         port map (B_CTRL,segment2(7 downto 6),ip_o,op_o,aux_o,tc_o,s_o,reg_to_b);  --B
   BX14 : CUNIT         port map (clk,reset,segment1,segment2(7 downto 6),CSalu,ALU_CTRL,PC_RESET,PC_INC,
                                  LD_BYTE1,LD_BYTE2,LD_BYTE3,CSstack,STACK_CTRL,CStcbx,TC_CTRL,TC_SET,
                                  WEauxbx,WEopbx,A_CTRL,B_CTRL,OUTI);

end RTL;
