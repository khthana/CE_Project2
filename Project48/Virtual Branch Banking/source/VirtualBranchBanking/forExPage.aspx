<%@ Page Language="vb" AutoEventWireup="false" Codebehind="forExPage.aspx.vb" Inherits="VirtualBranchBanking.forExPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Foreign Exchange</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma"></FONT>
			<asp:label id="Label3" style="Z-INDEX: 101; LEFT: 56px; POSITION: absolute; TOP: 32px" runat="server"
				Font-Size="Medium" Font-Bold="True" Font-Names="Arial" ForeColor="Black" Height="24px">Virtual Branch Banking</asp:label>
			<TABLE id="Table7" style="Z-INDEX: 102; LEFT: 216px; WIDTH: 520px; POSITION: absolute; TOP: 56px; HEIGHT: 21px"
				cellSpacing="0" cellPadding="0" width="520" border="0">
				<TR>
					<TD style="WIDTH: 14px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><STRONG><FONT face="Tahoma" size="2"></FONT></STRONG></TD>
					<TD style="WIDTH: 19px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><FONT face="Tahoma" size="2"><STRONG></STRONG></FONT></TD>
					<TD style="WIDTH: 55px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><STRONG><FONT face="Tahoma" color="#ffffff" size="2"><asp:imagebutton id="homebutton" runat="server" Height="21px" Width="55px" ImageUrl="\VirtualBranchBanking\picture\homeTmp.gif"
									BorderWidth="0px" BorderStyle="None"></asp:imagebutton></FONT></STRONG></TD>
					<TD style="WIDTH: 82px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><STRONG><FONT face="Tahoma" color="#ffffff" size="2"></FONT></STRONG></TD>
					<TD style="WIDTH: 120px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><FONT face="Tahoma">&nbsp;&nbsp;<FONT size="2"><STRONG>
								</STRONG></FONT></FONT>
					</TD>
					<TD style="WIDTH: 45px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00403g.gif"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 54px; HEIGHT: 17px"><FONT face="Tahoma"><asp:imagebutton id="logoffButton" runat="server" Height="21px" Width="64px" ImageUrl="\VirtualBranchBanking\picture\bg-end-logout.jpg"
								BorderWidth="0px" BorderStyle="None"></asp:imagebutton></FONT></TD>
				</TR>
			</TABLE>
			<TABLE id="Table8" style="Z-INDEX: 103; LEFT: 56px; WIDTH: 656px; POSITION: absolute; TOP: 112px; HEIGHT: 288px"
				cellSpacing="0" cellPadding="0" width="656" background="\VirtualBranchBanking\picture\bg_btm.jpg"
				border="0">
				<TR>
					<TD><FONT face="Tahoma"></FONT>
						<DIV style="WIDTH: 657px; HEIGHT: 280px" ms_positioning="FlowLayout">
							<TABLE id="Table9" style="WIDTH: 656px; HEIGHT: 232px" cellSpacing="0" cellPadding="0"
								width="656" border="0">
								<TR>
									<TD style="WIDTH: 166px">
										<DIV style="WIDTH: 177px; POSITION: relative; HEIGHT: 360px" ms_positioning="GridLayout"><asp:imagebutton id="accessAccButton" style="Z-INDEX: 101; LEFT: 0px; POSITION: absolute; TOP: 0px"
												runat="server" Height="22px" Width="176px" ImageUrl="\VirtualBranchBanking\picture\menuButton1.jpg" BorderWidth="0px" BorderStyle="None"></asp:imagebutton><asp:imagebutton id="paymentButton" style="Z-INDEX: 102; LEFT: 0px; POSITION: absolute; TOP: 24px"
												runat="server" Height="22px" Width="176px" ImageUrl="\VirtualBranchBanking\picture\menuButton2.jpg" BorderWidth="0px" BorderStyle="None"></asp:imagebutton><asp:imagebutton id="chequeButton" style="Z-INDEX: 103; LEFT: 0px; POSITION: absolute; TOP: 48px"
												runat="server" Height="22px" Width="176px" ImageUrl="\VirtualBranchBanking\picture\menuButton3.jpg" BorderWidth="0px" BorderStyle="None"></asp:imagebutton><asp:imagebutton id="forexButton" style="Z-INDEX: 104; LEFT: 0px; POSITION: absolute; TOP: 72px"
												runat="server" Height="22px" Width="176px" ImageUrl="\VirtualBranchBanking\picture\menuButton4.jpg" BorderWidth="0px" BorderStyle="None"></asp:imagebutton><asp:imagebutton id="creditLoanButton" style="Z-INDEX: 105; LEFT: 0px; POSITION: absolute; TOP: 96px"
												runat="server" Height="22px" Width="176px" ImageUrl="\VirtualBranchBanking\picture\menuButton5.jpg" BorderWidth="0px" BorderStyle="None"></asp:imagebutton><asp:imagebutton id="personalOptionButton" style="Z-INDEX: 106; LEFT: 0px; POSITION: absolute; TOP: 120px"
												runat="server" Height="22px" Width="176px" ImageUrl="\VirtualBranchBanking\picture\menuButton6.jpg" BorderWidth="0px" BorderStyle="None"></asp:imagebutton><asp:label id="Label12" style="Z-INDEX: 107; LEFT: 0px; POSITION: absolute; TOP: 144px" runat="server"
												Font-Size="Smaller" Font-Names="Arial" BackColor="Black" Width="176px"></asp:label><asp:label id="Label13" style="Z-INDEX: 108; LEFT: 0px; POSITION: absolute; TOP: 160px" runat="server"
												BackColor="LightSlateGray" Height="88px" Width="176px"></asp:label></DIV>
									</TD>
									<TD><FONT face="Tahoma"></FONT><FONT face="Tahoma">
											<DIV style="WIDTH: 472px; POSITION: relative; HEIGHT: 368px" ms_positioning="GridLayout">
												<TABLE id="Table10" style="Z-INDEX: 101; LEFT: 0px; WIDTH: 472px; POSITION: absolute; TOP: 8px; HEIGHT: 358px"
													cellSpacing="0" cellPadding="0" width="472" bgColor="#ffffff" border="0">
													<TR>
														<TD id="gridLayout1"></TD>
													</TR>
												</TABLE>
												<asp:label id="Label1" style="Z-INDEX: 144; LEFT: 16px; POSITION: absolute; TOP: 8px" runat="server"
													Font-Size="X-Small" Font-Bold="True" Font-Names="Tahoma" ForeColor="#404040">Foreign Exchange</asp:label>
												<TABLE id="Table5" style="Z-INDEX: 144; LEFT: 144px; WIDTH: 205px; POSITION: absolute; TOP: 40px; HEIGHT: 216px"
													borderColor="darkgray" cellSpacing="0" cellPadding="0" width="205" border="1" frame="border">
													<TR>
														<TD vAlign="top" align="center">
															<TABLE id="Table1" style="WIDTH: 200px; HEIGHT: 192px" cellSpacing="0" cellPadding="0"
																width="200" border="0">
																<TR>
																	<TD style="HEIGHT: 22px" vAlign="bottom" align="center" bgColor="lightgrey" colSpan="1"><asp:label id="Label2" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"> Convert</asp:label></TD>
																</TR>
																<TR>
																	<TD style="HEIGHT: 22px" align="center"><asp:dropdownlist id="currencyList" runat="server" Width="176px" AutoPostBack="True">
																			<asp:ListItem Value="USD">(USD) American Dollar</asp:ListItem>
																			<asp:ListItem Value="AUD">(AUD) Australian Dollar</asp:ListItem>
																			<asp:ListItem Value="BRL">(BRL) Brazilian Real</asp:ListItem>
																			<asp:ListItem Value="GBP">(GBP) British Pound</asp:ListItem>
																			<asp:ListItem Value="CAD">(CAD) Canadian Dollar</asp:ListItem>
																			<asp:ListItem Value="CNY">(CNY) Chinese Yuan</asp:ListItem>
																			<asp:ListItem Value="DKK">(DKK) Danish Krone</asp:ListItem>
																			<asp:ListItem Value="EUR">(EUR) Euro</asp:ListItem>
																			<asp:ListItem Value="HKD">(HKD) Hong Kong Dollar</asp:ListItem>
																			<asp:ListItem Value="INR">(INR) Indian Rupee</asp:ListItem>
																			<asp:ListItem Value="JPY">(JPY) Japanese Yen</asp:ListItem>
																			<asp:ListItem Value="MYR">(MYR) Malaysian Ringgit</asp:ListItem>
																			<asp:ListItem Value="MXN">(MXN) Mexican Peso</asp:ListItem>
																			<asp:ListItem Value="NZD">(NZD) New Zealand Dollar</asp:ListItem>
																			<asp:ListItem Value="SGD">(SGD) Singapore Dollar</asp:ListItem>
																			<asp:ListItem Value="KRW">(KRW) South Korean Won</asp:ListItem>
																			<asp:ListItem Value="LKR">(LKR) Sri Lanka Rupee</asp:ListItem>
																			<asp:ListItem Value="SEK">(SEK) Swedish Krona</asp:ListItem>
																			<asp:ListItem Value="CHF">(CHF) Swiss Franc</asp:ListItem>
																			<asp:ListItem Value="TWD">(TWD) Taiwan Dollar</asp:ListItem>
																			<asp:ListItem Value="THB">(THB) Thai Baht</asp:ListItem>
																		</asp:dropdownlist></TD>
																</TR>
																<TR>
																	<TD style="HEIGHT: 21px" vAlign="bottom" align="center"><asp:label id="Label4" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif">amount</asp:label></TD>
																</TR>
																<TR>
																	<TD style="HEIGHT: 14px" align="center"><asp:textbox id="amountTextBox" runat="server" Width="128px"></asp:textbox></TD>
																</TR>
																<TR>
																	<TD style="HEIGHT: 33px" align="center"><asp:imagebutton id="calculateButton" runat="server" Height="22px" Width="80px" ImageUrl="\VirtualBranchBanking\picture\calculateButton.jpg"></asp:imagebutton></TD>
																</TR>
																<TR>
																	<TD style="HEIGHT: 12px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		<asp:label id="Label5" runat="server" Font-Size="XX-Small" Font-Bold="True" Font-Names="Tahoma"
																			ForeColor="#404040">Convert to Thai Baht (THB)</asp:label></TD>
																</TR>
																<TR>
																	<TD style="HEIGHT: 25px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		<asp:label id="Label7" runat="server" Font-Size="X-Small" Font-Bold="True" Font-Names="Microsoft Sans Serif">=</asp:label><asp:label id="convertedLabel" runat="server" Font-Size="Smaller" Font-Bold="True" Font-Names="Tahoma"
																			ForeColor="#404040"></asp:label></TD>
																</TR>
																<TR>
																	<TD style="HEIGHT: 26px" align="center"></TD>
																</TR>
																<TR>
																	<TD style="HEIGHT: 21px" align="center"><asp:imagebutton id="convertButton" runat="server" Height="22px" Width="80px" ImageUrl="\VirtualBranchBanking\picture\convertButton.jpg"></asp:imagebutton></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
												</TABLE>
												<TABLE id="Table4" style="Z-INDEX: 144; LEFT: 24px; WIDTH: 115px; POSITION: absolute; TOP: 40px; HEIGHT: 184px"
													borderColor="darkgray" cellSpacing="0" cellPadding="0" width="115" border="1" frame="box">
													<TR>
														<TD vAlign="top" align="center">
															<TABLE id="Table3" style="WIDTH: 112px; HEIGHT: 24px" cellSpacing="0" cellPadding="0" width="112"
																bgColor="darkgray" border="0">
																<TR>
																	<TD vAlign="bottom" align="center" bgColor="lightgrey"><asp:label id="Label6" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif">Quick bar</asp:label></TD>
																</TR>
															</TABLE>
															<TABLE id="Table2" style="WIDTH: 112px; HEIGHT: 168px" cellSpacing="0" cellPadding="0"
																width="112" border="0">
																<TR>
																	<TD style="WIDTH: 53px; HEIGHT: 40px" vAlign="middle" align="center"><asp:imagebutton id="ImageButton1" runat="server" ImageUrl="/VirtualBranchBanking/picture/us.png"></asp:imagebutton></TD>
																	<TD style="HEIGHT: 40px" vAlign="middle" align="center"><asp:imagebutton id="ImageButton2" runat="server" ImageUrl="/VirtualBranchBanking/picture/AU.png"></asp:imagebutton></TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 53px; HEIGHT: 39px" vAlign="middle" align="center"><asp:imagebutton id="ImageButton3" runat="server" ImageUrl="/VirtualBranchBanking/picture/ca.png"></asp:imagebutton></TD>
																	<TD style="HEIGHT: 39px" vAlign="middle" align="center"><asp:imagebutton id="ImageButton4" runat="server" ImageUrl="/VirtualBranchBanking/picture/eu.png"></asp:imagebutton></TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 53px; HEIGHT: 40px" vAlign="middle" align="center"><asp:imagebutton id="ImageButton5" runat="server" ImageUrl="/VirtualBranchBanking/picture/GB.png"></asp:imagebutton></TD>
																	<TD style="HEIGHT: 40px" vAlign="middle" align="center"><asp:imagebutton id="ImageButton6" runat="server" ImageUrl="/VirtualBranchBanking/picture/in.png"></asp:imagebutton></TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 53px" vAlign="middle" align="center"><asp:imagebutton id="ImageButton7" runat="server" ImageUrl="/VirtualBranchBanking/picture/jp.png"></asp:imagebutton></TD>
																	<TD vAlign="middle" align="center"><asp:imagebutton id="ImageButton8" runat="server" ImageUrl="/VirtualBranchBanking/picture/sg.png"></asp:imagebutton></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
												</TABLE>
												<TABLE id="Table6" style="Z-INDEX: 144; LEFT: 352px; WIDTH: 108px; POSITION: absolute; TOP: 40px; HEIGHT: 320px"
													borderColor="darkgray" cellSpacing="0" cellPadding="0" width="108" align="center" border="0"
													frame="box">
													<TR>
														<TD style="HEIGHT: 23px" vAlign="bottom" align="center" bgColor="gainsboro"><asp:label id="Label8" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif">Currency</asp:label></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 7px" align="left"><asp:hyperlink id="HyperLink20" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- American Dollar</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 5px" align="left"><asp:hyperlink id="HyperLink19" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- Australian Dollar</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 11px" align="left"><asp:hyperlink id="HyperLink18" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- Brazilian Real</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 7px" align="left"><asp:hyperlink id="HyperLink17" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- British Pound</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 11px" align="left"><asp:hyperlink id="HyperLink16" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- Canadian Dollar</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 7px" align="left"><asp:hyperlink id="HyperLink1" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- Chinese Yuan</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 10px" align="left"><asp:hyperlink id="HyperLink2" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- Danish Krone</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 7px" align="left"><asp:hyperlink id="HyperLink3" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- Euro</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 6px" align="left"><asp:hyperlink id="HyperLink4" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- Hong Kong Dollar</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 3px"><asp:hyperlink id="HyperLink5" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- Indian Rupee</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 1px"><asp:hyperlink id="HyperLink6" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- Japanese Yen</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 9px"><asp:hyperlink id="HyperLink7" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- Malaysian Ringgit</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 10px"><asp:hyperlink id="HyperLink8" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- Mexican Peso</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 8px"><asp:hyperlink id="HyperLink9" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- New Zealand Dollar</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 8px"><asp:hyperlink id="HyperLink10" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- Singapore Dollar</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 4px"><asp:hyperlink id="HyperLink11" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- South Korean Won</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 1px"><asp:hyperlink id="HyperLink12" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- Swedish Krona</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 9px"><asp:hyperlink id="HyperLink13" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- Swiss Franc</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 12px"><asp:hyperlink id="HyperLink14" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- Taiwan Dollar</asp:hyperlink></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 6px"><asp:hyperlink id="HyperLink15" runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif"
																ForeColor="DimGray">- Thai Baht</asp:hyperlink></TD>
													</TR>
												</TABLE>
											</DIV>
										</FONT><FONT face="Tahoma"></FONT>
									</TD>
								</TR>
							</TABLE>
						</DIV>
						<asp:label id="Label11" runat="server" Font-Size="X-Small" Font-Names="Arial" BackColor="Black"
							Width="656px"></asp:label></TD>
				</TR>
			</TABLE>
			<TABLE id="Table11" style="Z-INDEX: 104; LEFT: 56px; WIDTH: 167px; POSITION: absolute; TOP: 56px; HEIGHT: 34px"
				cellSpacing="0" cellPadding="0" width="167" background="\VirtualBranchBanking\picture\bb00201g.gif"
				border="0">
				<TR>
					<TD background="file:///C:\Inetpub\wwwroot\VirtualBranchBanking\picture\bb00201g.gif"><FONT face="Arial" color="#ffffff"><FONT size="4"><STRONG>&nbsp;</STRONG></FONT><FONT face="Tahoma" size="2">Foreign 
								Exchange</FONT></FONT></TD>
				</TR>
			</TABLE>
			<asp:label id="noOfUser" style="Z-INDEX: 105; LEFT: 688px; POSITION: absolute; TOP: 536px"
				runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif" ForeColor="#0000C0"></asp:label><asp:label id="Label14" style="Z-INDEX: 106; LEFT: 632px; POSITION: absolute; TOP: 536px" runat="server"
				Font-Size="XX-Small" Font-Names="Microsoft Sans Serif">Now online</asp:label><asp:label id="Label10" style="Z-INDEX: 107; LEFT: 624px; POSITION: absolute; TOP: 80px" runat="server"
				Font-Size="XX-Small" Font-Names="Microsoft Sans Serif">Hello</asp:label><asp:label id="userLabel" style="Z-INDEX: 108; LEFT: 648px; POSITION: absolute; TOP: 80px"
				runat="server" Font-Size="XX-Small" Font-Names="Arial" ForeColor="Maroon" Height="8px"></asp:label><asp:label id="Label9" style="Z-INDEX: 109; LEFT: 56px; POSITION: absolute; TOP: 96px" runat="server"
				Font-Size="X-Small" Font-Names="Arial" BackColor="Black" Width="176px"></asp:label><asp:imagebutton id="ImageButton9" style="Z-INDEX: 110; LEFT: 232px; POSITION: absolute; TOP: 96px"
				runat="server" Height="16px" Width="100px" ImageUrl="\VirtualBranchBanking\picture\forexMenuButton.jpg"></asp:imagebutton></form>
	</body>
</HTML>
