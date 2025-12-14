<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormInBasket.aspx.vb" Inherits="WebApplicationSeller2.WebFormInBasket"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormInBasket</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" BGCOLOR="#cc9966">
		<form id="Form1" method="post" runat="server">
			<FONT face="MS Sans Serif, Microsoft Sans Serif" size="2">
				<asp:datagrid id=DataGrid1 style="Z-INDEX: 100; LEFT: 149px; POSITION: absolute; TOP: 119px" runat="server" DataSource="<%# DataSet1 %>" Height="99px" Width="503px">
				</asp:datagrid>
				<asp:Button id="btnCheckOut" style="Z-INDEX: 106; LEFT: 696px; POSITION: absolute; TOP: 178px" runat="server" Width="84px" Height="33px" Text="จ่ายเงิน"></asp:Button>
				<asp:Label id="lblSum" style="Z-INDEX: 101; LEFT: 414px; POSITION: absolute; TOP: 76px" runat="server" Height="32px" Width="160px"></asp:Label>
				<asp:Label id="Label1" style="Z-INDEX: 102; LEFT: 314px; POSITION: absolute; TOP: 77px" runat="server" Height="29px" Width="92px">รวมเงินทั้งสิ้น</asp:Label>
				<asp:Label id="Label2" style="Z-INDEX: 103; LEFT: 580px; POSITION: absolute; TOP: 78px" runat="server" Height="29px" Width="67px">บาท</asp:Label>
				<asp:Button id="btnContinue" style="Z-INDEX: 105; LEFT: 697px; POSITION: absolute; TOP: 127px" runat="server" Width="84px" Height="33px" Text="ซื้อสินค้าต่อ"></asp:Button></FONT>
		</form>
	</body>
</HTML>
