<%@ Page Language="vb" AutoEventWireup="false" Codebehind="registerPage.aspx.vb" Inherits="BillerBanking.registerPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>registerPage</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:textbox id="usernameTextBox" style="Z-INDEX: 157; LEFT: 360px; POSITION: absolute; TOP: 160px"
				runat="server" Width="144px"></asp:textbox>
			<asp:textbox id="passwordTextBox" style="Z-INDEX: 102; LEFT: 360px; POSITION: absolute; TOP: 192px"
				runat="server" TextMode="Password" EnableViewState="False"></asp:textbox>
			<asp:textbox id="confirmPasswordTextBox" style="Z-INDEX: 103; LEFT: 360px; POSITION: absolute; TOP: 224px"
				runat="server" Width="144px" TextMode="Password" EnableViewState="False"></asp:textbox><FONT face="Tahoma">
				<asp:button id="submitButton" style="Z-INDEX: 104; LEFT: 360px; POSITION: absolute; TOP: 296px"
					runat="server" Text="Submit"></asp:button></FONT>
			<asp:Label id="Label28" style="Z-INDEX: 156; LEFT: 56px; POSITION: absolute; TOP: 56px" runat="server"
				Width="657px" ForeColor="White" Height="8px" BackColor="Maroon" Font-Size="X-Small" Font-Names="Microsoft Sans Serif">Virtual Branch Banking</asp:Label>
			<asp:label id="showtext" style="Z-INDEX: 105; LEFT: 360px; POSITION: absolute; TOP: 264px"
				runat="server" ForeColor="Red"></asp:label>
			<asp:label id="Label1" style="Z-INDEX: 106; LEFT: 296px; POSITION: absolute; TOP: 160px" runat="server">Username</asp:label>
			<asp:label id="Label2" style="Z-INDEX: 107; LEFT: 296px; POSITION: absolute; TOP: 192px" runat="server">Password</asp:label>
			<asp:label id="Label3" style="Z-INDEX: 108; LEFT: 248px; POSITION: absolute; TOP: 224px" runat="server">Confirm 
      Password</asp:label>
			<asp:label id="Label12" style="Z-INDEX: 109; LEFT: 600px; POSITION: absolute; TOP: 72px" runat="server">Required Fields (*)</asp:label>
			<asp:label id="Label13" style="Z-INDEX: 110; LEFT: 256px; POSITION: absolute; TOP: 120px" runat="server"
				ForeColor="ControlText" Font-Bold="True">Define Username & Password</asp:label>
			<asp:hyperlink id="HyperLink1" style="Z-INDEX: 111; LEFT: 56px; POSITION: absolute; TOP: 72px"
				runat="server" NavigateUrl="index.aspx">Home</asp:hyperlink>
			<asp:hyperlink id="HyperLink2" style="Z-INDEX: 112; LEFT: 56px; POSITION: absolute; TOP: 96px"
				runat="server">Log in</asp:hyperlink>
			<asp:label id="Label5" style="Z-INDEX: 115; LEFT: 280px; POSITION: absolute; TOP: 80px" runat="server">Merchant ID</asp:label>
			<asp:textbox id="merIDTextBox" style="Z-INDEX: 116; LEFT: 360px; POSITION: absolute; TOP: 80px"
				runat="server" Width="144px"></asp:textbox>
			<asp:label id="Label7" style="Z-INDEX: 119; LEFT: 56px; POSITION: absolute; TOP: 32px" runat="server"
				Font-Size="Medium" Font-Names="Arial" Font-Bold="True">Registation Form</asp:label>
		</form>
	</body>
</HTML>
