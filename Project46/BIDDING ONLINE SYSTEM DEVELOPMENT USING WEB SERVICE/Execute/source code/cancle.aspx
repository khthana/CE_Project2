<%@ Page language="c#" Codebehind="cancle.aspx.cs" AutoEventWireup="false" Inherits="project.cancle" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>cancle</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio 7.0">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="cancle" method="post" runat="server">
			<FONT face="Tahoma">
				<asp:Label id="Label1" style="Z-INDEX: 101; LEFT: 139px; POSITION: absolute; TOP: 65px" runat="server">  ใส่Password ของผู้มีสิทธิยกเลิกการประกวด</asp:Label>
				<asp:Label id="Label3" style="Z-INDEX: 103; LEFT: 144px; POSITION: absolute; TOP: 206px" runat="server">Password</asp:Label>
				<asp:TextBox id="TextBox2" style="Z-INDEX: 105; LEFT: 268px; POSITION: absolute; TOP: 211px" runat="server" TextMode="Password"></asp:TextBox>
				<asp:Button id="Button1" style="Z-INDEX: 106; LEFT: 237px; POSITION: absolute; TOP: 292px" runat="server" Text="Button"></asp:Button>
				<INPUT style="Z-INDEX: 107; LEFT: 360px; POSITION: absolute; TOP: 294px" type="reset" value="Reset">
			</FONT>
		</form>
	</body>
</HTML>
