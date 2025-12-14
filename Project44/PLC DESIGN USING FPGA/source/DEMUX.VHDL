----------------------------------------------------------------------------------------------------
-- DEMUX                                                                                          --
----------------------------------------------------------------------------------------------------

library IEEE;
use work.PLC.all;
use IEEE.STD_Logic_1164.all;
use IEEE.STD_Logic_Unsigned.all;

entity DEMUX is
port( CTRL  : in std_logic;    
      CE    : in std_logic_vector(1 downto 0);
      d_in0 : in std_logic;    -- input
      d_in1 : in std_logic;    -- output
      d_in2 : in std_logic;    -- aux
      d_in3 : in std_logic;    -- tc
      d_in4 : in std_logic;    -- acc(A) , stack(B)
      d_out : out std_logic );
end DEMUX;

architecture RTL of DEMUX is
begin

   process (CTRL, CE, d_in0, d_in1, d_in2, d_in3, d_in4)
   begin
      if CTRL = '1' then
            d_out <= d_in4;    -- acc(A) , stack(B)
      else
         case CE is
            when "00" =>
               d_out <= d_in0;    -- input
            when "01" =>
               d_out <= d_in1;    -- output
            when "10" =>
               d_out <= d_in2;    -- aux
            when "11" =>
               d_out <= d_in3;    -- tc
            when others =>
               d_out <= d_in4;    -- acc(A) , stack(B)
         end case;
      end if;
   end process;

end RTL;
