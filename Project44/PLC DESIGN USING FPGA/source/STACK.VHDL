----------------------------------------------------------------------------------------------------
-- STACK                                                                                          --
----------------------------------------------------------------------------------------------------

library IEEE;
use work.PLC.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity STACK is
port( CS    : in  std_logic;
      CTRL  : in  STACK_OPERATIONS;
      S_i   : in  std_logic;
      S_o   : out std_logic );
end STACK;

architecture RTL of STACK is
   subtype STACK_POINTER_TYPE is natural range 0 to STACK_DEPTH;
   type    MEM_TYPE is array (STACK_POINTER_TYPE) of std_logic;
   signal  MEM      : MEM_TYPE;
   signal  SP       : STACK_POINTER_TYPE;
   signal  FULLFF, EMPTYFF : std_logic;
begin

   S_o <= MEM(SP);

   PROCESS (CS, CTRL)
   begin
      if (CS'event and CS = '1') then
         case CTRL is
            when sCLR =>            -- Stack Clear
               EMPTYFF <= '1';
               FULLFF  <= '0';
               SP      <= STACK_POINTER_TYPE'low;
            when sPUSH =>           -- Stack PUSH
               if (FULLFF = '0') then
                  EMPTYFF <= '0';
                  MEM(SP) <= S_i;
                  SP      <= SP + 1;
                  if (SP = STACK_POINTER_TYPE'high) then
                     FULLFF <= '1';
                  end if;
               end if;
            when sPOP =>            -- Stack POP
               if (EMPTYFF = '0') then
                  FULLFF <= '0';
                  SP      <= SP - 1;
                  if (SP = STACK_POINTER_TYPE'low) then
                     EMPTYFF <= '1';
                  end if;
               end if;
            when others =>          -- Stack No Operation
               NULL; 
         end case;
      end if;
   end process;

end RTL;
