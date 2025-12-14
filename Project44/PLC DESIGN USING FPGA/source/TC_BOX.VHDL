----------------------------------------------------------------------------------------------------
-- TC                                                                                             --
----------------------------------------------------------------------------------------------------

library IEEE;
use work.PLC.all;
use IEEE.STD_Logic_1164.all;
use IEEE.STD_Logic_Unsigned.all;

entity TC is
port( CS      : in std_logic;    --control on level
      CTRL    : in TC_OPERATIONS;--c=0 ,t=1
      RESET   : in std_logic;
      tick_i  : in std_logic;    --tick input
      clk_i   : in std_logic;    --clk input 10Hz
      rst     : in std_logic;    --start of timer or counter
      N       : in NUMBER;       --number that you choose (13 downto 0)
      reg_out : out std_logic ); --register out
end TC;

architecture RTL of TC is
   signal state    : std_logic;
   signal s_rst    : std_logic;
   signal s_N      : NUMBER;
   signal C        : NUMBER;      --counter number
   signal fin      : std_logic;   --fin = 1 when count success 
   signal freq_i   : std_logic;   --from tick or nclk decide from torc 
   signal s_tick_i : std_logic;
begin

   --compare C,N if same fin = 1
   fin <= not ( (C(0) xor s_N(0))   or (C(1) xor s_N(1))   or (C(2) xor s_N(2))   or 
                (C(3) xor s_N(3))   or (C(4) xor s_N(4))   or (C(5) xor s_N(5))   or 
                (C(6) xor s_N(6))   or (C(7) xor s_N(7))   or (C(8) xor s_N(8))   or 
                (C(9) xor s_N(9))   or (C(10) xor s_N(10)) or (C(11) xor s_N(11)) or 
                (C(12) xor s_N(12)) or (C(13) xor s_N(13)) );
   reg_out <= fin;
   freq_i  <= ((state and clk_i) or (not(state) and s_tick_i)) and not(fin);

   process (CS, RESET, CTRL, rst, N, tick_i)
   begin
      if (RESET = '1') then
         s_rst    <= '1';
         s_N      <= "11111111111111";
         state    <= tcSET_C;
         s_tick_i <= '0';
      elsif (CS'event and CS = '1') then
         s_rst    <= rst;
         s_N      <= N;
         s_tick_i <= tick_i;
         state    <= CTRL;
      end if;
   end process;
       
   process (s_rst, freq_i, fin)
   begin
      if (s_rst = '1') then
         C <= "00000000000000";
      elsif (freq_i'event and freq_i = '1') then
         C <= C + 1;               --count is continute
      end if;
   end process;

end RTL;

----------------------------------------------------------------------------------------------------
-- TC_BOX                                                                                           --
----------------------------------------------------------------------------------------------------

library IEEE;
use work.PLC.all;
use IEEE.STD_Logic_1164.all;
use IEEE.STD_Logic_Unsigned.all;

entity TC_BOX is
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
end TC_BOX;

architecture RTL of TC_BOX is

component TC
port( CS      : in std_logic;    --control on level
      CTRL    : in TC_OPERATIONS;
      RESET   : in std_logic;
      tick_i  : in std_logic;    --tick input
      clk_i   : in std_logic;    --clk input 10Hz
      rst     : in std_logic;    --start of timer or counter
      N       : in NUMBER;       --number that you choose (13 downto 0)
      reg_out : out std_logic ); --register out
end component;

   signal s_reg_out : std_logic_vector(3 downto 0);
   signal csen      : std_logic_vector(3 downto 0);
   signal s_en      : std_logic_vector(3 downto 0);
   signal s_en_set  : std_logic_vector(3 downto 0);
begin
   process (en_set)
   begin
      case en_set is
         when "00"   => s_en_set <= "0001";
         when "01"   => s_en_set <= "0010";
         when "10"   => s_en_set <= "0100";
         when "11"   => s_en_set <= "1000";
         when others => s_en_set <= "0000";
      end case;
   end process;

   process(TC_SET, s_en_set, en_use )
   begin
      if TC_SET = '1' then
         s_en <= s_en_set;
      else
         s_en <= en_use;
      end if;
   end process;

   csen <= s_en and (CS & CS & CS & CS);
   TC0 : TC port map (csen(0),CTRL,RESET,tick_i,clk_i,rst,N,s_reg_out(0));
   TC1 : TC port map (csen(1),CTRL,RESET,tick_i,clk_i,rst,N,s_reg_out(1));
   TC2 : TC port map (csen(2),CTRL,RESET,tick_i,clk_i,rst,N,s_reg_out(2));
   TC3 : TC port map (csen(3),CTRL,RESET,tick_i,clk_i,rst,N,s_reg_out(3));
   TC_o <= (s_en(0) and s_reg_out(0)) or (s_en(1) and s_reg_out(1)) or 
           (s_en(2) and s_reg_out(2)) or (s_en(3) and s_reg_out(3));

end RTL;

