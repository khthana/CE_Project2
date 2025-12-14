<%@ Page Language="vb" AutoEventWireup="false" Codebehind="login.aspx.vb" Inherits="skyhighbeta.login"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SkyHigh :: Login Page</title>
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
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: saddlebrown; FONT-FAMILY: Tahoma"
												width="18%">Plan Your Trip</td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: saddlebrown; FONT-FAMILY: Tahoma"
												width="16%">Select</td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: saddlebrown; FONT-FAMILY: Tahoma"
												width="16%">Fares</td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: yellowgreen; FONT-FAMILY: Tahoma"
												width="18%">Passenger Details</td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: peachpuff; FONT-FAMILY: Tahoma"
												width="16%">Review</td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: peachpuff; FONT-FAMILY: Tahoma"
												width="16%">Payment</td>
										</tr>
										<tr height="2">
											<td bgColor="saddlebrown" colSpan="3"></td>
											<td bgColor="yellowgreen"></td>
											<td bgColor="peachpuff" colSpan="2"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 16pt; COLOR: #cc6633; FONT-FAMILY: Tahoma; HEIGHT: 35px"
								vAlign="middle">
								<td>LOG IN
								</td>
							</tr>
							<tr style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma">
								<td height="10"></td>
							</tr>
							<TR>
								<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ff9933"
									align="left" height="24">&nbsp;Log In -&nbsp;To access skyhigh's member system.</td>
							</TR>
							<tr bgColor="#ff9933">
								<TD>
									<table style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" cellSpacing="0"
										cellPadding="4" width="100%" align="center">
										<tr bgColor="#ffcc33">
											<td width="20%">User Name</td>
											<td width="20%">Password</td>
											<td width="30%"></td>
											<td width="30%" bgColor="yellowgreen">&nbsp;&nbsp; Check to Enable form</td>
										</tr>
										<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
											<td width="20%"><asp:textbox id="txtUser" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="98%"></asp:textbox></td>
											<td width="20%"><asp:textbox id="txtPwd" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="98%" TextMode="Password"></asp:textbox></td>
											<td width="30%"><asp:button id="btnLogin" runat="server" Font-Names="Tahoma" Font-Size="8pt" Font-Bold="True"
													ForeColor="White" BackColor="Firebrick" BorderColor="MistyRose" Text="Log in"></asp:button>&nbsp;
												<asp:button id="btnForget" runat="server" Font-Names="Tahoma" Font-Size="8pt" Font-Bold="True"
													ForeColor="White" BackColor="Firebrick" BorderColor="MistyRose" Text="Forget Password"></asp:button></td>
											<td width="30%" bgColor="#ccff99">&nbsp;<asp:checkbox id="chkNonMember" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="I'm not a SkyHigh member"
													AutoPostBack="True"></asp:checkbox></td>
										</tr>
									</table>
								</TD>
							</tr>
							<tr height="20">
								<td align="center">
									<asp:label id="lblStatus" runat="server" Font-Size="8pt" Font-Names="Tahoma" ForeColor="OrangeRed"
										Font-Bold="True" Visible="False"></asp:label></td>
							</tr>
							<tr style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma" height="20">
								<td><b>Special Services</b>
								</td>
							</tr>
							<tr style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma">
								<td>If you wish to book more complex itineraries, group bookings or require 
									personal assistance such as elder, handicapped and other special services,
									<br>
									please email with all details to <A href="mailto:reservation@skyhigh.com">reservation@skyhigh.com</A></td>
							</tr>
							<tr>
								<td>
									<table style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma" width="100%">
										<tr vAlign="middle" height="30">
											<td width="50%"><asp:button id="btnEdit" runat="server" Font-Names="Tahoma" Font-Size="8pt" Font-Bold="True"
													ForeColor="White" BackColor="Firebrick" BorderColor="MistyRose" Text="Edit Info"></asp:button></td>
											<td align="right" width="50%"><b>Go to:</b> Review
												<asp:button id="btnNext" runat="server" Font-Names="Tahoma" Font-Size="8pt" Font-Bold="True"
													ForeColor="White" BackColor="Firebrick" BorderColor="MistyRose" Text="Next" Enabled="False"></asp:button></td>
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
