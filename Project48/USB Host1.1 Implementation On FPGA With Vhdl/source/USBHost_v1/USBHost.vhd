LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity USBHost is
	port(
		Clock24M					: in 			std_logic;
		ResetB						: in 			std_logic;
		Read						: in			std_logic;
		Write						: in			std_logic;
		dplus						: inout			std_logic;
		dminus						: inout			std_logic;
		status_full					: out			std_logic;
		status_low					: out			std_logic;
		status_connect				: out			std_logic
	);
end entity;



architecture A_USBHost of USBHost is
	component Physical is
		port(
			Clock					: in 			std_logic;
			Reset					: in 			std_logic;
			CE						: in			std_logic;
			dplus					: inout	  		std_logic;
			dminus					: inout			std_logic;
			DataS_Rd   				: out			std_logic;			
			DataS_In				: in			std_logic;
			DataS_Empty				: in			std_logic;
			DataS_AEmpty			: in			std_logic;
			DataR_Wr				: out  			std_logic;
			DataR_Out				: out  			std_logic;
			DataR_Full				: in   			std_logic;
			DataR_AFull				: in  	 		std_logic;
			DataDir					: in			std_logic;
			BUS_Data				: in			std_logic;
			BUS_SE0					: in			std_logic;
			BUS_EOP					: in			std_logic;
			BUS_SOP					: in			std_logic;
			status_full				: out			std_logic;
			status_low				: out			std_logic;
			status_connect			: out			std_logic
		);
	end component;
	
	
	
	component Protocol is
		port(
			Clock					: in			std_logic;
			Reset					: in			std_logic;

			TD_WrClk				: in			std_logic;			
			TD_Wr					: in			std_logic;
			TD_Din					: in			std_logic_vector(15 downto 0);
			TD_Full					: out			std_logic;		
			DataS_Rd				: out	   		std_logic;
			DataS					: in			std_logic_vector(7 downto 0);


			BUS_Data				: out			std_logic;
			BUS_SE0					: out			std_logic;
			BUS_EOP					: out			std_logic;
			BUS_SOP					: out			std_logic;
			
			Data_SHClk				: in			std_logic;
			Data_out				: out			std_logic;
			Data_SHout				: in			std_logic;
			Data_Empty				: out			std_logic;
			Data_AEmpty				: out			std_logic
			
		);
	end component;



	component ClockDiv is
		port(
			Clock24M				: in 			std_logic;
			Reset					: in 			std_logic;
			Clock12M				: out			std_logic;
			Clock1K					: out			std_logic
		);
	end component;


	component USBDriver
		port(
			Clock					: in 			std_logic;
			Clock1K					: in			std_logic;
			Reset					: in 			std_logic;
			TD_Wr					: out			std_logic;
			TD_Din					: out			std_logic_vector(15 downto 0);
			TD_Full					: in			std_logic;
			UserWr					: in			std_logic;
			UserRd					: in			std_logic;
			DataS_Wr				: out			std_logic;
			DataS				:	 out			std_logic_vector(7 downto 0)
		);
	end component;



	component datamem IS
		port (
		din: IN std_logic_VECTOR(7 downto 0);
		rd_clk: IN std_logic;
		rd_en: IN std_logic;
		rst: IN std_logic;
		wr_clk: IN std_logic;
		wr_en: IN std_logic;
		almost_empty: OUT std_logic;
		almost_full: OUT std_logic;
		dout: OUT std_logic_VECTOR(7 downto 0);
		empty: OUT std_logic;
		full: OUT std_logic);
	end component;




	signal Data_out					: std_logic;
	signal rDataS_in				: std_logic;

	-------------------- SYSTEM SIGNAL ----------------------------
	signal sysClock24M				: std_logic;
	signal sysClock12M				: std_logic;
	signal sysClock1M				: std_logic;
	signal sysClock1K				: std_logic;
	signal sysReset					: std_logic;
	---------------------------------------------------------------

	-------------------- PHYSICAL LAYER SIGNAL --------------------
	signal PHY_CE					: std_logic;	
	signal PHY_dplus				: std_logic;
	signal PHY_dminus				: std_logic;
	signal PHY_DataS_Rd				: std_logic;
	signal PHY_DataS_In				: std_logic;
	signal PHY_DataS_Empty			: std_logic;
	signal PHY_DataS_AEmpty			: std_logic;
	signal PHY_DataR_Wr				: std_logic;
	signal PHY_DataR_Out			: std_logic;
	signal PHY_DataR_Full			: std_logic;
	signal PHY_DataR_AFull			: std_logic;
	signal PHY_DataDir				: std_logic;
	signal PHY_BUS_DATA				: std_logic;
	signal PHY_BUS_SE0 				: std_logic;
	signal PHY_BUS_EOP				: std_logic;
	signal PHY_BUS_SOP 				: std_logic;
	---------------------------------------------------------------	

	-------------------- PROTOCOL LAYER SIGNAL --------------------
	signal PT_TD_WrClk				: std_logic;
	signal PT_TD_Wr					: std_logic;
	signal PT_TD_Din 				: std_logic_vector(15 downto 0);
	signal PT_TD_Full		 	  	: std_logic;
	signal PT_DataS_Rd		 		: std_logic;
	signal PT_DataS					: std_logic_vector(7 downto 0);
	signal PT_BUS_DATA				: std_logic;
	signal PT_BUS_SE0 				: std_logic;
	signal PT_BUS_EOP				: std_logic;
	signal PT_BUS_SOP				: std_logic;
	signal PT_Dout_ShClk			: std_logic;
	signal PT_Dout					: std_logic;
	signal PT_Dout_Sh				: std_logic;
	signal PT_Dout_Empty			: std_logic;
	signal PT_Dout_AEmpty			: std_logic;	
	signal PT_Mem_En				: std_logic;
	signal PT_Mem_We				: std_logic;
	---------------------------------------------------------------

	-------------------- DRIVER LAYER SIGNAL ----------------------
	signal DR_MemS_Addr				: std_logic_vector(8 downto 0);
	signal DR_MemR_Data				: std_logic_vector(7 downto 0);
	signal DR_MemS_Data				: std_logic_vector(7 downto 0);
	signal DR_Mem_En				: std_logic;
	signal DR_Mem_We				: std_logic;
	---------------------------------------------------------------	

	signal DM_din	: std_logic_vector(7 downto 0);
	signal DM_rd_clk	: std_logic;
	signal DM_rd_EN		: std_logic;
	signal DM_wr_clk		: std_logic;
	signal DM_wr_en		:  std_logic;
	signal DM_aempty	:  std_logic;
	signal DM_empty		: std_logic;
	signal DM_afull		: std_logic;
	signal DM_full		: std_logic;
	signal DM_dout		: std_logic_vector(7 downto 0);
		
	signal selfReset	: std_logic;
	
	
begin
	
	
	PHY_cE <= '1';
	rDataS_in					<= Data_out;
	DM_Rd_EN <= PT_DataS_Rd;
	DM_Wr_Clk <= sysclock24m;
	DM_Rd_Clk <= sysclock24m;
	PT_DataS <= DM_DOut;	

	----- SYSTEM SIGNAL -------------
	sysClock24M					<= Clock24M;
	sysReset					<= (not ResetB) or selfReset;
	Clock12M					<= sysClock12M;
	Clock1K						<= sysClock1K;	
	dplus						<= PHY_dplus;
	dminus						<= PHY_dminus;

	----- PROTOCOL LAYER SIGNAL -----
	PT_Dout_Sh					<= PHY_DataS_Rd;
	
	----- PHYSICAL LAYER SIGNAL -----
	PHY_DataS_In					<= PT_Dout;
	PHY_DataS_Empty					<= PT_Dout_Empty;
	PHY_DataS_AEmpty				<= PT_Dout_AEmpty;

	PHY_BUS_DATA					<= PT_BUS_DATA;
	PHY_BUS_SE0						<= PT_BUS_SE0;
	PHY_BUS_EOP						<= PT_BUS_EOP;
	PHY_BUS_SOP						<= PT_BUS_SOP;
	
	-- MAP COMPONENT --
	u_ClockDiv : ClockDiv
	port map(
		Reset					=> sysReset,
		Clock24M				=> sysClock24M,
		Clock12M				=> sysClock12M,
		Clock1K					=> sysClock1K
	);
	
	
	u_USBDriver : USBDriver
	port map(
		Clock					=> sysClock24M,
		Reset					=> sysReset,
		Clock1K					=> sysClock1K,
		TD_Wr					=> PT_TD_Wr,
		TD_Din					=> PT_TD_Din,
		TD_Full					=> PT_TD_Full,
		UserRd					=> Read,
		UserWr					=> Write,
		DataS_Wr				=> dm_wr_en,
		DataS					=> dm_din
	);

	
	u_Physical : Physical
	port map(
		Clock					=> sysClock12M,
		Reset					=> sysReset,
		CE						=> PHY_CE,
		dplus					=> PHY_dplus,
		dminus					=> PHY_dminus,
		DataS_Rd 				=> PHY_DataS_Rd,
		DataS_in				=> PHY_DataS_In,
		DataS_Empty				=> PHY_DataS_Empty,
		DataS_AEmpty			=> PHY_DataS_AEmpty,
		DataR_Wr 				=> PHY_DataR_Wr,
		DataR_Out				=> PHY_DataR_Out,
		DataR_Full				=> PHY_DataR_Full,
		DataR_AFull				=> PHY_DataR_AFull,
		DataDir					=> PHY_DataDir,
		BUS_DATA				=> PHY_BUS_DATA,
		BUS_SE0					=> PHY_BUS_SE0,
		BUS_EOP					=> PHY_BUS_EOP,
		BUS_SOP					=> PHY_BUS_SOP,
		
		status_full => status_full,
		status_low => status_low,
		status_connect => status_connect

		
	);
	
		
	u_Protocol : Protocol
	port map(
		Clock					=> sysClock24M,
		Reset					=> sysReset,
		TD_WrClk				=> sysClock24M,
		TD_Wr					=> PT_TD_Wr,
		TD_Din					=> PT_TD_Din,
		TD_Full					=> PT_TD_Full,
		Data_SHClk				=> sysClock12M,
		Data_out				=> PT_Dout,
		Data_SHout				=> PT_Dout_Sh,
		Data_Empty				=> PT_Dout_Empty,
		Data_AEmpty				=> PT_Dout_AEmpty,
		DataS_Rd				=> PT_DataS_Rd,
		DataS					=> PT_DataS,
  		BUS_DATA				=> PT_BUS_DATA,
		BUS_SE0					=> PT_BUS_SE0,
		BUS_EOP					=> PT_BUS_EOP,
		BUS_SOP					=> PT_BUS_SOP
	);
	

	u_datamem : datamem
	port map(
		din => DM_din,
		rd_clk => DM_rd_clk,
		rd_en => dm_rd_en,
		rst => sysreset,
		wr_clk => dm_wr_clk,
		wr_en => dm_wr_en,
		almost_full => dm_afull,
		almost_empty 	=>		dm_aempty,
		full			=> dm_full,
		empty => dm_empty,
		dout			=> dm_dout
	);   
end architecture;
