<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormUpdate.aspx.vb" Inherits="WebApplicationBehide.WebFormUpdate"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormUpdate</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma">
				<asp:Label id="lblDetail" style="Z-INDEX: 100; LEFT: 206px; POSITION: absolute; TOP: 139px" runat="server" Width="367px" Height="141px"></asp:Label>
				<asp:Label id="Label2" style="Z-INDEX: 107; LEFT: 214px; POSITION: absolute; TOP: 60px" runat="server" Height="48px" Width="323px" Font-Size="Large">การจ่ายเงินและจัดส่งสินค้า</asp:Label>
				<asp:Button id="Button1" style="Z-INDEX: 105; LEFT: 490px; POSITION: absolute; TOP: 375px" runat="server" Width="93px" Height="29px" Text="กลับ"></asp:Button>
				<asp:CheckBox id="chkPay" style="Z-INDEX: 102; LEFT: 425px; POSITION: absolute; TOP: 299px" runat="server" Width="112px" Height="26px" Text="จ่ายเงิน"></asp:CheckBox>
				<asp:CheckBox id="chkSend" style="Z-INDEX: 101; LEFT: 222px; POSITION: absolute; TOP: 299px" runat="server" Width="112px" Height="26px" Text="ส่งสินค้า"></asp:CheckBox>
				<asp:Button id="btnUpdate" style="Z-INDEX: 103; LEFT: 381px; POSITION: absolute; TOP: 376px" runat="server" Width="93px" Height="29px" Text="ปรับปรุง"></asp:Button>
				<asp:Label id="lblOk" style="Z-INDEX: 106; LEFT: 155px; POSITION: absolute; TOP: 371px" runat="server" Width="187px" Height="42px">แก้ไขเรียบร้อย</asp:Label></FONT>
		</form>
	</body>
</HTML>
