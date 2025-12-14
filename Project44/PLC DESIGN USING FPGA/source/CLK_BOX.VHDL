library IEEE;
use work.PLC.all;
use IEEE.STD_Logic_1164.all;
use IEEE.STD_Logic_Unsigned.all;

entity CLKDIV is
port( clk_in : in std_logic;      --clk input 5 MHz
      clk_out : out std_logic );   --clk output 10 Hz devide by 500,000
end CLKDIV;

architecture RTL of CLKDIV is
   signal C    : std_logic_vector(17 downto 0); --counter
   signal rst  : std_logic;         --for reset
   signal nclk : std_logic;         --signal for clk out
begin

   rst <= C(17) and C(16) and C(15) and C(14) and 
          not(C(13)) and C(12) and not(C(11)) and not(C(10)) and 
          not(C(9)) and not(C(8)) and C(7) and not(C(6)) and 
          not(C(5)) and  C(4) and not(C(3)) and not(C(2)) and 
          not(C(1)) and not(C(0)) ;     --11110100001001000 = 250,000
   clk_out <= nclk;

   process(clk_in, rst)
   begin
      if (rst = '1') then 
         C <= "000000000000000000";
      elsif (clk_in'event and clk_in ='1') then
         C <= C + 1;
      end if;
   end process;

   process(rst)
   begin
      if (rst'event and rst = '1') then
         nclk <= not nclk;
      end if;
   end process;

end RTL;