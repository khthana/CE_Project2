-- **********************************************************************
--  $RCSfile: xor_coreI.vhd,v $
--  $Revision: 1.18 $
--  last change by $Author: sirikhum $
--  at $Date: 2002/11/22 19:38:32 $
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


package xor_core_lib is
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
  
  component xor_coreI 
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

end xor_core_lib;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.xor_core_lib.all;

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
  signal dout_buf_valid	:std_logic := '1'; 	-- solve can't synthesis
					   	-- vector()'event 
  signal encrypt_buf	:std_logic := '1'; 
begin

-- control data_flow and data_latch and also for state
process (reset, din_valid, dout_buf_valid)
begin
  if reset = '1' then
    encrypt_buf <= '0';
    state <= IDLE;
--    key_in_buf <= "00000000000000000000000000000000000000000000000000000000";
--    din_buf <= "0000000000000000000000000000000000000000000000000000000000000000";
    dout <= "0000000000000000000000000000000000000000000000000000000000000000";
    encrypt_buf <= '1';
  elsif din_valid='1' then
    if state=IDLE then
 	din_buf <= din;
    	key_in_buf <= key_in;
    	encrypt_buf <= encrypt;
    	state <= WORKING;
    end if;
  elsif dout_buf_valid = '1' then
    	dout <= dout_buf;
    	state <= FINISHED;
  elsif dout_buf_valid = '0' then
    	state <= IDLE;
  end if;
end process;


-- X|
process(reset, state)
begin
  if reset = '1' then
	busy <= '0';
    	dout_buf <= "0000000000000000000000000000000000000000000000000000000000000000";
	dout_buf_valid <= '0';	-- dout_buf not valid
  elsif state=WORKING and busy='0' then
    busy <= '1';
--    wait for 10 ns;
    dout_buf <= din_buf XOR key_in_buf&"11111111";
    dout_buf_valid <= '1';
--    wait for 10 ns;
    busy <= '0';
  elsif state=FINISHED then
    dout_buf_valid <= '0';
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.xor_core_lib.all;

entity xor_coreI is 
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
end xor_coreI;

architecture arch_stub of xor_coreI is
	signal data_from_bus_buf	:std_logic_vector (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
--	signal crypted_data	:std_logic_vector (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
	signal key_from_bus_buf		:std_logic_vector (55 downto 0) := "00000000000000000000000000000000000000000000000000000000";
--	signal ack		:std_logic := '0';
--	signal loaded		:std_logic := '0'; -- crypted data was NOT out yet
	signal fetched		:std_logic := '1'; -- fetch data&key completely
						   -- initialize with 1 to solve
						   -- data_to_xor_valid's issue
	signal cs		:std_logic := '0';
	signal csI		:std_logic := '0';
	signal csII		:std_logic := '0';
	signal isr_ack		:std_logic := '0'; -- our irq_ack-self_gen
	signal cs_datai		:std_logic_vector (3 downto 0) := "0000";
	signal cs_key		:std_logic_vector (3 downto 0) := "0000";
	signal cs_datao		:std_logic_vector (3 downto 0) := "0000";

--  signla to DES core
	signal xor_clk			:std_logic;
	signal xor_reset		:std_logic := '0';
	signal en_decrypt		:std_logic := '1';
	signal key_to_xor		:std_logic_vector(55 downto 0);
	signal data_to_xor		:std_logic_vector(63 downto 0);
	signal data_to_xor_valid	:std_logic := '0';
	signal data_to_xor_valid_latched:std_logic := '0';
	signal running_xor		:std_logic;
	signal data_from_xor		:std_logic_vector(63 downto 0);
	signal data_from_xor_buf	:std_logic_vector(63 downto 0);
	signal data_from_xor_valid	:std_logic;
	
--	signal encrypt_flag		:std_logic;
--	signal decrypt_flag		:std_logic
--	signal fetchinf			:std_logic;

begin
	xor_clk <= sys_clk ;
	xor_reset <= sys_reset ;

-- module chip select
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
	cs <= csI or csII;
	cs_out <= not cs;
	iocs16 <= not cs;
		
	-- fetch data chip select 0x110-0x116
	cs_datai(0) 	<= csI and ((not addr_bus(3) and addr_bus(2)) and
				(not addr_bus(1) and not addr_bus(0)));
	cs_datai(1) 	<= csI and ((not addr_bus(3) and addr_bus(2)) and 
				(not addr_bus(1) and addr_bus(0)));
	cs_datai(2) 	<= csI and ((not addr_bus(3) and addr_bus(2)) and
				(addr_bus(1) and not addr_bus(0)));
	cs_datai(3) 	<= csI and ((not addr_bus(3) and addr_bus(2)) and
				(addr_bus(1) and addr_bus(0)));
				
	-- fetch key chip select 0x118 - 0x11e
	cs_key(0) 	<= csI and ((addr_bus(3) and not addr_bus(2)) and
				(not addr_bus(1) and not addr_bus(0)));
	cs_key(1)	<= csI and ((addr_bus(3) and not addr_bus(2)) and 
				(not addr_bus(1) and addr_bus(0)));
	cs_key(2)	<= csI and ((addr_bus(3) and not addr_bus(2)) and 
				(addr_bus(1) and not addr_bus(0)));
	cs_key(3)	<= csI and ((addr_bus(3) and not addr_bus(2)) and
				(addr_bus(1) and addr_bus(0)));

	-- out crypted data chip select 0x120 - 0x126
	cs_datao(0)	<= csII and ((addr_bus(3) and addr_bus(2)) and
				(not addr_bus(1) and not addr_bus(0)));
	cs_datao(1)	<= csII and ((addr_bus(3) and addr_bus(2)) and
				(not addr_bus(1) and addr_bus(0)));
	cs_datao(2)	<= csII and ((addr_bus(3) and  addr_bus(2)) and
				(addr_bus(1) and not addr_bus(0)));
	cs_datao(3)	<= csII and ((addr_bus(3) and addr_bus(2)) and
				(addr_bus(1) and addr_bus(0)));

	isr_ack	<= (cs_datao(0) and cs_datao(1)) and (cs_datao(2) and cs_datao(3));


DES_CORE:xor_crypt port map(xor_clk, xor_reset, en_decrypt, key_to_xor, data_to_xor, data_to_xor_valid, running_xor, data_from_xor, data_from_xor_valid);

--iocs16_hdl:process(reset, cs)
--begin
--	if reset = '1' then
--		iocs16 = '1';
--	elsif cs = '1' then
--		iocs16 = '0';
--	else 
--		iocs16 = '1';
--	end if;
--end;


-- get_data() load both data and key from 
-- It load datas every positive'edge of clock
--get_data:process(data_bus, clk, reset, cs_datai, cs_key, iow)
--get_data:process(sys_clk, sys_reset, cs, iow, ior)
get_data:process(sys_clk, sys_reset)
begin
	if sys_reset = '1' then 
	 dir_out	<= '0';
	 iochrdy	<= '1';
	 data_bus(15 downto 0) <= "ZZZZZZZZZZZZZZZZ";
	 data_from_bus_buf 	<="0000000000000000000000000000000000000000000000000000000000000000";
--	 data_to_xor 	<="0000000000000000000000000000000000000000000000000000000000000000";
	 key_from_bus_buf	<="00000000000000000000000000000000000000000000000000000000";
--	 ack      	<='0';
	 fetched	<='1';
	 en_decrypt	<='1';
--	 is_ok    	<='1';
	elsif cs = '1' then
	   if iow = '0' then 	-- read data from BUS
		dir_out <= '0';
		iochrdy <= '0'; -- ask uP to wait for fetch complete
		-- start loading data
		if  cs_datai(0) = '1' and fetched <= '1' then
		 	data_from_bus_buf(63 downto 48) <= data_bus(15 downto 0);
			fetched <= '0';
		elsif cs_datai(1)  = '1' then
		 	data_from_bus_buf(47 downto 32) <= data_bus(15 downto 0);
			fetched <= '0';
		elsif cs_datai(2) = '1' then
 			data_from_bus_buf(31 downto 16) <= data_bus(15 downto 0);
			fetched <= '0';
		elsif cs_datai(3) = '1' then
			data_from_bus_buf(15 downto 0) <= data_bus(15 downto 0);
			fetched <= '0';
			
		-- start loading key
		elsif cs_key(0) = '1' then
	 		key_from_bus_buf(55 downto 40) <= data_bus(15 downto 0);
			fetched <= '0';
 		elsif cs_key(1) = '1' then
		  	key_from_bus_buf(39 downto 24) <= data_bus(15 downto 0);
			fetched <= '0';
		elsif cs_key(2) = '1' then
		 	key_from_bus_buf(23 downto 8) <= data_bus(15 downto 0);
			fetched <= '0';
		elsif cs_key(3) = '1' then
			key_from_bus_buf(7 downto 0) <= data_bus(15 downto 8);
			-- en/de-crypt : 1=encrypt, 0=decrypt
			en_decrypt <= data_bus(7);
			fetched <= '1';	-- fetched was used as 'START_NOW'
		end if;
		iochrdy <= '1';
	   elsif ior='0' then -- write data to BUS
		dir_out <= '1';
		iochrdy <= '0';
		if cs_datao(0) = '1' then
			data_bus(15 downto 0) <= data_from_xor_buf(63 downto 48);
		elsif cs_datao(1) = '1' then
			data_bus(15 downto 0) <= data_from_xor_buf(47 downto 32);
		elsif cs_datao(2) = '1' then
			data_bus(15 downto 0) <= data_from_xor_buf(31 downto 16);
		elsif cs_datao(3) = '1' then
			data_bus(15 downto 0) <= data_from_xor_buf(15 downto 0);
		end if;
		dir_out <= '0';
		iochrdy <= '1';
	   end if;
	elsif ior = '1' and iow='1' then
		dir_out <= '0';
		iochrdy <= '1';
		data_bus(15 downto 0) <= "ZZZZZZZZZZZZZZZZ";
	end if;

	iochrdy<='1'; -- ok fetch completed
end process;


-- start encrypt data after datas were fetched completely
begin_crypt:process(sys_reset, sys_clk, fetched)
begin
	if sys_reset = '1' then
	 data_to_xor 	<="0000000000000000000000000000000000000000000000000000000000000000";
	 key_to_xor    	<="00000000000000000000000000000000000000000000000000000000";
	 data_to_xor_valid <='0';
	 data_to_xor_valid_latched <= '0';

	elsif sys_clk = '0' then
		if data_to_xor_valid_latched = '1' then
			data_to_xor_valid <= '0';
			data_to_xor_valid_latched <= '0';
		elsif data_to_xor_valid = '1' then
			data_to_xor_valid_latched <= '1';
		end if;

	elsif fetched'event and fetched='1' then
		data_to_xor <= data_from_bus_buf;
		key_to_xor <= key_from_bus_buf;
		data_to_xor_valid <= '1';
--		running_xor <= '1';
	end if;
end process; --begin_crypt()


-- handle crypto completed
-- handle interrupt ack
-- fetch data and 
--end_crypt:process(data_from_xor_valid, irq_ack)
--end_crypt:process(clk, data_from_xor_valid)
end_crypt:process(sys_reset, sys_clk, isr_ack, data_from_xor_valid)
begin
	if sys_reset = '1' then
	   irq <= '0';
	   data_from_xor_buf <= "0000000000000000000000000000000000000000000000000000000000000000";
--	   loaded 	<='0';	-- 'loaded' will be '1' if data was receive from CORE
	elsif data_from_xor_valid = '1' then
--	   if sys_clk'event and sys_clk='1' then
--		crypted_data <= data_from_xor;
		data_from_xor_buf <= data_from_xor;
--		loaded <='1';
		irq <= '1'; 
--	   end if; -- sys_clk
	elsif isr_ack = '1' then
		irq <= '0';
	end if;
end process; -- end_crypt()


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
