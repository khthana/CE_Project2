<%@ Page Language="vb" AutoEventWireup="false" Codebehind="index.aspx.vb" Inherits="BillerBanking.index"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Biller (Log in)</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma"></FONT>
			<asp:hyperlink id="HyperLink1" style="Z-INDEX: 137; LEFT: 616px; POSITION: absolute; TOP: 48px"
				runat="server" Font-Bold="True" Font-Size="Smaller" Font-Names="Arial" NavigateUrl="/BillerBanking/registerPage.aspx"
				ForeColor="MidnightBlue">Sign up</asp:hyperlink>
			<TABLE id="Table3" style="Z-INDEX: 138; LEFT: 24px; WIDTH: 656px; POSITION: absolute; TOP: 72px; HEIGHT: 312px"
				borderColor="#660000" cellSpacing="1" cellPadding="1" width="656" border="1">
				<TR>
					<TD background="\Banking\Picture\bg_btm.jpg">
						<DIV style="WIDTH: 648px; POSITION: relative; HEIGHT: 284px" ms_positioning="GridLayout">
							<asp:button id="userloginButton" style="Z-INDEX: 101; LEFT: 224px; POSITION: absolute; TOP: 128px"
								tabIndex="3" runat="server" Text="Enter"></asp:button>
							<asp:textbox id="passwordTextBox" style="Z-INDEX: 102; LEFT: 200px; POSITION: absolute; TOP: 64px"
								tabIndex="2" runat="server" Width="136px" EnableViewState="False" TextMode="Password"></asp:textbox>
							<asp:textbox id="usernameTextBox" style="Z-INDEX: 103; LEFT: 200px; POSITION: absolute; TOP: 32px"
								tabIndex="1" runat="server" Width="136px" EnableViewState="False"></asp:textbox>
							<asp:label id="Label3" style="Z-INDEX: 104; LEFT: 136px; POSITION: absolute; TOP: 64px" runat="server"
								BackColor="Transparent" ForeColor="White" Font-Size="Smaller">Password</asp:label>
							<asp:label id="Label2" style="Z-INDEX: 105; LEFT: 136px; POSITION: absolute; TOP: 32px" runat="server"
								BackColor="Transparent" ForeColor="White" Font-Size="Smaller">Username</asp:label>
							<asp:label id="showtext" style="Z-INDEX: 106; LEFT: 216px; POSITION: absolute; TOP: 96px" runat="server"
								BackColor="Transparent" ForeColor="White" Font-Names="Microsoft Sans Serif"></asp:label></DIV>
					</TD>
				</TR>
			</TABLE>
			<TABLE id="Table1" style="Z-INDEX: 104; LEFT: 24px; POSITION: absolute; TOP: 24px" height="36"
				cellSpacing="0" cellPadding="0" width="167" border="0">
				<TR>
					<TD background="\Banking\Picture\bb00201g.gif">
						<asp:label id="loginLabel" runat="server" BackColor="Transparent" ForeColor="White" Font-Names="Tahoma"
							Font-Size="Larger" Font-Bold="True">Log in</asp:label></TD>
				</TR>
			</TABLE>
			<TABLE id="Table2" style="Z-INDEX: 105; LEFT: 184px; WIDTH: 496px; POSITION: absolute; TOP: 24px; HEIGHT: 22px"
				height="22" cellSpacing="0" cellPadding="0" width="496" border="0">
				<TR>
					<TD style="WIDTH: 347px" background="\Banking\Picture\bb00401g.gif"></TD>
					<TD style="WIDTH: 65px" background="\Banking\Picture\bb00403g.gif"></TD>
					<TD style="WIDTH: 62px" background="\Banking\Picture\bg-end.jpg"></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
