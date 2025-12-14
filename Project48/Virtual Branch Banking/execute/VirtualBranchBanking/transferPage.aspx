<%@ Page Language="vb" AutoEventWireup="false" Codebehind="transferPage.aspx.vb" Inherits="VirtualBranchBanking.transferPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Transfer Funds</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:label id="Label17" style="Z-INDEX: 131; LEFT: 56px; POSITION: absolute; TOP: 32px" runat="server"
				Font-Size="Medium" Font-Names="Arial" Font-Bold="True" ForeColor="Black" Height="24px">Virtual Branch Banking</asp:label><asp:label id="Label14" style="Z-INDEX: 139; LEFT: 56px; POSITION: absolute; TOP: 96px" runat="server"
				Font-Size="X-Small" Font-Names="Arial" Width="57px" BackColor="Black"></asp:label><asp:imagebutton id="accSumButton" style="Z-INDEX: 110; LEFT: 112px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\accSumButton.jpg"></asp:imagebutton><asp:imagebutton id="openNewAccButton" style="Z-INDEX: 111; LEFT: 208px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\openNewAccButton.jpg"></asp:imagebutton><asp:imagebutton id="withdrawMenuButton" style="Z-INDEX: 112; LEFT: 304px; POSITION: absolute; TOP: 96px"
				runat="server" Width="60px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\withdrawMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="depositMenuButton" style="Z-INDEX: 113; LEFT: 360px; POSITION: absolute; TOP: 96px"
				runat="server" Width="60px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\depositMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="transferMenuButton" style="Z-INDEX: 114; LEFT: 416px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\transferMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="updatePassButton" style="Z-INDEX: 115; LEFT: 512px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\updateBookMenuButton.jpg"></asp:imagebutton><asp:imagebutton id="transferHisButton" style="Z-INDEX: 116; LEFT: 608px; POSITION: absolute; TOP: 96px"
				runat="server" Width="100px" Height="16px" ImageUrl="\VirtualBranchBanking\picture\transferHisMenuButton.jpg"></asp:imagebutton>
			<TABLE id="Table2" style="Z-INDEX: 132; LEFT: 216px; WIDTH: 520px; POSITION: absolute; TOP: 56px; HEIGHT: 21px"
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
			<TABLE id="Table4" style="Z-INDEX: 133; LEFT: 56px; WIDTH: 656px; POSITION: absolute; TOP: 112px; HEIGHT: 288px"
				cellSpacing="0" cellPadding="0" width="656" background="\VirtualBranchBanking\picture\bg_btm.jpg"
				border="0">
				<TR>
					<TD><FONT face="Tahoma"></FONT>
						<DIV style="WIDTH: 648px; HEIGHT: 286px" ms_positioning="FlowLayout">
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
												Font-Size="Smaller" Font-Names="Arial" Width="176px" BackColor="Black"></asp:label><asp:label id="Label13" style="Z-INDEX: 108; LEFT: 0px; POSITION: absolute; TOP: 160px" runat="server"
												Width="176px" BackColor="LightSlateGray" Height="88px"></asp:label></DIV>
									</TD>
									<TD><FONT face="Tahoma"></FONT><FONT face="Tahoma">
											<DIV style="WIDTH: 472px; POSITION: relative; HEIGHT: 234px" ms_positioning="GridLayout">
												<TABLE id="Table5" style="Z-INDEX: 100; LEFT: 0px; WIDTH: 472px; POSITION: absolute; TOP: 0px; HEIGHT: 234px"
													cellSpacing="0" cellPadding="0" width="472" bgColor="#ffffff" border="0">
													<TR>
														<TD id="gridLayout1">
															<asp:DropDownList id="transferByList" style="Z-INDEX: 101; LEFT: 112px; POSITION: absolute; TOP: 32px"
																runat="server" Width="128px" AutoPostBack="True">
																<asp:ListItem Value="Account">Account</asp:ListItem>
																<asp:ListItem Value="Cash">Cash</asp:ListItem>
															</asp:DropDownList>
															<asp:Image id="cashCounterImage" style="Z-INDEX: 102; LEFT: 344px; POSITION: absolute; TOP: 8px"
																runat="server" Height="56px" Width="64px" ImageUrl="\VirtualBranchBanking\picture\cashCounter.jpg"
																Visible="False"></asp:Image></TD>
													</TR>
												</TABLE>
												<asp:label id="Label1" style="Z-INDEX: 115; LEFT: 16px; POSITION: absolute; TOP: 8px" runat="server"
													Font-Size="X-Small" Font-Names="Tahoma" Font-Bold="True" ForeColor="#404040">Transfer Funds</asp:label><asp:label id="Label2" style="Z-INDEX: 103; LEFT: 72px; POSITION: absolute; TOP: 64px" runat="server"
													Font-Size="X-Small" Font-Names="Tahoma" Font-Bold="True" ForeColor="#404040">Account Information</asp:label><asp:label id="Label3" style="Z-INDEX: 121; LEFT: 24px; POSITION: absolute; TOP: 88px" runat="server"
													Font-Size="X-Small" Font-Names="Tahoma" ForeColor="#404040">From Account</asp:label><asp:label id="Label4" style="Z-INDEX: 105; LEFT: 40px; POSITION: absolute; TOP: 112px" runat="server"
													Font-Size="X-Small" Font-Names="Tahoma" ForeColor="#404040">To Account</asp:label><asp:dropdownlist id="fromAccountList" style="Z-INDEX: 116; LEFT: 112px; POSITION: absolute; TOP: 88px"
													runat="server" Width="128px" Height="22px" AutoPostBack="True"></asp:dropdownlist><asp:dropdownlist id="toAccountList" style="Z-INDEX: 107; LEFT: 112px; POSITION: absolute; TOP: 112px"
													runat="server" Width="128px" Height="22px" AutoPostBack="True"></asp:dropdownlist><asp:label id="Label5" style="Z-INDEX: 113; LEFT: 296px; POSITION: absolute; TOP: 64px" runat="server"
													Font-Size="X-Small" Font-Names="Tahoma" Font-Bold="True" ForeColor="#404040">Transfer Information</asp:label><asp:label id="Label6" style="Z-INDEX: 109; LEFT: 288px; POSITION: absolute; TOP: 88px" runat="server"
													Font-Size="X-Small" Font-Names="Tahoma" ForeColor="#404040">Amount</asp:label><asp:label id="Label7" style="Z-INDEX: 114; LEFT: 288px; POSITION: absolute; TOP: 120px" runat="server"
													Font-Size="X-Small" Font-Names="Tahoma" ForeColor="#404040">Method</asp:label><asp:textbox id="amountTextBox" style="Z-INDEX: 111; LEFT: 336px; POSITION: absolute; TOP: 88px"
													runat="server" Width="96px" Height="22px"></asp:textbox><asp:radiobutton id="immedatelyRadio" style="Z-INDEX: 101; LEFT: 336px; POSITION: absolute; TOP: 120px"
													runat="server" Font-Size="X-Small" Font-Names="Tahoma" Enabled="False" Text="Immediate"></asp:radiobutton><asp:radiobutton id="scheduleRadio" style="Z-INDEX: 102; LEFT: 336px; POSITION: absolute; TOP: 104px"
													runat="server" Font-Size="X-Small" Font-Names="Tahoma" Enabled="False" Text="Schedule"></asp:radiobutton><asp:label id="Label8" style="Z-INDEX: 104; LEFT: 48px; POSITION: absolute; TOP: 152px" runat="server"
													Font-Size="X-Small" Font-Names="Tahoma" ForeColor="#404040">Next Date</asp:label><asp:label id="Label9" style="Z-INDEX: 106; LEFT: 48px; POSITION: absolute; TOP: 176px" runat="server"
													Font-Size="X-Small" Font-Names="Tahoma" ForeColor="#404040">Frequency</asp:label><asp:label id="Label10" style="Z-INDEX: 108; LEFT: 48px; POSITION: absolute; TOP: 200px" runat="server"
													Font-Size="X-Small" Font-Names="Tahoma" ForeColor="#404040">Number of</asp:label><asp:dropdownlist id="dayBox" style="Z-INDEX: 110; LEFT: 112px; POSITION: absolute; TOP: 152px" runat="server"
													Width="48px" Height="22px" AutoPostBack="True" Enabled="False">
													<asp:ListItem Value="1" Selected="True">1</asp:ListItem>
													<asp:ListItem Value="2">2</asp:ListItem>
													<asp:ListItem Value="3">3</asp:ListItem>
													<asp:ListItem Value="4">4</asp:ListItem>
													<asp:ListItem Value="5">5</asp:ListItem>
													<asp:ListItem Value="6">6</asp:ListItem>
													<asp:ListItem Value="7">7</asp:ListItem>
													<asp:ListItem Value="8">8</asp:ListItem>
													<asp:ListItem Value="9">9</asp:ListItem>
													<asp:ListItem Value="10">10</asp:ListItem>
													<asp:ListItem Value="11">11</asp:ListItem>
													<asp:ListItem Value="12">12</asp:ListItem>
													<asp:ListItem Value="13">13</asp:ListItem>
													<asp:ListItem Value="14">14</asp:ListItem>
													<asp:ListItem Value="15">15</asp:ListItem>
													<asp:ListItem Value="16">16</asp:ListItem>
													<asp:ListItem Value="17">17</asp:ListItem>
													<asp:ListItem Value="18">18</asp:ListItem>
													<asp:ListItem Value="19">19</asp:ListItem>
													<asp:ListItem Value="20">20</asp:ListItem>
													<asp:ListItem Value="21">21</asp:ListItem>
													<asp:ListItem Value="22">22</asp:ListItem>
													<asp:ListItem Value="23">23</asp:ListItem>
													<asp:ListItem Value="24">24</asp:ListItem>
													<asp:ListItem Value="25">25</asp:ListItem>
													<asp:ListItem Value="26">26</asp:ListItem>
													<asp:ListItem Value="27">27</asp:ListItem>
													<asp:ListItem Value="28">28</asp:ListItem>
													<asp:ListItem Value="29">29</asp:ListItem>
													<asp:ListItem Value="30">30</asp:ListItem>
													<asp:ListItem Value="31">31</asp:ListItem>
												</asp:dropdownlist><asp:dropdownlist id="monthBox" style="Z-INDEX: 112; LEFT: 160px; POSITION: absolute; TOP: 152px"
													runat="server" Width="72px" Height="22px" AutoPostBack="True" Enabled="False">
													<asp:ListItem Value="January" Selected="True">January</asp:ListItem>
													<asp:ListItem Value="ก.พ.">February</asp:ListItem>
													<asp:ListItem Value="มี.ค.">March</asp:ListItem>
													<asp:ListItem Value="เม.ย.">April</asp:ListItem>
													<asp:ListItem Value="พ.ค.">May</asp:ListItem>
													<asp:ListItem Value="มิ.ย.">June</asp:ListItem>
													<asp:ListItem Value="ก.ค.">July</asp:ListItem>
													<asp:ListItem Value="ส.ค.">August</asp:ListItem>
													<asp:ListItem Value="ก.ย.">September</asp:ListItem>
													<asp:ListItem Value="ต.ค.">October</asp:ListItem>
													<asp:ListItem Value="พ.ย.">November</asp:ListItem>
													<asp:ListItem Value="ธ.ค.">December</asp:ListItem>
												</asp:dropdownlist><asp:dropdownlist id="yearBox" style="Z-INDEX: 117; LEFT: 232px; POSITION: absolute; TOP: 152px" runat="server"
													Height="22px" AutoPostBack="True" Enabled="False">
													<asp:ListItem Value="2000">2000</asp:ListItem>
													<asp:ListItem Value="2001">2001</asp:ListItem>
													<asp:ListItem Value="2002">2002</asp:ListItem>
													<asp:ListItem Value="2003">2003</asp:ListItem>
													<asp:ListItem Value="2004">2004</asp:ListItem>
													<asp:ListItem Value="2005">2005</asp:ListItem>
													<asp:ListItem Value="2006" Selected="True">2006</asp:ListItem>
													<asp:ListItem Value="2007">2007</asp:ListItem>
													<asp:ListItem Value="2008">2008</asp:ListItem>
													<asp:ListItem Value="2009">2009</asp:ListItem>
													<asp:ListItem Value="2010">2010</asp:ListItem>
													<asp:ListItem Value="2011">2011</asp:ListItem>
													<asp:ListItem Value="2012">2012</asp:ListItem>
													<asp:ListItem Value="2013">2013</asp:ListItem>
													<asp:ListItem Value="2014">2014</asp:ListItem>
													<asp:ListItem Value="2015">2015</asp:ListItem>
													<asp:ListItem Value="2016">2016</asp:ListItem>
													<asp:ListItem Value="2017">2017</asp:ListItem>
													<asp:ListItem Value="2018">2018</asp:ListItem>
													<asp:ListItem Value="2019">2019</asp:ListItem>
													<asp:ListItem Value="2020">2020</asp:ListItem>
												</asp:dropdownlist><asp:dropdownlist id="frequencyBox" style="Z-INDEX: 118; LEFT: 112px; POSITION: absolute; TOP: 176px"
													runat="server" Width="120px" Height="22px" AutoPostBack="True" Enabled="False">
													<asp:ListItem Value="Only once" Selected="True">Only once</asp:ListItem>
													<asp:ListItem Value="Weekly">Weekly</asp:ListItem>
													<asp:ListItem Value="Every two week">Every two week</asp:ListItem>
													<asp:ListItem Value="Twice a month">Twice a month</asp:ListItem>
													<asp:ListItem Value="Monthly">Monthly</asp:ListItem>
													<asp:ListItem Value="Every two month">Every two month</asp:ListItem>
													<asp:ListItem Value="Quarterly">Quarterly</asp:ListItem>
													<asp:ListItem Value="Every four month">Every four month</asp:ListItem>
													<asp:ListItem Value="Twice a year">Twice a year</asp:ListItem>
												</asp:dropdownlist><asp:textbox id="noOfBox" style="Z-INDEX: 119; LEFT: 112px; POSITION: absolute; TOP: 200px" runat="server"
													Width="48px" Height="22px" Enabled="False" ReadOnly="True"></asp:textbox><asp:imagebutton id="transferButton" style="Z-INDEX: 122; LEFT: 336px; POSITION: absolute; TOP: 184px"
													runat="server" Width="80px" Height="22px" ImageUrl="\VirtualBranchBanking\picture\transferButton.jpg"></asp:imagebutton>
												<asp:label id="Label18" style="Z-INDEX: 123; LEFT: 40px; POSITION: absolute; TOP: 32px" runat="server"
													ForeColor="#404040" Font-Names="Tahoma" Font-Size="X-Small">Transfer By</asp:label>
												<asp:Image id="receiptImage" style="Z-INDEX: 140; LEFT: 416px; POSITION: absolute; TOP: 136px"
													runat="server" Height="96px" Width="48px" ImageUrl="\VirtualBranchBanking\picture\reciept.jpg"
													BorderWidth="1px" Visible="False" BorderColor="Gray"></asp:Image></DIV>
										</FONT><FONT face="Tahoma"></FONT>
									</TD>
								</TR>
							</TABLE>
						</DIV>
						<asp:label id="Label11" runat="server" Font-Size="X-Small" Font-Names="Arial" Width="656px"
							BackColor="Black"></asp:label></TD>
				</TR>
			</TABLE>
			<TABLE id="Table3" style="Z-INDEX: 134; LEFT: 56px; WIDTH: 167px; POSITION: absolute; TOP: 56px; HEIGHT: 34px"
				cellSpacing="0" cellPadding="0" width="167" background="\VirtualBranchBanking\picture\bb00201g.gif"
				border="0">
				<TR>
					<TD background="file:///C:\Inetpub\wwwroot\VirtualBranchBanking\picture\bb00201g.gif"><FONT face="Arial" color="#ffffff"><FONT size="4"><STRONG>&nbsp;</STRONG></FONT><FONT face="Tahoma" size="2">Access 
								Account</FONT></FONT></TD>
				</TR>
			</TABLE>
			<asp:label id="noOfUser" style="Z-INDEX: 135; LEFT: 696px; POSITION: absolute; TOP: 416px"
				runat="server" Font-Size="XX-Small" Font-Names="Microsoft Sans Serif" ForeColor="#0000C0"></asp:label><asp:label id="Label16" style="Z-INDEX: 136; LEFT: 640px; POSITION: absolute; TOP: 416px" runat="server"
				Font-Size="XX-Small" Font-Names="Microsoft Sans Serif">Now online</asp:label><asp:label id="Label15" style="Z-INDEX: 137; LEFT: 624px; POSITION: absolute; TOP: 80px" runat="server"
				Font-Size="XX-Small" Font-Names="Microsoft Sans Serif">Hello</asp:label><asp:label id="userLabel" style="Z-INDEX: 138; LEFT: 648px; POSITION: absolute; TOP: 80px"
				runat="server" Font-Size="XX-Small" Font-Names="Arial" ForeColor="Maroon" Height="8px"></asp:label></form>
	</body>
</HTML>
