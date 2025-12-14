<%@ Page Language="vb" AutoEventWireup="false" Codebehind="cancelresult.aspx.vb" Inherits="skyhighbeta.cancelresult"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SkyHigh :: Cancel Result</title>
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
							<TR style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: darkgray; FONT-FAMILY: Tahoma">
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
							<TR>
								<td>
									<table style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" width="100%">
										<tr style="FONT-WEIGHT: bold; COLOR: darkorange">
											<td rowSpan="5"></td>
											<td>Result</td>
										</tr>
										<tr height="4">
											<td background="image/bar.gif"></td>
										</tr>
										<tr height="10">
											<td>
												<asp:Label id="lblCancel" runat="server" ForeColor="OrangeRed" Font-Names="Tahoma" Font-Size="8pt"></asp:Label></td>
										</tr>
										<tr height="30">
											<td></td>
										</tr>
										<TR>
											<TD style="WIDTH: 485px"><STRONG>Thank you for visiting <A href="http://www.skyhigh.com">www.skyhigh.com</A></STRONG>&nbsp;&nbsp;
												<BR>
												<asp:Image id="Image2" runat="server" ImageUrl="image/point.gif"></asp:Image>
												We hope you will visit us again soon.</TD>
										</TR>
									</table>
								</td>
							</TR>
							<tr>
								<td>
									<table style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma" width="100%">
										<tr vAlign="middle" height="30">
											<td width="50%"><STRONG> &nbsp;</STRONG></td>
											<td align="right" width="50%"><b><STRONG>go to:</STRONG> Main page
													<asp:button id="btnHome" runat="server" Font-Bold="True" Font-Names="Tahoma" BackColor="Firebrick"
														BorderColor="MistyRose" ForeColor="White" Text="Home" Font-Size="8pt"></asp:button></b></td>
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
