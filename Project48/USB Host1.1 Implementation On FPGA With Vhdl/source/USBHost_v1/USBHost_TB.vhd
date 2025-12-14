LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY USBHost_tb IS
END USBHost_tb;

ARCHITECTURE HTWTestBench OF USBHost_tb IS

--		constant Period  : time := 83 ns;
		constant Period  : time := 10 ns;


COMPONENT USBHost
    PORT (
		Clock24M			: in 			std_logic;
		ResetB				: in 			std_logic;
		Read				: in			std_logic;
		Write				: in			std_logic;
		dplus				: inout			std_logic;
		dminus				: inout			std_logic

	);
END COMPONENT;

         
		SIGNAL Clock_Signal					: std_logic;
		SIGNAL Reset_Signal					: std_logic;
		signal Read_Signal					: std_logic;
		signal Write_Signal					: std_logic;
		signal dplus_Signal					: std_logic;
		signal dminus_Signal				: std_logic;
		
		
--		signal Test_data					: std_logic_vector(15 downto 0) := "1010010110100101";

	
BEGIN
	
    U1 : USBHost
	PORT MAP (
		Clock24M => Clock_Signal,
		ResetB => Reset_Signal,
		Read => Read_Signal,
		Write => Write_Signal,
		dplus => dplus_signal,
		dminus => dminus_signal
	);



	u_Clock : process
	begin
		if(Clock_Signal = '1') then
			Clock_Signal <= '0';
		else
			Clock_Signal <= '1';
		end if;
		wait for Period / 2;
	end process;
	
	
	u_Reset : process
	begin
		wait for Period * 2;
		Reset_Signal <= '0';
		wait for Period * 2;
		Reset_Signal <= '1';
		wait;
	end process;


	u_Test_Input : process
--		variable i : integer;
	begin
		
		Write_signal <= '1';
		wait for Period * 100;
		Write_Signal <= '0';
		wait for Period;
		Write_Signal <= '1';
--		for i in 0 to 30 loop
--			dplus_in_Signal <= test_data(0);
--			dminus_in_Signal <= not test_data(0);
--			test_data(15 downto 0) <= '0' & test_data(15 downto 1);
--			wait for Period * 2;
--		end loop;
		wait;
	end process;


END HTWTestBench;
