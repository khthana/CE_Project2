<%@ Page Language="vb" AutoEventWireup="false" Codebehind="QuickPaymentPage.aspx.vb" Inherits="VirtualBranchBanking.QuickPaymentPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Quick Payment</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:label id="Label3" style="Z-INDEX: 101; LEFT: 56px; POSITION: absolute; TOP: 32px" runat="server"
				Font-Names="Arial" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Height="24px">Virtual Branch Banking</asp:label>
			<TABLE id="Table2" style="Z-INDEX: 102; LEFT: 216px; WIDTH: 520px; POSITION: absolute; TOP: 56px; HEIGHT: 21px"
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
			<TABLE id="Table4" style="Z-INDEX: 103; LEFT: 56px; WIDTH: 656px; POSITION: absolute; TOP: 112px; HEIGHT: 288px"
				cellSpacing="0" cellPadding="0" width="656" background="\VirtualBranchBanking\picture\bg_btm.jpg"
				border="0">
				<TR>
					<TD><FONT face="Tahoma"></FONT>
						<DIV style="WIDTH: 657px; HEIGHT: 280px" ms_positioning="FlowLayout">
							<TABLE id="Table1" style="WIDTH: 656px; HEIGHT: 232px" cellSpacing="0" cellPadding="0"
								width="656" border="0">
								<TR>
									<TD style="WIDTH: 166px">
										<DIV style="WIDTH: 177px; POSITION: relative; HEIGHT: 312px" ms_positioning="GridLayout"><asp:imagebutton id="accessAccButton" style="Z-INDEX: 101; LEFT: 0px; POSITION: absolute; TOP: 0px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton1.jpg"></asp:imagebutton><asp:imagebutton id="paymentButton" style="Z-INDEX: 102; LEFT: 0px; POSITION: absolute; TOP: 24px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton2.jpg"></asp:imagebutton><asp:imagebutton id="chequeButton" style="Z-INDEX: 103; LEFT: 0px; POSITION: absolute; TOP: 48px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton3.jpg"></asp:imagebutton><asp:imagebutton id="forexButton" style="Z-INDEX: 104; LEFT: 0px; POSITION: absolute; TOP: 72px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton4.jpg"></asp:imagebutton><asp:imagebutton id="creditLoanButton" style="Z-INDEX: 105; LEFT: 0px; POSITION: absolute; TOP: 96px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton5.jpg"></asp:imagebutton><asp:imagebutton id="personalOptionButton" style="Z-INDEX: 106; LEFT: 0px; POSITION: absolute; TOP: 120px"
												runat="server" Width="176px" Height="22px" BorderStyle="None" BorderWidth="0px" ImageUrl="\VirtualBranchBanking\picture\menuButton6.jpg"></asp:imagebutton><asp:label id="Label12" style="Z-INDEX: 107; LEFT: 0px; POSITION: absolute; TOP: 144px" runat="server"
												Font-Names="Arial" Font-Size="Smaller" Width="176px" BackColor="Black"></asp:label><asp:label id="Label18" style="Z-INDEX: 108; LEFT: 0px; POSITION: absolute; TOP: 160px" runat="server"
												Width="176px" Height="88px" BackColor="LightSlateGray"></asp:label></DIV>
									</TD>
									<TD><FONT face="Tahoma"></FONT><FONT face="Tahoma">
											<DIV style="WIDTH: 474px; POSITION: relative; HEIGHT: 304px" ms_positioning="GridLayout">
												<TABLE id="Table5" style="Z-INDEX: 101; LEFT: 0px; WIDTH: 472px; POSITION: absolute; TOP: 0px; HEIGHT: 304px"
													cellSpacing="0" cellPadding="0" width="472" bgColor="#ffffff" border="0">
													<TR>
														<TD id="gridLayout1"></TD>
													</TR>
												</TABLE>
												<asp:label id="Label1" style="Z-INDEX: 119; LEFT: 16px; POSITION: absolute; TOP: 8px" runat="server"
													Font-Names="Tahoma" Font-Bold="True" Font-Size="X-Small" ForeColor="#404040">Quick Payment</asp:label><asp:label id="Label2" style="Z-INDEX: 104; LEFT: 144px; POSITION: absolute; TOP: 24px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="Blue">Please take the Bills to Laser reader..</asp:label><asp:image id="Image1" style="Z-INDEX: 116; LEFT: 360px; POSITION: absolute; TOP: 0px" runat="server"
													Width="113px" Height="50px" ImageUrl="\VirtualBranchBanking\picture\bill_barcode.jpg"></asp:image><asp:dropdownlist id="merchantList" style="Z-INDEX: 106; LEFT: 328px; POSITION: absolute; TOP: 56px"
													runat="server" AutoPostBack="True" Width="145px" Height="22px"></asp:dropdownlist><asp:label id="Label11" style="Z-INDEX: 120; LEFT: 256px; POSITION: absolute; TOP: 56px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">Biller name</asp:label><asp:textbox id="payerNameTextBox" style="Z-INDEX: 108; LEFT: 328px; POSITION: absolute; TOP: 80px"
													runat="server" Width="140px" Height="22px"></asp:textbox><asp:textbox id="amountTextBox" style="Z-INDEX: 125; LEFT: 328px; POSITION: absolute; TOP: 104px"
													runat="server" Width="92px" Height="22px"></asp:textbox><asp:label id="Label13" style="Z-INDEX: 110; LEFT: 256px; POSITION: absolute; TOP: 80px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">Payer name</asp:label><asp:label id="Label14" style="Z-INDEX: 121; LEFT: 280px; POSITION: absolute; TOP: 104px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">Amount</asp:label><asp:label id="Label4" style="Z-INDEX: 112; LEFT: 32px; POSITION: absolute; TOP: 40px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">Bill Information</asp:label><asp:label id="Label5" style="Z-INDEX: 118; LEFT: 56px; POSITION: absolute; TOP: 56px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">Biller name</asp:label><asp:label id="Label6" style="Z-INDEX: 114; LEFT: 48px; POSITION: absolute; TOP: 104px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">Payer name</asp:label><asp:label id="payerLabel" style="Z-INDEX: 102; LEFT: 128px; POSITION: absolute; TOP: 104px"
													runat="server" Font-Names="Arial" Font-Size="Smaller" ForeColor="Navy"></asp:label><asp:label id="billerLabel" style="Z-INDEX: 103; LEFT: 128px; POSITION: absolute; TOP: 56px"
													runat="server" Font-Names="Arial" Font-Size="Smaller" ForeColor="Navy"></asp:label><asp:label id="Label9" style="Z-INDEX: 105; LEFT: 40px; POSITION: absolute; TOP: 80px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">Biller account</asp:label><asp:label id="billerAccLabel" style="Z-INDEX: 107; LEFT: 128px; POSITION: absolute; TOP: 80px"
													runat="server" Font-Names="Arial" Font-Size="Smaller" ForeColor="Navy"></asp:label><asp:label id="Label7" style="Z-INDEX: 109; LEFT: 72px; POSITION: absolute; TOP: 128px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">Amount</asp:label><asp:label id="amountLabel" style="Z-INDEX: 111; LEFT: 128px; POSITION: absolute; TOP: 128px"
													runat="server" Font-Names="Arial" Font-Size="Smaller" ForeColor="Navy"></asp:label><asp:label id="Label8" style="Z-INDEX: 113; LEFT: 32px; POSITION: absolute; TOP: 152px" runat="server"
													Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040">Pay by</asp:label><asp:radiobuttonlist id="paybyRadioButton" style="Z-INDEX: 115; LEFT: 88px; POSITION: absolute; TOP: 160px"
													runat="server" Font-Names="Tahoma" Font-Size="X-Small" AutoPostBack="True" Width="232px" ForeColor="#404040" Height="72px">
													<asp:ListItem Value="byAccount">Account</asp:ListItem>
													<asp:ListItem Value="byCash">Cash</asp:ListItem>
												</asp:radiobuttonlist><asp:dropdownlist id="fromAccountList" style="Z-INDEX: 117; LEFT: 168px; POSITION: absolute; TOP: 168px"
													runat="server" Font-Names="Arial" Font-Size="Smaller" AutoPostBack="True" Width="144px" ForeColor="#404040"></asp:dropdownlist><asp:image id="cashImage" style="Z-INDEX: 122; LEFT: 168px; POSITION: absolute; TOP: 208px"
													runat="server" Width="80px" Height="40px" Visible="False" ImageUrl="\VirtualBranchBanking\picture\cash.jpg"></asp:image><asp:label id="cashokLabel" style="Z-INDEX: 123; LEFT: 32px; POSITION: absolute; TOP: 272px"
													runat="server" Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#404040" Visible="False">Cash Ok and Amount =</asp:label><asp:textbox id="cashAmountTextBox" style="Z-INDEX: 124; LEFT: 168px; POSITION: absolute; TOP: 272px"
													runat="server" Width="104px" Visible="False"></asp:textbox><asp:imagebutton id="verifyButton" style="Z-INDEX: 126; LEFT: 352px; POSITION: absolute; TOP: 136px"
													runat="server" Width="80px" Height="22px" ImageUrl="\VirtualBranchBanking\picture\verifyButton.jpg"></asp:imagebutton><asp:imagebutton id="payButton" style="Z-INDEX: 127; LEFT: 352px; POSITION: absolute; TOP: 272px"
													runat="server" Width="80px" Height="22px" ImageUrl="\VirtualBranchBanking\picture\payButton.jpg"></asp:imagebutton></DIV>
										</FONT><FONT face="Tahoma"></FONT>
									</TD>
								</TR>
							</TABLE>
						</DIV>
						<asp:label id="Label17" runat="server" Font-Names="Arial" Font-Size="X-Small" Width="656px"
							BackColor="Black"></asp:label></TD>
				</TR>
			</TABLE>
			<TABLE id="Table3" style="Z-INDEX: 104; LEFT: 56px; WIDTH: 167px; POSITION: absolute; TOP: 56px; HEIGHT: 34px"
				cellSpacing="0" cellPadding="0" width="167" background="\VirtualBranchBanking\picture\bb00201g.gif"
				border="0">
				<TR>
					<TD background="file:///C:\Inetpub\wwwroot\VirtualBranchBanking\picture\bb00201g.gif"><FONT face="Arial" color="#ffffff"><FONT size="4"><STRONG>&nbsp;</STRONG></FONT><FONT face="Tahoma" size="2">Payment</FONT></FONT></TD>
				</TR>
			</TABLE>
			<asp:label id="noOfUser" style="Z-INDEX: 105; LEFT: 696px; POSITION: absolute; TOP: 480px"
				runat="server" Font-Names="Microsoft Sans Serif" Font-Size="XX-Small" ForeColor="#0000C0"></asp:label><asp:label id="Label16" style="Z-INDEX: 106; LEFT: 640px; POSITION: absolute; TOP: 480px" runat="server"
				Font-Names="Microsoft Sans Serif" Font-Size="XX-Small">Now online</asp:label><asp:label id="Label15" style="Z-INDEX: 107; LEFT: 624px; POSITION: absolute; TOP: 80px" runat="server"
				Font-Names="Microsoft Sans Serif" Font-Size="XX-Small">Hello</asp:label><asp:label id="userLabel" style="Z-INDEX: 108; LEFT: 648px; POSITION: absolute; TOP: 80px"
				runat="server" Font-Names="Arial" Font-Size="XX-Small" ForeColor="Maroon" Height="8px"></asp:label><asp:label id="Label10" style="Z-INDEX: 109; LEFT: 56px; POSITION: absolute; TOP: 96px" runat="server"
				Font-Names="Arial" Font-Size="X-Small" Width="176px" BackColor="Black"></asp:label><asp:imagebutton id="quickPayButton" style="Z-INDEX: 110; LEFT: 232px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\quickPayMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="paymybillButton" style="Z-INDEX: 111; LEFT: 336px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\payMyBillMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="eduPayButton" style="Z-INDEX: 112; LEFT: 440px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\eduPayMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="paymentHisButton" style="Z-INDEX: 113; LEFT: 544px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\PayHisMenuButton.jpg"></asp:imagebutton></form>
	</body>
</HTML>
