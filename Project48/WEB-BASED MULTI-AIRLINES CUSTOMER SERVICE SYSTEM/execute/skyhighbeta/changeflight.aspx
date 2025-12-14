<%@ Page Language="vb" AutoEventWireup="false" Codebehind="changeflight.aspx.vb" Inherits="skyhighbeta.changeflight"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SkyHigh :: Change Flight</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout" background="image/background.gif">
		<form id="Form1" method="post" runat="server">
			<table id="Table1" cellSpacing="0" cellPadding="0" width="800" align="center" border="0">
				<tr>
					<td align="center"><asp:image id="Image1" runat="server" ImageUrl="image/airflash2.jpg"></asp:image></td>
				</tr>
				<tr>
					<td>
						<TABLE id="Table2" style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #fffff1"
							cellSpacing="0" cellPadding="2" width="96%" align="center">
							<tr height="12">
								<td bgColor="#ff9933" colSpan="6"></td>
							</tr>
							<TR style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: darkgray; FONT-FAMILY: Tahoma"
								height="24">
								<TD>E-SERVICE &gt; YOUR ITINERARY&nbsp;&gt; CHANGE FLIGHT</TD>
							</TR>
							<tr height="4">
								<td background="image/bar.gif"></td>
							</tr>
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 16pt; COLOR: #cc6633; FONT-FAMILY: Tahoma; HEIGHT: 35px"
								vAlign="middle">
								<td>CHANGE FLIGHT
								</td>
							</tr>
							<tr height="30">
								<td>Please note that rules and conditions of originally paid must be observed when 
									changing flight and date.</td>
							</tr>
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ff9933"
								align="left">
								<td>&nbsp;New Traveling Date</td>
							</tr>
							<tr bgColor="#ff9933">
								<td>
									<table style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" cellSpacing="0"
										cellPadding="4" width="100%">
										<tr bgColor="#ffcc33">
											<td colSpan="6">Route</td>
										</tr>
										<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
											<td style="HEIGHT: 20px" width="20%"><asp:label id="lblDeparture" runat="server"></asp:label></td>
											<td style="HEIGHT: 20px" width="25%"><asp:dropdownlist id="cboDeptDay" runat="server" Width="40px" Font-Names="Tahoma" Font-Size="8pt">
													<asp:ListItem Value="1">1</asp:ListItem>
													<asp:ListItem Value="2">2</asp:ListItem>
													<asp:ListItem Value="3">3</asp:ListItem>
													<asp:ListItem Value="4">4</asp:ListItem>
													<asp:ListItem Value="5">5</asp:ListItem>
													<asp:ListItem Value="6">6</asp:ListItem>
													<asp:ListItem Value="7">7</asp:ListItem>
													<asp:ListItem Value="8">8</asp:ListItem>
													<asp:ListItem Value="9">9</asp:ListItem>
													<asp:ListItem Value="10">10</asp:ListItem>
													<asp:ListItem Value="11">11</asp:ListItem>
													<asp:ListItem Value="12">12</asp:ListItem>
													<asp:ListItem Value="13">13</asp:ListItem>
													<asp:ListItem Value="14">14</asp:ListItem>
													<asp:ListItem Value="15">15</asp:ListItem>
													<asp:ListItem Value="16">16</asp:ListItem>
													<asp:ListItem Value="17">17</asp:ListItem>
													<asp:ListItem Value="18">18</asp:ListItem>
													<asp:ListItem Value="19">19</asp:ListItem>
													<asp:ListItem Value="20">20</asp:ListItem>
													<asp:ListItem Value="21">21</asp:ListItem>
													<asp:ListItem Value="22">22</asp:ListItem>
													<asp:ListItem Value="23">23</asp:ListItem>
													<asp:ListItem Value="24">24</asp:ListItem>
													<asp:ListItem Value="25">25</asp:ListItem>
													<asp:ListItem Value="26">26</asp:ListItem>
													<asp:ListItem Value="27">27</asp:ListItem>
													<asp:ListItem Value="28">28</asp:ListItem>
													<asp:ListItem Value="29">29</asp:ListItem>
													<asp:ListItem Value="30">30</asp:ListItem>
													<asp:ListItem Value="31">31</asp:ListItem>
												</asp:dropdownlist><asp:dropdownlist id="cboDeptMon" runat="server" Width="88px" Font-Names="Tahoma" Font-Size="8pt">
													<asp:ListItem Value="1">January</asp:ListItem>
													<asp:ListItem Value="2">February</asp:ListItem>
													<asp:ListItem Value="3">March</asp:ListItem>
													<asp:ListItem Value="4">April</asp:ListItem>
													<asp:ListItem Value="5">May</asp:ListItem>
													<asp:ListItem Value="6">June</asp:ListItem>
													<asp:ListItem Value="7">July</asp:ListItem>
													<asp:ListItem Value="8">August</asp:ListItem>
													<asp:ListItem Value="9">September</asp:ListItem>
													<asp:ListItem Value="10">October</asp:ListItem>
													<asp:ListItem Value="11">November</asp:ListItem>
													<asp:ListItem Value="12">December</asp:ListItem>
												</asp:dropdownlist></td>
											<td width="10%" align="right">Flight Stop:</td>
											<td width="15%" rowspan="3">
												<asp:checkboxlist id="chkHop" runat="server" Width="100%" Font-Names="Tahoma" Font-Size="8pt">
													<asp:ListItem Value="0" Selected="True">Non-Stop</asp:ListItem>
													<asp:ListItem Value="1">1-Stop</asp:ListItem>
													<asp:ListItem Value="2">2-Stop</asp:ListItem>
												</asp:checkboxlist></td>
											<td width="15%" align="right">Gap Less:</td>
											<td width="15%">
												<asp:dropdownlist id="cboGapless" runat="server" Width="60px" Font-Names="Tahoma" Font-Size="8pt">
													<asp:ListItem Value="15" Selected="True">15 min</asp:ListItem>
													<asp:ListItem Value="30">30 min</asp:ListItem>
													<asp:ListItem Value="45">45 min</asp:ListItem>
													<asp:ListItem Value="60">1 hour</asp:ListItem>
													<asp:ListItem Value="120">2 hour</asp:ListItem>
													<asp:ListItem Value="180">3 hour</asp:ListItem>
													<asp:ListItem Value="240">4 hour</asp:ListItem>
													<asp:ListItem Value="300">5 hour</asp:ListItem>
													<asp:ListItem Value="360">6 hour</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
										<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
											<td width="20%" style="HEIGHT: 24px"><asp:label id="lblReturn" runat="server" Visible="False"></asp:label></td>
											<td width="25%" style="HEIGHT: 24px"><asp:dropdownlist id="cboReturnDay" runat="server" Width="40px" Font-Names="Tahoma" Font-Size="8pt"
													Visible="False">
													<asp:ListItem Value="1">1</asp:ListItem>
													<asp:ListItem Value="2">2</asp:ListItem>
													<asp:ListItem Value="3">3</asp:ListItem>
													<asp:ListItem Value="4">4</asp:ListItem>
													<asp:ListItem Value="5">5</asp:ListItem>
													<asp:ListItem Value="6">6</asp:ListItem>
													<asp:ListItem Value="7">7</asp:ListItem>
													<asp:ListItem Value="8">8</asp:ListItem>
													<asp:ListItem Value="9">9</asp:ListItem>
													<asp:ListItem Value="10">10</asp:ListItem>
													<asp:ListItem Value="11">11</asp:ListItem>
													<asp:ListItem Value="12">12</asp:ListItem>
													<asp:ListItem Value="13">13</asp:ListItem>
													<asp:ListItem Value="14">14</asp:ListItem>
													<asp:ListItem Value="15">15</asp:ListItem>
													<asp:ListItem Value="16">16</asp:ListItem>
													<asp:ListItem Value="17">17</asp:ListItem>
													<asp:ListItem Value="18">18</asp:ListItem>
													<asp:ListItem Value="19">19</asp:ListItem>
													<asp:ListItem Value="20">20</asp:ListItem>
													<asp:ListItem Value="21">21</asp:ListItem>
													<asp:ListItem Value="22">22</asp:ListItem>
													<asp:ListItem Value="23">23</asp:ListItem>
													<asp:ListItem Value="24">24</asp:ListItem>
													<asp:ListItem Value="25">25</asp:ListItem>
													<asp:ListItem Value="26">26</asp:ListItem>
													<asp:ListItem Value="27">27</asp:ListItem>
													<asp:ListItem Value="28">28</asp:ListItem>
													<asp:ListItem Value="29">29</asp:ListItem>
													<asp:ListItem Value="30">30</asp:ListItem>
													<asp:ListItem Value="31">31</asp:ListItem>
												</asp:dropdownlist><asp:dropdownlist id="cboReturnMon" runat="server" Width="88px" Font-Names="Tahoma" Font-Size="8pt"
													Visible="False">
													<asp:ListItem Value="1">January</asp:ListItem>
													<asp:ListItem Value="2">February</asp:ListItem>
													<asp:ListItem Value="3">March</asp:ListItem>
													<asp:ListItem Value="4">April</asp:ListItem>
													<asp:ListItem Value="5">May</asp:ListItem>
													<asp:ListItem Value="6">June</asp:ListItem>
													<asp:ListItem Value="7">July</asp:ListItem>
													<asp:ListItem Value="8">August</asp:ListItem>
													<asp:ListItem Value="9">September</asp:ListItem>
													<asp:ListItem Value="10">October</asp:ListItem>
													<asp:ListItem Value="11">November</asp:ListItem>
													<asp:ListItem Value="12">December</asp:ListItem>
												</asp:dropdownlist></td>
											<td width="10%"></td>
											<td width="15%" align="right" style="HEIGHT: 24px">Gap Most:</td>
											<td width="15%" style="HEIGHT: 24px">
												<asp:dropdownlist id="cboGapmost" runat="server" Width="60px" Font-Names="Tahoma" Font-Size="8pt">
													<asp:ListItem Value="-30">30 min</asp:ListItem>
													<asp:ListItem Value="-60">1 hour</asp:ListItem>
													<asp:ListItem Value="-120">2 hour</asp:ListItem>
													<asp:ListItem Value="-180">3 hour</asp:ListItem>
													<asp:ListItem Value="-240">4 hour</asp:ListItem>
													<asp:ListItem Value="-300">5 hour</asp:ListItem>
													<asp:ListItem Value="-360">6 hour</asp:ListItem>
													<asp:ListItem Value="-420">7 hour</asp:ListItem>
													<asp:ListItem Value="-480">8 hour</asp:ListItem>
													<asp:ListItem Value="-540">9 hour</asp:ListItem>
													<asp:ListItem Value="-600">10 hour</asp:ListItem>
													<asp:ListItem Value="-1440" Selected="True">1 day</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
										<tr bgColor="#ffffc1" style="FONT-WEIGHT: normal">
											<td></td>
											<td></td>
											<td width="10%"></td>
											<td width="15%" align="right">Not Prefer:</td>
											<td width="15%">
												<asp:dropdownlist id="cboNotAirline" runat="server" Width="104px" Font-Names="Tahoma" Font-Size="8pt"
													DataValueField="airlinecode" DataTextField="airlinename"></asp:dropdownlist></td>
										</tr>
										<tr bgColor="#ffffc1">
											<td></td>
											<td width="10%"></td>
											<td width="15%"></td>
											<td align="right"></td>
											<td colspan="2"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td>
									<table style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma" width="100%">
										<tr vAlign="middle" height="30">
											<td width="50%"><asp:button id="btnBack" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="White"
													Font-Bold="True" Text="Back" BackColor="Firebrick" BorderColor="MistyRose"></asp:button><STRONG>&nbsp; 
													Go to:</STRONG>Your itinerary</td>
											<td align="right" width="50%"><b>Go to: </b>Select flight(s)&nbsp;<asp:button id="btnConfirm" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="White"
													Font-Bold="True" Text="Confirm" BackColor="Firebrick" BorderColor="MistyRose"></asp:button></td>
										</tr>
									</table>
								</td>
							</tr>
						</TABLE>
					</td>
				</tr>
				<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; TEXT-ALIGN: center" bgColor="#ff9933">
					<td height="24">| <A href="../skyhighbeta/condition.aspx">Terms &amp; Conditions</A>
						| <A href="../skyhighbeta/carriage.aspx">Conditions of Carriage</A> | <A href="../skyhighbeta/privacy.aspx">
							Privacy &amp; Security</A> |
					</td>
				</tr>
				<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; TEXT-ALIGN: center" height="26">
					<td>Copyright 2006 SkyHigh Alliance Co., Ltd. All reserved.</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
