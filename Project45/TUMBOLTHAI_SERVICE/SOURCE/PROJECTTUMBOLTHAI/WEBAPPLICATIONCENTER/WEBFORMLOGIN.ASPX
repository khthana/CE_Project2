<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormLogin.aspx.vb" Inherits="WebApplicationCenter.WebForm1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebForm1</title>
		<meta content="True" name="vs_showGrid">
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body bgColor="#ffffcc" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="MS Sans Serif, Microsoft Sans Serif" size="2">
				<asp:textbox id="txtUsername" style="Z-INDEX: 101; LEFT: 85px; POSITION: absolute; TOP: 162px" runat="server" MaxLength="20" Height="21px" Width="127" tabIndex="1"></asp:textbox>
				<asp:label id="lblUpdateRegis" style="Z-INDEX: 120; LEFT: 69px; POSITION: absolute; TOP: 328px" runat="server" Width="108px" Height="23px" Font-Bold="True" ForeColor="White">
					<A href="WebformUpdateregis.aspx" target="body">แก้ไขข้อมูลสมาชิก</A></asp:label>
				<asp:label id="Label6" style="Z-INDEX: 119; LEFT: 68px; POSITION: absolute; TOP: 439px" runat="server" Width="51px" Height="19px">
					<A href="webformCheckOut.aspx" target="body">• จ่ายเงิน</A></asp:label>
				<asp:label id="Label4" style="Z-INDEX: 118; LEFT: 68px; POSITION: absolute; TOP: 418px" runat="server" Width="107px" Height="19px">
					<A href="webformInbasket.aspx" target="body">• สินค้าในตะกร้า</A></asp:label><asp:label id="Label14" style="Z-INDEX: 116; LEFT: 44px; POSITION: absolute; TOP: 494px" runat="server" Height="19px" Width="107px">ผู้ขาย [Sellers]</asp:label><asp:label id="Label13" style="Z-INDEX: 115; LEFT: 68px; POSITION: absolute; TOP: 398px" runat="server" Height="19px" Width="107px"><A href="webformshow.aspx" target="body">• 
						ร้านค้า</A></asp:label><asp:label id="Label12" style="Z-INDEX: 114; LEFT: 64px; POSITION: absolute; TOP: 538px" runat="server" Height="19px" Width="151px"><A href="webformorder.aspx" target="body">
						• ตรวจใบสั่งซื้อ</A></asp:label><asp:label id="Label11" style="Z-INDEX: 113; LEFT: 68px; POSITION: absolute; TOP: 462px" runat="server" Height="19px" Width="105px"><A href="webformcheckstatusselled.aspx" target="body">
						• ตรวจสอบสินค้าที่ซื้อ</A></asp:label><asp:label id="Label10" style="Z-INDEX: 112; LEFT: 64px; POSITION: absolute; TOP: 518px" runat="server" Height="19px" Width="65px"><A href="openshop.aspx" target="body">
						• เปิดร้านค้า</A></asp:label><asp:label id="Label9" style="Z-INDEX: 111; LEFT: 68px; POSITION: absolute; TOP: 374px" runat="server" Height="19" Width="108"><A href="webformSearch.aspx" target="body">
						• ค้นหาสินค้า</A></asp:label><asp:label id="Label7" style="Z-INDEX: 110; LEFT: 64px; POSITION: absolute; TOP: 591px" runat="server" Height="19px" Width="139px"><A href="webformshowcrook1.aspx" target="body">
						• 10 กลโกงทาง Internet</A></asp:label><asp:label id="Label5" style="Z-INDEX: 109; LEFT: 46px; POSITION: absolute; TOP: 567px" runat="server" Height="19px" Width="142px"> เผยกลโกงทางอินเทอร์เน็ต</asp:label><asp:button id="btnLogout" style="Z-INDEX: 106; LEFT: 135px; POSITION: absolute; TOP: 224px" runat="server" Height="25" Width="81" BackColor="PapayaWhip" Text="ออกจากระบบ" tabIndex="4"></asp:button><asp:label id="Label2" style="Z-INDEX: 104; LEFT: 27px; POSITION: absolute; TOP: 197px" runat="server" Height="15px" Width="47px" ForeColor="Black" Font-Bold="True">รหัสผ่าน</asp:label><asp:textbox id="txtPassword" style="Z-INDEX: 102; LEFT: 85px; POSITION: absolute; TOP: 191px" runat="server" MaxLength="20" Height="21px" Width="127px" TextMode="Password" tabIndex="2"></asp:textbox><asp:label id="Label1" style="Z-INDEX: 103; LEFT: 25px; POSITION: absolute; TOP: 162px" runat="server" Height="36px" Width="53px" ForeColor="Black" Font-Bold="True">ชื่อสมาชิก</asp:label><asp:button id="btnLogin" style="Z-INDEX: 105; LEFT: 21px; POSITION: absolute; TOP: 224px" runat="server" Height="25px" Width="81px" BackColor="BlanchedAlmond" Text="เข้าสู่ระบบ" tabIndex="3"></asp:button>
				<asp:label id="lblShowLogin" style="Z-INDEX: 107; LEFT: 21px; POSITION: absolute; TOP: 256px" runat="server" Height="44px" Width="193px" ForeColor="ActiveCaption"></asp:label><asp:label id="Label3" style="Z-INDEX: 108; LEFT: 50px; POSITION: absolute; TOP: 350px" runat="server" Height="19px" Width="80px">ผู้ซื้อ [Buyers]</asp:label><asp:label id="lblRegis" style="Z-INDEX: 117; LEFT: 68px; POSITION: absolute; TOP: 304px" runat="server" Height="23px" Width="87px" ForeColor="White" Font-Bold="True"><A href="Webformregis.aspx" target="body">สมัครสมาชิก</A></asp:label>
				<asp:Image id="Image1" style="Z-INDEX: 121; LEFT: 22px; POSITION: absolute; TOP: 45px" runat="server" Width="190px" Height="100px" ImageUrl="picture\logo2.jpg"></asp:Image></FONT></form>
	</body>
</HTML>
