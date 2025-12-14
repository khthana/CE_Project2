<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormSearch.aspx.vb" Inherits="WebApplicationSeller2.WebFormSearch"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormSearch</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" bgColor="#cc9966">
		<form id="Form1" method="post" runat="server">
			<asp:TextBox id="txtUsername" style="Z-INDEX: 111; LEFT: 98px; POSITION: absolute; TOP: 291px" runat="server" Height="21px" Width="118px"></asp:TextBox>
			<asp:Label id="Label8" style="Z-INDEX: 141; LEFT: 57px; POSITION: absolute; TOP: 501px" runat="server" Width="141px" Height="20px">
				<a href="webformcheckstatusselled.aspx">ตรวจสอบสินค้าที่ซื้อ </a>
			</asp:Label>
			<asp:label id="Label5" style="Z-INDEX: 140; LEFT: 12px; POSITION: absolute; TOP: 145px" runat="server" Width="64px">ชื่อสินค้า</asp:label>
			<asp:Label id="Label7" style="Z-INDEX: 139; LEFT: 7px; POSITION: absolute; TOP: 174px" runat="server" Width="80px" Height="21px">ลายระเอียด</asp:Label>
			<asp:textbox id="txtDetail" style="Z-INDEX: 125; LEFT: 98px; POSITION: absolute; TOP: 173px" runat="server" Width="118px" Height="21px"></asp:textbox>
			<asp:textbox id="txtPrice" style="Z-INDEX: 123; LEFT: 98px; POSITION: absolute; TOP: 202px" runat="server" Width="117px" Height="21px"></asp:textbox>
			<asp:Label id="Label6" style="Z-INDEX: 119; LEFT: 8px; POSITION: absolute; TOP: 203px" runat="server" Width="85px" Height="21px">ราคาไม่เกิน</asp:Label>
			<asp:Button id="btnLogout" style="Z-INDEX: 116; LEFT: 153px; POSITION: absolute; TOP: 357px" runat="server" Text="ออกระบบ" Width="64px"></asp:Button>
			<asp:Button id="btnLogin" style="Z-INDEX: 115; LEFT: 80px; POSITION: absolute; TOP: 357px" runat="server" Text="เข้าระบบ" Width="64px"></asp:Button>
			<asp:TextBox id="txtPassword" style="Z-INDEX: 110; LEFT: 97px; POSITION: absolute; TOP: 324px" runat="server" Height="21px" Width="118px"></asp:TextBox>
			<DIV style="DISPLAY: inline; Z-INDEX: 108; LEFT: 56px; WIDTH: 178px; POSITION: absolute; TOP: 528px; HEIGHT: 24px" ms_positioning="FlowLayout"><FONT face="Tahoma">Back 
					to บริการตำบลไทย</FONT></DIV>
			<asp:label id="Label3" style="Z-INDEX: 101; LEFT: 103px; POSITION: absolute; TOP: 81px" runat="server" Height="17px" Width="28px">Search</asp:label>&nbsp;
			<asp:label id="Label2" style="Z-INDEX: 102; LEFT: 43px; POSITION: absolute; TOP: 323px" runat="server" Height="17px" Width="28px">รหัส</asp:label>
			<asp:label id="Label1" style="Z-INDEX: 103; LEFT: 23px; POSITION: absolute; TOP: 293px" runat="server" Height="17px" Width="68px">ชื่อสมาชิก</asp:label>
			<DIV style="DISPLAY: inline; Z-INDEX: 104; LEFT: 468px; WIDTH: 138px; POSITION: absolute; TOP: 29px; HEIGHT: 30px" ms_positioning="FlowLayout">
				<h1>เทียนหอม</h1>
			</DIV>
			<DIV style="DISPLAY: inline; Z-INDEX: 105; LEFT: 56px; WIDTH: 132px; POSITION: absolute; TOP: 402px; HEIGHT: 21px" ms_positioning="FlowLayout"><A href="webformcandle1.aspx">สินค้าของร้านเรา</A></DIV>
			<DIV style="DISPLAY: inline; Z-INDEX: 106; LEFT: 56px; WIDTH: 107px; POSITION: absolute; TOP: 471px; HEIGHT: 19px" ms_positioning="FlowLayout"><A href="WebFormInbasket.aspx">ดูสินค้าในตะกร้า</A></DIV>
			<DIV style="DISPLAY: inline; Z-INDEX: 107; LEFT: 56px; WIDTH: 86px; POSITION: absolute; TOP: 437px; HEIGHT: 19px" ms_positioning="FlowLayout"><A href="webformRegis.aspx">สมัครสมาชิก</A></ACRONYM></DIV>
			<asp:TextBox id="txtNameSearch" style="Z-INDEX: 109; LEFT: 98px; POSITION: absolute; TOP: 145px" runat="server" Height="21px" Width="118px"></asp:TextBox>
			<asp:Button id="btnSearch" style="Z-INDEX: 112; LEFT: 97px; POSITION: absolute; TOP: 248px" runat="server" Text="ค้นหา" Width="64px"></asp:Button>
			<asp:DropDownList id="ddlFrom" style="Z-INDEX: 113; LEFT: 98px; POSITION: absolute; TOP: 114px" runat="server" Width="122px">
				<asp:ListItem Value="0" Selected="True">ภายในร้าน</asp:ListItem>
				<asp:ListItem Value="1">ทุกๆร้าน</asp:ListItem>
			</asp:DropDownList>
			<asp:Label id="Label4" style="Z-INDEX: 114; LEFT: 42px; POSITION: absolute; TOP: 116px" runat="server" Width="46px">จาก</asp:Label>
			<asp:DataGrid id=DataGrid1 style="Z-INDEX: 117; LEFT: 291px; POSITION: absolute; TOP: 118px" runat="server" Width="500px" Height="132px" DataSource="<%# DataSet1 %>">
			</asp:DataGrid>
			<asp:Label id="lblShowLogin" style="Z-INDEX: 118; LEFT: 41px; POSITION: absolute; TOP: 10px" runat="server" Width="174px" Height="65px"></asp:Label>
		</form>
	</body>
</HTML>
