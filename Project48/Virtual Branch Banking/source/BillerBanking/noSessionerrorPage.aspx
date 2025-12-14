<%@ Page Language="vb" AutoEventWireup="false" Codebehind="noSessionerrorPage.aspx.vb" Inherits="BillerBanking.noSessionerroePage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>noSessionerroePage</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:Label id="Label1" style="Z-INDEX: 105; LEFT: 56px; POSITION: absolute; TOP: 40px" runat="server"
				Font-Bold="True" Font-Names="Arial" Font-Size="Smaller">Session expired , Please log in again...</asp:Label>
			<asp:label id="Label3" style="Z-INDEX: 104; LEFT: 56px; POSITION: absolute; TOP: 56px" runat="server"
				Font-Names="Microsoft Sans Serif" Font-Size="X-Small" ForeColor="Window" Width="656px"
				Height="8px" BorderColor="White" BackColor="Maroon">Virtual Branch Banking</asp:label>
			<asp:HyperLink id="HyperLink1" style="Z-INDEX: 102; LEFT: 56px; POSITION: absolute; TOP: 72px"
				runat="server" Font-Names="Arial" Font-Size="Smaller" ForeColor="Blue" Target="_self" NavigateUrl="/BillerBanking/index.aspx">Log in</asp:HyperLink>
		</form>
	</body>
</HTML>
