<%@ Page Language="vb" AutoEventWireup="false" Codebehind="index.aspx.vb" Inherits="Banking.StartPage" EnableSessionState="True" enableViewState="False"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Banking System (Login)</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT language="vb" face="Tahoma">
				<TABLE id="Table3" style="Z-INDEX: 101; LEFT: 24px; WIDTH: 656px; POSITION: absolute; TOP: 72px; HEIGHT: 312px"
					cellSpacing="1" cellPadding="1" width="656" border="1" borderColor="#660000">
					<TR>
						<TD background="\Banking\Picture\bg_btm.jpg">
							<DIV style="WIDTH: 648px; POSITION: relative; HEIGHT: 284px" ms_positioning="GridLayout">
								<asp:button id="enterButton" style="Z-INDEX: 101; LEFT: 224px; POSITION: absolute; TOP: 128px"
									tabIndex="3" runat="server" Text="Enter"></asp:button>
								<asp:textbox id="passwordTextBox" style="Z-INDEX: 102; LEFT: 200px; POSITION: absolute; TOP: 64px"
									tabIndex="2" runat="server" Width="136px" TextMode="Password" EnableViewState="False"></asp:textbox>
								<asp:textbox id="usernameTextBox" style="Z-INDEX: 103; LEFT: 200px; POSITION: absolute; TOP: 32px"
									tabIndex="1" runat="server" Width="136px" EnableViewState="False"></asp:textbox>
								<asp:label id="Label3" style="Z-INDEX: 104; LEFT: 136px; POSITION: absolute; TOP: 64px" runat="server"
									Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Password</asp:label>
								<asp:label id="Label2" style="Z-INDEX: 105; LEFT: 136px; POSITION: absolute; TOP: 32px" runat="server"
									Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Username</asp:label>
								<asp:label id="Label1" style="Z-INDEX: 106; LEFT: 216px; POSITION: absolute; TOP: 96px" runat="server"
									Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent"></asp:label>
								<asp:hyperlink id="HyperLink1" style="Z-INDEX: 107; LEFT: 552px; POSITION: absolute; TOP: 0px"
									runat="server" Font-Size="Smaller" ForeColor="White" NavigateUrl="AddAdminPage.aspx" BackColor="Transparent">Add New Admin</asp:hyperlink></DIV>
						</TD>
					</TR>
				</TABLE>
				<asp:Label id="BankNameLabel" style="Z-INDEX: 102; LEFT: 200px; POSITION: absolute; TOP: 48px"
					runat="server" Font-Size="Smaller"></asp:Label>
				<asp:Label id="BankLocationLabel" style="Z-INDEX: 103; LEFT: 312px; POSITION: absolute; TOP: 48px"
					runat="server" Font-Size="Smaller"></asp:Label>
				<TABLE id="Table1" style="Z-INDEX: 104; LEFT: 24px; POSITION: absolute; TOP: 24px" cellSpacing="0"
					cellPadding="0" width="167" border="0" height="36">
					<TR>
						<TD background="\Banking\Picture\bb00201g.gif">
							<asp:label id="loginLabel" runat="server" BackColor="Transparent" ForeColor="White" Font-Bold="True"
								Font-Size="Larger" Font-Names="Tahoma">Log in</asp:label></TD>
					</TR>
				</TABLE>
				<TABLE id="Table2" style="Z-INDEX: 105; LEFT: 184px; WIDTH: 496px; POSITION: absolute; TOP: 24px; HEIGHT: 22px"
					cellSpacing="0" cellPadding="0" width="496" border="0" height="22">
					<TR>
						<TD style="WIDTH: 347px" background="\Banking\Picture\bb00401g.gif"></TD>
						<TD background="\Banking\Picture\bb00403g.gif" style="WIDTH: 65px"></TD>
						<TD style="WIDTH: 62px" background="\Banking\Picture\bg-end.jpg"></TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
