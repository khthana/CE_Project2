<%@ Page Language="vb" AutoEventWireup="false" Codebehind="paymentresult.aspx.vb" Inherits="skyhighbeta.paymentresult"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SkyHigh :: Payment Result</title>
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
				<tr bgcolor="#ffffee">
					<td>
						<TABLE id="Table2" style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" cellSpacing="0"
							cellPadding="4" width="96%" align="center">
							<tr height="12">
								<td colspan="6" bgcolor="#ff9933"></td>
							</tr>
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 14pt; COLOR: #cc6633; FONT-FAMILY: Tahoma; HEIGHT: 35px"
								vAlign="middle">
								<td>PAYMENT RESULT
								</td>
							</tr>
							<TR>
								<td>
									<table style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" width="100%" cellpadding="4"
										cellspacing="0">
										<tr style="FONT-WEIGHT: bold; COLOR: darkorange">
											<td rowSpan="7" width="20%"></td>
											<td width="80%">Result</td>
										</tr>
										<tr height="4">
											<td background="image/bar.gif"></td>
										</tr>
										<tr height="10" style="COLOR: orangered">
											<td>
												<asp:Label id="lblFail" runat="server" Visible="False" ForeColor="Firebrick"><b>Payment 
														has failed due to approval code provided !</b><BR>
												This transaction has been rejected sine to your credit card has not been 
												approved; please contact your credit card issuer.<BR>
												To purchase the ticket,please go to E-Services on home page.</asp:Label>
												<asp:Label id="lblSuccess" runat="server" ForeColor="OrangeRed" Visible="False">Your payment is successful.</asp:Label></td>
										</tr>
										<tr height="10">
											<td></td>
										</tr>
										<tr style="COLOR: orangered">
											<td>
												<asp:Label id="lblMustPayIn" runat="server" Visible="False" ForeColor="Firebrick"></asp:Label>
											</td>
										</tr>
										<tr height="10">
											<td></td>
										</tr>
										<TR>
											<TD style="WIDTH: 485px">
												<asp:Label id="lblBottom1" runat="server" Font-Bold="True"></asp:Label>
												<BR>
												<asp:Image id="Image2" runat="server" ImageUrl="image/point.gif"></asp:Image>&nbsp;
												<asp:Label id="lblBottom2" runat="server" ForeColor="Black"></asp:Label></TD>
										</TR>
									</table>
								</td>
							</TR>
							<tr>
								<td>
									<table style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma" width="100%">
										<tr vAlign="middle" height="30">
											<td width="50%">
												<asp:button id="btnBack" runat="server" Font-Bold="True" Font-Names="Tahoma" BackColor="Firebrick"
													BorderColor="MistyRose" ForeColor="White" Text="Back" Font-Size="8pt"></asp:button>&nbsp;<B>Go 
													to:&nbsp;</B>Pay Now</td>
											<td align="right" width="50%"><b>Go To:</b> All Trips
												<asp:button id="btnAllTrips" runat="server" Font-Bold="True" Font-Size="8pt" Text="See All Trips"
													ForeColor="White" BorderColor="MistyRose" BackColor="Firebrick" Font-Names="Tahoma"></asp:button></td>
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
