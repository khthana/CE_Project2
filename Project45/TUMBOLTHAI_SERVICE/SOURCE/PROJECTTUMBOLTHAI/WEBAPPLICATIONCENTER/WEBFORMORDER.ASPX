<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormOrder.aspx.vb" Inherits="WebApplicationCenter.WebFormOrder"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormOrder</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" BGCOLOR="#ffffcc">
		<form id="Form1" method="post" runat="server">
			<FONT face="MS Sans Serif, Microsoft Sans Serif" size="2">
				<asp:DataGrid id="DataGrid1" style="Z-INDEX: 101; LEFT: 56px; POSITION: absolute; TOP: 230px" runat="server" Width="771px" Height="91px"></asp:DataGrid>
				<asp:Label id="Label2" style="Z-INDEX: 106; LEFT: 388px; POSITION: absolute; TOP: 132px" runat="server" Width="87px" Height="21px">รหัสผ่าน</asp:Label>
				<asp:TextBox id="txtUserName" style="Z-INDEX: 102; LEFT: 174px; POSITION: absolute; TOP: 166px" runat="server" Width="162px" Height="23px" TextMode="Password" tabIndex="1"></asp:TextBox>
				<asp:TextBox id="txtPassword" style="Z-INDEX: 103; LEFT: 383px; POSITION: absolute; TOP: 165px" runat="server" Width="159px" Height="24px" TextMode="Password" tabIndex="2"></asp:TextBox>
				<asp:Button id="btnOk" style="Z-INDEX: 104; LEFT: 594px; POSITION: absolute; TOP: 162px" runat="server" Width="96px" Height="32px" Text="ตกลง" tabIndex="3"></asp:Button>
				<asp:Label id="Label1" style="Z-INDEX: 105; LEFT: 179px; POSITION: absolute; TOP: 134px" runat="server" Width="87px" Height="21px">ชื่อสมาชิก</asp:Label>
				<asp:Label id="Label3" style="Z-INDEX: 107; LEFT: 230px; POSITION: absolute; TOP: 30px" runat="server" Width="327px" Height="76px" Font-Bold="True" Font-Size="XX-Large">สำหรับพ่อค้า</asp:Label></FONT>
		</form>
	</body>
</HTML>
