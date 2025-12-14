<%@ Page Language="vb" AutoEventWireup="false" Codebehind="PayMyBillsPage.aspx.vb" Inherits="VirtualBranchBanking.PayMyBillsPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Payment my bill</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma"></FONT>
			<asp:label id="Label3" style="Z-INDEX: 134; LEFT: 56px; POSITION: absolute; TOP: 32px" runat="server"
				Font-Size="Medium" Font-Bold="True" Font-Names="Arial" ForeColor="Black" Height="24px">Virtual Branch Banking</asp:label><asp:imagebutton id="quickPayButton" style="Z-INDEX: 143; LEFT: 232px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\quickPayMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="paymybillButton" style="Z-INDEX: 111; LEFT: 336px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\payMyBillMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="eduPayButton" style="Z-INDEX: 112; LEFT: 440px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\eduPayMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="paymentHisButton" style="Z-INDEX: 113; LEFT: 544px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\PayHisMenuButton.jpg"></asp:imagebutton>
			<TABLE id="Table2" style="Z-INDEX: 135; LEFT: 216px; WIDTH: 520px; POSITION: absolute; TOP: 56px; HEIGHT: 21px"
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
			<TABLE id="Table4" style="Z-INDEX: 136; LEFT: 56px; WIDTH: 658px; POSITION: absolute; TOP: 112px; HEIGHT: 264px"
				cellSpacing="0" cellPadding="0" width="658" background="\VirtualBranchBanking\picture\bg_btm.jpg"
				border="0">
				<TR>
					<TD><FONT face="Tahoma"></FONT>
						<DIV style="WIDTH: 657px; HEIGHT: 232px" ms_positioning="FlowLayout">
							<TABLE id="Table1" style="WIDTH: 656px; HEIGHT: 240px" cellSpacing="0" cellPadding="0"
								width="656" border="0">
								<TR>
									<TD style="WIDTH: 166px">
										<DIV style="WIDTH: 177px; POSITION: relative; HEIGHT: 272px" ms_positioning="GridLayout"><asp:imagebutton id="accessAccButton" style="Z-INDEX: 101; LEFT: 0px; POSITION: absolute; TOP: 0px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton1.jpg"></asp:imagebutton><asp:imagebutton id="paymentButton" style="Z-INDEX: 102; LEFT: 0px; POSITION: absolute; TOP: 24px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton2.jpg"></asp:imagebutton><asp:imagebutton id="chequeButton" style="Z-INDEX: 103; LEFT: 0px; POSITION: absolute; TOP: 48px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton3.jpg"></asp:imagebutton><asp:imagebutton id="forexButton" style="Z-INDEX: 104; LEFT: 0px; POSITION: absolute; TOP: 72px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton4.jpg"></asp:imagebutton><asp:imagebutton id="creditLoanButton" style="Z-INDEX: 105; LEFT: 0px; POSITION: absolute; TOP: 96px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton5.jpg"></asp:imagebutton><asp:imagebutton id="personalOptionButton" style="Z-INDEX: 106; LEFT: 0px; POSITION: absolute; TOP: 120px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton6.jpg"></asp:imagebutton><asp:label id="Label12" style="Z-INDEX: 107; LEFT: 0px; POSITION: absolute; TOP: 136px" runat="server"
												Font-Size="Smaller" Font-Names="Arial" Width="176px" BackColor="Black"></asp:label><asp:label id="Label13" style="Z-INDEX: 108; LEFT: 0px; POSITION: absolute; TOP: 152px" runat="server"
												Width="176px" BackColor="LightSlateGray" Height="88px"></asp:label></DIV>
									</TD>
									<TD><FONT face="Tahoma"></FONT><FONT face="Tahoma">
											<DIV style="WIDTH: 472px; POSITION: relative; HEIGHT: 282px" ms_positioning="GridLayout">
												<TABLE id="Table5" style="Z-INDEX: 101; LEFT: 0px; WIDTH: 464px; POSITION: absolute; TOP: 8px; HEIGHT: 274px"
													cellSpacing="0" cellPadding="0" width="464" bgColor="#ffffff" border="0">
													<TR>
														<TD id="gridLayout1" style="WIDTH: 47px; HEIGHT: 274px"></TD>
													</TR>
												</TABLE>
												<asp:label id="Label1" style="Z-INDEX: 114; LEFT: 16px; POSITION: absolute; TOP: 8px" runat="server"
													Font-Size="X-Small" Font-Bold="True" Font-Names="Tahoma" ForeColor="#404040">Pay my Bills</asp:label><asp:textbox id="dateTextBox5" style="Z-INDEX: 104; LEFT: 240px; POSITION: absolute; TOP: 208px"
													runat="server" Width="112px" Height="22px"></asp:textbox><asp:textbox id="dateTextBox4" style="Z-INDEX: 118; LEFT: 240px; POSITION: absolute; TOP: 184px"
													runat="server" Width="112px" Height="22px"></asp:textbox><asp:textbox id="dateTextBox3" style="Z-INDEX: 106; LEFT: 240px; POSITION: absolute; TOP: 160px"
													runat="server" Width="112px" Height="22px"></asp:textbox><asp:textbox id="dateTextBox2" style="Z-INDEX: 116; LEFT: 240px; POSITION: absolute; TOP: 136px"
													runat="server" Width="112px" Height="22px"></asp:textbox><asp:textbox id="amountTextBox5" style="Z-INDEX: 108; LEFT: 360px; POSITION: absolute; TOP: 208px"
													runat="server" Width="97px" Height="22px"></asp:textbox><asp:textbox id="amountTextBox4" style="Z-INDEX: 119; LEFT: 360px; POSITION: absolute; TOP: 184px"
													runat="server" Width="97px" Height="22px"></asp:textbox><asp:textbox id="amountTextBox3" style="Z-INDEX: 110; LEFT: 360px; POSITION: absolute; TOP: 160px"
													runat="server" Width="98px" Height="22px"></asp:textbox><asp:label id="Label2" style="Z-INDEX: 124; LEFT: 80px; POSITION: absolute; TOP: 24px" runat="server"
													Font-Size="X-Small" Font-Bold="True" Font-Names="Tahoma" Width="376px" BackColor="Gainsboro" ForeColor="#404040">Pay bills by</asp:label><asp:dropdownlist id="fromAccountList" style="Z-INDEX: 112; LEFT: 224px; POSITION: absolute; TOP: 48px"
													runat="server" Width="144px" Height="22px" AutoPostBack="True"></asp:dropdownlist><asp:label id="Label4" style="Z-INDEX: 120; LEFT: 80px; POSITION: absolute; TOP: 72px" runat="server"
													Font-Size="X-Small" Font-Bold="True" Font-Names="Tahoma" Width="376px" BackColor="Gainsboro" ForeColor="#404040">Pay to</asp:label><asp:label id="Label5" style="Z-INDEX: 102; LEFT: 80px; POSITION: absolute; TOP: 96px" runat="server"
													Font-Size="X-Small" Font-Names="Tahoma" ForeColor="#404040">Merchant</asp:label><asp:dropdownlist id="merchantList1" style="Z-INDEX: 103; LEFT: 80px; POSITION: absolute; TOP: 112px"
													runat="server" Width="152px" Height="22px" AutoPostBack="True"></asp:dropdownlist><asp:dropdownlist id="merchantList2" style="Z-INDEX: 105; LEFT: 80px; POSITION: absolute; TOP: 136px"
													runat="server" Width="152px" Height="22px" AutoPostBack="True"></asp:dropdownlist><asp:dropdownlist id="merchantList3" style="Z-INDEX: 107; LEFT: 80px; POSITION: absolute; TOP: 160px"
													runat="server" Width="152px" Height="22px" AutoPostBack="True"></asp:dropdownlist><asp:dropdownlist id="merchantList4" style="Z-INDEX: 109; LEFT: 80px; POSITION: absolute; TOP: 184px"
													runat="server" Width="152px" Height="22px" AutoPostBack="True"></asp:dropdownlist><asp:dropdownlist id="merchantList5" style="Z-INDEX: 111; LEFT: 80px; POSITION: absolute; TOP: 208px"
													runat="server" Width="152px" Height="22px" AutoPostBack="True"></asp:dropdownlist><asp:label id="Label6" style="Z-INDEX: 113; LEFT: 240px; POSITION: absolute; TOP: 96px" runat="server"
													Font-Size="X-Small" Font-Names="Tahoma" ForeColor="#404040">Date(dd/mm/yyyy)</asp:label><asp:label id="Label7" style="Z-INDEX: 115; LEFT: 360px; POSITION: absolute; TOP: 96px" runat="server"
													Font-Size="X-Small" Font-Names="Tahoma" ForeColor="#404040">Amount in THB</asp:label><asp:textbox id="amountTextBox1" style="Z-INDEX: 117; LEFT: 360px; POSITION: absolute; TOP: 112px"
													runat="server" Width="98px" Height="22px"></asp:textbox><asp:textbox id="amountTextBox2" style="Z-INDEX: 121; LEFT: 360px; POSITION: absolute; TOP: 136px"
													runat="server" Width="97px" Height="22px"></asp:textbox><asp:textbox id="dateTextBox1" style="Z-INDEX: 122; LEFT: 240px; POSITION: absolute; TOP: 112px"
													runat="server" Width="112px" Height="22px"></asp:textbox><asp:label id="Label8" style="Z-INDEX: 123; LEFT: 168px; POSITION: absolute; TOP: 48px" runat="server"
													Font-Size="Smaller" Font-Names="Arial" ForeColor="#404040">Account</asp:label><asp:imagebutton id="payButton" style="Z-INDEX: 125; LEFT: 192px; POSITION: absolute; TOP: 240px"
													runat="server" Width="80px" Height="22px" ImageUrl="\VirtualBranchBanking\picture\payButton.jpg"></asp:imagebutton></DIV>
										</FONT><FONT face="Tahoma"></FONT>
									</TD>
								</TR>
							</TABLE>
						</DIV>
						<asp:label id="Label11" runat="server" Font-Size="X-Small" Font-Names="Arial" Width="656px"
							BackColor="Black"></asp:label></TD>
				</TR>
			</TABLE>
			<TABLE id="Table3" style="Z-INDEX: 137; LEFT: 56px; WIDTH: 167px; POSITION: absolute; TOP: 56px; HEIGHT: 34px"
				cellSpacing="0" cellPadding="0" width="167" background="\VirtualBranchBanking\picture\bb00201g.gif"
				border="0">
				<TR>
					<TD background="file:///C:\Inetpub\wwwroot\VirtualBranchBanking\picture\bb00201g.gif"><FONT face="Arial" color="#ffffff"><FONT size="4"><STRONG>&nbsp;</STRONG></FONT><FONT face="Tahoma" size="2">Payment</FONT></FONT></TD>
				</TR>
			</TABLE>
			<asp:label id="noOfUser" style="Z-INDEX: 138; LEFT: 696px; POSITION: absolute; TOP: 448px"
				runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif" ForeColor="#0000C0"></asp:label><asp:label id="Label15" style="Z-INDEX: 139; LEFT: 640px; POSITION: absolute; TOP: 448px" runat="server"
				Font-Size="XX-Small" Font-Names="Microsoft Sans Serif">Now online</asp:label><asp:label id="Label14" style="Z-INDEX: 140; LEFT: 624px; POSITION: absolute; TOP: 80px" runat="server"
				Font-Size="XX-Small" Font-Names="Microsoft Sans Serif">Hello</asp:label><asp:label id="userLabel" style="Z-INDEX: 141; LEFT: 648px; POSITION: absolute; TOP: 80px"
				runat="server" Font-Size="XX-Small" Font-Names="Arial" ForeColor="Maroon" Height="8px"></asp:label><asp:label id="Label10" style="Z-INDEX: 142; LEFT: 56px; POSITION: absolute; TOP: 96px" runat="server"
				Font-Size="X-Small" Font-Names="Arial" Width="176px" BackColor="Black"></asp:label></form>
	</body>
</HTML>
