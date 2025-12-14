<%@ Page Language="vb" AutoEventWireup="false" Codebehind="payment.aspx.vb" Inherits="skyhighbeta.payment"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SkyHigh :: Payment</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body background="image/background.gif" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table id="Table1" cellSpacing="0" cellPadding="0" width="800" align="center" border="0">
				<tr>
					<td align="center"><asp:image id="Image1" runat="server" ImageUrl="image/airflash2.jpg"></asp:image></td>
				</tr>
				<tr bgcolor="#ffffff">
					<td>
						<TABLE id="Table2" style="FONT-SIZE: x-small; COLOR: black; FONT-FAMILY: Tahoma, 'Microsoft Sans Serif'"
							cellSpacing="0" cellPadding="2" width="96%" align="center" bgColor="#ffffff">
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
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: saddlebrown; FONT-FAMILY: Tahoma"
												width="18%">Passenger Details</td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: saddlebrown; FONT-FAMILY: Tahoma"
												width="16%">Review</td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: yellowgreen; FONT-FAMILY: Tahoma"
												width="16%">Payment</td>
										</tr>
										<tr height="2">
											<td bgColor="saddlebrown" colSpan="5"></td>
											<td bgColor="yellowgreen"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 16pt; COLOR: #cc6633; FONT-FAMILY: Tahoma; HEIGHT: 35px"
								vAlign="middle">
								<td>Payment
								</td>
							</tr>
							<tr style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma" height="10">
								<td></td>
							</tr>
							<TR>
								<td>
									<table cellSpacing="0" cellPadding="8" width="100%">
										<tr>
											<td width="25%" background="image/bar.gif">
												<table style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" cellSpacing="0" cellPadding="3"
													width="100%" bgColor="#fffff1">
													<tr>
														<td style="FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR: saddlebrown" align="center" bgColor="#ffffcc">BOOKING 
															REFERENCE</td>
													</tr>
													<tr>
														<td align="center"><asp:label id="lblBookRef" runat="server" Font-Size="Medium" Font-Names="Tahoma" ForeColor="Chocolate"
																Font-Bold="True"></asp:label></td>
													</tr>
												</table>
											</td>
											<td width="75%">
												<table style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" cellPadding="4" width="100%">
													<tr>
														<td>Booking reference is required to access E-service.</td>
													</tr>
													<tr>
														<td><asp:image id="Image5" runat="server" ImageUrl="image/point.gif"></asp:image><b>&nbsp;Total 
																Price: </b>
															<asp:label id="lblTotal" runat="server"></asp:label></td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</TR>
							<TR height="15">
								<TD></TD>
							</TR>
							<TR>
								<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: #ff9933; FONT-FAMILY: Tahoma" align="left"
									height="24">&nbsp;Credit card information</td>
							</TR>
							<tr height="4">
								<td background="image/bar.gif"></td>
							</tr>
							<tr>
								<td style="HEIGHT: 164px">
									<table style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" cellSpacing="0" cellPadding="0"
										width="100%">
										<tr height="30">
											<td width="45%" rowSpan="6"><asp:image id="Image2" runat="server" ImageUrl="image/card.gif"></asp:image></td>
											<TD>&nbsp;We accept <b>Visa</b> and <b>MasterCard</b>.
											</TD>
										</tr>
										<tr height="20">
											<td width="55%"><asp:image id="Image3" runat="server" ImageUrl="image/point.gif"></asp:image><b>&nbsp;Credit 
													card number</b>
											</td>
										</tr>
										<TR>
											<TD width="55%"><asp:textbox id="txtCredit1" runat="server" Width="40px" Font-Size="8pt" Font-Names="Tahoma"
													BorderStyle="Groove" MaxLength="4"></asp:textbox><STRONG>&nbsp;</STRONG>&nbsp;
												<asp:textbox id="txtCredit2" runat="server" Width="40px" Font-Size="8pt" Font-Names="Tahoma"
													BorderStyle="Groove" MaxLength="4"></asp:textbox><STRONG>&nbsp;</STRONG>&nbsp;
												<asp:textbox id="txtCredit3" runat="server" Width="40px" Font-Size="8pt" Font-Names="Tahoma"
													BorderStyle="Groove" MaxLength="4"></asp:textbox><STRONG>&nbsp;</STRONG>&nbsp;
												<asp:textbox id="txtCredit4" runat="server" Width="40px" Font-Size="8pt" Font-Names="Tahoma"
													BorderStyle="Groove" MaxLength="4"></asp:textbox><STRONG>&nbsp;</STRONG>&nbsp;
												<asp:textbox id="txtCreditLast3" runat="server" Width="32px" Font-Size="8pt" Font-Names="Tahoma"
													BackColor="NavajoWhite" BorderStyle="Groove" MaxLength="3"></asp:textbox>*<BR>
												* Enter the last 3 digits on the back of your credit card.</TD>
										</TR>
										<tr>
											<td width="55%"></td>
										</tr>
										<tr height="20">
											<td><b><asp:image id="Image4" runat="server" ImageUrl="image/point.gif"></asp:image>&nbsp;Expiry 
													Date</b>
											</td>
										</tr>
										<tr>
											<td style="HEIGHT: 32px" width="60%"><asp:dropdownlist id="cboMonth" runat="server" Width="48px" Font-Size="8pt" Font-Names="Tahoma">
													<asp:ListItem Value="Jan">Jan</asp:ListItem>
													<asp:ListItem Value="Feb">Feb</asp:ListItem>
													<asp:ListItem Value="Mar">Mar</asp:ListItem>
													<asp:ListItem Value="Apr">Apr</asp:ListItem>
													<asp:ListItem Value="May">May</asp:ListItem>
													<asp:ListItem Value="Jun">Jun</asp:ListItem>
													<asp:ListItem Value="Jul">Jul</asp:ListItem>
													<asp:ListItem Value="Aug">Aug</asp:ListItem>
													<asp:ListItem Value="Sep">Sep</asp:ListItem>
													<asp:ListItem Value="Oct">Oct</asp:ListItem>
													<asp:ListItem Value="Nov">Nov</asp:ListItem>
													<asp:ListItem Value="Dec">Dec</asp:ListItem>
												</asp:dropdownlist>&nbsp;
												<asp:dropdownlist id="cboYear" runat="server" Width="48px" Font-Size="8pt" Font-Names="Tahoma">
													<asp:ListItem Value="2005">2005</asp:ListItem>
													<asp:ListItem Value="2006">2006</asp:ListItem>
													<asp:ListItem Value="2007">2007</asp:ListItem>
													<asp:ListItem Value="2008">2008</asp:ListItem>
													<asp:ListItem Value="2009">2009</asp:ListItem>
													<asp:ListItem Value="2010">2010</asp:ListItem>
													<asp:ListItem Value="2012">2012</asp:ListItem>
													<asp:ListItem Value="2013">2013</asp:ListItem>
													<asp:ListItem Value="2014">2014</asp:ListItem>
													<asp:ListItem Value="2015">2015</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr height="10">
								<td></td>
							</tr>
							<tr style="FONT-SIZE: 8pt; COLOR: #ff9933; FONT-FAMILY: Tahoma" height="20">
								<td><b>Note</b>
								</td>
							</tr>
							<tr height="4">
								<td background="image/bar.gif"></td>
							</tr>
							<tr style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma">
								<td><BR>
									- Credit card holder must be part of the traveling party and the card must be 
									presented upon check-in.<BR>
									- Bangkok Airways - KTC Visa card ticket discount privileges are only valid 
									through any Bangkok Airways office.</td>
							</tr>
							<tr>
								<td>
									<table style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma" width="100%">
										<tr vAlign="middle" height="30">
											<td width="50%"><asp:button id="btnSubmit" runat="server" Font-Size="8pt" Font-Names="Tahoma" Text="Submit"
													BorderColor="MistyRose" BackColor="Firebrick" ForeColor="White" Font-Bold="True"></asp:button></td>
											<td align="right" width="50%"></td>
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
