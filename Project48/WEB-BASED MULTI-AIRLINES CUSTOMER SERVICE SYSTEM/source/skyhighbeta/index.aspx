<%@ Page Language="vb" AutoEventWireup="false" Codebehind="index.aspx.vb" Inherits="skyhighbeta.index"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SkyHigh :: Plan your trip</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body background="image/background.gif" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table id="Table1" cellSpacing="0" cellPadding="0" width="800" align="center" border="0">
				<tr>
					<td align="center"><asp:image id="Image2" runat="server" ImageUrl="image/airflash2.jpg"></asp:image></td>
				</tr>
				<tr bgColor="#ffffee">
					<td>
						<TABLE id="Table2" style="FONT-SIZE: x-small; COLOR: black; FONT-FAMILY: Tahoma, 'Microsoft Sans Serif'"
							cellSpacing="0" cellPadding="2" width="96%" align="center">
							<tr>
								<td>
									<table style="FONT-WEIGHT: bold; FONT-SIZE: x-small; COLOR: black; FONT-FAMILY: Tahoma, 'Microsoft Sans Serif'"
										cellPadding="4" width="100%" align="left">
										<tr height="12">
											<td bgColor="#ff9933" colSpan="6"></td>
										</tr>
										<tr>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: yellowgreen; FONT-FAMILY: Tahoma"
												width="18%">Plan Your Trip</td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: peachpuff; FONT-FAMILY: Tahoma"
												width="16%">Select</td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: peachpuff; FONT-FAMILY: Tahoma"
												width="16%">Fares</td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: peachpuff; FONT-FAMILY: Tahoma"
												width="18%">Passenger Details</td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: peachpuff; FONT-FAMILY: Tahoma"
												width="16%">Review</td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: peachpuff; FONT-FAMILY: Tahoma"
												width="16%">Payment</td>
										</tr>
										<tr height="2">
											<td bgColor="yellowgreen"></td>
											<td bgColor="peachpuff" colSpan="6"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 16pt; COLOR: #cc6633; FONT-FAMILY: Tahoma; HEIGHT: 35px"
								vAlign="middle">
								<td>PLAN YOUR TRIP&nbsp;
									<asp:label id="lblStatus" runat="server" ForeColor="OrangeRed" Font-Bold="True" Font-Size="8pt"></asp:label>
								</td>
							</tr>
							<tr style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma">
								<td height="10"></td>
							</tr>
							<TR>
								<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ff9933"
									align="left" height="24">&nbsp;Book Now</td>
							</TR>
							<tr bgColor="#ff9933">
								<TD>
									<table style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" cellSpacing="0"
										cellPadding="4" width="100%" align="center">
										<tr bgColor="#ffcc33">
											<td width="15%"></td>
											<td width="10%">Day</td>
											<td width="20%">Month</td>
											<td width="30%"></td>
											<td width="25%">City</td>
										</tr>
										<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
											<td style="HEIGHT: 18px" align="right" width="15%">Departure Date:&nbsp;</td>
											<td style="HEIGHT: 18px" width="10%"><asp:dropdownlist id="cboDeptDay" runat="server" Width="100%" Font-Size="8pt" Font-Names="Tahoma">
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
												</asp:dropdownlist></td>
											<td style="HEIGHT: 18px" width="20%"><asp:dropdownlist id="cboDeptMon" runat="server" Width="100%" Font-Size="8pt" Font-Names="Tahoma">
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
											<td style="HEIGHT: 18px" align="right" width="30%">From:&nbsp;</td>
											<td style="HEIGHT: 18px" width="25%"><asp:dropdownlist id="cboFrom" runat="server" Width="100%" Font-Size="8pt" Font-Names="Tahoma" DataValueField="airportcity"
													DataTextField="airportcity"></asp:dropdownlist></td>
										</tr>
										<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
											<td align="right" width="15%"><asp:label id="lblReturn" runat="server">Return Date:</asp:label>&nbsp;</td>
											<td width="10%"><asp:dropdownlist id="cboReturnDay" runat="server" Width="100%" Font-Size="8pt" Font-Names="Tahoma">
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
												</asp:dropdownlist></td>
											<td width="20%"><asp:dropdownlist id="cboReturnMon" runat="server" Width="100%" Font-Size="8pt" Font-Names="Tahoma">
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
											<td align="right" width="30%">To:&nbsp;</td>
											<td width="25%"><asp:dropdownlist id="cboTo" runat="server" Width="100%" Font-Size="8pt" Font-Names="Tahoma" DataValueField="airportcity"
													DataTextField="airportcity"></asp:dropdownlist></td>
										</tr>
									</table>
								</TD>
							</tr>
							<TR>
								<TD></TD>
							</TR>
							<tr bgColor="#ff9933">
								<TD>
									<table style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" cellSpacing="0"
										cellPadding="4" width="100%" align="center">
										<tr bgColor="#ffcc33">
											<td width="20%"></td>
											<td></td>
											<td>Passenger(s)</td>
											<td>Trip</td>
											<td align="center">Flight Stop</td>
											<td align="center"></td>
											<td></td>
										</tr>
										<tr bgColor="#ffffc1" style="FONT-WEIGHT: normal">
											<td width="20%" rowspan="3"></td>
											<td align="right">Adult:</td>
											<td><asp:dropdownlist id="cboAdult" runat="server" Width="60px" Font-Size="8pt" Font-Names="Tahoma">
													<asp:ListItem Value="1" Selected="True">1</asp:ListItem>
													<asp:ListItem Value="2">2</asp:ListItem>
													<asp:ListItem Value="3">3</asp:ListItem>
													<asp:ListItem Value="4">4</asp:ListItem>
													<asp:ListItem Value="5">5</asp:ListItem>
													<asp:ListItem Value="6">6</asp:ListItem>
													<asp:ListItem Value="7">7</asp:ListItem>
													<asp:ListItem Value="8">8</asp:ListItem>
													<asp:ListItem Value="9">9</asp:ListItem>
												</asp:dropdownlist></td>
											<td rowspan="2">
												<asp:radiobuttonlist id="radIsRound" runat="server" Font-Size="8pt" Font-Names="Tahoma" AutoPostBack="True">
													<asp:ListItem Value="0">One-way</asp:ListItem>
													<asp:ListItem Value="1" Selected="True">Round-trip</asp:ListItem>
												</asp:radiobuttonlist></td>
											<td align="right" rowspan="3"><asp:checkboxlist id="chkHop" runat="server" Font-Size="8pt" Font-Names="Tahoma">
													<asp:ListItem Value="0" Selected="True">Non-Stop</asp:ListItem>
													<asp:ListItem Value="1">1-Stop</asp:ListItem>
													<asp:ListItem Value="2">2-Stop</asp:ListItem>
												</asp:checkboxlist></td>
											<td align="right">Gap less:</td>
											<td>
												<asp:dropdownlist id="cboGapless" runat="server" Width="60px" Font-Size="8pt" Font-Names="Tahoma">
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
										<tr bgColor="#ffffc1" style="FONT-WEIGHT: normal">
											<td align="right">Child (2-11 years):</td>
											<td><asp:dropdownlist id="cboChild" runat="server" Width="60px" Font-Size="8pt" Font-Names="Tahoma">
													<asp:ListItem Value="0" Selected="True">0</asp:ListItem>
													<asp:ListItem Value="1">1</asp:ListItem>
													<asp:ListItem Value="2">2</asp:ListItem>
													<asp:ListItem Value="3">3</asp:ListItem>
													<asp:ListItem Value="4">4</asp:ListItem>
													<asp:ListItem Value="5">5</asp:ListItem>
													<asp:ListItem Value="6">6</asp:ListItem>
													<asp:ListItem Value="7">7</asp:ListItem>
													<asp:ListItem Value="8">8</asp:ListItem>
													<asp:ListItem Value="9">9</asp:ListItem>
												</asp:dropdownlist></td>
											<td align="right">Gap Most:
											</td>
											<td>
												<asp:dropdownlist id="cboGapmost" runat="server" Width="60px" Font-Size="8pt" Font-Names="Tahoma">
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
										<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
											<td align="right"></td>
											<td></td>
											<td></td>
											<td align="right">
												Not prefer:</td>
											<td>
												<asp:dropdownlist id="cboNotAirline" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="104px"
													DataTextField="airlinename" DataValueField="airlinecode"></asp:dropdownlist></td>
										</tr>
									</table>
								</TD>
							</tr>
							<tr height="10">
								<td></td>
							</tr>
							<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma">
								<td>
									<ul>
										<li>
										Child (between 2 to 11 years) must travel together with an adult.&nbsp;
										<li>
										Only Visa and MasterCard are accepted.&nbsp;
										<li>
										Credit card holder must be part of the traveling party and the card must be 
										presented upon check-in.
										<li>
											Each booking allows a maximum of 7 passengers. If your traveling party exceeds 
											this number,
											<BR>
											please make a seperate booking.</li></ul>
								</td>
							</tr>
							<tr>
								<td>
									<table style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma" width="100%">
										<tr vAlign="middle" height="30">
											<td width="55%"><asp:label id="Label6" runat="server" Font-Size="8pt" Font-Names="Tahoma">E-Service:</asp:label><asp:textbox id="txtChkTrip" runat="server" Width="120px" Font-Size="8pt" Font-Names="Tahoma"></asp:textbox><asp:button id="btnCheckTrip" runat="server" Font-Size="8pt" Font-Names="Tahoma" BackColor="Firebrick"
													BorderColor="MistyRose" Text="Check Trip" Font-Bold="True" ForeColor="White"></asp:button>&nbsp;</td>
											<td align="right" width="45%" colSpan="3">&nbsp;<asp:button id="btnSearch" runat="server" Font-Size="8pt" Font-Names="Tahoma" BackColor="Firebrick"
													BorderColor="MistyRose" Text="Search" Font-Bold="True" ForeColor="White"></asp:button></td>
										</tr>
										<tr>
											<td><asp:button id="btnLogin" runat="server" Font-Size="8pt" Font-Names="Tahoma" BackColor="ForestGreen"
													BorderColor="MistyRose" Text="Login" Font-Bold="True" ForeColor="White"></asp:button>&nbsp;
												<asp:button id="btnRegister" runat="server" Font-Size="8pt" Font-Names="Tahoma" BackColor="ForestGreen"
													BorderColor="MistyRose" Text="Register" Font-Bold="True" ForeColor="White"></asp:button>&nbsp;
												<asp:button id="btnAllTrip" runat="server" Font-Size="8pt" Font-Names="Tahoma" BackColor="ForestGreen"
													BorderColor="MistyRose" Text="See All Trip" Font-Bold="True" ForeColor="White"></asp:button>&nbsp;Please 
												log in before</td>
											<td align="right"><asp:dropdownlist id="cboAirport" runat="server" Font-Size="8pt" Font-Names="Tahoma" DataValueField="airportcode"
													DataTextField="airportname"></asp:dropdownlist></td>
											<td align="right"><asp:radiobuttonlist id="radFlightStatus" runat="server" Font-Size="8pt" Font-Names="Tahoma" RepeatDirection="Horizontal">
													<asp:ListItem Value="0">Departure</asp:ListItem>
													<asp:ListItem Value="1" Selected="True">Arrival</asp:ListItem>
												</asp:radiobuttonlist></td>
											<td align="right"><asp:button id="btnFlightStatus" runat="server" Font-Size="8pt" Font-Names="Tahoma" BackColor="ForestGreen"
													BorderColor="MistyRose" Text="Flight Status" Font-Bold="True" ForeColor="White"></asp:button></td>
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
