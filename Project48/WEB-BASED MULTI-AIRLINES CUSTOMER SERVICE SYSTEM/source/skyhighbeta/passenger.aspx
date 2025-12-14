<%@ Page Language="vb" AutoEventWireup="false" Codebehind="passenger.aspx.vb" Inherits="skyhighbeta.passenger"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SkyHigh :: Passenger Details</title>
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
								<td>Passenger Details
								</td>
							</tr>
							<tr style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma">
								<td height="10"></td>
							</tr>
							<TR>
								<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ff9933"
									align="left" height="24">&nbsp;Log In -&nbsp;To AutoComplete your information.</td>
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
							<TR>
								<TD align="center"><asp:label id="lblStatus" runat="server" Font-Names="Tahoma" Font-Size="8pt" Font-Bold="True"
										ForeColor="OrangeRed" Visible="False"></asp:label></TD>
							</TR>
							<TR height="15">
								<TD></TD>
							</TR>
							<TR style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: orangered; FONT-FAMILY: Tahoma"
								height="20">
								<TD style="HEIGHT: 20px">**For non-member only</TD>
							</TR>
							<TR>
								<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ff9933"
									align="left" height="24">&nbsp;Adult - Please provide passenger name(s) as 
									shown&nbsp;in passport.&nbsp;</td>
							</TR>
							<tr bgColor="#ff9933">
								<TD>
									<table style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" cellSpacing="0"
										cellPadding="4" width="100%" align="center">
										<tr bgColor="#ffcc33">
											<td width="20%">First Name</td>
											<td width="20%">Last Name</td>
											<td width="15%">Sex</td>
											<td width="10%">Age</td>
											<td width="20%">Country of Residence</td>
											<td width="15%">Special Meal</td>
										</tr>
										<tr bgColor="#ffffc1">
											<td width="20%"><asp:textbox id="txtFirstName" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="98%"
													Enabled="False"></asp:textbox></td>
											<td width="20%"><asp:textbox id="txtLastName" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="98%"
													Enabled="False"></asp:textbox></td>
											<td width="15%"><asp:radiobuttonlist id="radSex" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="100%" Enabled="False"
													RepeatDirection="Horizontal">
													<asp:ListItem Value="M" Selected="True">Male</asp:ListItem>
													<asp:ListItem Value="F">Female</asp:ListItem>
												</asp:radiobuttonlist></td>
											<td width="10%"><asp:textbox id="txtAge" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="98%" Enabled="False"
													MaxLength="3"></asp:textbox></td>
											<td width="20%"><asp:dropdownlist id="cboCountry" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="95%" Enabled="False">
													<asp:ListItem Value="61">Australia</asp:ListItem>
													<asp:ListItem Value="86">Chaina</asp:ListItem>
													<asp:ListItem Value="44">England</asp:ListItem>
													<asp:ListItem Value="39">Italy</asp:ListItem>
													<asp:ListItem Value="81">Japan</asp:ListItem>
													<asp:ListItem Value="82">South Korea</asp:ListItem>
													<asp:ListItem Value="65">Singapore</asp:ListItem>
													<asp:ListItem Value="66">Thailand</asp:ListItem>
												</asp:dropdownlist></td>
											<td width="15%"><asp:dropdownlist id="cboMeal" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="95%" Enabled="False">
													<asp:ListItem Value="Standard Meal">Standard Meal</asp:ListItem>
													<asp:ListItem Value="Children Meal">Children Meal</asp:ListItem>
													<asp:ListItem Value="Diabetic Meal">Diabetic Meal</asp:ListItem>
													<asp:ListItem Value="Hindu Meal">Hindu Meal</asp:ListItem>
													<asp:ListItem Value="Moslim Meal">Moslim Meal</asp:ListItem>
													<asp:ListItem Value="Vegetarian (Lacto Ovo)">Vegetarian (Lacto Ovo)</asp:ListItem>
													<asp:ListItem Value="Vegetarian (Non Dairy)">Vegetarian (Non Dairy)</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
									</table>
								</TD>
							</tr>
							<TR height="20">
								<TD></TD>
							</TR>
							<tr>
								<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ff9933"
									align="left">&nbsp;Contact Details - At least one phone number is required.</td>
							</tr>
							<TR bgColor="#ff9933">
								<TD align="center">
									<table style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" cellSpacing="0"
										cellPadding="4" width="100%" align="center">
										<tr bgColor="#ffcc33">
											<td width="20%"></td>
											<td width="25%">Country Code
											</td>
											<td width="35%">Number</td>
											<td width="20%">Ext.</td>
										</tr>
										<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
											<td align="right" width="20%">Home or Mobile Number:
											</td>
											<td width="25%"><asp:dropdownlist id="cboCodeHome" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="95%"
													Enabled="False">
													<asp:ListItem Value="61">Australia</asp:ListItem>
													<asp:ListItem Value="86">Chaina</asp:ListItem>
													<asp:ListItem Value="44">England</asp:ListItem>
													<asp:ListItem Value="39">Italy</asp:ListItem>
													<asp:ListItem Value="81">Japan</asp:ListItem>
													<asp:ListItem Value="82">South Korea</asp:ListItem>
													<asp:ListItem Value="65">Singapore</asp:ListItem>
													<asp:ListItem Value="66">Thailand</asp:ListItem>
												</asp:dropdownlist></td>
											<td width="35%"><asp:textbox id="txtTelHome" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="98%" Enabled="False"></asp:textbox></td>
											<td width="20%"></td>
										</tr>
										<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
											<td style="HEIGHT: 28px" align="right" width="20%">Business Number:
											</td>
											<td style="HEIGHT: 28px" width="25%"><asp:dropdownlist id="cboCodeBiz" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="95%" Enabled="False">
													<asp:ListItem Value="61">Australia</asp:ListItem>
													<asp:ListItem Value="86">Chaina</asp:ListItem>
													<asp:ListItem Value="44">England</asp:ListItem>
													<asp:ListItem Value="39">Italy</asp:ListItem>
													<asp:ListItem Value="81">Japan</asp:ListItem>
													<asp:ListItem Value="82">South Korea</asp:ListItem>
													<asp:ListItem Value="65">Singapore</asp:ListItem>
													<asp:ListItem Value="66">Thailand</asp:ListItem>
												</asp:dropdownlist></td>
											<td style="HEIGHT: 28px" width="35%"><asp:textbox id="txtTelBiz" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="98%" Enabled="False"></asp:textbox></td>
											<td style="HEIGHT: 28px" width="20%"><asp:textbox id="txtExt" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="98%" Enabled="False"></asp:textbox></td>
										</tr>
										<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
											<td align="right" width="20%">Fax Number:
											</td>
											<td width="25%"><asp:dropdownlist id="cboCodeFax" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="95%" Enabled="False">
													<asp:ListItem Value="61">Australia</asp:ListItem>
													<asp:ListItem Value="86">Chaina</asp:ListItem>
													<asp:ListItem Value="44">England</asp:ListItem>
													<asp:ListItem Value="39">Italy</asp:ListItem>
													<asp:ListItem Value="81">Japan</asp:ListItem>
													<asp:ListItem Value="82">South Korea</asp:ListItem>
													<asp:ListItem Value="65">Singapore</asp:ListItem>
													<asp:ListItem Value="66">Thailand</asp:ListItem>
												</asp:dropdownlist></td>
											<td width="35%"><asp:textbox id="txtTelFax" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="98%" Enabled="False"></asp:textbox></td>
											<td width="20%"></td>
										</tr>
										<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
											<td align="right">E-Mail Adress:
											</td>
											<td colSpan="3"><asp:textbox id="txtEmail" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="100%" Enabled="False"></asp:textbox></td>
										</tr>
										<tr style="FONT-WEIGHT: normal; FONT-SIZE: 8pt; FONT-FAMILY: Tahoma" bgColor="#ffffc1">
											<td colSpan="5"><b>Note: </b>Minimum Connecting Time is required any airports.<BR>
												<asp:image id="Image3" runat="server" ImageUrl="image/point.gif"></asp:image>&nbsp;International 
												to Domestic 2 hours<BR>
												<asp:image id="Image4" runat="server" ImageUrl="image/point.gif"></asp:image>&nbsp;Domestic 
												to International 2 hours<BR>
												<asp:image id="Image5" runat="server" ImageUrl="image/point.gif"></asp:image>&nbsp;International 
												to International 1.30 hours<BR>
												<asp:image id="Image6" runat="server" ImageUrl="image/point.gif"></asp:image>&nbsp;Domestic 
												to Domestic 30 minutes<BR>
												<BR>
											</td>
										</tr>
									</table>
								</TD>
							</TR>
							<tr height="20">
								<td align="center"></td>
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
											<td width="50%"><asp:button id="btnStart" runat="server" Font-Names="Tahoma" Font-Size="8pt" Font-Bold="True"
													ForeColor="White" BackColor="Firebrick" BorderColor="MistyRose" Text="Start over"></asp:button></td>
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
