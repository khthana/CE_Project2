<%@ Page Language="vb" AutoEventWireup="false" Codebehind="updateseat.aspx.vb" Inherits="skyhighWS.updateseat"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>updateseat</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table id="Table1" cellSpacing="0" cellPadding="0" width="800" align="center" border="0">
				<tr>
					<td align="center"><FONT face="Tahoma"></FONT></td>
				</tr>
				<tr bgColor="#ffffee">
					<td>
						<TABLE id="Table2" style="FONT-SIZE: x-small; COLOR: black; FONT-FAMILY: Tahoma, 'Microsoft Sans Serif'"
							cellSpacing="0" cellPadding="2" width="81%" align="center">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 16pt; COLOR: #cc6633; FONT-FAMILY: Tahoma; HEIGHT: 35px"
								vAlign="middle">
								<td>UPDATE SEAT&nbsp;
									<asp:label id="lblStatus" runat="server" Font-Size="8pt" Font-Names="Tahoma" Font-Bold="True"
										ForeColor="OrangeRed"></asp:label>
								</td>
							</tr>
							<tr style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma">
								<td height="10"></td>
							</tr>
							<TR>
								<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ff9933"
									align="left" height="24">&nbsp;Select Parameters to use this webservice</td>
							</TR>
							<tr bgColor="#ff9933">
								<TD>
									<table style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" cellSpacing="0"
										cellPadding="4" width="100%" align="center">
										<tr bgColor="#ffcc33">
											<td width="15%"></td>
											<td width="10%">Day</td>
											<td width="15%">Month</td>
											<td width="10%">Year</td>
											<td width="20%"></td>
											<td width="30%">Class</td>
										</tr>
										<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
											<td align="right" width="15%">Select&nbsp;Date:&nbsp;</td>
											<td width="10%">
												<asp:dropdownlist id="cboDay" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="100%">
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
											<td width="15%">
												<asp:dropdownlist id="cboMonth" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="100%">
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
											<td width="10%">
												<asp:dropdownlist id="cboYear" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="100%">
													<asp:ListItem Value="2006" Selected="True">2006</asp:ListItem>
													<asp:ListItem Value="2007">2007</asp:ListItem>
													<asp:ListItem Value="2008">2008</asp:ListItem>
												</asp:dropdownlist></td>
											<td align="right" width="20%"></td>
											<td width="30%" rowspan="3">
												<asp:radiobuttonlist id="radCabinClass" runat="server" Font-Names="Tahoma" Font-Size="8pt">
													<asp:ListItem Value="0">First</asp:ListItem>
													<asp:ListItem Value="1" Selected="True">Business</asp:ListItem>
													<asp:ListItem Value="2">Economy</asp:ListItem>
												</asp:radiobuttonlist></td>
										</tr>
										<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
											<td align="right" width="15%">
												Flight ID:</td>
											<td width="10%" colspan="2">
												<asp:dropdownlist id="cboFlightID" runat="server" Width="100%" Font-Size="8pt" Font-Names="Tahoma"
													DataValueField="key"></asp:dropdownlist></td>
											<td width="10%"></td>
											<td align="right" width="20%"></td>
										</tr>
										<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
											<td align="right" width="15%">
												Seat:&nbsp;</td>
											<td width="10%" colspan="2">
												<asp:textbox id="txtSeat" runat="server" Width="100%" Font-Size="8pt" Font-Names="Tahoma"></asp:textbox></td>
											<td width="10%"></td>
											<td align="right" width="20%"></td>
										</tr>
										<tr align="right">
											<td colspan="6">
												<asp:button id="btnUpdate" runat="server" Font-Size="8pt" Font-Names="Tahoma" BackColor="ForestGreen"
													BorderColor="MistyRose" Text="Update by web service" Font-Bold="True" ForeColor="White"></asp:button></td>
										</tr>
									</table>
								</TD>
							</tr>
							<TR height="6">
								<TD></TD>
							</TR>
						</TABLE>
					</td>
				</tr>
				<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; TEXT-ALIGN: center" height="26">
					<td>Copyright 2006 SkyHigh Alliance Co., Ltd. All reserved.</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
