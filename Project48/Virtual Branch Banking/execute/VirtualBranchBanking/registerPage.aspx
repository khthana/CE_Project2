<%@ Page Language="vb" AutoEventWireup="false" Codebehind="registerPage.aspx.vb" Inherits="VirtualBranchBanking.registerPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Sing up</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma">
				<P><FONT face="Arial" size="2"></FONT></P>
				<FONT face="Arial" size="2">
					<P><FONT face="Arial" size="2"></FONT></P>
					<FONT face="Arial" size="2">
						<P><FONT face="Tahoma"></FONT></P>
					</FONT></FONT></FONT>
			<asp:label id="Label16" style="Z-INDEX: 128; LEFT: 56px; POSITION: absolute; TOP: 32px" runat="server"
				Font-Names="Arial" Font-Size="Medium" Height="24px" ForeColor="Black" Font-Bold="True">Virtual Branch Banking</asp:label>
			<TABLE id="Table2" style="Z-INDEX: 129; LEFT: 216px; WIDTH: 520px; POSITION: absolute; TOP: 56px; HEIGHT: 21px"
				cellSpacing="0" cellPadding="0" width="520" border="0">
				<TR>
					<TD style="WIDTH: 14px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><STRONG><FONT face="Tahoma" size="2"></FONT></STRONG></TD>
					<TD style="WIDTH: 19px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><FONT face="Tahoma" size="2"><STRONG></STRONG></FONT></TD>
					<TD style="WIDTH: 55px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><STRONG><FONT face="Tahoma" color="#ffffff" size="2">
								<asp:imagebutton id="homeButton" runat="server" Width="55px" Height="21px" BorderStyle="None" BorderWidth="0px"
									ImageUrl="\VirtualBranchBanking\picture\homeTmp.gif"></asp:imagebutton></FONT></STRONG></TD>
					<TD style="WIDTH: 82px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><STRONG><FONT face="Tahoma" color="#ffffff" size="2"></FONT></STRONG></TD>
					<TD style="WIDTH: 120px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><FONT face="Tahoma">&nbsp;&nbsp;<FONT size="2"><STRONG>
								</STRONG></FONT></FONT>
					</TD>
					<TD style="WIDTH: 45px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00403g.gif"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 54px; HEIGHT: 17px"><FONT face="Tahoma">
							<asp:imagebutton id="logoffButton" runat="server" Width="64px" Height="21px" BorderStyle="None" BorderWidth="0px"
								ImageUrl="\VirtualBranchBanking\picture\loginButtonTmp.jpg"></asp:imagebutton></FONT></TD>
				</TR>
			</TABLE>
			<TABLE id="Table4" style="Z-INDEX: 130; LEFT: 56px; WIDTH: 656px; POSITION: absolute; TOP: 112px; HEIGHT: 288px"
				cellSpacing="0" cellPadding="0" width="656" background="\VirtualBranchBanking\picture\bg_btm.jpg"
				border="0">
				<TR>
					<TD><FONT face="Tahoma"></FONT>
						<DIV style="WIDTH: 657px; HEIGHT: 280px" ms_positioning="FlowLayout">
							<TABLE id="Table1" style="WIDTH: 656px; HEIGHT: 232px" cellSpacing="0" cellPadding="0"
								width="656" border="0">
								<TR>
									<TD style="WIDTH: 166px">
										<DIV style="WIDTH: 177px; POSITION: relative; HEIGHT: 248px" ms_positioning="GridLayout">
											<asp:imagebutton id="accessAccButton" style="Z-INDEX: 101; LEFT: 0px; POSITION: absolute; TOP: 0px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton1.jpg"></asp:imagebutton>
											<asp:ImageButton id="paymentButton" style="Z-INDEX: 102; LEFT: 0px; POSITION: absolute; TOP: 24px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton2.jpg"></asp:ImageButton>
											<asp:ImageButton id="chequeButton" style="Z-INDEX: 103; LEFT: 0px; POSITION: absolute; TOP: 48px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton3.jpg"></asp:ImageButton>
											<asp:ImageButton id="forexButton" style="Z-INDEX: 104; LEFT: 0px; POSITION: absolute; TOP: 72px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton4.jpg"></asp:ImageButton>
											<asp:ImageButton id="creditLoanButton" style="Z-INDEX: 105; LEFT: 0px; POSITION: absolute; TOP: 96px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton5.jpg"></asp:ImageButton>
											<asp:ImageButton id="personalOptionButton" style="Z-INDEX: 106; LEFT: 0px; POSITION: absolute; TOP: 120px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton6.jpg"></asp:ImageButton>
											<asp:Label id="Label15" style="Z-INDEX: 107; LEFT: 0px; POSITION: absolute; TOP: 144px" runat="server"
												Width="176px" Font-Names="Arial" Font-Size="Smaller" BackColor="Black"></asp:Label>
											<asp:Label id="Label14" style="Z-INDEX: 108; LEFT: 0px; POSITION: absolute; TOP: 160px" runat="server"
												Width="176px" BackColor="LightSlateGray" Height="88px"></asp:Label></DIV>
									</TD>
									<TD><FONT face="Tahoma"></FONT><FONT face="Tahoma">
											<DIV style="WIDTH: 472px; POSITION: relative; HEIGHT: 240px" ms_positioning="GridLayout">
												<TABLE id="Table5" style="Z-INDEX: 101; LEFT: 0px; WIDTH: 472px; POSITION: absolute; TOP: 0px; HEIGHT: 240px"
													cellSpacing="0" cellPadding="0" width="472" bgColor="#ffffff" border="0">
													<TR>
														<TD id="gridLayout1"></TD>
													</TR>
												</TABLE>
												<asp:label id="Label7" style="Z-INDEX: 108; LEFT: 16px; POSITION: absolute; TOP: 8px" runat="server"
													Font-Bold="True" Font-Size="X-Small" Font-Names="Tahoma" ForeColor="#404040">Registation Form</asp:label><asp:label id="Label4" style="Z-INDEX: 104; LEFT: 112px; POSITION: absolute; TOP: 24px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">Register By</asp:label><asp:dropdownlist id="regisByList" style="Z-INDEX: 109; LEFT: 184px; POSITION: absolute; TOP: 24px"
													runat="server">
													<asp:ListItem Value="atm">ATM Card</asp:ListItem>
												</asp:dropdownlist><asp:label id="Label5" style="Z-INDEX: 106; LEFT: 104px; POSITION: absolute; TOP: 56px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">Card Number</asp:label><asp:label id="Label6" style="Z-INDEX: 110; LEFT: 160px; POSITION: absolute; TOP: 80px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">PIN</asp:label><asp:textbox id="pinTextBox" style="Z-INDEX: 115; LEFT: 184px; POSITION: absolute; TOP: 72px"
													runat="server" Width="80px" TextMode="Password" Height="22px"></asp:textbox><asp:textbox id="cardNoTextBox" style="Z-INDEX: 111; LEFT: 184px; POSITION: absolute; TOP: 48px"
													runat="server" Width="144px" Height="22px"></asp:textbox>
												<asp:textbox id="usernameTextBox" style="Z-INDEX: 102; LEFT: 184px; POSITION: absolute; TOP: 128px"
													runat="server" Width="144px" Height="22px"></asp:textbox><asp:textbox id="passwordTextBox" style="Z-INDEX: 103; LEFT: 184px; POSITION: absolute; TOP: 152px"
													runat="server" TextMode="Password" EnableViewState="False" Height="22px"></asp:textbox><asp:textbox id="confirmPasswordTextBox" style="Z-INDEX: 105; LEFT: 184px; POSITION: absolute; TOP: 176px"
													runat="server" Width="144px" TextMode="Password" EnableViewState="False" Height="22px"></asp:textbox><asp:label id="Label1" style="Z-INDEX: 107; LEFT: 120px; POSITION: absolute; TOP: 136px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">Username</asp:label><asp:label id="Label2" style="Z-INDEX: 112; LEFT: 120px; POSITION: absolute; TOP: 160px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">Password</asp:label><asp:label id="Label3" style="Z-INDEX: 113; LEFT: 72px; POSITION: absolute; TOP: 184px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">Confirm 
      Password</asp:label><asp:label id="Label13" style="Z-INDEX: 114; LEFT: 152px; POSITION: absolute; TOP: 104px" runat="server"
													ForeColor="#404040" Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Small">Define Username & Password</asp:label>
												<asp:ImageButton id="submitButton" style="Z-INDEX: 116; LEFT: 184px; POSITION: absolute; TOP: 216px"
													runat="server" Width="80px" Height="22px" ImageUrl="\VirtualBranchBanking\picture\submitButton.jpg"></asp:ImageButton><asp:label id="Label12" style="Z-INDEX: 137; LEFT: 344px; POSITION: absolute; TOP: 32px" runat="server"
													Font-Names="Tahoma" Font-Size="XX-Small" ForeColor="#404040">Required Fields (*)</asp:label></DIV>
										</FONT><FONT face="Tahoma"></FONT>
									</TD>
								</TR>
							</TABLE>
						</DIV>
						<asp:label id="Label11" runat="server" Width="656px" Font-Names="Arial" Font-Size="X-Small"
							BackColor="Black"></asp:label></TD>
				</TR>
			</TABLE>
			<TABLE id="Table3" style="Z-INDEX: 131; LEFT: 56px; WIDTH: 167px; POSITION: absolute; TOP: 56px; HEIGHT: 34px"
				cellSpacing="0" cellPadding="0" width="167" background="\VirtualBranchBanking\picture\bb00201g.gif"
				border="0">
				<TR>
					<TD background="file:///C:\Inetpub\wwwroot\VirtualBranchBanking\picture\bb00201g.gif"><FONT face="Arial" color="#ffffff"><FONT size="4"><STRONG>&nbsp;</STRONG></FONT><FONT face="Tahoma" size="2">Access 
								Account</FONT></FONT></TD>
				</TR>
			</TABLE>
			<asp:label id="noOfUser" style="Z-INDEX: 132; LEFT: 696px; POSITION: absolute; TOP: 416px"
				runat="server" Font-Names="Microsoft Sans Serif" Font-Size="XX-Small" ForeColor="#0000C0"></asp:label>
			<asp:label id="Label10" style="Z-INDEX: 133; LEFT: 640px; POSITION: absolute; TOP: 416px" runat="server"
				Font-Names="Microsoft Sans Serif" Font-Size="XX-Small">Now online</asp:label>
			<asp:label id="Label9" style="Z-INDEX: 134; LEFT: 624px; POSITION: absolute; TOP: 80px" runat="server"
				Font-Names="Microsoft Sans Serif" Font-Size="XX-Small">Hello</asp:label>
			<asp:label id="userLabel" style="Z-INDEX: 135; LEFT: 648px; POSITION: absolute; TOP: 80px"
				runat="server" Font-Names="Arial" Font-Size="XX-Small" Height="8px" ForeColor="Maroon"></asp:label>
			<asp:label id="Label8" style="Z-INDEX: 136; LEFT: 56px; POSITION: absolute; TOP: 96px" runat="server"
				Width="657px" Font-Names="Arial" Font-Size="X-Small" BackColor="Black"></asp:label>
		</form>
	</body>
</HTML>
