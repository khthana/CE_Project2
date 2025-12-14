----------------------------------------------------------------------------------------------------
-- ALU                                                                                            --
----------------------------------------------------------------------------------------------------

library IEEE;
use work.PLC.all;
use IEEE.STD_Logic_1164.all;
use IEEE.STD_Logic_Unsigned.all;

entity ALU is
port( CS    : in std_logic;
      CTRL  : in ALU_OPERATIONS;
      src_a : in std_logic;
      src_b : in std_logic;
      acc   : out std_logic );
end ALU;

architecture RTL of ALU is
   signal acc_tmp  : std_logic;
begin

   acc <= acc_tmp;

   process (CS, CTRL, acc_tmp)
   begin
      if (CS'event and CS = '1') then
         case CTRL is
         when aLD =>             -- LD (load)
            acc_tmp <= src_a;
         when aLDI =>            -- LDI (load inverse)
            acc_tmp <= not(src_a);
         when aAND =>            -- LDI (load inverse)
            acc_tmp <= src_a and src_b;
         when aANI =>            -- ANI (and inverse)
            acc_tmp <= src_a and not(src_b);
         when aOR =>             -- OR (or)
            acc_tmp <= src_a or src_b;
         when aORI =>            -- ORI (or inverese)
            acc_tmp <= src_a or not(src_b);
         when others => 
            acc_tmp <= acc_tmp;
         end case;
      end if;
   end process;

end RTL;