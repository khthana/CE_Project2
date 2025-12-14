<%@ Page Language="vb" AutoEventWireup="false" Codebehind="confirmcancel.aspx.vb" Inherits="skyhighbeta.confirmcancel"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SkyHigh :: Cancel Booking</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" background="image/background.gif">
		<form id="Form1" method="post" runat="server">
			<table id="Table1" cellSpacing="0" cellPadding="0" width="800" align="center" border="0">
				<tr>
					<td align="center"><asp:image id="Image1" runat="server" ImageUrl="image/airflash2.jpg"></asp:image></td>
				</tr>
				<tr bgcolor="#fffff1">
					<td>
						<TABLE id="Table2" style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #fffff1"
							cellSpacing="0" cellPadding="4" width="96%" align="center">
							<tr height="12">
								<td colspan="6" bgcolor="#ff9933"></td>
							</tr>
							<TR style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: darkgray; FONT-FAMILY: Tahoma"
								height="24">
								<TD>E-SERVICE &gt; YOUR ITINERARY&nbsp;&gt; CANCEL BOOKING</TD>
							</TR>
							<tr height="4">
								<td background="image/bar.gif"></td>
							</tr>
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 14pt; COLOR: #cc6633; FONT-FAMILY: Tahoma; HEIGHT: 35px"
								vAlign="middle">
								<td>CANCEL BOOKING
								</td>
							</tr>
							<tr>
								<td>We are sorry that you will not travel with us.</td>
							</tr>
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ff9933"
								align="left">
								<td>&nbsp;Survey</td>
							</tr>
							<tr bgColor="#ff9933">
								<td>
									<table style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" cellSpacing="0"
										cellPadding="4" width="100%">
										<tr bgColor="#ffcc33">
											<td colSpan="2">To help us serve you better in the future, please kindly provide us 
												the reason of your cancellation.</td>
										</tr>
										<tr bgColor="#ffffc1">
											<td colSpan="2"><asp:radiobuttonlist id="radCancel" runat="server" Font-Size="8pt" Font-Names="Tahoma" Width="350px">
													<asp:ListItem Value="0" Selected="True">Change of plan</asp:ListItem>
													<asp:ListItem Value="1">Dissatisfaction with SkyHigh Alliance service, please specify</asp:ListItem>
												</asp:radiobuttonlist></td>
										</tr>
										<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
											<td width="3%"></td>
											<td width="97%"><asp:textbox id="txtCancel" runat="server" Font-Size="8pt" Font-Names="Tahoma" Width="612px"
													MaxLength="200"></asp:textbox>&nbsp; (200 characters)</td>
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
											<td width="50%"><asp:button id="btnBack" runat="server" Font-Size="8pt" Font-Names="Tahoma" ForeColor="White"
													Font-Bold="True" Text="Back" BackColor="Firebrick" BorderColor="MistyRose"></asp:button><STRONG>&nbsp; 
													Go to:</STRONG>Your itinerary</td>
											<td align="right" width="50%"><b><asp:button id="btnConfirm" runat="server" Font-Size="8pt" Font-Names="Tahoma" ForeColor="White"
														Font-Bold="True" Text="Confirm" BackColor="Firebrick" BorderColor="MistyRose"></asp:button></b></td>
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
