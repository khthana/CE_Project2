<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormPutIn.aspx.vb" Inherits="WebApplicationSeller2.WebFormPutIn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormPutIn</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout" bgColor="#cc9966">
		<form id="Form1" method="post" runat="server">
			<FONT face="MS Sans Serif, Microsoft Sans Serif" size="2">
				<asp:label id="lblName" style="Z-INDEX: 101; LEFT: 276px; POSITION: absolute; TOP: 74px" runat="server" Font-Size="Larger" ForeColor="White" Font-Bold="True" Height="45px" Width="232px">Label</asp:label>
				<asp:Label id="Label2" style="Z-INDEX: 130; LEFT: 13px; POSITION: absolute; TOP: 332px" runat="server" Width="62px" Height="21px">รหัส</asp:Label>
				<asp:Label id="Label1" style="Z-INDEX: 129; LEFT: 12px; POSITION: absolute; TOP: 299px" runat="server" Width="62px" Height="21px">ชื่อสมาชิก</asp:Label>
				<asp:Label id="Label5" style="Z-INDEX: 128; LEFT: 10px; POSITION: absolute; TOP: 147px" runat="server" Width="62px" Height="21px">ชื่อ</asp:Label>
				<asp:Label id="Label4" style="Z-INDEX: 127; LEFT: 10px; POSITION: absolute; TOP: 115px" runat="server" Width="62px" Height="21px">จาก</asp:Label>
				<asp:Label id="Label7" style="Z-INDEX: 126; LEFT: 12px; POSITION: absolute; TOP: 176px" runat="server" Width="62px" Height="21px">ลายระเอียด</asp:Label>
				<asp:textbox id="txtDetail" style="Z-INDEX: 114; LEFT: 83px; POSITION: absolute; TOP: 173px" runat="server" Width="118px" Height="21px"></asp:textbox>
				<asp:textbox id="txtPrice" style="Z-INDEX: 112; LEFT: 83px; POSITION: absolute; TOP: 201px" runat="server" Width="117px" Height="21px"></asp:textbox>
				<asp:Label id="Label6" style="Z-INDEX: 111; LEFT: 8px; POSITION: absolute; TOP: 203px" runat="server" Width="85px" Height="21px">ราคาไม่เกิน</asp:Label><asp:button id="btnInBasket" style="Z-INDEX: 110; LEFT: 431px; POSITION: absolute; TOP: 333px" runat="server" Height="27px" Width="79px" Text="ในตะกร้า"></asp:button><asp:label id="lblDetail" style="Z-INDEX: 102; LEFT: 280px; POSITION: absolute; TOP: 183px" runat="server" Height="132px" Width="230px">Label</asp:label><asp:image id="ImgProduct" style="Z-INDEX: 103; LEFT: 529px; POSITION: absolute; TOP: 69px" runat="server" Height="250px" Width="304px"></asp:image><asp:textbox id="txtQuantity" style="Z-INDEX: 104; LEFT: 368px; POSITION: absolute; TOP: 133px" runat="server" Height="30px" Width="45px" MaxLength="3"></asp:textbox><asp:label id="Label3" style="Z-INDEX: 105; LEFT: 279px; POSITION: absolute; TOP: 132px" runat="server" Height="37" Width="72">จำนวน</asp:label><asp:label id="lblUnit" style="Z-INDEX: 106; LEFT: 438px; POSITION: absolute; TOP: 132px" runat="server" Height="37px" Width="72px">Label</asp:label><asp:label id="lblPrice" style="Z-INDEX: 107; LEFT: 556px; POSITION: absolute; TOP: 332px" runat="server" Height="24px" Width="260px">Label</asp:label><asp:button id="btnOk" style="Z-INDEX: 108; LEFT: 278px; POSITION: absolute; TOP: 334px" runat="server" Height="27px" Width="79px" Text="ตกลง"></asp:button><asp:label id="lblError" style="Z-INDEX: 109; LEFT: 281px; POSITION: absolute; TOP: 376px" runat="server" Font-Size="Larger" ForeColor="Red" Font-Bold="True" Height="25px" Width="550px" Visible="False"></asp:label></FONT>
			<asp:Label id="lblShowLogin" style="Z-INDEX: 113; LEFT: 28px; POSITION: absolute; TOP: 8px" runat="server" Height="71px" Width="172px"></asp:Label>
			<asp:dropdownlist id="ddlFrom" style="Z-INDEX: 115; LEFT: 83px; POSITION: absolute; TOP: 114px" runat="server" Width="122px">
				<asp:ListItem Value="0" Selected="True">ภายในร้าน</asp:ListItem>
				<asp:ListItem Value="1">ทุกๆร้าน</asp:ListItem>
			</asp:dropdownlist>
			<asp:textbox id="txtNameSearch" style="Z-INDEX: 116; LEFT: 83px; POSITION: absolute; TOP: 145px" runat="server" Height="21px" Width="118px"></asp:textbox>
			<asp:button id="btnSearch" style="Z-INDEX: 117; LEFT: 82px; POSITION: absolute; TOP: 254px" runat="server" Width="64px" Text="ค้นหา"></asp:button>
			<asp:textbox id="txtUsername" style="Z-INDEX: 118; LEFT: 83px; POSITION: absolute; TOP: 297px" runat="server" Height="21px" Width="118px"></asp:textbox>
			<asp:textbox id="txtPassword" style="Z-INDEX: 119; LEFT: 82px; POSITION: absolute; TOP: 330px" runat="server" Height="21px" Width="118px"></asp:textbox>
			<asp:button id="btnLogin" style="Z-INDEX: 120; LEFT: 65px; POSITION: absolute; TOP: 363px" runat="server" Width="64px" Text="เข้าระบบ"></asp:button>
			<asp:button id="btnLogout" style="Z-INDEX: 121; LEFT: 138px; POSITION: absolute; TOP: 363px" runat="server" Width="64px" Text="ออกระบบ"></asp:button>
			<DIV style="DISPLAY: inline; Z-INDEX: 122; LEFT: 41px; WIDTH: 132px; POSITION: absolute; TOP: 408px; HEIGHT: 21px" ms_positioning="FlowLayout"><A href="webformcandle1.aspx">สินค้าของร้านเรา</A></DIV>
			<DIV style="DISPLAY: inline; Z-INDEX: 123; LEFT: 41px; WIDTH: 86px; POSITION: absolute; TOP: 443px; HEIGHT: 19px" ms_positioning="FlowLayout"><A href="addmem_candle.aspx">สมัครสมาชิก</A></ACRONYM></DIV>
			<DIV style="DISPLAY: inline; Z-INDEX: 124; LEFT: 41px; WIDTH: 107px; POSITION: absolute; TOP: 477px; HEIGHT: 19px" ms_positioning="FlowLayout"><A href="WebFormInbasket.aspx">ดูสินค้าในตะกร้า</A></DIV>
			<DIV style="DISPLAY: inline; Z-INDEX: 125; LEFT: 41px; WIDTH: 178px; POSITION: absolute; TOP: 536px; HEIGHT: 24px" ms_positioning="FlowLayout"><FONT face="Tahoma"><a href="http://161.246.6.4/projecttumbolthai/webapplicationCenter/index.htm">Back 
						to บริการตำบลไทย</a></FONT></DIV>
			<asp:Label id="Label8" style="Z-INDEX: 131; LEFT: 43px; POSITION: absolute; TOP: 506px" runat="server" Width="141px" Height="20px">
				<a href="webformcheckstatusselled.aspx">ตรวจสอบสินค้าที่ซื้อ </a>
			</asp:Label>
		</form>
	</body>
</HTML>
