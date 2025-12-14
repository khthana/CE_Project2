<%@ Page Language="vb" AutoEventWireup="false" Codebehind="AddAdminPage.aspx.vb" Inherits="Banking.AddAdminPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Add New Admin</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" style="Z-INDEX: 111; LEFT: 24px; POSITION: absolute; TOP: 24px" height="36"
				cellSpacing="0" cellPadding="0" width="167" border="0">
				<TR>
					<TD background="\Banking\Picture\bb00201g.gif">
						<asp:label id="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium"
							ForeColor="White" BackColor="Transparent">Add New Admin</asp:label></TD>
				</TR>
			</TABLE>
			<TABLE id="Table2" style="Z-INDEX: 107; LEFT: 184px; WIDTH: 496px; POSITION: absolute; TOP: 24px; HEIGHT: 22px"
				height="22" cellSpacing="0" cellPadding="0" width="496" border="0">
				<TR>
					<TD style="WIDTH: 347px" background="\Banking\Picture\bb00401g.gif"></TD>
					<TD style="WIDTH: 65px" background="\Banking\Picture\bb00403g.gif"></TD>
					<TD style="WIDTH: 62px" background="\Banking\Picture\bg-end.jpg"></TD>
				</TR>
			</TABLE>
			<FONT language="vb" face="Tahoma">
				<TABLE id="Table3" style="Z-INDEX: 101; LEFT: 24px; WIDTH: 656px; POSITION: absolute; TOP: 72px; HEIGHT: 312px"
					borderColor="#660000" cellSpacing="1" cellPadding="1" width="656" border="1">
					<TR>
						<TD background="\Banking\Picture\bg_btm.jpg">
							<DIV style="WIDTH: 648px; POSITION: relative; HEIGHT: 284px" ms_positioning="GridLayout"><asp:textbox id="confirmPassword" style="Z-INDEX: 112; LEFT: 280px; POSITION: absolute; TOP: 120px"
									runat="server" TextMode="Password" EnableViewState="False"></asp:textbox><asp:label id="Label4" style="Z-INDEX: 112; LEFT: 160px; POSITION: absolute; TOP: 120px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Confirm Password</asp:label><asp:button id="submitButton" style="Z-INDEX: 112; LEFT: 312px; POSITION: absolute; TOP: 184px"
									runat="server" Text="Submit"></asp:button><asp:textbox id="passwordTextBox" style="Z-INDEX: 112; LEFT: 280px; POSITION: absolute; TOP: 88px"
									runat="server" TextMode="Password" EnableViewState="False"></asp:textbox><asp:textbox id="usernameTextBox" style="Z-INDEX: 112; LEFT: 280px; POSITION: absolute; TOP: 56px"
									runat="server" EnableViewState="False" Width="144px"></asp:textbox><asp:label id="Label3" style="Z-INDEX: 112; LEFT: 208px; POSITION: absolute; TOP: 88px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Password</asp:label><asp:label id="Label2" style="Z-INDEX: 112; LEFT: 208px; POSITION: absolute; TOP: 56px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Username</asp:label><asp:label id="showtext" style="Z-INDEX: 112; LEFT: 312px; POSITION: absolute; TOP: 152px"
									runat="server" Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent"></asp:label></DIV>
						</TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
