<%@ Page Language="vb" AutoEventWireup="false" Codebehind="LoginPage.aspx.vb" Inherits="VirtualBranchBanking.LoginPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Virtual Branch Banking(Log in)</title>
		<meta content="False" name="vs_snapToGrid">
		<meta content="True" name="vs_showGrid">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta http-equiv="Refresh" content="120">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:label id="Label1" style="Z-INDEX: 101; LEFT: 56px; POSITION: absolute; TOP: 35px" runat="server"
				Font-Size="Medium" ForeColor="Black" Height="24px" Font-Names="Arial" Font-Bold="True">Virtual Branch Banking</asp:label>
			<TABLE id="Table2" style="Z-INDEX: 102; LEFT: 219px; WIDTH: 494px; POSITION: absolute; TOP: 57px; HEIGHT: 22px"
				cellSpacing="0" cellPadding="0" width="494" border="0">
				<TR>
					<TD style="WIDTH: 355px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 57px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00403g.gif"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 64px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bg-end.jpg"><FONT face="Tahoma"></FONT></TD>
				</TR>
			</TABLE>
			<TABLE id="Table3" style="Z-INDEX: 103; LEFT: 55px; WIDTH: 167px; POSITION: absolute; TOP: 57px; HEIGHT: 34px"
				cellSpacing="0" cellPadding="0" width="167" border="0" background="\VirtualBranchBanking\picture\bb00201g.gif">
				<TR>
					<TD background="file:///C:\Inetpub\wwwroot\VirtualBranchBanking\picture\bb00201g.gif"><FONT face="Arial" color="#ffffff"><FONT size="4"><STRONG>&nbsp;</STRONG></FONT><FONT face="Tahoma" size="2">Log 
								in</FONT></FONT></TD>
				</TR>
			</TABLE>
			<FONT face="Tahoma"></FONT>
			<TABLE id="Table1" style="Z-INDEX: 104; LEFT: 55px; WIDTH: 651px; POSITION: absolute; TOP: 94px; HEIGHT: 302px"
				cellSpacing="0" cellPadding="0" width="651" border="0" background="\VirtualBranchBanking\picture\bg_btm.jpg">
				<TR>
					<TD>
						<DIV style="WIDTH: 653px; POSITION: relative; HEIGHT: 283px" ms_positioning="GridLayout">
							<asp:label id="Label4" style="Z-INDEX: 115; LEFT: 168px; POSITION: absolute; TOP: 71px" runat="server"
								BackColor="Black" Font-Size="XX-Small" ForeColor="White" Font-Names="Microsoft Sans Serif"
								Height="1px">Username</asp:label>
							<asp:textbox id="usernameTextBox" style="Z-INDEX: 114; LEFT: 219px; POSITION: absolute; TOP: 69px"
								runat="server" Width="127px" EnableViewState="False"></asp:textbox>
							<asp:label id="Label5" style="Z-INDEX: 103; LEFT: 169px; POSITION: absolute; TOP: 94px" runat="server"
								BackColor="Black" Font-Size="XX-Small" ForeColor="White" Font-Names="Microsoft Sans Serif">Password</asp:label>
							<asp:textbox id="passwordTextBox" style="Z-INDEX: 109; LEFT: 219px; POSITION: absolute; TOP: 92px"
								runat="server" Width="127px" EnableViewState="False" TextMode="Password"></asp:textbox>
							<asp:imagebutton id="userloginButton" style="Z-INDEX: 105; LEFT: 260px; POSITION: absolute; TOP: 116px"
								runat="server" Width="85px" Height="23px" ImageUrl="file:///C:\Inetpub\wwwroot\VirtualBranchBanking\picture\loginButton.jpg"></asp:imagebutton>
							<asp:label id="Label3" style="Z-INDEX: 110; LEFT: 385px; POSITION: absolute; TOP: 73px" runat="server"
								BackColor="Black" Font-Size="XX-Small" ForeColor="White" Width="60px" Font-Names="Microsoft Sans Serif">Active ATM</asp:label>
							<asp:label id="Label8" style="Z-INDEX: 107; LEFT: 384px; POSITION: absolute; TOP: 85px" runat="server"
								BackColor="Black" Font-Size="XX-Small" ForeColor="White" Width="60px" Font-Names="Microsoft Sans Serif">Card Reader</asp:label>
							<asp:imagebutton id="activeCardImageButton" style="Z-INDEX: 111; LEFT: 449px; POSITION: absolute; TOP: 71px"
								runat="server" Width="97px" Height="72px" ImageUrl="/VirtualBranchBanking/picture/card2.jpg"></asp:imagebutton>
							<asp:label id="nowInsertLabel" style="Z-INDEX: 101; LEFT: 446px; POSITION: absolute; TOP: 146px"
								runat="server" BackColor="Black" Font-Size="XX-Small" ForeColor="White" Width="100px" Height="3px"
								Font-Names="Microsoft Sans Serif" Visible="False">Now, Card is inserted</asp:label>
							<asp:label id="cardNoInsertLabel" style="Z-INDEX: 102; LEFT: 394px; POSITION: absolute; TOP: 169px"
								runat="server" BackColor="Black" Font-Size="XX-Small" ForeColor="White" Width="53px" Font-Names="Microsoft Sans Serif"
								Visible="False">Card No. is</asp:label>
							<asp:label id="pinLabel" style="Z-INDEX: 104; LEFT: 428px; POSITION: absolute; TOP: 188px"
								runat="server" BackColor="Black" Font-Size="XX-Small" ForeColor="White" Width="19px" Height="16px"
								Font-Names="Microsoft Sans Serif" Visible="False">PIN</asp:label>
							<asp:textbox id="cardNoInsertTextBox" style="Z-INDEX: 106; LEFT: 450px; POSITION: absolute; TOP: 164px"
								runat="server" Width="112px" EnableViewState="False" Visible="False"></asp:textbox>
							<asp:textbox id="pinInsertTextBox" style="Z-INDEX: 112; LEFT: 450px; POSITION: absolute; TOP: 187px"
								runat="server" Width="81px" EnableViewState="False" Visible="False" TextMode="Password"></asp:textbox><asp:imagebutton id="enterPinButton" style="Z-INDEX: 113; LEFT: 451px; POSITION: absolute; TOP: 212px"
								runat="server" Width="82px" Height="23px" ImageUrl="\VirtualBranchBanking\picture\loginButton.jpg" Visible="False"></asp:imagebutton>
							<asp:hyperlink id="HyperLink1" style="Z-INDEX: 108; LEFT: 604px; POSITION: absolute; TOP: 0px"
								runat="server" BackColor="Black" Font-Size="XX-Small" ForeColor="White" Width="47px" Height="16px"
								Font-Names="Microsoft Sans Serif" Font-Bold="True" NavigateUrl="/VirtualBranchBanking/registerPage.aspx">Sign up</asp:hyperlink>
							<asp:label id="Label6" style="Z-INDEX: 116; LEFT: 385px; POSITION: absolute; TOP: 98px" runat="server"
								BackColor="Black" Font-Size="XX-Small" ForeColor="White" Width="60px" Font-Names="Microsoft Sans Serif">Click here >></asp:label></DIV>
						<asp:Label id="Label7" runat="server" BackColor="Black" ForeColor="Black" Width="650px" Font-Names="Arial"></asp:Label>
					</TD>
				</TR>
			</TABLE>
			<asp:Label id="Label2" style="Z-INDEX: 105; LEFT: 56px; POSITION: absolute; TOP: 426px" runat="server"
				Font-Size="XX-Small" Width="499px" Font-Names="Arial">@ Copyright by Computer Engineering faculty, King Mongkut's Institute of Technology Ladkrabang, 2006</asp:Label>
		</form>
	</body>
</HTML>
