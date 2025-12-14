<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormLogin.aspx.vb" Inherits="WebApplicationSeller1.WebFormLogin"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormLogin</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body background="pic/snows.gif" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma">
				<asp:textbox id="txtUsername" style="Z-INDEX: 106; LEFT: 226px; POSITION: absolute; TOP: 145px" runat="server" Width="118px" Height="21px"></asp:textbox>
				<DIV style="DISPLAY: inline; Z-INDEX: 113; LEFT: 252px; WIDTH: 41px; POSITION: absolute; TOP: 287px; HEIGHT: 21px" ms_positioning="FlowLayout"><A href="WEBFORMbag1.aspx">Back</A></DIV>
				<asp:label id="lblShowLogin" style="Z-INDEX: 107; LEFT: 383px; POSITION: absolute; TOP: 150px" runat="server" Width="315px" Height="71px"></asp:label><asp:button id="btnLogout" style="Z-INDEX: 105; LEFT: 281px; POSITION: absolute; TOP: 213px" runat="server" Width="64px" Text="ออกระบบ"></asp:button><asp:button id="btnLogin" style="Z-INDEX: 104; LEFT: 208px; POSITION: absolute; TOP: 213px" runat="server" Width="64px" Text="เข้าระบบ"></asp:button><asp:textbox id="txtPassword" style="Z-INDEX: 103; LEFT: 225px; POSITION: absolute; TOP: 180px" runat="server" Width="118px" Height="21px"></asp:textbox><asp:label id="Label2" style="Z-INDEX: 101; LEFT: 171px; POSITION: absolute; TOP: 179px" runat="server" Width="28px" Height="17px">รหัส</asp:label><asp:label id="Label1" style="Z-INDEX: 102; LEFT: 151px; POSITION: absolute; TOP: 149px" runat="server" Width="68px" Height="17px">ชื่อสมาชิก</asp:label><asp:label id="lblDetail" style="Z-INDEX: 112; LEFT: 382px; POSITION: absolute; TOP: 225px" runat="server" Width="319px" Height="181px">Label</asp:label></FONT></form>
	</body>
</HTML>
