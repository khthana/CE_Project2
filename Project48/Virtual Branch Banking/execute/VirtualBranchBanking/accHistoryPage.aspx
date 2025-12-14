<%@ Page Language="vb" AutoEventWireup="false" Codebehind="accHistoryPage.aspx.vb" Inherits="VirtualBranchBanking.accHistoryPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Account History</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma"></FONT>
			<asp:label id="Label7" style="Z-INDEX: 106; LEFT: 56px; POSITION: absolute; TOP: 32px" runat="server"
				Font-Size="Medium" Font-Names="Arial" Font-Bold="True" ForeColor="Black" Height="24px">Virtual Branch Banking</asp:label><asp:label id="Label4" style="Z-INDEX: 116; LEFT: 56px; POSITION: absolute; TOP: 96px" runat="server"
				BackColor="Black" Width="57px" Font-Size="X-Small" Font-Names="Arial"></asp:label><asp:imagebutton id="accSumButton" style="Z-INDEX: 101; LEFT: 112px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\accSumButton.jpg"></asp:imagebutton><asp:imagebutton id="openNewAccButton" style="Z-INDEX: 102; LEFT: 208px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\openNewAccButton.jpg"></asp:imagebutton><asp:imagebutton id="withdrawMenuButton" style="Z-INDEX: 103; LEFT: 304px; POSITION: absolute; TOP: 96px"
				runat="server" Width="60px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\withdrawMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="depositMenuButton" style="Z-INDEX: 104; LEFT: 360px; POSITION: absolute; TOP: 96px"
				runat="server" Width="60px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\depositMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="transferMenuButton" style="Z-INDEX: 105; LEFT: 416px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\transferMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="updatePassButton" style="Z-INDEX: 107; LEFT: 512px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\updateBookMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="transferHisButton" style="Z-INDEX: 108; LEFT: 608px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\transferHisMenuButton.jpg"></asp:imagebutton>
			<TABLE id="Table2" style="Z-INDEX: 109; LEFT: 216px; WIDTH: 520px; POSITION: absolute; TOP: 56px; HEIGHT: 21px"
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
			<TABLE id="Table4" style="Z-INDEX: 110; LEFT: 56px; WIDTH: 656px; POSITION: absolute; TOP: 112px; HEIGHT: 288px"
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
												BackColor="Black" Width="176px" Font-Size="Smaller" Font-Names="Arial"></asp:label><asp:label id="Label13" style="Z-INDEX: 108; LEFT: 0px; POSITION: absolute; TOP: 160px" runat="server"
												BackColor="LightSlateGray" Width="176px" Height="88px"></asp:label></DIV>
									</TD>
									<TD><FONT face="Tahoma"></FONT><FONT face="Tahoma">
											<DIV style="WIDTH: 473px; POSITION: relative; HEIGHT: 232px" ms_positioning="GridLayout">
												<TABLE id="Table5" style="Z-INDEX: 101; LEFT: 0px; WIDTH: 472px; POSITION: absolute; TOP: 0px; HEIGHT: 232px"
													cellSpacing="0" cellPadding="0" width="472" bgColor="#ffffff" border="0">
													<TR>
														<TD id="gridLayout1"></TD>
													</TR>
												</TABLE>
												<asp:label id="Label2" style="Z-INDEX: 124; LEFT: 16px; POSITION: absolute; TOP: 0px" runat="server"
													Font-Size="XX-Small" Font-Names="Tahoma" Font-Bold="True" ForeColor="Gray">Account No.</asp:label><asp:label id="Label3" style="Z-INDEX: 124; LEFT: 16px; POSITION: absolute; TOP: 16px" runat="server"
													Font-Size="XX-Small" Font-Names="Tahoma" Font-Bold="True" ForeColor="Gray">Customer Name</asp:label><asp:label id="accNoLabel" style="Z-INDEX: 124; LEFT: 104px; POSITION: absolute; TOP: 0px"
													runat="server" Font-Size="XX-Small" Font-Names="Tahoma" ForeColor="MediumBlue"></asp:label><asp:label id="cusNameLabel" style="Z-INDEX: 124; LEFT: 104px; POSITION: absolute; TOP: 16px"
													runat="server" Font-Size="XX-Small" Font-Names="Tahoma" ForeColor="MediumBlue"></asp:label><asp:label id="Label1" style="Z-INDEX: 124; LEFT: 232px; POSITION: absolute; TOP: 8px" runat="server"
													Font-Size="X-Small" Font-Names="Tahoma" Font-Bold="True" ForeColor="#404040">Account History</asp:label><asp:datagrid id="DataGrid1" style="Z-INDEX: 124; LEFT: 0px; POSITION: absolute; TOP: 40px" runat="server"
													BackColor="Beige" AutoGenerateColumns="False" Width="472px">
													<SelectedItemStyle VerticalAlign="Middle"></SelectedItemStyle>
													<EditItemStyle VerticalAlign="Middle"></EditItemStyle>
													<AlternatingItemStyle VerticalAlign="Middle" BackColor="White"></AlternatingItemStyle>
													<ItemStyle Font-Size="X-Small" Font-Names="Tahoma" HorizontalAlign="Center" ForeColor="#404040"
														VerticalAlign="Middle" BackColor="White"></ItemStyle>
													<HeaderStyle Font-Size="X-Small" Font-Names="Tahoma" Font-Bold="True" HorizontalAlign="Center"
														ForeColor="DimGray" VerticalAlign="Middle"></HeaderStyle>
													<FooterStyle VerticalAlign="Middle"></FooterStyle>
													<Columns>
														<asp:BoundColumn DataField="DUE_DATE" ReadOnly="True" HeaderText="Date"></asp:BoundColumn>
														<asp:BoundColumn DataField="WITHDRAW" ReadOnly="True" HeaderText="Withdraw" DataFormatString="{0,1:C}"></asp:BoundColumn>
														<asp:BoundColumn DataField="DEPOSIT" ReadOnly="True" HeaderText="Deposit" DataFormatString="{0,1:C}"></asp:BoundColumn>
														<asp:BoundColumn DataField="FEE" ReadOnly="True" HeaderText="Fee" DataFormatString="{0,1:C}"></asp:BoundColumn>
														<asp:BoundColumn DataField="BALANCE" ReadOnly="True" HeaderText="Remain Balance" DataFormatString="{0,1:C}"></asp:BoundColumn>
													</Columns>
													<PagerStyle VerticalAlign="Middle" BackColor="White"></PagerStyle>
												</asp:datagrid></DIV>
										</FONT><FONT face="Tahoma"></FONT>
									</TD>
								</TR>
							</TABLE>
						</DIV>
						<asp:label id="Label11" runat="server" BackColor="Black" Width="656px" Font-Size="X-Small"
							Font-Names="Arial"></asp:label></TD>
				</TR>
			</TABLE>
			<TABLE id="Table3" style="Z-INDEX: 111; LEFT: 56px; WIDTH: 167px; POSITION: absolute; TOP: 56px; HEIGHT: 34px"
				cellSpacing="0" cellPadding="0" width="167" background="\VirtualBranchBanking\picture\bb00201g.gif"
				border="0">
				<TR>
					<TD background="file:///C:\Inetpub\wwwroot\VirtualBranchBanking\picture\bb00201g.gif"><FONT face="Arial" color="#ffffff"><FONT size="4"><STRONG>&nbsp;</STRONG></FONT><FONT face="Tahoma" size="2">Access 
								Account</FONT></FONT></TD>
				</TR>
			</TABLE>
			<asp:label id="noOfUser" style="Z-INDEX: 112; LEFT: 696px; POSITION: absolute; TOP: 416px"
				runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif" ForeColor="#0000C0"></asp:label><asp:label id="Label6" style="Z-INDEX: 113; LEFT: 640px; POSITION: absolute; TOP: 416px" runat="server"
				Font-Size="XX-Small" Font-Names="Microsoft Sans Serif">Now online</asp:label><asp:label id="Label5" style="Z-INDEX: 114; LEFT: 624px; POSITION: absolute; TOP: 80px" runat="server"
				Font-Size="XX-Small" Font-Names="Microsoft Sans Serif">Hello</asp:label><asp:label id="userLabel" style="Z-INDEX: 115; LEFT: 648px; POSITION: absolute; TOP: 80px"
				runat="server" Font-Size="XX-Small" Font-Names="Arial" ForeColor="Maroon" Height="8px"></asp:label></form>
	</body>
</HTML>
