<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormInBasket.aspx.vb" Inherits="WebApplicationCenter.WebFormInBasket"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormInBasket</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body bgColor="#ffffcc" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="MS Sans Serif, Microsoft Sans Serif" size="2">
				<asp:datagrid id=DataGrid1 style="Z-INDEX: 101; LEFT: 146px; POSITION: absolute; TOP: 183px" runat="server" DataSource="<%# DataSet1 %>" Height="99px" Width="503px">
				</asp:datagrid>
				<asp:Label id="Label12" style="Z-INDEX: 137; LEFT: 246px; POSITION: absolute; TOP: 37px" runat="server" Width="291px" Height="60px" Font-Size="XX-Large" Font-Bold="True">สินค้าในตะกร้า</asp:Label>
				<asp:Label id="lblSum" style="Z-INDEX: 102; LEFT: 414px; POSITION: absolute; TOP: 140px" runat="server" Height="32px" Width="160px"></asp:Label>
				<asp:Label id="Label1" style="Z-INDEX: 103; LEFT: 314px; POSITION: absolute; TOP: 141px" runat="server" Height="29px" Width="92px">รวมเงินทั้งสิ้น</asp:Label>
				<asp:Label id="Label2" style="Z-INDEX: 104; LEFT: 580px; POSITION: absolute; TOP: 142px" runat="server" Height="29px" Width="67px">บาท</asp:Label></FONT></form>
	</body>
</HTML>
