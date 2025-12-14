<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormSearch.aspx.vb" Inherits="WebApplicationSeller1.WebFormSearch"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormSearch</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" BACKGROUND="pic/snows.gif">
		<form id="Form1" method="post" runat="server">
			<asp:textbox id="txtNameSearch" style="Z-INDEX: 103; LEFT: 207px; POSITION: absolute; TOP: 111px" runat="server" Width="118px" Height="21px"></asp:textbox>
			<asp:Label id="Label4" style="Z-INDEX: 110; LEFT: 464px; POSITION: absolute; TOP: 83px" runat="server" Height="21px" Width="85px">ราคาไม่เกิน</asp:Label>
			<asp:Label id="Label2" style="Z-INDEX: 109; LEFT: 326px; POSITION: absolute; TOP: 83px" runat="server" Height="21px" Width="130px">ลายระเอียดเพิ่มเติม</asp:Label>
			<asp:textbox id="txtPrice" style="Z-INDEX: 106; LEFT: 455px; POSITION: absolute; TOP: 111px" runat="server" Height="21px" Width="75px"></asp:textbox>
			<asp:textbox id="txtDetail" style="Z-INDEX: 105; LEFT: 330px; POSITION: absolute; TOP: 111px" runat="server" Height="21px" Width="118px"></asp:textbox>
			<asp:button id="btnSearch" style="Z-INDEX: 100; LEFT: 668px; POSITION: absolute; TOP: 109px" runat="server" Width="64px" Text="ค้นหา"></asp:button>
			<asp:dropdownlist id="ddlFrom" style="Z-INDEX: 101; LEFT: 536px; POSITION: absolute; TOP: 111px" runat="server" Width="122px">
				<asp:ListItem Value="0" Selected="True">ภายในร้าน</asp:ListItem>
				<asp:ListItem Value="1">ทุกๆร้าน</asp:ListItem>
			</asp:dropdownlist>
			<asp:label id="Label3" style="Z-INDEX: 102; LEFT: 115px; POSITION: absolute; TOP: 112px" runat="server" Width="81px" Height="17px">ค้นหาสินค้า</asp:label>
			<asp:DataGrid id=DataGrid1 style="Z-INDEX: 104; LEFT: 179px; POSITION: absolute; TOP: 154px" runat="server" Width="483px" Height="135px" DataSource="<%# DataSet1 %>">
			</asp:DataGrid>
			<asp:Label id="Label1" style="Z-INDEX: 107; LEFT: 213px; POSITION: absolute; TOP: 83px" runat="server" Height="21px" Width="69px">ชื่อสินค้า</asp:Label>
		</form>
	</body>
</HTML>
