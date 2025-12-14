----------------------------------------------------------------------------
----------------------------------------------------------------------------
--  The Free IP Project
--  VHDL DES Core
--  (c) 1999, The Free IP Project and David Kessner
--
--
--  Warning:  This software probably falls under the jurisdiction of some
--            cryptography import/export laws.  Don't import/export this
--            file (or products that use this file) unless you've worked
--            out all the legal issues.  Don't say we didn't warn you!
--
--
--  FREE IP GENERAL PUBLIC LICENSE
--  TERMS AND CONDITIONS FOR USE, COPYING, DISTRIBUTION, AND MODIFICATION
--
--  1.  You may copy and distribute verbatim copies of this core, as long
--      as this file, and the other associated files, remain intact and
--      unmodified.  Modifications are outlined below.  Also, see the
--      import/export warning above for further restrictions on
--      distribution.
--  2.  You may use this core in any way, be it academic, commercial, or
--      military.  Modified or not.  See, again, the import/export warning
--      above.
--  3.  Distribution of this core must be free of charge.  Charging is
--      allowed only for value added services.  Value added services
--      would include copying fees, modifications, customizations, and
--      inclusion in other products.
--  4.  If a modified source code is distributed, the original unmodified
--      source code must also be included (or a link to the Free IP web
--      site).  In the modified source code there must be clear
--      identification of the modified version.
--  5.  Visit the Free IP web site for additional information.
--
----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

package destest_lib is

  component des_fast_testbench
  end component;

  component des_small_testbench
  end component;


  function random32 (din:std_logic_vector(31 downto 0))
                     return std_logic_vector;
  function random56 (din:std_logic_vector(55 downto 0))
                     return std_logic_vector;
  function random64 (din:std_logic_vector(63 downto 0))
                     return std_logic_vector;
end destest_lib;

                     
----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.destest_lib.all;

package body destest_lib is
  function random32 (din:std_logic_vector(31 downto 0))
                     return std_logic_vector is
    variable val	:std_logic_vector (31 downto 0);
  begin
    val := (din(31) xor din(6) xor din(4) xor din(2) xor din(1)) & din(31 downto 1);
    return (val);
  end random32;

  function random56 (din:std_logic_vector(55 downto 0))
                     return std_logic_vector is
    variable val	:std_logic_vector (55 downto 0);
  begin
    val := (din(55) xor din(6) xor din(3) xor din(1)) & din(55 downto 1);
    return (val);
  end random56;

  function random64 (din:std_logic_vector(63 downto 0))
                     return std_logic_vector is
    variable val	:std_logic_vector (63 downto 0);
  begin
    val := (din(63) xor din(3) xor din(2) xor din(0)) & din(63 downto 1);
    return (val);
  end random64;

end destest_lib;

  
----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.des_lib.all;
use work.destest_lib.all;


entity des_fast_testbench is
--  port();
end des_fast_testbench;


architecture arch_des_fast_testbench of des_fast_testbench is
  signal clk		:std_logic := '1';
  signal reset		:std_logic := '1';
  signal stall		:std_logic := '0';
  signal key1		:std_logic_vector (55 downto 0) := "00000000000000000000000000000000000000000000000000000000";
  signal key2		:std_logic_vector (55 downto 0) := "00000000000000000000000000000000000000000000000000000000";
  signal key3		:std_logic_vector (55 downto 0) := "00000000000000000000000000000000000000000000000000000000";
  signal din		:std_logic_vector (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
  signal din_valid	:std_logic := '0'; 
  signal dout1		:std_logic_vector (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
  signal dout2		:std_logic_vector (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
  signal dout_valid1	:std_logic := '0';
  signal dout_valid2	:std_logic := '0';
  signal encrypt_flag	:std_logic := '1';
  signal decrypt_flag   :std_logic := '0';
begin
  process (clk)
  begin
    if clk='1' then
      clk <= '0' after 20ns, '1' after 40ns;
    end if;
  end process;

  reset <= '1' after 0ns, '0' after 125ns;

  -- Generate the random key's and random data
  process (reset, clk)
  begin
    if reset='1' then
      din_valid <= '0';
      din <= "1001010001010110101011001010010001100101010110101010100101101110";
      key1 <= "00101100110100001101110101001100110101011010101100110011";
    elsif clk'event and clk='1' then
      key1 <= random56(key1);
      din  <= random64(din);
      din_valid <= '1';
    end if;
  end process;
    

  -- Do the DES encryption/decryption blocks
  encrypt_flag <= '1';
  decrypt_flag <= '0';
  DES0:  des_fast port map (clk, reset, stall, encrypt_flag, key1, din, din_valid, dout1, dout_valid1, key2);
  DES1:  des_fast port map (clk, reset, stall, decrypt_flag, key2, dout1, dout_valid1, dout2, dout_valid2, key3);


  -- Verify the unencrypted output
  process (reset, clk, dout2, dout_valid2)
    variable check  :std_logic_vector (63 downto 0);
  begin
    if reset='1' then
      check := "1001010001010110101011001010010001100101010110101010100101101110";
    elsif clk'event and clk='1' then
      if dout_valid2='1' then
        check := random64(check);

        if check/=dout2 then         
          assert 1=0
            report "Simulation Ended, DES Fast Failed!!!!!!!!!!!!!!!!!!!!!!!!!"
            severity failure;
        end if;
      end if;
    end if;
  end process;

end arch_des_fast_testbench;




----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.des_lib.all;
use work.destest_lib.all;


entity des_small_testbench is
--  port();
end des_small_testbench;


architecture arch_des_small_testbench of des_small_testbench is
  signal clk		:std_logic := '1';
  signal reset		:std_logic := '1';
  signal key		:std_logic_vector (55 downto 0) := "00000000000000000000000000000000000000000000000000000000";
  signal din		:std_logic_vector (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
  signal din_valid	:std_logic := '0'; 
  signal dout1		:std_logic_vector (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
  signal dout2		:std_logic_vector (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
  signal dout_valid1	:std_logic := '0';
  signal dout_valid2	:std_logic := '0';
  signal encrypt_flag	:std_logic := '1';
  signal decrypt_flag   :std_logic := '0';
  signal busy1		:std_logic := '1';
  signal busy2		:std_logic := '1';
  
begin
  process (clk)
  begin
    if clk='1' then
      clk <= '0' after 20ns, '1' after 40ns;
    end if;
  end process;

  reset <= '1' after 0ns, '0' after 125ns;

  -- Generate the random key's and random data
  process (reset, clk, busy1, busy2)
  begin
    if reset='1' then
      din_valid <= '0';
      din <= "0010100100110110001001011011001111001011001001100010010100011001";
      key <= "10100101010010010100101010001101010001011001111110000111";
    elsif clk'event and clk='1' then
      --if dout_valid2='1' then
      if din_valid='0' and busy1='0' and busy2='0' and dout_valid1='0' and dout_valid2='0' then
        din_valid <= '1';
        din <= random64(din);
        key <= random56(key);
      else
        din_valid <= '0';
      end if;     
    end if;
  end process;
    

  -- Do the DES encryption/decryption blocks
  encrypt_flag <= '1';
  decrypt_flag <= '0';
  DES0:  des_small port map (clk, reset, encrypt_flag, key, din,   din_valid,   busy1, dout1, dout_valid1);
  DES1:  des_small port map (clk, reset, decrypt_flag, key, dout1, dout_valid1, busy2, dout2, dout_valid2);


  -- Verify the unencrypted output
  process (clk, din, dout_valid2)
    variable check  :std_logic_vector (63 downto 0);
  begin
    if clk'event and clk='1' then
      if dout_valid2='1' then
        if din/=dout2 then         
          assert 1=0
            report "Simulation Ended, DES Small Failed!!!!!!!!!!!!!!!!!!!!!!!!!"
            severity failure;
        end if;
      end if;
    end if;
  end process;

end arch_des_small_testbench;











