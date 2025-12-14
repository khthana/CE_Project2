<%@ Page Language="vb" AutoEventWireup="false" Codebehind="MainmenuPage.aspx.vb" Inherits="BillerBanking.MainmenuPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Main Menu</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma">
				<TABLE id="Table3" style="Z-INDEX: 111; LEFT: 24px; WIDTH: 656px; POSITION: absolute; TOP: 72px; HEIGHT: 312px"
					borderColor="#660000" cellSpacing="1" cellPadding="1" width="656" border="1">
					<TR>
						<TD background="\Banking\Picture\bg_btm.jpg">
							<DIV style="WIDTH: 648px; POSITION: relative; HEIGHT: 284px" ms_positioning="GridLayout">
								<asp:LinkButton id="accsumLinkButton" style="Z-INDEX: 112; LEFT: 216px; POSITION: absolute; TOP: 40px"
									runat="server" Font-Names="Arial" Font-Size="Smaller" ForeColor="White">Account Summary</asp:LinkButton>
								<asp:Label id="Label2" style="Z-INDEX: 112; LEFT: 152px; POSITION: absolute; TOP: 16px" runat="server"
									Font-Bold="True" Font-Names="Arial" Font-Size="Smaller" ForeColor="White">Access Account</asp:Label>
								<asp:Label id="Label3" style="Z-INDEX: 112; LEFT: 152px; POSITION: absolute; TOP: 64px" runat="server"
									Font-Bold="True" Font-Names="Arial" Font-Size="Smaller" ForeColor="White">Payment</asp:Label>
								<asp:LinkButton id="payhisLinkButton" style="Z-INDEX: 112; LEFT: 216px; POSITION: absolute; TOP: 88px"
									runat="server" Font-Names="Arial" Font-Size="Smaller" ForeColor="White">Payment History</asp:LinkButton></DIV>
						</TD>
					</TR>
				</TABLE>
				<TABLE id="Table1" style="Z-INDEX: 104; LEFT: 24px; POSITION: absolute; TOP: 24px" height="36"
					cellSpacing="0" cellPadding="0" width="167" border="0">
					<TR>
						<TD background="\Banking\Picture\bb00201g.gif">
							<asp:label id="loginLabel" runat="server" Font-Size="Larger" Font-Names="Tahoma" Font-Bold="True"
								BackColor="Transparent" ForeColor="White">Main Menu</asp:label></TD>
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
				<asp:Label id="Label4" style="Z-INDEX: 109; LEFT: 536px; POSITION: absolute; TOP: 48px" runat="server"
					Font-Size="X-Small" Font-Names="Tahoma" ForeColor="Black">Hello</asp:Label>
				<asp:Label id="userLabel" style="Z-INDEX: 110; LEFT: 568px; POSITION: absolute; TOP: 48px"
					runat="server" Font-Size="X-Small" Font-Names="Tahoma" ForeColor="Maroon"></asp:Label></FONT>
		</form>
	</body>
</HTML>
