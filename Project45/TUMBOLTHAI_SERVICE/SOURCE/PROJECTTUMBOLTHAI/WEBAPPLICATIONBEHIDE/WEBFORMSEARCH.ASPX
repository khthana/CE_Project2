<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormSearch.aspx.vb" Inherits="WebApplicationBehide.WebForm1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebForm1</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma">
				<asp:DataGrid id=DataGrid1 style="Z-INDEX: 101; LEFT: 33px; POSITION: absolute; TOP: 120px" runat="server" Width="743px" Height="91px" DataSource="<%# DataSet1 %>">
				</asp:DataGrid>
				<asp:TextBox id="txtName" style="Z-INDEX: 102; LEFT: 225px; POSITION: absolute; TOP: 80px" runat="server" Width="198px" Height="25px"></asp:TextBox>
				<asp:Button id="btnOK" style="Z-INDEX: 103; LEFT: 464px; POSITION: absolute; TOP: 81px" runat="server" Width="85px" Height="28px" Text="ค้นหา"></asp:Button>
				<asp:Label id="Label1" style="Z-INDEX: 104; LEFT: 128px; POSITION: absolute; TOP: 77px" runat="server" Width="73px" Height="29px">ชื่อสินค้า</asp:Label>
				<asp:Label id="Label2" style="Z-INDEX: 105; LEFT: 243px; POSITION: absolute; TOP: 14px" runat="server" Height="48px" Width="323px" Font-Size="Large">การจ่ายเงินและจักส่งสินค้า</asp:Label></FONT>
		</form>
	</body>
</HTML>
