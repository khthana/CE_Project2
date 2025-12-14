-------------------------------------------------------------
-- This file contain 2 copyright license with first part is - 
-- corresponding with original authors                      - 
-------------------------------------------------------------

-- The 1st part --
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


package des_lib is
  component des_fast
    port (clk		:in std_logic;
          reset		:in std_logic;
          stall		:in std_logic;

	  encrypt	:in std_logic;  -- 1=encrypt, 0=decrypt
          key_in	:in std_logic_vector (55 downto 0);
          din		:in std_logic_vector (63 downto 0);
          din_valid     :in std_logic;

          dout		:out std_logic_vector (63 downto 0);
          dout_valid	:out std_logic;
          key_out	:out std_logic_vector (55 downto 0)
         );
  end component;


  component des_small
    port (clk		:in std_logic;
          reset		:in std_logic;

          encrypt	:in std_logic;
          key_in	:in std_logic_vector (55 downto 0);
          din		:in std_logic_vector (63 downto 0);
          din_valid	:in std_logic;
          
          busy		:buffer std_logic;
          dout		:out std_logic_vector (63 downto 0);
          dout_valid	:out std_logic
         );
  end component;
          

  component des_round
    port (clk		:in std_logic;
          reset		:in std_logic;
          stall		:in std_logic;

	  encrypt_in	:in std_logic;
          encrypt_shift	:in std_logic_vector (4 downto 0);
          decrypt_shift	:in std_logic_vector (4 downto 0);
          key_in	:in std_logic_vector (55 downto 0);
          din		:in std_logic_vector (63 downto 0);
          din_valid     :in std_logic;	


	  encrypt_out	:out std_logic;
          key_out	:out std_logic_vector (55 downto 0);
          dout		:out std_logic_vector (63 downto 0);
          dout_valid	:out std_logic
         );
  end component;


  -- Inital permutation
  function des_ip(din	:std_logic_vector(63 downto 0))
                  return std_logic_vector;

  -- Final permutation
  function des_fp(din	:std_logic_vector(63 downto 0))
                  return std_logic_vector;

  -- Key permutation, converts a 64 bit key into a 56 bit key, ignoring parity
  function des_kp(din   :std_logic_vector (63 downto 0))
                  return std_logic_vector;

  -- Compression Permutation, converts a 56 bit key into a 48 bits.
  function des_cp(din   :std_logic_vector (55 downto 0))
                  return std_logic_vector;

  -- Expansion permutation
  function des_ep(din   :std_logic_vector (31 downto 0))
                  return std_logic_vector;

  -- S-Box Substitution, 48 bits in, 32 bits out.
  function des_sbox(din   :std_logic_vector (47 downto 0))
                    return std_logic_vector;

  -- P-Box Permutation
  function des_pbox(din   :std_logic_vector (31 downto 0))
                    return std_logic_vector;

  -- Key Shift
  function des_keyshift (din	:std_logic_vector (55 downto 0);
                         n 	:std_logic_vector (4 downto 0))
                         return std_logic_vector;
                  
end des_lib;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.des_lib.all;

package body des_lib is
  --------------------------------------------------------
  -- Inital permutation
  function des_ip(din	:std_logic_vector(63 downto 0))
                  return std_logic_vector is
    variable val 	:std_logic_vector (63 downto 0);
  begin
    val := din(64-58) & din(64-50) & din(64-42) & din(64-34) & din(64-26) & din(64-18) & din(64-10) & din(64- 2) &
           din(64-60) & din(64-52) & din(64-44) & din(64-36) & din(64-28) & din(64-20) & din(64-12) & din(64- 4) &
           din(64-62) & din(64-54) & din(64-46) & din(64-38) & din(64-30) & din(64-22) & din(64-14) & din(64- 6) &
           din(64-64) & din(64-56) & din(64-48) & din(64-40) & din(64-32) & din(64-24) & din(64-16) & din(64- 8) &
           
           din(64-57) & din(64-49) & din(64-41) & din(64-33) & din(64-25) & din(64-17) & din(64- 9) & din(64- 1) &
           din(64-59) & din(64-51) & din(64-43) & din(64-35) & din(64-27) & din(64-19) & din(64-11) & din(64- 3) &
           din(64-61) & din(64-53) & din(64-45) & din(64-37) & din(64-29) & din(64-21) & din(64-13) & din(64- 5) &
           din(64-63) & din(64-55) & din(64-47) & din(64-39) & din(64-31) & din(64-23) & din(64-15) & din(64- 7);
    return val;
  end des_ip;


  --------------------------------------------------------
  -- Final permutation
  function des_fp(din	:std_logic_vector(63 downto 0))
                  return std_logic_vector is
    variable val 	:std_logic_vector (63 downto 0);
  begin
    val := din(64-40) & din(64- 8) & din(64-48) & din(64-16) & din(64-56) & din(64-24) & din(64-64) & din(64-32) &
           din(64-39) & din(64- 7) & din(64-47) & din(64-15) & din(64-55) & din(64-23) & din(64-63) & din(64-31) &
           din(64-38) & din(64- 6) & din(64-46) & din(64-14) & din(64-54) & din(64-22) & din(64-62) & din(64-30) &
           din(64-37) & din(64- 5) & din(64-45) & din(64-13) & din(64-53) & din(64-21) & din(64-61) & din(64-29) &           
           din(64-36) & din(64- 4) & din(64-44) & din(64-12) & din(64-52) & din(64-20) & din(64-60) & din(64-28) &
           din(64-35) & din(64- 3) & din(64-43) & din(64-11) & din(64-51) & din(64-19) & din(64-59) & din(64-27) &           
           din(64-34) & din(64- 2) & din(64-42) & din(64-10) & din(64-50) & din(64-18) & din(64-58) & din(64-26) &
           din(64-33) & din(64- 1) & din(64-41) & din(64- 9) & din(64-49) & din(64-17) & din(64-57) & din(64-25);
    return val;
  end des_fp;


  --------------------------------------------------------
  -- Key permutation, converts a 64 bit key into a 56 bit key, ignoring parity
  function des_kp(din   :std_logic_vector (63 downto 0))
                  return std_logic_vector is
    variable val 	:std_logic_vector (55 downto 0);
  begin
    val := din(64-57) & din(64-49) & din(64-41) & din(64-33) & din(64-25) & din(64-17) & din(64- 9) & din(64- 1) &
           din(64-58) & din(64-50) & din(64-42) & din(64-34) & din(64-26) & din(64-18) & din(64-10) & din(64- 2) &
           din(64-59) & din(64-51) & din(64-43) & din(64-35) & din(64-27) & din(64-19) & din(64-11) & din(64- 3) &
           din(64-60) & din(64-52) & din(64-44) & din(64-36) &

           din(64-63) & din(64-55) & din(64-47) & din(64-39) & din(64-31) & din(64-23) & din(64-15) & din(64- 7) &
           din(64-62) & din(64-54) & din(64-46) & din(64-38) & din(64-30) & din(64-22) & din(64-14) & din(64- 6) &
           din(64-61) & din(64-53) & din(64-45) & din(64-37) & din(64-29) & din(64-21) & din(64-13) & din(64- 5) &
           
           din(64-28) & din(64-20) & din(64-12) & din(64- 4);
    return val;
  end des_kp;


  --------------------------------------------------------
  -- Compression Permutation, converts a 56 bit key into a 48 bits.
  function des_cp(din   :std_logic_vector (55 downto 0))
                  return std_logic_vector is
    variable val 	:std_logic_vector (47 downto 0);
  begin
    val := din(56-14) & din(56-17) & din(56-11) & din(56-24) & din(56- 1) & din(56- 5) &
           din(56- 3) & din(56-28) & din(56-15) & din(56- 6) & din(56-21) & din(56-10) &
           din(56-23) & din(56-19) & din(56-12) & din(56- 4) & din(56-26) & din(56- 8) &
           din(56-16) & din(56- 7) & din(56-27) & din(56-20) & din(56-13) & din(56- 2) &
           din(56-41) & din(56-52) & din(56-31) & din(56-37) & din(56-47) & din(56-55) &
           din(56-30) & din(56-40) & din(56-51) & din(56-45) & din(56-33) & din(56-48) &
           din(56-44) & din(56-49) & din(56-39) & din(56-56) & din(56-34) & din(56-53) &
           din(56-46) & din(56-42) & din(56-50) & din(56-36) & din(56-29) & din(56-32);
    return val;
  end des_cp;


  --------------------------------------------------------
  -- Expansion permutation
  function des_ep(din   :std_logic_vector (31 downto 0))
                  return std_logic_vector is
    variable val 	:std_logic_vector (47 downto 0);
  begin
    val := din(32-32) & din(32- 1) & din(32- 2) & din(32- 3) & din(32- 4) & din(32- 5) &
           din(32- 4) & din(32- 5) & din(32- 6) & din(32- 7) & din(32- 8) & din(32- 9) &
           din(32- 8) & din(32- 9) & din(32-10) & din(32-11) & din(32-12) & din(32-13) &
           din(32-12) & din(32-13) & din(32-14) & din(32-15) & din(32-16) & din(32-17) &
           din(32-16) & din(32-17) & din(32-18) & din(32-19) & din(32-20) & din(32-21) &
           din(32-20) & din(32-21) & din(32-22) & din(32-23) & din(32-24) & din(32-25) &
           din(32-24) & din(32-25) & din(32-26) & din(32-27) & din(32-28) & din(32-29) &
           din(32-28) & din(32-29) & din(32-30) & din(32-31) & din(32-32) & din(32- 1);
    return val;
  end des_ep;


  --------------------------------------------------------
  -- S-Box Substitution, 48 bits in, 32 bits out.
  function des_sbox(din   :std_logic_vector (47 downto 0))
                    return std_logic_vector is
    variable val 	:std_logic_vector (31 downto 0);
  begin
    -- SBOX 8
    case din( 5 downto  0) is
      when "000000" =>  val(3 downto 0) := "1101";      when "000001" =>  val(3 downto 0) := "0001";
      when "000010" =>  val(3 downto 0) := "0010";      when "000011" =>  val(3 downto 0) := "1111";
      when "000100" =>  val(3 downto 0) := "1000";      when "000101" =>  val(3 downto 0) := "1101";
      when "000110" =>  val(3 downto 0) := "0100";      when "000111" =>  val(3 downto 0) := "1000";
      when "001000" =>  val(3 downto 0) := "0110";      when "001001" =>  val(3 downto 0) := "1010";
      when "001010" =>  val(3 downto 0) := "1111";      when "001011" =>  val(3 downto 0) := "0011";
      when "001100" =>  val(3 downto 0) := "1011";      when "001101" =>  val(3 downto 0) := "0111";
      when "001110" =>  val(3 downto 0) := "0001";      when "001111" =>  val(3 downto 0) := "0100";
      when "010000" =>  val(3 downto 0) := "1010";      when "010001" =>  val(3 downto 0) := "1100";
      when "010010" =>  val(3 downto 0) := "1001";      when "010011" =>  val(3 downto 0) := "0101";
      when "010100" =>  val(3 downto 0) := "0011";      when "010101" =>  val(3 downto 0) := "0110";
      when "010110" =>  val(3 downto 0) := "1110";      when "010111" =>  val(3 downto 0) := "1011";
      when "011000" =>  val(3 downto 0) := "0101";      when "011001" =>  val(3 downto 0) := "0000";
      when "011010" =>  val(3 downto 0) := "0000";      when "011011" =>  val(3 downto 0) := "1110";
      when "011100" =>  val(3 downto 0) := "1100";      when "011101" =>  val(3 downto 0) := "1001";
      when "011110" =>  val(3 downto 0) := "0111";      when "011111" =>  val(3 downto 0) := "0010";
      when "100000" =>  val(3 downto 0) := "0111";      when "100001" =>  val(3 downto 0) := "0010";
      when "100010" =>  val(3 downto 0) := "1011";      when "100011" =>  val(3 downto 0) := "0001";
      when "100100" =>  val(3 downto 0) := "0100";      when "100101" =>  val(3 downto 0) := "1110";
      when "100110" =>  val(3 downto 0) := "0001";      when "100111" =>  val(3 downto 0) := "0111";
      when "101000" =>  val(3 downto 0) := "1001";      when "101001" =>  val(3 downto 0) := "0100";
      when "101010" =>  val(3 downto 0) := "1100";      when "101011" =>  val(3 downto 0) := "1010";
      when "101100" =>  val(3 downto 0) := "1110";      when "101101" =>  val(3 downto 0) := "1000";
      when "101110" =>  val(3 downto 0) := "0010";      when "101111" =>  val(3 downto 0) := "1101";
      when "110000" =>  val(3 downto 0) := "0000";      when "110001" =>  val(3 downto 0) := "1111";
      when "110010" =>  val(3 downto 0) := "0110";      when "110011" =>  val(3 downto 0) := "1100";
      when "110100" =>  val(3 downto 0) := "1010";      when "110101" =>  val(3 downto 0) := "1001";
      when "110110" =>  val(3 downto 0) := "1101";      when "110111" =>  val(3 downto 0) := "0000";
      when "111000" =>  val(3 downto 0) := "1111";      when "111001" =>  val(3 downto 0) := "0011";
      when "111010" =>  val(3 downto 0) := "0011";      when "111011" =>  val(3 downto 0) := "0101";
      when "111100" =>  val(3 downto 0) := "0101";      when "111101" =>  val(3 downto 0) := "0110";
      when "111110" =>  val(3 downto 0) := "1000";      when "111111" =>  val(3 downto 0) := "1011";
      when others   =>  val(3 downto 0) := "1011";
    end case;

    -- SBOX 7
    case din(11 downto  6) is
      when "000000" =>  val(7 downto 4) := "0100";      when "000001" =>  val(7 downto 4) := "1101";
      when "000010" =>  val(7 downto 4) := "1011";      when "000011" =>  val(7 downto 4) := "0000";
      when "000100" =>  val(7 downto 4) := "0010";      when "000101" =>  val(7 downto 4) := "1011";
      when "000110" =>  val(7 downto 4) := "1110";      when "000111" =>  val(7 downto 4) := "0111";
      when "001000" =>  val(7 downto 4) := "1111";      when "001001" =>  val(7 downto 4) := "0100";
      when "001010" =>  val(7 downto 4) := "0000";      when "001011" =>  val(7 downto 4) := "1001";
      when "001100" =>  val(7 downto 4) := "1000";      when "001101" =>  val(7 downto 4) := "0001";
      when "001110" =>  val(7 downto 4) := "1101";      when "001111" =>  val(7 downto 4) := "1010";
      when "010000" =>  val(7 downto 4) := "0011";      when "010001" =>  val(7 downto 4) := "1110";
      when "010010" =>  val(7 downto 4) := "1100";      when "010011" =>  val(7 downto 4) := "0011";
      when "010100" =>  val(7 downto 4) := "1001";      when "010101" =>  val(7 downto 4) := "0101";
      when "010110" =>  val(7 downto 4) := "0111";      when "010111" =>  val(7 downto 4) := "1100";
      when "011000" =>  val(7 downto 4) := "0101";      when "011001" =>  val(7 downto 4) := "0010";
      when "011010" =>  val(7 downto 4) := "1010";      when "011011" =>  val(7 downto 4) := "1111";
      when "011100" =>  val(7 downto 4) := "0110";      when "011101" =>  val(7 downto 4) := "1000";
      when "011110" =>  val(7 downto 4) := "0001";      when "011111" =>  val(7 downto 4) := "0110";
      when "100000" =>  val(7 downto 4) := "0001";      when "100001" =>  val(7 downto 4) := "0110";
      when "100010" =>  val(7 downto 4) := "0100";      when "100011" =>  val(7 downto 4) := "1011";
      when "100100" =>  val(7 downto 4) := "1011";      when "100101" =>  val(7 downto 4) := "1101";
      when "100110" =>  val(7 downto 4) := "1101";      when "100111" =>  val(7 downto 4) := "1000";
      when "101000" =>  val(7 downto 4) := "1100";      when "101001" =>  val(7 downto 4) := "0001";
      when "101010" =>  val(7 downto 4) := "0011";      when "101011" =>  val(7 downto 4) := "0100";
      when "101100" =>  val(7 downto 4) := "0111";      when "101101" =>  val(7 downto 4) := "1010";
      when "101110" =>  val(7 downto 4) := "1110";      when "101111" =>  val(7 downto 4) := "0111";
      when "110000" =>  val(7 downto 4) := "1010";      when "110001" =>  val(7 downto 4) := "1001";
      when "110010" =>  val(7 downto 4) := "1111";      when "110011" =>  val(7 downto 4) := "0101";
      when "110100" =>  val(7 downto 4) := "0110";      when "110101" =>  val(7 downto 4) := "0000";
      when "110110" =>  val(7 downto 4) := "1000";      when "110111" =>  val(7 downto 4) := "1111";
      when "111000" =>  val(7 downto 4) := "0000";      when "111001" =>  val(7 downto 4) := "1110";
      when "111010" =>  val(7 downto 4) := "0101";      when "111011" =>  val(7 downto 4) := "0010";
      when "111100" =>  val(7 downto 4) := "1001";      when "111101" =>  val(7 downto 4) := "0011";
      when "111110" =>  val(7 downto 4) := "0010";      when "111111" =>  val(7 downto 4) := "1100";
      when others   =>  val(7 downto 4) := "1100";
    end case;

    -- SBOX 6
    case din(17 downto 12) is
      when "000000" =>  val(11 downto 8) := "1100";      when "000001" =>  val(11 downto 8) := "1010";
      when "000010" =>  val(11 downto 8) := "0001";      when "000011" =>  val(11 downto 8) := "1111";
      when "000100" =>  val(11 downto 8) := "1010";      when "000101" =>  val(11 downto 8) := "0100";
      when "000110" =>  val(11 downto 8) := "1111";      when "000111" =>  val(11 downto 8) := "0010";
      when "001000" =>  val(11 downto 8) := "1001";      when "001001" =>  val(11 downto 8) := "0111";
      when "001010" =>  val(11 downto 8) := "0010";      when "001011" =>  val(11 downto 8) := "1100";
      when "001100" =>  val(11 downto 8) := "0110";      when "001101" =>  val(11 downto 8) := "1001";
      when "001110" =>  val(11 downto 8) := "1000";      when "001111" =>  val(11 downto 8) := "0101";
      when "010000" =>  val(11 downto 8) := "0000";      when "010001" =>  val(11 downto 8) := "0110";
      when "010010" =>  val(11 downto 8) := "1101";      when "010011" =>  val(11 downto 8) := "0001";
      when "010100" =>  val(11 downto 8) := "0011";      when "010101" =>  val(11 downto 8) := "1101";
      when "010110" =>  val(11 downto 8) := "0100";      when "010111" =>  val(11 downto 8) := "1110";
      when "011000" =>  val(11 downto 8) := "1110";      when "011001" =>  val(11 downto 8) := "0000";
      when "011010" =>  val(11 downto 8) := "0111";      when "011011" =>  val(11 downto 8) := "1011";
      when "011100" =>  val(11 downto 8) := "0101";      when "011101" =>  val(11 downto 8) := "0011";
      when "011110" =>  val(11 downto 8) := "1011";      when "011111" =>  val(11 downto 8) := "1000";
      when "100000" =>  val(11 downto 8) := "1001";      when "100001" =>  val(11 downto 8) := "0100";
      when "100010" =>  val(11 downto 8) := "1110";      when "100011" =>  val(11 downto 8) := "0011";
      when "100100" =>  val(11 downto 8) := "1111";      when "100101" =>  val(11 downto 8) := "0010";
      when "100110" =>  val(11 downto 8) := "0101";      when "100111" =>  val(11 downto 8) := "1100";
      when "101000" =>  val(11 downto 8) := "0010";      when "101001" =>  val(11 downto 8) := "1001";
      when "101010" =>  val(11 downto 8) := "1000";      when "101011" =>  val(11 downto 8) := "0101";
      when "101100" =>  val(11 downto 8) := "1100";      when "101101" =>  val(11 downto 8) := "1111";
      when "101110" =>  val(11 downto 8) := "0011";      when "101111" =>  val(11 downto 8) := "1010";
      when "110000" =>  val(11 downto 8) := "0111";      when "110001" =>  val(11 downto 8) := "1011";
      when "110010" =>  val(11 downto 8) := "0000";      when "110011" =>  val(11 downto 8) := "1110";
      when "110100" =>  val(11 downto 8) := "0100";      when "110101" =>  val(11 downto 8) := "0001";
      when "110110" =>  val(11 downto 8) := "1010";      when "110111" =>  val(11 downto 8) := "0111";
      when "111000" =>  val(11 downto 8) := "0001";      when "111001" =>  val(11 downto 8) := "0110";
      when "111010" =>  val(11 downto 8) := "1101";      when "111011" =>  val(11 downto 8) := "0000";
      when "111100" =>  val(11 downto 8) := "1011";      when "111101" =>  val(11 downto 8) := "1000";
      when "111110" =>  val(11 downto 8) := "0110";      when "111111" =>  val(11 downto 8) := "1101";
      when others   =>  val(11 downto 8) := "1101";
    end case;

    -- SBOX 5
    case din(23 downto 18) is
      when "000000" =>  val(15 downto 12) := "0010";      when "000001" =>  val(15 downto 12) := "1110";
      when "000010" =>  val(15 downto 12) := "1100";      when "000011" =>  val(15 downto 12) := "1011";
      when "000100" =>  val(15 downto 12) := "0100";      when "000101" =>  val(15 downto 12) := "0010";
      when "000110" =>  val(15 downto 12) := "0001";      when "000111" =>  val(15 downto 12) := "1100";
      when "001000" =>  val(15 downto 12) := "0111";      when "001001" =>  val(15 downto 12) := "0100";
      when "001010" =>  val(15 downto 12) := "1010";      when "001011" =>  val(15 downto 12) := "0111";
      when "001100" =>  val(15 downto 12) := "1011";      when "001101" =>  val(15 downto 12) := "1101";
      when "001110" =>  val(15 downto 12) := "0110";      when "001111" =>  val(15 downto 12) := "0001";
      when "010000" =>  val(15 downto 12) := "1000";      when "010001" =>  val(15 downto 12) := "0101";
      when "010010" =>  val(15 downto 12) := "0101";      when "010011" =>  val(15 downto 12) := "0000";
      when "010100" =>  val(15 downto 12) := "0011";      when "010101" =>  val(15 downto 12) := "1111";
      when "010110" =>  val(15 downto 12) := "1111";      when "010111" =>  val(15 downto 12) := "1010";
      when "011000" =>  val(15 downto 12) := "1101";      when "011001" =>  val(15 downto 12) := "0011";
      when "011010" =>  val(15 downto 12) := "0000";      when "011011" =>  val(15 downto 12) := "1001";
      when "011100" =>  val(15 downto 12) := "1110";      when "011101" =>  val(15 downto 12) := "1000";
      when "011110" =>  val(15 downto 12) := "1001";      when "011111" =>  val(15 downto 12) := "0110";
      when "100000" =>  val(15 downto 12) := "0100";      when "100001" =>  val(15 downto 12) := "1011";
      when "100010" =>  val(15 downto 12) := "0010";      when "100011" =>  val(15 downto 12) := "1000";
      when "100100" =>  val(15 downto 12) := "0001";      when "100101" =>  val(15 downto 12) := "1100";
      when "100110" =>  val(15 downto 12) := "1011";      when "100111" =>  val(15 downto 12) := "0111";
      when "101000" =>  val(15 downto 12) := "1010";      when "101001" =>  val(15 downto 12) := "0001";
      when "101010" =>  val(15 downto 12) := "1101";      when "101011" =>  val(15 downto 12) := "1110";
      when "101100" =>  val(15 downto 12) := "0111";      when "101101" =>  val(15 downto 12) := "0010";
      when "101110" =>  val(15 downto 12) := "1000";      when "101111" =>  val(15 downto 12) := "1101";
      when "110000" =>  val(15 downto 12) := "1111";      when "110001" =>  val(15 downto 12) := "0110";
      when "110010" =>  val(15 downto 12) := "1001";      when "110011" =>  val(15 downto 12) := "1111";
      when "110100" =>  val(15 downto 12) := "1100";      when "110101" =>  val(15 downto 12) := "0000";
      when "110110" =>  val(15 downto 12) := "0101";      when "110111" =>  val(15 downto 12) := "1001";
      when "111000" =>  val(15 downto 12) := "0110";      when "111001" =>  val(15 downto 12) := "1010";
      when "111010" =>  val(15 downto 12) := "0011";      when "111011" =>  val(15 downto 12) := "0100";
      when "111100" =>  val(15 downto 12) := "0000";      when "111101" =>  val(15 downto 12) := "0101";
      when "111110" =>  val(15 downto 12) := "1110";      when "111111" =>  val(15 downto 12) := "0011";
      when others   =>  val(15 downto 12) := "0011";
    end case;

    -- SBOX 4
    case din(29 downto 24) is
      when "000000" =>  val(19 downto 16) := "0111";      when "000001" =>  val(19 downto 16) := "1101";
      when "000010" =>  val(19 downto 16) := "1101";      when "000011" =>  val(19 downto 16) := "1000";
      when "000100" =>  val(19 downto 16) := "1110";      when "000101" =>  val(19 downto 16) := "1011";
      when "000110" =>  val(19 downto 16) := "0011";      when "000111" =>  val(19 downto 16) := "0101";
      when "001000" =>  val(19 downto 16) := "0000";      when "001001" =>  val(19 downto 16) := "0110";
      when "001010" =>  val(19 downto 16) := "0110";      when "001011" =>  val(19 downto 16) := "1111";
      when "001100" =>  val(19 downto 16) := "1001";      when "001101" =>  val(19 downto 16) := "0000";
      when "001110" =>  val(19 downto 16) := "1010";      when "001111" =>  val(19 downto 16) := "0011";
      when "010000" =>  val(19 downto 16) := "0001";      when "010001" =>  val(19 downto 16) := "0100";
      when "010010" =>  val(19 downto 16) := "0010";      when "010011" =>  val(19 downto 16) := "0111";
      when "010100" =>  val(19 downto 16) := "1000";      when "010101" =>  val(19 downto 16) := "0010";
      when "010110" =>  val(19 downto 16) := "0101";      when "010111" =>  val(19 downto 16) := "1100";
      when "011000" =>  val(19 downto 16) := "1011";      when "011001" =>  val(19 downto 16) := "0001";
      when "011010" =>  val(19 downto 16) := "1100";      when "011011" =>  val(19 downto 16) := "1010";
      when "011100" =>  val(19 downto 16) := "0100";      when "011101" =>  val(19 downto 16) := "1110";
      when "011110" =>  val(19 downto 16) := "1111";      when "011111" =>  val(19 downto 16) := "1001";
      when "100000" =>  val(19 downto 16) := "1010";      when "100001" =>  val(19 downto 16) := "0011";
      when "100010" =>  val(19 downto 16) := "0110";      when "100011" =>  val(19 downto 16) := "1111";
      when "100100" =>  val(19 downto 16) := "1001";      when "100101" =>  val(19 downto 16) := "0000";
      when "100110" =>  val(19 downto 16) := "0000";      when "100111" =>  val(19 downto 16) := "0110";
      when "101000" =>  val(19 downto 16) := "1100";      when "101001" =>  val(19 downto 16) := "1010";
      when "101010" =>  val(19 downto 16) := "1011";      when "101011" =>  val(19 downto 16) := "0001";
      when "101100" =>  val(19 downto 16) := "0111";      when "101101" =>  val(19 downto 16) := "1101";
      when "101110" =>  val(19 downto 16) := "1101";      when "101111" =>  val(19 downto 16) := "1000";
      when "110000" =>  val(19 downto 16) := "1111";      when "110001" =>  val(19 downto 16) := "1001";
      when "110010" =>  val(19 downto 16) := "0001";      when "110011" =>  val(19 downto 16) := "0100";
      when "110100" =>  val(19 downto 16) := "0011";      when "110101" =>  val(19 downto 16) := "0101";
      when "110110" =>  val(19 downto 16) := "1110";      when "110111" =>  val(19 downto 16) := "1011";
      when "111000" =>  val(19 downto 16) := "0101";      when "111001" =>  val(19 downto 16) := "1100";
      when "111010" =>  val(19 downto 16) := "0010";      when "111011" =>  val(19 downto 16) := "0111";
      when "111100" =>  val(19 downto 16) := "1000";      when "111101" =>  val(19 downto 16) := "0010";
      when "111110" =>  val(19 downto 16) := "0100";      when "111111" =>  val(19 downto 16) := "1110";
      when others   =>  val(19 downto 16) := "1110";
    end case;

    -- SBOX 3
    case din(35 downto 30) is
      when "000000" =>  val(23 downto 20) := "1010";      when "000001" =>  val(23 downto 20) := "1101";
      when "000010" =>  val(23 downto 20) := "0000";      when "000011" =>  val(23 downto 20) := "0111";
      when "000100" =>  val(23 downto 20) := "1001";      when "000101" =>  val(23 downto 20) := "0000";
      when "000110" =>  val(23 downto 20) := "1110";      when "000111" =>  val(23 downto 20) := "1001";
      when "001000" =>  val(23 downto 20) := "0110";      when "001001" =>  val(23 downto 20) := "0011";
      when "001010" =>  val(23 downto 20) := "0011";      when "001011" =>  val(23 downto 20) := "0100";
      when "001100" =>  val(23 downto 20) := "1111";      when "001101" =>  val(23 downto 20) := "0110";
      when "001110" =>  val(23 downto 20) := "0101";      when "001111" =>  val(23 downto 20) := "1010";
      when "010000" =>  val(23 downto 20) := "0001";      when "010001" =>  val(23 downto 20) := "0010";
      when "010010" =>  val(23 downto 20) := "1101";      when "010011" =>  val(23 downto 20) := "1000";
      when "010100" =>  val(23 downto 20) := "1100";      when "010101" =>  val(23 downto 20) := "0101";
      when "010110" =>  val(23 downto 20) := "0111";      when "010111" =>  val(23 downto 20) := "1110";
      when "011000" =>  val(23 downto 20) := "1011";      when "011001" =>  val(23 downto 20) := "1100";
      when "011010" =>  val(23 downto 20) := "0100";      when "011011" =>  val(23 downto 20) := "1011";
      when "011100" =>  val(23 downto 20) := "0010";      when "011101" =>  val(23 downto 20) := "1111";
      when "011110" =>  val(23 downto 20) := "1000";      when "011111" =>  val(23 downto 20) := "0001";
      when "100000" =>  val(23 downto 20) := "1101";      when "100001" =>  val(23 downto 20) := "0001";
      when "100010" =>  val(23 downto 20) := "0110";      when "100011" =>  val(23 downto 20) := "1010";
      when "100100" =>  val(23 downto 20) := "0100";      when "100101" =>  val(23 downto 20) := "1101";
      when "100110" =>  val(23 downto 20) := "1001";      when "100111" =>  val(23 downto 20) := "0000";
      when "101000" =>  val(23 downto 20) := "1000";      when "101001" =>  val(23 downto 20) := "0110";
      when "101010" =>  val(23 downto 20) := "1111";      when "101011" =>  val(23 downto 20) := "1001";
      when "101100" =>  val(23 downto 20) := "0011";      when "101101" =>  val(23 downto 20) := "1000";
      when "101110" =>  val(23 downto 20) := "0000";      when "101111" =>  val(23 downto 20) := "0111";
      when "110000" =>  val(23 downto 20) := "1011";      when "110001" =>  val(23 downto 20) := "0100";
      when "110010" =>  val(23 downto 20) := "0001";      when "110011" =>  val(23 downto 20) := "1111";
      when "110100" =>  val(23 downto 20) := "0010";      when "110101" =>  val(23 downto 20) := "1110";
      when "110110" =>  val(23 downto 20) := "1100";      when "110111" =>  val(23 downto 20) := "0011";
      when "111000" =>  val(23 downto 20) := "0101";      when "111001" =>  val(23 downto 20) := "1011";
      when "111010" =>  val(23 downto 20) := "1010";      when "111011" =>  val(23 downto 20) := "0101";
      when "111100" =>  val(23 downto 20) := "1110";      when "111101" =>  val(23 downto 20) := "0010";
      when "111110" =>  val(23 downto 20) := "0111";      when "111111" =>  val(23 downto 20) := "1100";
      when others   =>  val(23 downto 20) := "1100";
    end case;

    -- SBOX 2
    case din(41 downto 36) is
      when "000000" =>  val(27 downto 24) := "1111";      when "000001" =>  val(27 downto 24) := "0011";
      when "000010" =>  val(27 downto 24) := "0001";      when "000011" =>  val(27 downto 24) := "1101";
      when "000100" =>  val(27 downto 24) := "1000";      when "000101" =>  val(27 downto 24) := "0100";
      when "000110" =>  val(27 downto 24) := "1110";      when "000111" =>  val(27 downto 24) := "0111";
      when "001000" =>  val(27 downto 24) := "0110";      when "001001" =>  val(27 downto 24) := "1111";
      when "001010" =>  val(27 downto 24) := "1011";      when "001011" =>  val(27 downto 24) := "0010";
      when "001100" =>  val(27 downto 24) := "0011";      when "001101" =>  val(27 downto 24) := "1000";
      when "001110" =>  val(27 downto 24) := "0100";      when "001111" =>  val(27 downto 24) := "1110";
      when "010000" =>  val(27 downto 24) := "1001";      when "010001" =>  val(27 downto 24) := "1100";
      when "010010" =>  val(27 downto 24) := "0111";      when "010011" =>  val(27 downto 24) := "0000";
      when "010100" =>  val(27 downto 24) := "0010";      when "010101" =>  val(27 downto 24) := "0001";
      when "010110" =>  val(27 downto 24) := "1101";      when "010111" =>  val(27 downto 24) := "1010";
      when "011000" =>  val(27 downto 24) := "1100";      when "011001" =>  val(27 downto 24) := "0110";
      when "011010" =>  val(27 downto 24) := "0000";      when "011011" =>  val(27 downto 24) := "1001";
      when "011100" =>  val(27 downto 24) := "0101";      when "011101" =>  val(27 downto 24) := "1011";
      when "011110" =>  val(27 downto 24) := "1010";      when "011111" =>  val(27 downto 24) := "0101";
      when "100000" =>  val(27 downto 24) := "0000";      when "100001" =>  val(27 downto 24) := "1101";
      when "100010" =>  val(27 downto 24) := "1110";      when "100011" =>  val(27 downto 24) := "1000";
      when "100100" =>  val(27 downto 24) := "0111";      when "100101" =>  val(27 downto 24) := "1010";
      when "100110" =>  val(27 downto 24) := "1011";      when "100111" =>  val(27 downto 24) := "0001";
      when "101000" =>  val(27 downto 24) := "1010";      when "101001" =>  val(27 downto 24) := "0011";
      when "101010" =>  val(27 downto 24) := "0100";      when "101011" =>  val(27 downto 24) := "1111";
      when "101100" =>  val(27 downto 24) := "1101";      when "101101" =>  val(27 downto 24) := "0100";
      when "101110" =>  val(27 downto 24) := "0001";      when "101111" =>  val(27 downto 24) := "0010";
      when "110000" =>  val(27 downto 24) := "0101";      when "110001" =>  val(27 downto 24) := "1011";
      when "110010" =>  val(27 downto 24) := "1000";      when "110011" =>  val(27 downto 24) := "0110";
      when "110100" =>  val(27 downto 24) := "1100";      when "110101" =>  val(27 downto 24) := "0111";
      when "110110" =>  val(27 downto 24) := "0110";      when "110111" =>  val(27 downto 24) := "1100";
      when "111000" =>  val(27 downto 24) := "1001";      when "111001" =>  val(27 downto 24) := "0000";
      when "111010" =>  val(27 downto 24) := "0011";      when "111011" =>  val(27 downto 24) := "0101";
      when "111100" =>  val(27 downto 24) := "0010";      when "111101" =>  val(27 downto 24) := "1110";
      when "111110" =>  val(27 downto 24) := "1111";      when "111111" =>  val(27 downto 24) := "1001";
      when others   =>  val(27 downto 24) := "1001";
    end case;

    -- SBOX 1
    case din(47 downto 42) is
      when "000000" =>  val(31 downto 28) := "1110";      when "000001" =>  val(31 downto 28) := "0000";
      when "000010" =>  val(31 downto 28) := "0100";      when "000011" =>  val(31 downto 28) := "1111";
      when "000100" =>  val(31 downto 28) := "1101";      when "000101" =>  val(31 downto 28) := "0111";
      when "000110" =>  val(31 downto 28) := "0001";      when "000111" =>  val(31 downto 28) := "0100";
      when "001000" =>  val(31 downto 28) := "0010";      when "001001" =>  val(31 downto 28) := "1110";
      when "001010" =>  val(31 downto 28) := "1111";      when "001011" =>  val(31 downto 28) := "0010";
      when "001100" =>  val(31 downto 28) := "1011";      when "001101" =>  val(31 downto 28) := "1101";
      when "001110" =>  val(31 downto 28) := "1000";      when "001111" =>  val(31 downto 28) := "0001";
      when "010000" =>  val(31 downto 28) := "0011";      when "010001" =>  val(31 downto 28) := "1010";
      when "010010" =>  val(31 downto 28) := "1010";      when "010011" =>  val(31 downto 28) := "0110";
      when "010100" =>  val(31 downto 28) := "0110";      when "010101" =>  val(31 downto 28) := "1100";
      when "010110" =>  val(31 downto 28) := "1100";      when "010111" =>  val(31 downto 28) := "1011";
      when "011000" =>  val(31 downto 28) := "0101";      when "011001" =>  val(31 downto 28) := "1001";
      when "011010" =>  val(31 downto 28) := "1001";      when "011011" =>  val(31 downto 28) := "0101";
      when "011100" =>  val(31 downto 28) := "0000";      when "011101" =>  val(31 downto 28) := "0011";
      when "011110" =>  val(31 downto 28) := "0111";      when "011111" =>  val(31 downto 28) := "1000";
      when "100000" =>  val(31 downto 28) := "0100";      when "100001" =>  val(31 downto 28) := "1111";
      when "100010" =>  val(31 downto 28) := "0001";      when "100011" =>  val(31 downto 28) := "1100";
      when "100100" =>  val(31 downto 28) := "1110";      when "100101" =>  val(31 downto 28) := "1000";
      when "100110" =>  val(31 downto 28) := "1000";      when "100111" =>  val(31 downto 28) := "0010";
      when "101000" =>  val(31 downto 28) := "1101";      when "101001" =>  val(31 downto 28) := "0100";
      when "101010" =>  val(31 downto 28) := "0110";      when "101011" =>  val(31 downto 28) := "1001";
      when "101100" =>  val(31 downto 28) := "0010";      when "101101" =>  val(31 downto 28) := "0001";
      when "101110" =>  val(31 downto 28) := "1011";      when "101111" =>  val(31 downto 28) := "0111";
      when "110000" =>  val(31 downto 28) := "1111";      when "110001" =>  val(31 downto 28) := "0101";
      when "110010" =>  val(31 downto 28) := "1100";      when "110011" =>  val(31 downto 28) := "1011";
      when "110100" =>  val(31 downto 28) := "1001";      when "110101" =>  val(31 downto 28) := "0011";
      when "110110" =>  val(31 downto 28) := "0111";      when "110111" =>  val(31 downto 28) := "1110";
      when "111000" =>  val(31 downto 28) := "0011";      when "111001" =>  val(31 downto 28) := "1010";
      when "111010" =>  val(31 downto 28) := "1010";      when "111011" =>  val(31 downto 28) := "0000";
      when "111100" =>  val(31 downto 28) := "0101";      when "111101" =>  val(31 downto 28) := "0110";
      when "111110" =>  val(31 downto 28) := "0000";      when "111111" =>  val(31 downto 28) := "1101";
      when others   =>  val(31 downto 28) := "1101";
    end case;

    return val;
  end des_sbox;


  --------------------------------------------------------
  -- P-Box Permutation
  function des_pbox(din   :std_logic_vector (31 downto 0))
                    return std_logic_vector is
    variable val 	:std_logic_vector (31 downto 0);
  begin
    val := din(32-16) & din(32- 7) & din(32-20) & din(32-21) & din(32-29) & din(32-12) & din(32-28) & din(32-17) &
           din(32- 1) & din(32-15) & din(32-23) & din(32-26) & din(32- 5) & din(32-18) & din(32-31) & din(32-10) &
           din(32- 2) & din(32- 8) & din(32-24) & din(32-14) & din(32-32) & din(32-27) & din(32- 3) & din(32- 9) &
           din(32-19) & din(32-13) & din(32-30) & din(32- 6) & din(32-22) & din(32-11) & din(32- 4) & din(32-25);
    return val;
  end des_pbox;


  --------------------------------------------------------
  -- Key Shift
  function des_keyshift (din	:std_logic_vector (55 downto 0);
                         n 	:std_logic_vector (4 downto 0))
                         return std_logic_vector is
    variable val	:std_logic_vector (55 downto 0);
  begin
    case n is
      when "00000" =>  val := din(55 downto 28)                      & din(27 downto  0);
      when "00001" =>  val := din(54 downto 28) & din (55)           & din(26 downto  0) & din (27);
      when "00010" =>  val := din(53 downto 28) & din (55 downto 54) & din(25 downto  0) & din (27 downto 26);
    --when "00011" =>  val := din(52 downto 28) & din (55 downto 53) & din(24 downto  0) & din (27 downto 25);
      when "00100" =>  val := din(51 downto 28) & din (55 downto 52) & din(23 downto  0) & din (27 downto 24);
    --when "00101" =>  val := din(50 downto 28) & din (55 downto 51) & din(22 downto  0) & din (27 downto 23);
      when "00110" =>  val := din(49 downto 28) & din (55 downto 50) & din(21 downto  0) & din (27 downto 22);
    --when "00111" =>  val := din(48 downto 28) & din (55 downto 49) & din(20 downto  0) & din (27 downto 21);
      when "01000" =>  val := din(47 downto 28) & din (55 downto 48) & din(19 downto  0) & din (27 downto 20);
    --when "01001" =>  val := din(46 downto 28) & din (55 downto 47) & din(18 downto  0) & din (27 downto 19);
      when "01010" =>  val := din(45 downto 28) & din (55 downto 46) & din(17 downto  0) & din (27 downto 18);
    --when "01011" =>  val := din(44 downto 28) & din (55 downto 45) & din(16 downto  0) & din (27 downto 17);
      when "01100" =>  val := din(43 downto 28) & din (55 downto 44) & din(15 downto  0) & din (27 downto 16);
    --when "01101" =>  val := din(42 downto 28) & din (55 downto 43) & din(14 downto  0) & din (27 downto 15);
      when "01110" =>  val := din(41 downto 28) & din (55 downto 42) & din(13 downto  0) & din (27 downto 14);
      when "01111" =>  val := din(40 downto 28) & din (55 downto 41) & din(12 downto  0) & din (27 downto 13);
    --when "10000" =>  val := din(39 downto 28) & din (55 downto 40) & din(11 downto  0) & din (27 downto 12);
      when "10001" =>  val := din(38 downto 28) & din (55 downto 39) & din(10 downto  0) & din (27 downto 11);
    --when "10010" =>  val := din(37 downto 28) & din (55 downto 38) & din( 9 downto  0) & din (27 downto 10);
      when "10011" =>  val := din(36 downto 28) & din (55 downto 37) & din( 8 downto  0) & din (27 downto  9);
    --when "10100" =>  val := din(35 downto 28) & din (55 downto 36) & din( 7 downto  0) & din (27 downto  8);
      when "10101" =>  val := din(34 downto 28) & din (55 downto 35) & din( 6 downto  0) & din (27 downto  7);
    --when "10110" =>  val := din(33 downto 28) & din (55 downto 34) & din( 5 downto  0) & din (27 downto  6);
      when "10111" =>  val := din(32 downto 28) & din (55 downto 33) & din( 4 downto  0) & din (27 downto  5);
    --when "11000" =>  val := din(31 downto 28) & din (55 downto 32) & din( 3 downto  0) & din (27 downto  4);
      when "11001" =>  val := din(30 downto 28) & din (55 downto 31) & din( 2 downto  0) & din (27 downto  3);
    --when "11010" =>  val := din(29 downto 28) & din (55 downto 30) & din( 1 downto  0) & din (27 downto  2);
      when "11011" =>  val := din(28          ) & din (55 downto 29) & din( 0          ) & din (27 downto  1);
      when others  =>  val := din;
    end case;

    return val;
  end des_keyshift;

end des_lib;

----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.des_lib.all;

entity des_round is
    port (clk		:in std_logic;
          reset		:in std_logic;
          stall		:in std_logic;

	  encrypt_in	:in std_logic;
          encrypt_shift	:in std_logic_vector (4 downto 0);
          decrypt_shift	:in std_logic_vector (4 downto 0);
          key_in	:in std_logic_vector (55 downto 0);
          din		:in std_logic_vector (63 downto 0);
          din_valid     :in std_logic;	


	  encrypt_out	:out std_logic;
          key_out	:out std_logic_vector (55 downto 0);
          dout		:out std_logic_vector (63 downto 0);
          dout_valid	:out std_logic
         );
end des_round;


architecture arch_des_round of des_round is
begin

  process (clk, reset, stall, key_in, din, din_valid, encrypt_IN, encrypt_shift, decrypt_shift)
    variable key        :std_logic_vector (47 downto 0);
    variable data_ep    :std_logic_vector (47 downto 0);
    variable data_sbox  :std_logic_vector (31 downto 0);
    variable data_pbox  :std_logic_vector (31 downto 0);
  begin
    if reset='1' then
      key_out <= "00000000000000000000000000000000000000000000000000000000";
      dout  <= "0000000000000000000000000000000000000000000000000000000000000000";
      dout_valid <= '0';
	  encrypt_out <= '0';
    elsif clk'event and clk='1' then
      if stall='0' then
        -- Handle the key
        encrypt_out <= encrypt_in;
        key_out   <= key_in;
        if encrypt_in='1' then
          key       := des_cp(des_keyshift(key_in,encrypt_shift));
        else
          key       := des_cp(des_keyshift(key_in,decrypt_shift));
        end if;        

        -- Handle the data
        data_ep   := des_ep(din(31 downto 0)) xor key;
        data_sbox := des_sbox(data_ep);
        data_pbox := des_pbox(data_sbox) xor din(63 downto 32);
        dout      <= din(31 downto 0) & data_pbox;

        dout_valid <= din_valid;
      end if;
    end if;
  end process;

end arch_des_round;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.des_lib.all;

entity des_small is
    port (clk		:in std_logic;
          reset		:in std_logic;

          encrypt	:in std_logic;
          key_in	:in std_logic_vector (55 downto 0);
          din		:in std_logic_vector (63 downto 0);
          din_valid	:in std_logic;
          
          busy		:buffer std_logic;
          dout		:out std_logic_vector (63 downto 0);
          dout_valid	:out std_logic
         );
end des_small;


architecture arch_des_small of des_small is
  type STATES is (IDLE, WORKING);
  signal state  	:STATES := IDLE;
  signal round		:std_logic_vector (3 downto 0) := "0000";
  signal stall		:std_logic := '0';

  signal key		:std_logic_vector (55 downto 0) := "00000000000000000000000000000000000000000000000000000000";
  signal encrypt_flag	:std_logic := '1'; 

  signal encrypt_in	:std_logic := '1';
  signal encrypt_shift	:std_logic_vector (4 downto 0) := "00000";
  signal decrypt_shift	:std_logic_vector (4 downto 0) := "00000";
  signal r_key_in	:std_logic_vector (55 downto 0) := "00000000000000000000000000000000000000000000000000000000";
  signal r_din		:std_logic_vector (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
  
  signal r_dout		:std_logic_vector (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
  signal dummy1		:std_logic := '0';
  signal dummy2 	:std_logic := '0';
  signal dummy3 	:std_logic := '0';
  signal dummy4 	:std_logic_vector (55 downto 0) := "00000000000000000000000000000000000000000000000000000000";
begin

  -- Manage the IDLE/WORKING state machine
  process (clk, reset, round, din_valid)
  begin
    if reset='1' then
      state <= IDLE;
    elsif clk'event and clk='1' then
      case state is
        when IDLE =>
            if din_valid='1' then
              state <= WORKING;
            end if;

        when WORKING =>
            if (round="1111") then
              state <= IDLE;
            end if;
      end case;
    end if;
  end process;

  -- Track the current DES round
  process (clk, reset, din_valid, state)
  begin
    if reset='1' then
      round <= "0000";
    elsif clk'event and clk='1' then
      if state/=IDLE then
        round <= round + 1;
      elsif din_valid='1' then
        round <= round + 1;
      else
        round <= "0000";
      end if;
    end if;
  end process;

  -- Generate the busy signal
  process (clk, reset, state, round, din_valid)
  begin
    if reset='1' then
      busy <= '0';
    elsif clk'event and clk='1' then
      if state=IDLE and din_valid='0' then
        busy <= '0';
      elsif round="1111" then
        busy <= '0';
      else
        busy <= '1';
      end if;
    end if;
  end process;


  -- Latch the encrypt_flag, key
  process (clk, reset, state, din_valid, encrypt, key_in)
  begin
    if reset='1' then
      encrypt_flag <= '0';
      key <= "00000000000000000000000000000000000000000000000000000000";
    elsif clk'event and clk='1' then
      if state=IDLE and din_valid='1' then
        encrypt_flag <= encrypt;
        key <= key_in;
      end if;
    end if;
  end process;

  -- Mux the inputs to des_round
  encrypt_in <= encrypt when state=IDLE else encrypt_flag;
  r_key_in <= key_in when state=IDLE else key;
  r_din <= des_ip(din) when state=IDLE else r_dout;
  dummy1 <= '0';
  stall <= '0';

  -- Do the round
  ROUND0: des_round port map (clk, reset, stall,
               encrypt_in, encrypt_shift, decrypt_shift,
               r_key_in, r_din, dummy1,
               dummy2, dummy4, r_dout, dummy3);


  -- Generate the encrypt/decrypt key shift amounts:
  process (round)
  begin
    case round is
      when "0000" =>  encrypt_shift <= "00001"; decrypt_shift <= "00000";
      when "0001" =>  encrypt_shift <= "00010"; decrypt_shift <= "11011";
      when "0010" =>  encrypt_shift <= "00100"; decrypt_shift <= "11001";
      when "0011" =>  encrypt_shift <= "00110"; decrypt_shift <= "10111";
      when "0100" =>  encrypt_shift <= "01000"; decrypt_shift <= "10101";
      when "0101" =>  encrypt_shift <= "01010"; decrypt_shift <= "10011";
      when "0110" =>  encrypt_shift <= "01100"; decrypt_shift <= "10001";
      when "0111" =>  encrypt_shift <= "01110"; decrypt_shift <= "01111";
      when "1000" =>  encrypt_shift <= "01111"; decrypt_shift <= "01110";
      when "1001" =>  encrypt_shift <= "10001"; decrypt_shift <= "01100";
      when "1010" =>  encrypt_shift <= "10011"; decrypt_shift <= "01010";
      when "1011" =>  encrypt_shift <= "10101"; decrypt_shift <= "01000";
      when "1100" =>  encrypt_shift <= "10111"; decrypt_shift <= "00110";
      when "1101" =>  encrypt_shift <= "11001"; decrypt_shift <= "00100";
      when "1110" =>  encrypt_shift <= "11011"; decrypt_shift <= "00010";
      when "1111" =>  encrypt_shift <= "00000"; decrypt_shift <= "00001";
      when others =>  encrypt_shift <= "00001"; decrypt_shift <= "00000";
    end case;
  end process;

  -- Generate the dout_valid signal
  process (clk, reset, round)
  begin
    if reset='1' then
      dout_valid <= '0';
    elsif clk'event and clk='1' then
      if round="1111" then
        dout_valid <= '1';
      else
        dout_valid <= '0';
      end if;      
    end if;
  end process;

  -- Output the data
  dout <= des_fp(r_dout(31 downto 0) & r_dout(63 downto 32));

end arch_des_small;


----------------------------------------------------------------------------
----------------------------------------------------------------------------

-- The 2nd part --
-- **********************************************************************
--  $RCSfile: des_coreI.vhd,v $
--  $Revision: 1.1 $
--  last change by $Author: sirikhum $
--  at $Date: 2002/12/12 02:40:43 $
-- **********************************************************************
--
--   GNU Lesser General Public License Version 2.1
--   ===============================================
--   Copyright 2002 by Noppadon Sirikhum
--
--   This library is free software; you can redistribute it and/or
--   modify it under the terms of the GNU Lesser General Public
--   License version 2.1, as published by the Free Software Foundation.
--
--   This library is distributed in the hope that it will be useful,
--   but WITHOUT ANY WARRANTY; without even the implied warranty of
--   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--   Lesser General Public License for more details.
--
--   You should have received a copy of the GNU Lesser General Public
--   License along with this library; if not, write to the Free Software
--   Foundation, Inc., 59 Temple Place, Suite 330, Boston,
--   MA  02111-1307  USA
--
-- **********************************************************************

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

package des_core_libI is
  component des_coreI 
	port (	sys_clk	:in std_logic;
		sys_reset	:in std_logic;
		isa_aen	:in std_logic;
		cs_out	:out std_logic; 
		dir_out	:out std_logic;

		addr_bus	:in std_logic_vector(11 downto 0);
		data_bus	:inout std_logic_vector(15 downto 0);
		irq		:out std_logic :='1';
		ior		:in std_logic;
		iow		:in std_logic;
		iocs16		:out std_logic;
		iochrdy		:out std_logic
		);
  end component;

end des_core_libI;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.des_lib.all;
use work.des_core_libI.all;

entity des_coreI is 
	port (	sys_clk	:in std_logic;
		sys_reset	:in std_logic;
		isa_aen	:in std_logic;
		cs_out	:out std_logic := '1';
		dir_out	:out std_logic := '0';

		addr_bus	:in std_logic_vector(11 downto 0);
		data_bus	:inout std_logic_vector(15 downto 0) := "ZZZZZZZZZZZZZZZZ"; 
		irq		:out std_logic :='0';
--		irq_ack		:in std_logic;
		ior		:in std_logic;
		iow		:in std_logic;
		iocs16		:out std_logic;
		iochrdy		:out std_logic := '1'
		);
end des_coreI;

architecture arch_stub of des_coreI is
	signal data_from_bus_buf	:std_logic_vector (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
	signal data_from_des_buf	:std_logic_vector (63 downto 0)	:= "0000000000000000000000000000000000000000000000000000000000000000";
	signal data_to_bus_buf		:std_logic_vector(63 downto 0);
	signal key_from_bus_buf		:std_logic_vector (55 downto 0) := "00000000000000000000000000000000000000000000000000000000";
	signal fetched		:std_logic := '1'; -- fetch data&key completely
						   -- initialize with 1 to solve
						   -- data_to_xor_valid's issue
	signal cs		:std_logic := '0';
	signal csI		:std_logic := '0';
	signal csII		:std_logic := '0';
	signal irq_wait		:std_logic := '0';
	signal iirq		:std_logic := '0';
	signal isr_ack		:std_logic := '0'; -- our irq_ack-self_gen
	signal cs_datai		:std_logic_vector (3 downto 0) := "0000";
	signal cs_key		:std_logic_vector (3 downto 0) := "0000";
	signal cs_datao		:std_logic_vector (3 downto 0) := "0000";
	signal en_decrypt		:std_logic := '1';
	signal busy_from_des	:std_logic;
	signal des_out_valif	:std_logic;
	signal data_from_des_valid	:std_logic;
	
--	signal encrypt_flag		:std_logic;
--	signal decrypt_flag		:std_logic
--	signal fetchinf			:std_logic;

begin
---------------------------
-- module chip select     -
---------------------------
-- comment this 'cause of 10-bits ioports-addr limit.
-- our ioport-range are 0x110-0x11f for din and key 
-- and 0x120-0x126 for dout.
-- the last added range 'cause of 16bit data tranfer use 2 address.
-- (which  will easier if we use even addresses)
--	cs := addr_bus(15) and not addr_bus(14) and not addr_bus(13) and
--		not addr_bus(12) and not addr_bus(11) and not addr_bus(10) and
	csI <=  (((not addr_bus(11) and  not addr_bus(10)) and  
		(not addr_bus(9) and addr_bus(8))) and 
		((not addr_bus(7) and not addr_bus(6)) and
		(not addr_bus(5) and addr_bus(4)))) and 
		(not iow and not isa_aen);
	csII <=  (((not addr_bus(11) and  not addr_bus(10)) and  
		(not addr_bus(9) and addr_bus(8))) and 
		((not addr_bus(7) and not addr_bus(6)) and
		(addr_bus(5) and not addr_bus(4)))) and 
		(not ior and not isa_aen);
	-- use aen to make sure that not DMA cycle
		
	-- fetch data chip select 0x110-0x116
	cs_datai(0) 	<= csI and (not addr_bus(3) and not addr_bus(2)) and
				not addr_bus(1);
	cs_datai(1) 	<= csI and (not addr_bus(3) and not addr_bus(2)) and 
				addr_bus(1); 
	cs_datai(2) 	<= csI and (not addr_bus(3) and addr_bus(2)) and
				not addr_bus(1);
	cs_datai(3) 	<= csI and (not addr_bus(3) and addr_bus(2)) and
				addr_bus(1);
				
	-- fetch key chip select 0x118 - 0x11e
	cs_key(0) 	<= csI and (addr_bus(3) and not addr_bus(2)) and
				not addr_bus(1);
	cs_key(1)	<= csI and (addr_bus(3) and not addr_bus(2)) and 
				addr_bus(1);
	cs_key(2)	<= csI and (addr_bus(3) and addr_bus(2)) and 
				not addr_bus(1);
	cs_key(3)	<= csI and (addr_bus(3) and addr_bus(2)) and
				addr_bus(1);

	-- out crypted data chip select 0x120 - 0x126
	cs_datao(0)	<= csII and (not addr_bus(3) and not addr_bus(2)) and
				not addr_bus(1); 
	cs_datao(1)	<= csII and (not addr_bus(3) and not addr_bus(2)) and
				addr_bus(1);
	cs_datao(2)	<= csII and (not addr_bus(3) and addr_bus(2)) and
				not addr_bus(1);
	cs_datao(3)	<= csII and (not addr_bus(3) and addr_bus(2)) and
				addr_bus(1);
	cs <= csI or csII;
	dir_out <= '1' when csII='1' else '0'; 
	cs_out <= not cs;

----------------------------
-- module 'CTL' signal out -
----------------------------
	iocs16 <= not cs;
        iochrdy	<= not cs;

---------------
-- module des -
---------------
--	data_to_bus_buf <= (data_from_bus_buf XOR (key_from_bus_buf&"11111111"));
DES_SM: des_small port map (sys_clk, sys_reset, en_decrypt, key_from_bus_buf,
	data_from_bus_buf, cs_key(3), busy_from_des, data_from_des_buf,
	data_from_des_valid);

	data_to_bus_buf <= data_from_des_buf when data_from_des_valid='1'
		else data_to_bus_buf;

------------------------
-- module IRQ steering -
------------------------
	irq <= iirq;
	isr_ack <= (iirq and csII);

--irq1_steering:process(sys_clk)
--begin
--	wait until (sys_clk'event and sys_clk='0' ) or (sys_clk'event and sys_clk='1'); 
--			
--end process;

irq2_steering:process(sys_clk, data_from_des_valid, isr_ack)
begin
--	wait until ((sys_clk'event and sys_clk='0' ) or (sys_clk'event and sys_clk='1'));

--if ((sys_clk'event and sys_clk='0' ) or (sys_clk'event and sys_clk='1'))then
	if sys_clk'event then
--		iirq <= '1' when cs_key(3)='1'
--			else '0' when isr_ack='1'
--			else iirq;
		
		if (data_from_des_valid='1') then
			iirq<='1';
		elsif (isr_ack='1') then
			iirq<='0';
		else iirq<=iirq;
		end if;
	end if;
			
end process;

-------------------------
-- module DATA steering -
-------------------------
--	data_bus <= "ZZZZZZZZZZZZZZZZ" when (cs='0') else data_bus(15 downto 0);

-- fetch din
	data_from_bus_buf(63 downto 48) <= data_bus(15 downto 0) when (cs_datai(0)='1') else data_from_bus_buf(63 downto 48);
	data_from_bus_buf(47 downto 32) <= data_bus(15 downto 0) when (cs_datai(1)='1') else data_from_bus_buf(47 downto 32);
	data_from_bus_buf(31 downto 16) <= data_bus(15 downto 0) when (cs_datai(2)='1') else data_from_bus_buf(31 downto 16);
	data_from_bus_buf(15 downto 0) <= data_bus(15 downto 0) when (cs_datai(3)='1') else data_from_bus_buf(15 downto 0);

-- fetch key(in)
	key_from_bus_buf(55 downto 40) <= data_bus(15 downto 0) when (cs_key(0)='1') else key_from_bus_buf(55 downto 40);
	key_from_bus_buf(39 downto 24) <= data_bus(15 downto 0) when (cs_key(1)='1') else key_from_bus_buf(39 downto 24);
	key_from_bus_buf(23 downto 8) <= data_bus(15 downto 0) when (cs_key(2)='1') else key_from_bus_buf(23 downto 8);
	key_from_bus_buf(7 downto 0) <= data_bus(15 downto 8) when (cs_key(3)='1') else key_from_bus_buf(7 downto 0);

	en_decrypt <= data_bus(7) when (cs_key(3)='1') else en_decrypt;

-- out cdata
	data_bus(15 downto 0) <= data_to_bus_buf(63 downto 48) when (cs_datao(0)='1') 
 		else data_to_bus_buf(47 downto 32) when (cs_datao(1)='1') 
		else data_to_bus_buf(31 downto 16) when (cs_datao(2)='1')
		else data_to_bus_buf(15 downto 0) when (cs_datao(3)='1')
		else "ZZZZZZZZZZZZZZZZ";


	

--DES_CORE:xor_crypt port map(xor_clk, xor_reset, en_decrypt, key_to_xor, data_to_xor, data_to_xor_valid, running_xor, data_from_xor, data_from_xor_valid);


-- get_data() load both data and key from 
-- It load datas every positive'edge of clock
--get_data:process(data_bus, clk, reset, cs_datai, cs_key, iow)
--get_data:process(sys_clk, sys_reset, cs, iow, ior)
--get_data:process(sys_clk, sys_reset)
--begin
--	if sys_reset = '1' then 
----	 dir_out	<= '0';
--	 data_bus(15 downto 0) <= "ZZZZZZZZZZZZZZZZ";
--	 data_from_bus_buf 	<="0000000000000000000000000000000000000000000000000000000000000000";
----	 data_to_xor 	<="0000000000000000000000000000000000000000000000000000000000000000";
--	 key_from_bus_buf	<="00000000000000000000000000000000000000000000000000000000";
----	 ack      	<='0';
--	 fetched	<='1';
--	 en_decrypt	<='1';
----	 is_ok    	<='1';
--	elsif sys_clk'event then
--	 if cs = '1' then
--	   if iow = '0' then 	-- read data from BUS
--		-- start loading data
--		if  cs_datai(0) = '1' then
--		 	data_from_bus_buf(63 downto 48) <= data_bus(15 downto 0);
--			fetched <= '0';
--		elsif cs_datai(1)  = '1' then
--		 	data_from_bus_buf(47 downto 32) <= data_bus(15 downto 0);
--			fetched <= '0';
--		elsif cs_datai(2) = '1' then
-- 			data_from_bus_buf(31 downto 16) <= data_bus(15 downto 0);
--			fetched <= '0';
--		elsif cs_datai(3) = '1' then
--			data_from_bus_buf(15 downto 0) <= data_bus(15 downto 0);
--			fetched <= '0';
--			
--		-- start loading key
--		elsif cs_key(0) = '1' then
--	 		key_from_bus_buf(55 downto 40) <= data_bus(15 downto 0);
--			fetched <= '0';
-- 		elsif cs_key(1) = '1' then
--		  	key_from_bus_buf(39 downto 24) <= data_bus(15 downto 0);
--			fetched <= '0';
--		elsif cs_key(2) = '1' then
--		 	key_from_bus_buf(23 downto 8) <= data_bus(15 downto 0);
--			fetched <= '0';
--		elsif cs_key(3) = '1' then
--			key_from_bus_buf(7 downto 0) <= data_bus(15 downto 8);
--			-- en/de-crypt : 1=encrypt, 0=decrypt
--			en_decrypt <= data_bus(7);
--			fetched <= '1';	-- fetched was used as 'START_NOW'
--		end if;
--	   elsif ior='0' then -- write data to BUS
--		if cs_datao(0) = '1' then
--			data_bus(15 downto 0) <= data_to_bus_buf(63 downto 48);
--		elsif cs_datao(1) = '1' then
--			data_bus(15 downto 0) <= data_to_bus_buf(47 downto 32);
--		elsif cs_datao(2) = '1' then
--			data_bus(15 downto 0) <= data_to_bus_buf(31 downto 16);
--		elsif cs_datao(3) = '1' then
--			data_bus(15 downto 0) <= data_to_bus_buf(15 downto 0);
--		end if;
--	   end if;
--	 end if;
--	elsif ior = '1' and iow='1' then
--		data_bus(15 downto 0) <= "ZZZZZZZZZZZZZZZZ";
--	end if;
--
----	iochrdy<='1'; -- ok fetch completed
--end process;


-- handle crypto completed
-- handle interrupt ack
-- fetch data and 
--end_crypt:process(data_from_xor_valid, irq_ack)
--end_crypt:process(clk, data_from_xor_valid)

--end_crypt:process(sys_reset, sys_clk, fetched)
--begin
--	if sys_reset = '1' then
--		irq <= '0';
--		irq_wait <= '0';
--	elsif sys_clk'event and sys_clk='1' then
--		if fetched = '1' then
--			irq_wait <= '1';
--		elsif irq_wait <= '1' then
--			irq <= '1'; 
--			irq_wait <= '0';
--		elsif isr_ack = '1' then
--			irq <= '0';
--		end if;
--	end if;
--end process; -- end_crypt()


-- send crypted data back
--write_data:process(reset, clk, cs, ior, cs_datao)
--begin
--	if reset = '1' then
--		iochrdy <= '1';
--		data_bus(15 downto 0) <= "ZZZZZZZZZZZZZZZZ";
--	elsif cs='1' and ior'event and ior='0' then
--		iochrdy <= '0';
--		if cs_datao(0) = '1' then
--			data_bus(15 downto 0) <= crypted_data(63 downto 48);
--		elsif cs_datao(1) = '1' then
--			data_bus(15 downto 0) <= crypted_data(47 downto 32);
--		elsif cs_datao(2) = '1' then
--			data_bus(15 downto 0) <= crypted_data(31 downto 16);
--		elsif cs_datao(3) = '1' then
--			data_bus(15 downto 0) <= crypted_data(15 downto 0);
--		end if;
--	elsif clk'event and clk = '0' and ior = '0' then
--		iochrdy <= '1';
--	elsif clk'event and clk = '0' and ior = '1' then
--		iochrdy <= '1';
--		data_bus(15 downto 0) <= "ZZZZZZZZZZZZZZZZ";
--	end if;
--end process; -- write_data()

end; -- architecture
