<%@ Page Language="vb" AutoEventWireup="false" Codebehind="editinfo.aspx.vb" Inherits="skyhighbeta.editinfo"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SkyHigh :: Edit Member Infomation</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table id="Table1" cellSpacing="0" cellPadding="0" width="800" align="center" border="0">
				<tr>
					<td align="center"><asp:image id="Image1" runat="server" ImageUrl="image/airflash2.jpg"></asp:image></td>
				</tr>
				<tr bgColor="#ffffee">
					<td>
						<table cellSpacing="0" cellPadding="0" width="96%" align="center">
							<tr>
								<td>
									<table style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma, 'Microsoft Sans Serif'"
										cellPadding="4" width="99%" align="center">
										<tr height="12">
											<td bgColor="#ff9933" colSpan="6"></td>
										</tr>
										<tr>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: saddlebrown; FONT-FAMILY: Tahoma"
												width="18%"></td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: saddlebrown; FONT-FAMILY: Tahoma"
												width="16%"></td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: saddlebrown; FONT-FAMILY: Tahoma"
												width="16%"></td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: saddlebrown; FONT-FAMILY: Tahoma"
												width="18%"></td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: saddlebrown; FONT-FAMILY: Tahoma"
												width="16%"></td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: saddlebrown; FONT-FAMILY: Tahoma"
												width="16%"></td>
										</tr>
										<tr height="2">
											<td bgColor="saddlebrown" colSpan="6"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 16pt; COLOR: #cc6633; FONT-FAMILY: Tahoma; HEIGHT: 35px"
								vAlign="middle">
								<td>MEMBER INFORMATION&nbsp;&nbsp;<asp:label id="lblStatus" runat="server" ForeColor="OrangeRed" Font-Names="Tahoma" Font-Bold="True"
										Font-Size="8pt"></asp:label>
								</td>
							</tr>
							<tr style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma">
								<td height="10"></td>
							</tr>
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ff9933">
								<td height="24">&nbsp;&nbsp;Member Information</td>
							</tr>
							<tr bgColor="#ff9933">
								<td>
									<table cellSpacing="0" cellPadding="0" width="99%" align="center" bgColor="#ffffff">
										<tr>
											<td>
												<table style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" cellSpacing="0" cellPadding="4"
													width="100%" align="center">
													<tr style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ffcc33">
														<td width="20%">User Name</td>
														<td width="25%">Password</td>
														<td width="25%" colSpan="2">Confirm Password</td>
														<td width="30%" colSpan="2">Member Type</td>
													</tr>
													<tr bgColor="#ffffc1">
														<td width="20%"><asp:label id="lblUser" runat="server"></asp:label></td>
														<td width="25%"><asp:textbox id="txtPwd" tabIndex="2" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="98%"
																TextMode="Password"></asp:textbox></td>
														<td width="25%" colSpan="2"><asp:textbox id="txtConFirmPwd" tabIndex="3" runat="server" Font-Names="Tahoma" Font-Size="8pt"
																Width="98%" TextMode="Password"></asp:textbox></td>
														<td width="30%" colSpan="2"><asp:radiobuttonlist id="radMember" tabIndex="4" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="124px"
																RepeatDirection="Horizontal">
																<asp:ListItem Value="1" Selected="True">Star</asp:ListItem>
																<asp:ListItem Value="2">Moonlight</asp:ListItem>
																<asp:ListItem Value="3">Sunshine</asp:ListItem>
															</asp:radiobuttonlist></td>
													</tr>
													<tr height="10">
														<td colSpan="6"></td>
													</tr>
													<tr style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ffcc33">
														<td>First Name</td>
														<td>Last Name</td>
														<td width="10%">Age</td>
														<td width="15%">Sex</td>
														<td align="center">Country</td>
														<td align="center">Special Meal</td>
													</tr>
													<tr bgColor="#ffffc1">
														<td><asp:textbox id="txtFirstName" tabIndex="5" runat="server" Font-Names="Tahoma" Font-Size="8pt"
																Width="98%"></asp:textbox></td>
														<td><asp:textbox id="txtLastName" tabIndex="6" runat="server" Font-Names="Tahoma" Font-Size="8pt"
																Width="98%"></asp:textbox></td>
														<td width="10%"><asp:textbox id="txtAge" tabIndex="7" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="98%"
																MaxLength="3"></asp:textbox></td>
														<td width="15%"><asp:radiobuttonlist id="radSex" tabIndex="8" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="100%"
																RepeatDirection="Horizontal">
																<asp:ListItem Value="M" Selected="True">Male</asp:ListItem>
																<asp:ListItem Value="F">Female</asp:ListItem>
															</asp:radiobuttonlist></td>
														<td align="center"><asp:dropdownlist id="cboCountry" tabIndex="9" runat="server" Font-Names="Tahoma" Font-Size="8pt"
																Width="95%">
																<asp:ListItem Value="Australia">Australia</asp:ListItem>
																<asp:ListItem Value="Chaina">Chaina</asp:ListItem>
																<asp:ListItem Value="England">England</asp:ListItem>
																<asp:ListItem Value="Italy">Italy</asp:ListItem>
																<asp:ListItem Value="Japan">Japan</asp:ListItem>
																<asp:ListItem Value="South Korea">South Korea</asp:ListItem>
																<asp:ListItem Value="Singapore">Singapore</asp:ListItem>
																<asp:ListItem Value="Thailand">Thailand</asp:ListItem>
															</asp:dropdownlist></td>
														<td align="center"><asp:dropdownlist id="cboMeal" tabIndex="10" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="95%">
																<asp:ListItem Value="Standard Meal">Standard Meal</asp:ListItem>
																<asp:ListItem Value="Children Meal">Children Meal</asp:ListItem>
																<asp:ListItem Value="Diabetic Meal">Diabetic Meal</asp:ListItem>
																<asp:ListItem Value="Hindu Meal">Hindu Meal</asp:ListItem>
																<asp:ListItem Value="Moslim Meal">Moslim Meal</asp:ListItem>
																<asp:ListItem Value="Vegetarian (Lacto Ovo)">Vegetarian (Lacto Ovo)</asp:ListItem>
																<asp:ListItem Value="Vegetarian (Non Dairy)">Vegetarian (Non Dairy)</asp:ListItem>
															</asp:dropdownlist></td>
													</tr>
													<tr height="10">
														<td colSpan="6"></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td>
												<table style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" cellSpacing="0"
													cellPadding="4" width="100%" align="center">
													<TBODY>
														<tr bgColor="#ffcc33">
															<td width="15%"></td>
															<td width="25%">Country Code
															</td>
															<td width="30%">Number</td>
															<td width="30%">Ext.</td>
														</tr>
														<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
															<td align="right" width="15%">Home Number:
															</td>
															<td width="25%"><asp:dropdownlist id="cboCodeHome" tabIndex="11" runat="server" Font-Names="Tahoma" Font-Size="8pt"
																	Width="95%">
																	<asp:ListItem Value="61">Australia</asp:ListItem>
																	<asp:ListItem Value="86">Chaina</asp:ListItem>
																	<asp:ListItem Value="44">England</asp:ListItem>
																	<asp:ListItem Value="39">Italy</asp:ListItem>
																	<asp:ListItem Value="81">Japan</asp:ListItem>
																	<asp:ListItem Value="82">South Korea</asp:ListItem>
																	<asp:ListItem Value="65">Singapore</asp:ListItem>
																	<asp:ListItem Value="66">Thailand</asp:ListItem>
																</asp:dropdownlist></td>
															<td width="30%"><asp:textbox id="txtTelHome" tabIndex="13" runat="server" Font-Names="Tahoma" Font-Size="8pt"
																	Width="98%"></asp:textbox></td>
															<td width="30%"></td>
														</tr>
														<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
															<td style="HEIGHT: 28px" align="right" width="15%">Business Number:
															</td>
															<td style="HEIGHT: 28px" width="20%"><asp:dropdownlist id="cboCodeBiz" tabIndex="14" runat="server" Font-Names="Tahoma" Font-Size="8pt"
																	Width="95%">
																	<asp:ListItem Value="61">Australia</asp:ListItem>
																	<asp:ListItem Value="86">Chaina</asp:ListItem>
																	<asp:ListItem Value="44">England</asp:ListItem>
																	<asp:ListItem Value="39">Italy</asp:ListItem>
																	<asp:ListItem Value="81">Japan</asp:ListItem>
																	<asp:ListItem Value="82">South Korea</asp:ListItem>
																	<asp:ListItem Value="65">Singapore</asp:ListItem>
																	<asp:ListItem Value="66">Thailand</asp:ListItem>
																</asp:dropdownlist></td>
															<td style="HEIGHT: 28px" width="35%"><asp:textbox id="txtTelBiz" tabIndex="16" runat="server" Font-Names="Tahoma" Font-Size="8pt"
																	Width="98%"></asp:textbox></td>
															<td style="HEIGHT: 28px" width="300%"><asp:textbox id="txtExt" tabIndex="17" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="98%"></asp:textbox></td>
														</tr>
														<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
															<td align="right" width="15%">Fax Number:
															</td>
															<td width="25%"><asp:dropdownlist id="cboCodeFax" tabIndex="18" runat="server" Font-Names="Tahoma" Font-Size="8pt"
																	Width="95%">
																	<asp:ListItem Value="61">Australia</asp:ListItem>
																	<asp:ListItem Value="86">Chaina</asp:ListItem>
																	<asp:ListItem Value="44">England</asp:ListItem>
																	<asp:ListItem Value="39">Italy</asp:ListItem>
																	<asp:ListItem Value="81">Japan</asp:ListItem>
																	<asp:ListItem Value="82">South Korea</asp:ListItem>
																	<asp:ListItem Value="65">Singapore</asp:ListItem>
																	<asp:ListItem Value="66">Thailand</asp:ListItem>
																</asp:dropdownlist></td>
															<td width="30%"><asp:textbox id="txtTelFax" tabIndex="20" runat="server" Font-Names="Tahoma" Font-Size="8pt"
																	Width="98%"></asp:textbox></td>
															<td width="30%"></td>
														</tr>
														<tr bgColor="#ffffc1" height="16">
															<td colSpan="4"></td>
														</tr>
														<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
															<td align="right">E-Mail:
															</td>
															<td colSpan="1"><asp:textbox id="txtEmail" tabIndex="21" runat="server" Font-Names="Tahoma" Font-Size="8pt" Width="100%"></asp:textbox></td>
															<td align="right">ID Card Number:
															</td>
															<td><asp:textbox id="txtIDCard" tabIndex="22" runat="server" Font-Names="Tahoma" Font-Size="8pt"
																	Width="98%"></asp:textbox></td>
														</tr>
														<tr style="FONT-WEIGHT: normal" bgColor="#ffffc1">
															<td align="right">Adress:
															</td>
															<td colSpan="4"><asp:textbox id="txtAddress" tabIndex="23" runat="server" Font-Names="Tahoma" Font-Size="8pt"
																	Width="100%"></asp:textbox></td>
														</tr>
														<tr bgColor="#ffffc1" height="8">
															<td colSpan="6"></td>
														</tr>
														<tr bgColor="#ff9933" height="4">
															<td colSpan="6"></td>
														</tr>
													</TBODY>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma" cellSpacing="4" width="100%">
										<tr vAlign="middle">
											<td width="50%"><asp:button id="btnHome" tabIndex="24" runat="server" ForeColor="White" Font-Names="Tahoma"
													Font-Bold="True" Font-Size="8pt" Text="Home" BorderColor="MistyRose" BackColor="Firebrick"></asp:button></td>
											<td align="right" width="50%"><asp:button id="btnChange" tabIndex="25" runat="server" ForeColor="White" Font-Names="Tahoma"
													Font-Bold="True" Font-Size="8pt" Text="Change" BorderColor="MistyRose" BackColor="Firebrick"></asp:button>&nbsp;
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; TEXT-ALIGN: center" bgColor="#ff9933"
					height="24">
					<td>| <A href="http://161.246.5.166">Terms &amp; Conditions</A> | <A href="http://161.246.5.166">
							Conditions of Carriage</A> | <A href="http://161.246.5.166">Privacy &amp; 
							Security</A> |
					</td>
				</tr>
				<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; TEXT-ALIGN: center" height="30">
					<td>Copyright 2006 SkyHigh Alliance Co., Ltd. All reserved.</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
