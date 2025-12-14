library IEEE;
use work.PLC.all;
use IEEE.STD_Logic_1164.all;
use IEEE.STD_Logic_Unsigned.all;

entity CUNIT is
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
end CUNIT;

architecture RTL of CUNIT is
   signal curr_st, next_st : CONTROL_STATE;
begin
   process(CLK, next_st, RESET)
   begin
      if RESET = '1' then       -- async reset to reset state
         curr_st <= INIT;
      elsif (CLK'event and CLK = '1') then
         curr_st <= next_st;    -- go to next controller state on rising clock edge
      end if;
   end process;

   process(CLK, curr_st, OPCODE, OPERAND_TYPE, reset)
   begin
      CSalu       <= '0';  ALU_CTRL    <= aNOP;
      PC_reset    <= '0';  PC_inc      <= '0';
      LD_BYTE1    <= '0';  LD_BYTE2    <= '0';
      LD_BYTE3    <= '0';
      CSstack     <= '0';  STACK_CTRL  <= sNOP;
      CStcbx      <= '0';  TC_CTRL     <= tcSET_C;
      TC_SET      <= '0';
      WEauxbx     <= '0';  WEopbx      <= '0';
      A_CTRL      <= '1'; --a = acc
      B_CTRL      <= '1'; --b = stack
      OUTI        <= '0';
      case curr_st is
         when INIT =>
            PC_reset    <= '1';
            CSstack     <= not(CLK);
            STACK_CTRL  <= sCLR;
            next_st     <= FETCH1;
         when FETCH1 =>
            PC_inc      <= not(CLK);
            LD_BYTE1    <= '1';
            next_st     <= DECODE1;
         when FETCH2 =>
            PC_inc      <= not(CLK);
            LD_BYTE1    <= '1';
            next_st     <= DECODE2;
         when DECODE1 =>
            case OPCODE is
               when iEND =>
                  next_st     <= INIT;
               when iNOP =>
                  next_st     <= EXNOP1;
               when iLD =>
                  PC_inc      <= not(CLK);
                  LD_BYTE2    <= '1';
                  next_st     <= EXLD;
               when iLDI =>
                  PC_inc      <= not(CLK);
                  LD_BYTE2    <= '1';
                  next_st     <= EXLDI;
               when others =>
                  next_st     <= ERR;
            end case;
         when DECODE2 =>
            case OPCODE is
               when iLD =>
                  PC_inc      <= not(CLK);
                  LD_BYTE2    <= '1';
                  CSstack     <= not(CLK);
                  STACK_CTRL  <= sPUSH;
                  next_st     <= EXLD;
               when iLDI =>
                  PC_inc      <= not(CLK);
                  LD_BYTE2    <= '1';
                  CSstack     <= not(CLK);
                  STACK_CTRL  <= sPUSH;
                  next_st     <= EXLDI;
               when iAND =>
                  PC_inc      <= not(CLK);
                  LD_BYTE2    <= '1';
                  next_st     <= EXAND;
               when iANI =>
                  PC_inc      <= not(CLK);
                  LD_BYTE2    <= '1';
                  next_st     <= EXANI;
               when iOR =>
                  PC_inc      <= not(CLK);
                  LD_BYTE2    <= '1';
                  next_st     <= EXOR;
               when iORI =>
                  PC_inc      <= not(CLK);
                  LD_BYTE2    <= '1';
                  next_st     <= EXORI;
               when iOUT =>
                  PC_inc      <= not(CLK);
                  LD_BYTE2    <= '1';
                  next_st     <= EXOUT;
               when iOUI =>
                  PC_inc      <= not(CLK);
                  LD_BYTE2    <= '1';
                  next_st     <= EXOUI;
               when iANB =>
                  CSstack     <= not(CLK); 
                  STACK_CTRL  <= sPOP;
                  next_st     <= EXANB;
               when iORB =>
                  CSstack     <= not(CLK); 
                  STACK_CTRL  <= sPOP;
                  next_st     <= EXORB;
               when iTIM =>
                  PC_inc      <= not(CLK);
                  LD_BYTE2    <= '1';
                  next_st     <= SETTIM;
               when iCNT =>
                  PC_inc      <= not(CLK);
                  LD_BYTE2    <= '1';
                  CSstack     <= not(CLK); 
                  STACK_CTRL  <= sPOP;
                  next_st     <= SETCNT;
               when iNOP =>
                  next_st     <= EXNOP2;
               when others =>
                  next_st     <= ERR;
            end case;
         when EXLD =>
            CSalu    <= not(CLK); 
            ALU_CTRL <= aLD;
            A_CTRL   <= '0';
            next_st  <= FETCH2;
         when EXLDI =>
            CSalu    <= not(CLK); 
            ALU_CTRL <= aLDI;
            A_CTRL   <= '0';
            next_st  <= FETCH2;
         when EXAND =>
            CSalu    <= not(CLK); 
            ALU_CTRL <= aAND;
            B_CTRL   <= '0';
            next_st  <= FETCH2;
         when EXANI =>
            CSalu    <= not(CLK); 
            ALU_CTRL <= aANI;
            B_CTRL   <= '0';
            next_st  <= FETCH2;
         when EXOR =>
            CSalu    <= not(CLK);
            ALU_CTRL <= aOR;
            B_CTRL   <= '0';
            next_st  <= FETCH2;
         when EXORI =>
            CSalu    <= not(CLK);
            ALU_CTRL <= aORI;
            B_CTRL   <= '0';
            next_st  <= FETCH2;
         when EXOUT =>
            case OPERAND_TYPE is
               when rOUTPUT =>
                  WEopbx  <= not(CLK);
               when rAUX =>
                  WEauxbx <= not(CLK);
               when others =>
                  Null;
            end case;
            next_st <= FETCH1;
         when EXOUI =>
            case OPERAND_TYPE is
               when rOUTPUT =>
                  WEopbx  <= not(CLK);
               when rAUX =>
                  WEauxbx <= not(CLK);
               when others =>
                  Null;
            end case;
            OUTI    <= '1';
            next_st <= FETCH1;
         when EXANB =>
            CSalu   <= not(CLK); 
            ALU_CTRL <= aAND;
            next_st <= FETCH2;
         when EXORB =>
            CSalu   <= not(CLK); 
            ALU_CTRL <= aOR;
            next_st <= FETCH2;
         when SETTIM =>
            PC_inc   <= not(CLK);
            LD_BYTE3 <= '1';
            CStcbx   <= not(CLK);
            TC_CTRL  <= tcSET_T;
            TC_SET   <= '1';
            OUTI     <= '1';
            next_st  <= FETCH1;
         when SETCNT =>
            PC_inc   <= not(CLK);
            LD_BYTE3 <= '1';
            CStcbx   <= not(CLK);
            TC_SET   <= '1';
            next_st  <= FETCH1;
         when EXNOP1 =>
            next_st <= FETCH1;
         when EXNOP2 =>
            next_st <= FETCH2;
         when others =>
            next_st <= ERR;
      end case;
   end process;

end RTL;