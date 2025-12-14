<%@ Page language="c#" Codebehind="email.aspx.cs" AutoEventWireup="false" Inherits="project.email" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>email</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio 7.0">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="email" method="post" runat="server">
			<asp:TextBox id="txtnews" style="Z-INDEX: 101; LEFT: 355px; POSITION: absolute; TOP: 175px" runat="server" Height="128px"></asp:TextBox>
			<asp:TextBox id="txtsubject" style="Z-INDEX: 102; LEFT: 356px; POSITION: absolute; TOP: 120px" runat="server"></asp:TextBox>
			<asp:Button id="Button1" style="Z-INDEX: 103; LEFT: 331px; POSITION: absolute; TOP: 346px" runat="server" Text="Button"></asp:Button>
			<asp:Label id="Label1" style="Z-INDEX: 104; LEFT: 226px; POSITION: absolute; TOP: 184px" runat="server">ข้อความ</asp:Label>
			<INPUT style="Z-INDEX: 105; LEFT: 496px; POSITION: absolute; TOP: 349px" type="reset" value="Reset">
			<asp:Label id="Label2" style="Z-INDEX: 106; LEFT: 233px; POSITION: absolute; TOP: 118px" runat="server">หัวข้อ</asp:Label>
			<asp:Label id="Label3" style="Z-INDEX: 107; LEFT: 174px; POSITION: absolute; TOP: 58px" runat="server">Label</asp:Label>
			<asp:Label id="Label4" style="Z-INDEX: 108; LEFT: 278px; POSITION: absolute; TOP: 85px" runat="server">Email นี้ จะส่งให้ผู้ประกอบการทุกรายที่เข้าประกวด</asp:Label>
		</form>
	</body>
</HTML>
