-- **********************************************************************
--  $RCSfile: xor.vhd,v $
--  $Revision: 1.2 $
--  last change by $Author: sirikhum $
--  at $Date: 2002/10/28 14:31:49 $
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


package xor_lib is
  component xor_crypt
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
end xor_lib;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.xor_lib.all;

entity xor_crypt is
    port (clk		:in std_logic;
          reset		:in std_logic;

          encrypt	:in std_logic;
          key_in	:in std_logic_vector (55 downto 0);
          din		:in std_logic_vector (63 downto 0);
          din_valid	:in std_logic;
          
          busy		:buffer std_logic:='0';	  
          dout		:out std_logic_vector (63 downto 0);
          dout_valid	:out std_logic
         );
end xor_crypt;


architecture arch_xor_crypt of xor_crypt is
  type STATES is (IDLE, WORKING, FINISHED);
  signal state  	:STATES := IDLE;
  
  signal key_in_buf	:std_logic_vector (55 downto 0) := "00000000000000000000000000000000000000000000000000000000";
  signal din_buf	:std_logic_vector(63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
  signal dout_buf	:std_logic_vector(63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
  
  signal encrypt_buf	:std_logic := '1'; 
begin

-- control data_flow and data_latch and also for state
process (reset, din_valid, dout_buf, busy)
begin
  if reset = '1' then
    encrypt_buf <= '0';
    state <= IDLE;
  elsif din_valid='1' and state=IDLE then
    din_buf <= din;
    key_in_buf <= key_in;
    encrypt_buf <= encrypt;
    state <= WORKING;
  elsif dout_buf'event then
    dout <= dout_buf;
    state <= FINISHED;
  elsif busy='0' then
    state <= IDLE;
  end if;
end process;


-- X|
process(state)
begin
  if state=WORKING and busy='0' then
    busy <= '1';
--    wait for 10 ns;
    dout_buf <= din_buf XOR key_in_buf&"11111111";
--    wait for 10 ns;
    busy <= '0';
  end if;
end process;


-- Generate the dout_valid signal
process (clk, reset, state)
begin
    if reset='1' then
      dout_valid <= '0';
    elsif clk'event and clk='1' then
      if state=FINISHED then
        dout_valid <= '1';
      else
        dout_valid <= '0';
      end if;      
    end if;
end process;

end arch_xor_crypt;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
