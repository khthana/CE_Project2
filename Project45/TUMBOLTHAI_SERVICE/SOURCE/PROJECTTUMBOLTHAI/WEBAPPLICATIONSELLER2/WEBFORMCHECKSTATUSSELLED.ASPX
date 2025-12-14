<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormCheckStatusSelled.aspx.vb" Inherits="WebApplicationSeller2.WebFormCheckStatusSelled"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormCheckStatusSelled</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" BGCOLOR="#cc9966">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma">
				<asp:Label id="Label2" style="Z-INDEX: 106; LEFT: 134px; POSITION: absolute; TOP: 64px" runat="server" Width="483px" Height="64px" Font-Size="XX-Large" Font-Bold="True">รายการที่ทำการสั่งซื้อ</asp:Label>
				<asp:Label id="Label3" style="Z-INDEX: 103; LEFT: 462px; POSITION: absolute; TOP: 164px" runat="server" Width="281px" Height="55px">ท่านสามารถเข้ามาดู สถานะการจ่ายเงิน และ สถานะการส่งสินค้าได้ที่ รายการตรวจสอบสินค้าที่ซื้อ</asp:Label>
				<asp:Button id="Button1" style="Z-INDEX: 105; LEFT: 355px; POSITION: absolute; TOP: 204px" runat="server" Width="83px" Height="33px" Text="Back"></asp:Button>
				<asp:Label id="Label1" style="Z-INDEX: 102; LEFT: 14px; POSITION: absolute; TOP: 166px" runat="server" Width="299px" Height="62px">รายระเอียดของสินค้าที่ซื้อในครั้งนี้ทางร้านได้จัดส่งไปใน Email เรียบร้อยแล้ว ถ้าต้องการรายละเอียดเพิ่มเติม สามารถติดต่อเราได้ที่ 0-2356-6853 ตลอด 24 ซ.ม.</asp:Label><FONT face="MS Sans Serif, Microsoft Sans Serif" size="2">
					<asp:DataGrid id=DataGrid1 style="Z-INDEX: 101; LEFT: 12px; POSITION: absolute; TOP: 255px" runat="server" Width="752px" Height="56px" DataSource="<%# DataSet1 %>">
					</asp:DataGrid></FONT></FONT>
		</form>
	</body>
</HTML>
