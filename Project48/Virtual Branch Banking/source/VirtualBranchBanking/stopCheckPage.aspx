<%@ Page Language="vb" AutoEventWireup="false" Codebehind="stopCheckPage.aspx.vb" Inherits="VirtualBranchBanking.stopCheckPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Stop Cheque</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:label id="Label3" style="Z-INDEX: 121; LEFT: 56px; POSITION: absolute; TOP: 32px" runat="server"
				Font-Names="Arial" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Height="24px">Virtual Branch Banking</asp:label><asp:imagebutton id="cheqExButton" style="Z-INDEX: 130; LEFT: 232px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\CheqExMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="stopcheqButton" style="Z-INDEX: 111; LEFT: 336px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\stopCheqMenuButton.jpg"></asp:imagebutton>
			<TABLE id="Table2" style="Z-INDEX: 122; LEFT: 216px; WIDTH: 520px; POSITION: absolute; TOP: 56px; HEIGHT: 21px"
				cellSpacing="0" cellPadding="0" width="520" border="0">
				<TR>
					<TD style="WIDTH: 14px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><STRONG><FONT face="Tahoma" size="2"></FONT></STRONG></TD>
					<TD style="WIDTH: 19px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><FONT face="Tahoma" size="2"><STRONG></STRONG></FONT></TD>
					<TD style="WIDTH: 55px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><STRONG><FONT face="Tahoma" color="#ffffff" size="2"><asp:imagebutton id="homeButton" runat="server" Width="55px" Height="21px" BorderStyle="None" BorderWidth="0px"
									ImageUrl="\VirtualBranchBanking\picture\homeTmp.gif"></asp:imagebutton></FONT></STRONG></TD>
					<TD style="WIDTH: 82px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><STRONG><FONT face="Tahoma" color="#ffffff" size="2"></FONT></STRONG></TD>
					<TD style="WIDTH: 120px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><FONT face="Tahoma">&nbsp;&nbsp;<FONT size="2"><STRONG>
								</STRONG></FONT></FONT>
					</TD>
					<TD style="WIDTH: 45px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00403g.gif"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 54px; HEIGHT: 17px"><FONT face="Tahoma"><asp:imagebutton id="logoffButton" runat="server" Width="64px" Height="21px" BorderStyle="None" BorderWidth="0px"
								ImageUrl="\VirtualBranchBanking\picture\bg-end-logout.jpg"></asp:imagebutton></FONT></TD>
				</TR>
			</TABLE>
			<TABLE id="Table4" style="Z-INDEX: 123; LEFT: 56px; WIDTH: 656px; POSITION: absolute; TOP: 112px; HEIGHT: 288px"
				cellSpacing="0" cellPadding="0" width="656" background="\VirtualBranchBanking\picture\bg_btm.jpg"
				border="0">
				<TR>
					<TD><FONT face="Tahoma"></FONT>
						<DIV style="WIDTH: 657px; HEIGHT: 280px" ms_positioning="FlowLayout">
							<TABLE id="Table1" style="WIDTH: 656px; HEIGHT: 232px" cellSpacing="0" cellPadding="0"
								width="656" border="0">
								<TR>
									<TD style="WIDTH: 166px">
										<DIV style="WIDTH: 177px; POSITION: relative; HEIGHT: 248px" ms_positioning="GridLayout"><asp:imagebutton id="accessAccButton" style="Z-INDEX: 101; LEFT: 0px; POSITION: absolute; TOP: 0px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton1.jpg"></asp:imagebutton><asp:imagebutton id="paymentButton" style="Z-INDEX: 102; LEFT: 0px; POSITION: absolute; TOP: 24px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton2.jpg"></asp:imagebutton><asp:imagebutton id="chequeButton" style="Z-INDEX: 103; LEFT: 0px; POSITION: absolute; TOP: 48px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton3.jpg"></asp:imagebutton><asp:imagebutton id="forexButton" style="Z-INDEX: 104; LEFT: 0px; POSITION: absolute; TOP: 72px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton4.jpg"></asp:imagebutton><asp:imagebutton id="creditLoanButton" style="Z-INDEX: 105; LEFT: 0px; POSITION: absolute; TOP: 96px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton5.jpg"></asp:imagebutton><asp:imagebutton id="personalOptionButton" style="Z-INDEX: 106; LEFT: 0px; POSITION: absolute; TOP: 120px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton6.jpg"></asp:imagebutton><asp:label id="Label12" style="Z-INDEX: 107; LEFT: 0px; POSITION: absolute; TOP: 144px" runat="server"
												Font-Names="Arial" Font-Size="Smaller" Width="176px" BackColor="Black"></asp:label><asp:label id="Label13" style="Z-INDEX: 108; LEFT: 0px; POSITION: absolute; TOP: 160px" runat="server"
												Width="176px" Height="88px" BackColor="LightSlateGray"></asp:label></DIV>
									</TD>
									<TD><FONT face="Tahoma"></FONT><FONT face="Tahoma">
											<DIV style="WIDTH: 472px; POSITION: relative; HEIGHT: 232px" ms_positioning="GridLayout">
												<TABLE id="Table5" style="Z-INDEX: 101; LEFT: 0px; WIDTH: 472px; POSITION: absolute; TOP: 0px; HEIGHT: 232px"
													cellSpacing="0" cellPadding="0" width="472" bgColor="#ffffff" border="0">
													<TR>
														<TD id="gridLayout1">
															<asp:Label id="showtext" style="Z-INDEX: 101; LEFT: 208px; POSITION: absolute; TOP: 168px"
																runat="server" ForeColor="Maroon" Font-Size="X-Small" Font-Names="Tahoma"></asp:Label></TD>
													</TR>
												</TABLE>
												<asp:label id="Label7" style="Z-INDEX: 106; LEFT: 16px; POSITION: absolute; TOP: 8px" runat="server"
													Font-Names="Tahoma" Font-Bold="True" Font-Size="X-Small" ForeColor="#404040">Stop Cheque</asp:label><asp:label id="Label1" style="Z-INDEX: 111; LEFT: 136px; POSITION: absolute; TOP: 32px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">Account</asp:label><asp:dropdownlist id="accountList" style="Z-INDEX: 107; LEFT: 192px; POSITION: absolute; TOP: 32px"
													runat="server" Width="144px" Height="22px" AutoPostBack="True"></asp:dropdownlist><asp:textbox id="chequeNoTextBox" style="Z-INDEX: 104; LEFT: 296px; POSITION: absolute; TOP: 72px"
													runat="server" Width="96px" Height="22px"></asp:textbox><asp:label id="Label4" style="Z-INDEX: 105; LEFT: 80px; POSITION: absolute; TOP: 72px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">Stop Payment on</asp:label><asp:label id="Label6" style="Z-INDEX: 102; LEFT: 208px; POSITION: absolute; TOP: 136px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">From</asp:label><asp:textbox id="fromRangeTextBox" style="Z-INDEX: 103; LEFT: 248px; POSITION: absolute; TOP: 136px"
													runat="server" Width="48px" Height="22px"></asp:textbox><asp:label id="Label8" style="Z-INDEX: 108; LEFT: 304px; POSITION: absolute; TOP: 136px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">To</asp:label><asp:textbox id="toRangeTextBox" style="Z-INDEX: 109; LEFT: 328px; POSITION: absolute; TOP: 136px"
													runat="server" Width="64px" Height="22px"></asp:textbox><asp:radiobuttonlist id="RadioList" style="Z-INDEX: 110; LEFT: 184px; POSITION: absolute; TOP: 64px"
													runat="server" Font-Names="Tahoma" Font-Size="X-Small" Width="112px" ForeColor="#404040" Height="72px" AutoPostBack="True">
													<asp:ListItem Value="ChequeNo">Cheque No.</asp:ListItem>
													<asp:ListItem Value="ChequeRange">Cheque Range</asp:ListItem>
												</asp:radiobuttonlist><asp:imagebutton id="stopButton" style="Z-INDEX: 112; LEFT: 192px; POSITION: absolute; TOP: 192px"
													runat="server" Width="80px" Height="22px" ImageUrl="\VirtualBranchBanking\picture\stopButton.jpg"></asp:imagebutton></DIV>
										</FONT><FONT face="Tahoma"></FONT>
									</TD>
								</TR>
							</TABLE>
						</DIV>
						<asp:label id="Label11" runat="server" Font-Names="Arial" Font-Size="X-Small" Width="656px"
							BackColor="Black"></asp:label></TD>
				</TR>
			</TABLE>
			<TABLE id="Table3" style="Z-INDEX: 124; LEFT: 56px; WIDTH: 167px; POSITION: absolute; TOP: 56px; HEIGHT: 34px"
				cellSpacing="0" cellPadding="0" width="167" background="\VirtualBranchBanking\picture\bb00201g.gif"
				border="0">
				<TR>
					<TD background="file:///C:\Inetpub\wwwroot\VirtualBranchBanking\picture\bb00201g.gif"><FONT face="Arial" color="#ffffff"><FONT size="4"><STRONG>&nbsp;</STRONG></FONT><FONT face="Tahoma" size="2">Cheque</FONT></FONT></TD>
				</TR>
			</TABLE>
			<asp:label id="noOfUser" style="Z-INDEX: 125; LEFT: 696px; POSITION: absolute; TOP: 416px"
				runat="server" Font-Names="Microsoft Sans Serif" Font-Size="XX-Small" ForeColor="#0000C0"></asp:label><asp:label id="Label2" style="Z-INDEX: 126; LEFT: 640px; POSITION: absolute; TOP: 416px" runat="server"
				Font-Names="Microsoft Sans Serif" Font-Size="XX-Small">Now online</asp:label><asp:label id="Label9" style="Z-INDEX: 127; LEFT: 624px; POSITION: absolute; TOP: 80px" runat="server"
				Font-Names="Microsoft Sans Serif" Font-Size="XX-Small">Hello</asp:label><asp:label id="userLabel" style="Z-INDEX: 128; LEFT: 648px; POSITION: absolute; TOP: 80px"
				runat="server" Font-Names="Arial" Font-Size="XX-Small" ForeColor="Maroon" Height="8px"></asp:label><asp:label id="Label5" style="Z-INDEX: 129; LEFT: 56px; POSITION: absolute; TOP: 96px" runat="server"
				Font-Names="Arial" Font-Size="X-Small" Width="176px" BackColor="Black"></asp:label></form>
	</body>
</HTML>
