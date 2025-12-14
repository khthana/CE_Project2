----------------------------------------------------------------------------------------------------
-- INPUT_BOX                                                                                           --
----------------------------------------------------------------------------------------------------

library IEEE;
use work.PLC.all;
use IEEE.STD_Logic_1164.all;
use IEEE.STD_Logic_Unsigned.all;

entity INPUT_BOX is
port( clk   : in std_logic;
      en    : in std_logic_vector(4 downto 0);
      INPUT : in std_logic_vector(4 downto 0);
      IP_o  : out std_logic );
end INPUT_BOX;

architecture RTL of INPUT_BOX is
   signal s_IP : std_logic_vector(4 downto 0);
begin

   IP_o <= (en(0) and s_IP(0)) or (en(1) and s_IP(1)) or 
           (en(2) and s_IP(2)) or (en(3) and s_IP(3)) or 
           (en(4) and s_IP(4));

   process (clk, INPUT)
   begin 
      if (clk'event and clk = '1') then
         s_IP <= INPUT;
      end if;
   end process;

end RTL;

