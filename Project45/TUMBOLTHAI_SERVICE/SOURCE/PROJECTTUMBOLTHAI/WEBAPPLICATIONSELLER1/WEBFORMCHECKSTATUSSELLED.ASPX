<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormCheckStatusSelled.aspx.vb" Inherits="WebApplicationSeller1.WebFormCheckStatusSelled"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormCheckStatusSelled</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" BACKGROUND="pic/snows.gif">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma">
				<asp:Label id="Label2" style="Z-INDEX: 104; LEFT: 138px; POSITION: absolute; TOP: 52px" runat="server" Font-Bold="True" Font-Size="XX-Large" Height="64px" Width="483px">รายการที่ทำการสั่งซื้อ</asp:Label>
				<asp:Label id="Label3" style="Z-INDEX: 103; LEFT: 462px; POSITION: absolute; TOP: 164px" runat="server" Height="55px" Width="281px">ท่านสามารถเข้ามาดู สถานะการจ่ายเงิน และ สถานะการส่งสินค้าได้ที่ รายการตรวจสอบสินค้าที่ซื้อ</asp:Label>
				<asp:Label id="Label1" style="Z-INDEX: 102; LEFT: 14px; POSITION: absolute; TOP: 166px" runat="server" Height="62px" Width="299px">รายระเอียดของสินค้าที่ซื้อในครั้งนี้ทางร้านได้จัดส่งไปใน Email เรียบร้อยแล้ว ถ้าต้องการรายละเอียดเพิ่มเติม สามารถติดต่อเราได้ที่ 0-2356-6853 ตลอด 24 ซ.ม.</asp:Label><FONT face="MS Sans Serif, Microsoft Sans Serif" size="2">
					<asp:DataGrid id=DataGrid2 style="Z-INDEX: 101; LEFT: 12px; POSITION: absolute; TOP: 255px" runat="server" Height="56px" Width="752px" DataSource="<%# DataSet1 %>">
					</asp:DataGrid>
					<asp:Button id="Button1" style="Z-INDEX: 105; LEFT: 355px; POSITION: absolute; TOP: 204px" runat="server" Height="33px" Width="83px" Text="Back"></asp:Button></FONT></FONT>
		</form>
	</body>
</HTML>
