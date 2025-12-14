<%@ Page Language="vb" AutoEventWireup="false" Codebehind="withdrawPage.aspx.vb" Inherits="VirtualBranchBanking.withdrawPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Withdraw money</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma"></FONT>
			<asp:label id="Label3" style="Z-INDEX: 117; LEFT: 56px; POSITION: absolute; TOP: 32px" runat="server"
				Font-Size="Medium" Font-Bold="True" Font-Names="Arial" ForeColor="Black" Height="24px">Virtual Branch Banking</asp:label>
			<TABLE id="Table2" style="Z-INDEX: 118; LEFT: 216px; WIDTH: 520px; POSITION: absolute; TOP: 56px; HEIGHT: 21px"
				cellSpacing="0" cellPadding="0" width="520" border="0">
				<TR>
					<TD style="WIDTH: 14px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><STRONG><FONT face="Tahoma" size="2"></FONT></STRONG></TD>
					<TD style="WIDTH: 19px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><FONT face="Tahoma" size="2"><STRONG></STRONG></FONT></TD>
					<TD style="WIDTH: 55px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><STRONG><FONT face="Tahoma" color="#ffffff" size="2"><asp:imagebutton id="homeButton" runat="server" Height="21px" Width="55px" BorderStyle="None" BorderWidth="0px"
									ImageUrl="\VirtualBranchBanking\picture\homeTmp.gif"></asp:imagebutton></FONT></STRONG></TD>
					<TD style="WIDTH: 82px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><STRONG><FONT face="Tahoma" color="#ffffff" size="2"></FONT></STRONG></TD>
					<TD style="WIDTH: 120px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><FONT face="Tahoma">&nbsp;&nbsp;<FONT size="2"><STRONG>
								</STRONG></FONT></FONT>
					</TD>
					<TD style="WIDTH: 45px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00403g.gif"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 54px; HEIGHT: 17px"><FONT face="Tahoma"><asp:imagebutton id="logoffButton" runat="server" Height="21px" Width="64px" BorderStyle="None" BorderWidth="0px"
								ImageUrl="\VirtualBranchBanking\picture\bg-end-logout.jpg"></asp:imagebutton></FONT></TD>
				</TR>
			</TABLE>
			<TABLE id="Table4" style="Z-INDEX: 119; LEFT: 56px; WIDTH: 656px; POSITION: absolute; TOP: 112px; HEIGHT: 288px"
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
												runat="server" Height="22px" Width="176px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton1.jpg"></asp:imagebutton><asp:imagebutton id="paymentButton" style="Z-INDEX: 102; LEFT: 0px; POSITION: absolute; TOP: 24px"
												runat="server" Height="22px" Width="176px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton2.jpg"></asp:imagebutton><asp:imagebutton id="chequeButton" style="Z-INDEX: 103; LEFT: 0px; POSITION: absolute; TOP: 48px"
												runat="server" Height="22px" Width="176px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton3.jpg"></asp:imagebutton><asp:imagebutton id="forexButton" style="Z-INDEX: 104; LEFT: 0px; POSITION: absolute; TOP: 72px"
												runat="server" Height="22px" Width="176px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton4.jpg"></asp:imagebutton><asp:imagebutton id="creditLoanButton" style="Z-INDEX: 105; LEFT: 0px; POSITION: absolute; TOP: 96px"
												runat="server" Height="22px" Width="176px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton5.jpg"></asp:imagebutton><asp:imagebutton id="personalOptionButton" style="Z-INDEX: 106; LEFT: 0px; POSITION: absolute; TOP: 120px"
												runat="server" Height="22px" Width="176px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton6.jpg"></asp:imagebutton><asp:label id="Label12" style="Z-INDEX: 107; LEFT: 0px; POSITION: absolute; TOP: 144px" runat="server"
												Font-Size="Smaller" Font-Names="Arial" BackColor="Black" Width="176px"></asp:label><asp:label id="Label13" style="Z-INDEX: 108; LEFT: 0px; POSITION: absolute; TOP: 160px" runat="server"
												BackColor="LightSlateGray" Height="88px" Width="176px"></asp:label></DIV>
									</TD>
									<TD><FONT face="Tahoma"></FONT><FONT face="Tahoma">
											<DIV style="WIDTH: 472px; POSITION: relative; HEIGHT: 232px" ms_positioning="GridLayout">
												<TABLE id="Table5" style="Z-INDEX: 100; LEFT: 0px; WIDTH: 472px; POSITION: absolute; TOP: 0px; HEIGHT: 232px"
													cellSpacing="0" cellPadding="0" width="472" bgColor="#ffffff" border="0">
													<TR>
														<TD id="gridLayout1">
															<asp:Image id="recieptImage" style="Z-INDEX: 101; LEFT: 320px; POSITION: absolute; TOP: 120px"
																runat="server" Height="96px" ImageUrl="\VirtualBranchBanking\picture\reciept.jpg" BorderWidth="1px"
																Width="48px" BorderColor="Gray" Visible="False"></asp:Image></TD>
													</TR>
												</TABLE>
												<asp:label id="Label1" style="Z-INDEX: 103; LEFT: 16px; POSITION: absolute; TOP: 8px" runat="server"
													Font-Size="X-Small" Font-Bold="True" Font-Names="Tahoma" ForeColor="#404040">Withdraw Money</asp:label><asp:label id="Label2" style="Z-INDEX: 101; LEFT: 128px; POSITION: absolute; TOP: 40px" runat="server"
													Font-Size="X-Small" Font-Names="Tahoma" ForeColor="#404040">From Account</asp:label><asp:dropdownlist id="fromAccountList" style="Z-INDEX: 102; LEFT: 216px; POSITION: absolute; TOP: 40px"
													runat="server" Height="22px" Width="128px" AutoPostBack="True"></asp:dropdownlist><asp:textbox id="amountTextBox" style="Z-INDEX: 107; LEFT: 216px; POSITION: absolute; TOP: 64px"
													runat="server" Height="22px" Width="128px"></asp:textbox><asp:label id="Label4" style="Z-INDEX: 104; LEFT: 160px; POSITION: absolute; TOP: 64px" runat="server"
													Font-Size="X-Small" Font-Names="Tahoma" ForeColor="#404040">Amount</asp:label><asp:textbox id="secureCodeTextBox" style="Z-INDEX: 105; LEFT: 216px; POSITION: absolute; TOP: 88px"
													runat="server" Height="22px" Width="80px"></asp:textbox><asp:label id="Label5" style="Z-INDEX: 106; LEFT: 128px; POSITION: absolute; TOP: 88px" runat="server"
													Font-Size="X-Small" Font-Names="Tahoma" ForeColor="#404040">Secure Code</asp:label><asp:imagebutton id="withdrawButton" style="Z-INDEX: 108; LEFT: 200px; POSITION: absolute; TOP: 144px"
													runat="server" Height="22px" Width="80px" ImageUrl="\VirtualBranchBanking\picture\withdrawButton.jpg"></asp:imagebutton></DIV>
										</FONT><FONT face="Tahoma"></FONT>
									</TD>
								</TR>
							</TABLE>
						</DIV>
						<asp:label id="Label11" runat="server" Font-Size="X-Small" Font-Names="Arial" BackColor="Black"
							Width="656px"></asp:label></TD>
				</TR>
			</TABLE>
			<TABLE id="Table3" style="Z-INDEX: 120; LEFT: 56px; WIDTH: 167px; POSITION: absolute; TOP: 56px; HEIGHT: 34px"
				cellSpacing="0" cellPadding="0" width="167" background="\VirtualBranchBanking\picture\bb00201g.gif"
				border="0">
				<TR>
					<TD background="file:///C:\Inetpub\wwwroot\VirtualBranchBanking\picture\bb00201g.gif"><FONT face="Arial" color="#ffffff"><FONT size="4"><STRONG>&nbsp;</STRONG></FONT><FONT face="Tahoma" size="2">Access 
								Account</FONT></FONT></TD>
				</TR>
			</TABLE>
			<asp:label id="noOfUser" style="Z-INDEX: 121; LEFT: 696px; POSITION: absolute; TOP: 416px"
				runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif" ForeColor="#0000C0"></asp:label><asp:label id="Label8" style="Z-INDEX: 122; LEFT: 640px; POSITION: absolute; TOP: 416px" runat="server"
				Font-Size="XX-Small" Font-Names="Microsoft Sans Serif">Now online</asp:label><asp:label id="Label7" style="Z-INDEX: 123; LEFT: 624px; POSITION: absolute; TOP: 80px" runat="server"
				Font-Size="XX-Small" Font-Names="Microsoft Sans Serif">Hello</asp:label><asp:label id="userLabel" style="Z-INDEX: 124; LEFT: 648px; POSITION: absolute; TOP: 80px"
				runat="server" Font-Size="XX-Small" Font-Names="Arial" ForeColor="Maroon" Height="8px"></asp:label><asp:imagebutton id="accSumButton" style="Z-INDEX: 110; LEFT: 112px; POSITION: absolute; TOP: 96px"
				runat="server" Height="16px" Width="100px" ImageUrl="\VirtualBranchBanking\picture\accSumButton.jpg"></asp:imagebutton><asp:imagebutton id="openNewAccButton" style="Z-INDEX: 111; LEFT: 208px; POSITION: absolute; TOP: 96px"
				runat="server" Height="16px" Width="100px" ImageUrl="\VirtualBranchBanking\picture\openNewAccButton.jpg"></asp:imagebutton><asp:imagebutton id="withdrawMenuButton" style="Z-INDEX: 112; LEFT: 304px; POSITION: absolute; TOP: 96px"
				runat="server" Height="16px" Width="60px" ImageUrl="\VirtualBranchBanking\picture\withdrawMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="depositMenuButton" style="Z-INDEX: 113; LEFT: 360px; POSITION: absolute; TOP: 96px"
				runat="server" Height="16px" Width="60px" ImageUrl="\VirtualBranchBanking\picture\depositMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="transferMenuButton" style="Z-INDEX: 114; LEFT: 416px; POSITION: absolute; TOP: 96px"
				runat="server" Height="16px" Width="100px" ImageUrl="\VirtualBranchBanking\picture\transferMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="updatePassButton" style="Z-INDEX: 115; LEFT: 512px; POSITION: absolute; TOP: 96px"
				runat="server" Height="16px" Width="100px" ImageUrl="\VirtualBranchBanking\picture\updateBookMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="transferHisButton" style="Z-INDEX: 116; LEFT: 608px; POSITION: absolute; TOP: 96px"
				runat="server" Height="16px" Width="100px" ImageUrl="\VirtualBranchBanking\picture\transferHisMenuButton.jpg"></asp:imagebutton><asp:label id="Label6" style="Z-INDEX: 109; LEFT: 56px; POSITION: absolute; TOP: 96px" runat="server"
				Font-Size="X-Small" Font-Names="Arial" BackColor="Black" Width="57px"></asp:label></form>
	</body>
</HTML>
