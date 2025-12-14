<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormCandle1.aspx.vb" Inherits="WebApplicationSeller2.WebForm1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebForm1</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body bgColor="#cc9966" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma"></FONT>
			<asp:textbox id="txtUsername" style="Z-INDEX: 122; LEFT: 98px; POSITION: absolute; TOP: 299px" runat="server" Width="118px" Height="21px"></asp:textbox>
			<asp:Label id="Label7" style="Z-INDEX: 139; LEFT: 8px; POSITION: absolute; TOP: 172px" runat="server" Height="21px" Width="80px">ลายระเอียด</asp:Label>
			<asp:textbox id="txtPrice" style="Z-INDEX: 123; LEFT: 98px; POSITION: absolute; TOP: 202px" runat="server" Height="21px" Width="117px"></asp:textbox>
			<asp:Label id="Label6" style="Z-INDEX: 120; LEFT: 8px; POSITION: absolute; TOP: 203px" runat="server" Height="21px" Width="85px">ราคาไม่เกิน</asp:Label>
			<asp:textbox id="txtDetail" style="Z-INDEX: 125; LEFT: 98px; POSITION: absolute; TOP: 173px" runat="server" Height="21px" Width="118px"></asp:textbox><asp:button id="btnLogout" style="Z-INDEX: 130; LEFT: 153px; POSITION: absolute; TOP: 365px" runat="server" Width="64px" Text="ออกระบบ"></asp:button><asp:button id="btnLogin" style="Z-INDEX: 129; LEFT: 80px; POSITION: absolute; TOP: 365px" runat="server" Width="64px" Text="เข้าระบบ"></asp:button><asp:textbox id="txtPassword" style="Z-INDEX: 121; LEFT: 97px; POSITION: absolute; TOP: 332px" runat="server" Width="118px" Height="21px"></asp:textbox>
			<DIV style="DISPLAY: inline; Z-INDEX: 118; LEFT: 56px; WIDTH: 178px; POSITION: absolute; TOP: 543px; HEIGHT: 24px" ms_positioning="FlowLayout"><FONT face="Tahoma"><a href="http://161.246.6.4/projecttumbolthai/webapplicationCenter/index.htm">กลับสู่เว็บบริการตำบลไทย</a></FONT></DIV>
			<DIV style="DISPLAY: inline; Z-INDEX: 114; LEFT: 845px; WIDTH: 167px; POSITION: absolute; TOP: 352px; HEIGHT: 97px" ms_positioning="FlowLayout">
				<P>เทียนหอมรูปพักทอง</P>
				<P>ราคา&nbsp;&nbsp;70 บาท</P>
				<P><asp:button id="Button3" runat="server" Width="79px" Height="20px" Text="หยิบใส่ตะกร้า"></asp:button></P>
			</DIV>
			<IMG style="Z-INDEX: 113; LEFT: 838px; WIDTH: 142px; POSITION: absolute; TOP: 464px; HEIGHT: 156px" height="156" alt="" src="pic\can00026_2.gif" width="142"><IMG style="Z-INDEX: 102; LEFT: 806px; WIDTH: 215px; POSITION: absolute; TOP: 225px; HEIGHT: 111px" height="111" alt="" src="pic\can00030_2.gif" width="215">
			<DIV style="DISPLAY: inline; Z-INDEX: 110; LEFT: 353px; WIDTH: 157px; POSITION: absolute; TOP: 646px; HEIGHT: 89px" ms_positioning="FlowLayout">
				<P>เทียนหอมรูปกุหลาบ</P>
				<P>ราคา&nbsp; 50 บาท</P>
				<P><asp:button id="Button4" runat="server" Width="79px" Height="20px" Text="หยิบใส่ตะกร้า"></asp:button></P>
			</DIV>
			<DIV style="DISPLAY: inline; Z-INDEX: 109; LEFT: 575px; WIDTH: 167px; POSITION: absolute; TOP: 352px; HEIGHT: 97px" ms_positioning="FlowLayout">
				<P>เทียนหอมรูปพริกหยวก</P>
				<P>ราคา&nbsp;&nbsp;130 บาท</P>
				<P><asp:button id="Button2" runat="server" Width="79px" Height="20px" Text="หยิบใส่ตะกร้า"></asp:button></P>
			</DIV>
			<DIV style="DISPLAY: inline; Z-INDEX: 108; LEFT: 337px; WIDTH: 165px; POSITION: absolute; TOP: 354px; HEIGHT: 22px" ms_positioning="FlowLayout">
				<P>เทียนหอมรูปกล้วย</P>
				<P>ราคา&nbsp;&nbsp;56 บาท</P>
				<P><asp:button id="Button1" runat="server" Width="79px" Height="20px" Text="หยิบใส่ตะกร้า"></asp:button></P>
				<P><FONT face="Tahoma"></FONT>&nbsp;</P>
			</DIV>
			<IMG style="Z-INDEX: 107; LEFT: 325px; WIDTH: 195px; POSITION: absolute; TOP: 482px; HEIGHT: 146px" height="146" alt="" src="pic\can00039_2.gif" width="195"><IMG style="Z-INDEX: 106; LEFT: 549px; WIDTH: 202px; POSITION: absolute; TOP: 206px; HEIGHT: 133px" height="133" alt="" src="pic\can00031_2.gif" width="202">
			<asp:label id="Label3" style="Z-INDEX: 101; LEFT: 103px; POSITION: absolute; TOP: 81px" runat="server" Width="28px" Height="17px">Search</asp:label>&nbsp;
			<asp:label id="Label2" style="Z-INDEX: 103; LEFT: 43px; POSITION: absolute; TOP: 331px" runat="server" Width="28px" Height="17px">รหัส</asp:label><asp:label id="Label1" style="Z-INDEX: 104; LEFT: 23px; POSITION: absolute; TOP: 301px" runat="server" Width="68px" Height="17px">ชื่อสมาชิก</asp:label><IMG style="Z-INDEX: 105; LEFT: 348px; WIDTH: 146px; POSITION: absolute; TOP: 128px; HEIGHT: 212px" height="212" alt="" src="pic\can00027_2.gif" width="146">
			<DIV style="DISPLAY: inline; Z-INDEX: 111; LEFT: 599px; WIDTH: 173px; POSITION: absolute; TOP: 646px; HEIGHT: 99px" ms_positioning="FlowLayout">
				<P>
				เทียนหอมรูปส้ม
				<P></P>
				<P>ราคา&nbsp; 50 บาท</P>
				<P><asp:button id="Button5" runat="server" Width="79px" Height="20px" Text="หยิบใส่ตะกร้า"></asp:button></P>
			</DIV>
			<IMG style="Z-INDEX: 112; LEFT: 557px; WIDTH: 208px; POSITION: absolute; TOP: 497px; HEIGHT: 126px" height="126" alt="" src="pic\can00025_2.gif" width="208">
			<DIV style="DISPLAY: inline; Z-INDEX: 115; LEFT: 839px; WIDTH: 167px; POSITION: absolute; TOP: 642px; HEIGHT: 97px" ms_positioning="FlowLayout">
				<P>เทียนหอมรูปมะนาว</P>
				<P>ราคา&nbsp;&nbsp;50 บาท</P>
				<P><asp:button id="Button6" runat="server" Width="79px" Height="20px" Text="หยิบใส่ตะกร้า"></asp:button></P>
			</DIV>
			<DIV style="DISPLAY: inline; Z-INDEX: 116; LEFT: 56px; WIDTH: 107px; POSITION: absolute; TOP: 479px; HEIGHT: 19px" ms_positioning="FlowLayout"><A href="WebFormInbasket.aspx">ดูสินค้าในตะกร้า</A></DIV>
			<DIV id="lblRegis" style="DISPLAY: inline; Z-INDEX: 117; LEFT: 56px; WIDTH: 86px; POSITION: absolute; TOP: 445px; HEIGHT: 19px" ms_positioning="FlowLayout"><A href="WebFormRegis.aspx">สมัครสมาชิก</A></ACRONYM></DIV>
			<asp:textbox id="txtNameSearch" style="Z-INDEX: 119; LEFT: 98px; POSITION: absolute; TOP: 145px" runat="server" Width="118px" Height="21px"></asp:textbox><asp:button id="btnSearch" style="Z-INDEX: 124; LEFT: 97px; POSITION: absolute; TOP: 241px" runat="server" Width="64px" Text="ค้นหา"></asp:button><asp:dropdownlist id="ddlFrom" style="Z-INDEX: 126; LEFT: 98px; POSITION: absolute; TOP: 114px" runat="server" Width="122px">
				<asp:ListItem Value="0" Selected="True">ภายในร้าน</asp:ListItem>
				<asp:ListItem Value="1">ทุกๆร้าน</asp:ListItem>
			</asp:dropdownlist><asp:label id="Label4" style="Z-INDEX: 127; LEFT: 42px; POSITION: absolute; TOP: 116px" runat="server" Width="46px">จาก</asp:label><asp:label id="Label5" style="Z-INDEX: 128; LEFT: 23px; POSITION: absolute; TOP: 148px" runat="server" Width="64px">ชื่อสินค้า</asp:label><asp:label id="lblShowLogin" style="Z-INDEX: 131; LEFT: 43px; POSITION: absolute; TOP: 8px" runat="server" Width="172px" Height="71px"></asp:label><IMG style="Z-INDEX: 132; LEFT: 337px; WIDTH: 175px; POSITION: absolute; TOP: 786px; HEIGHT: 166px" height="166" alt="" src="pic\can00034_2.gif" width="175">
			<DIV style="DISPLAY: inline; Z-INDEX: 133; LEFT: 339px; WIDTH: 167px; POSITION: absolute; TOP: 970px; HEIGHT: 97px" ms_positioning="FlowLayout">
				<P>เทียนหอมรูปแตงโม</P>
				<P>ราคา&nbsp;&nbsp;130 บาท</P>
				<P>
					<asp:button id="Button7" runat="server" Width="79px" Height="20px" Text="หยิบใส่ตะกร้า"></asp:button></P>
			</DIV>
			<IMG style="Z-INDEX: 134; LEFT: 836px; WIDTH: 191px; POSITION: absolute; TOP: 806px; HEIGHT: 147px" height="147" alt="" src="pic\can00033_2.gif" width="191">
			<DIV style="DISPLAY: inline; Z-INDEX: 135; LEFT: 845px; WIDTH: 167px; POSITION: absolute; TOP: 969px; HEIGHT: 97px" ms_positioning="FlowLayout">
				<P>เทียนหอมรูปน้อยหน่า</P>
				<P>ราคา&nbsp;&nbsp;130 บาท</P>
				<P>
					<asp:button id="Button8" runat="server" Width="79px" Height="20px" Text="หยิบใส่ตะกร้า"></asp:button></P>
			</DIV>
			<IMG style="Z-INDEX: 136; LEFT: 584px; WIDTH: 216px; POSITION: absolute; TOP: 829px; HEIGHT: 119px" height="119" alt="" src="pic\can00028_2.gif" width="216">
			<DIV style="DISPLAY: inline; Z-INDEX: 137; LEFT: 608px; WIDTH: 167px; POSITION: absolute; TOP: 969px; HEIGHT: 97px" ms_positioning="FlowLayout">
				<P>เทียนหอมรูปแอปเปิ้ล</P>
				<P>ราคา&nbsp;&nbsp;130 บาท</P>
				<P>
					<asp:button id="Button9" runat="server" Width="79px" Height="20px" Text="หยิบใส่ตะกร้า"></asp:button></P>
			</DIV>
			<asp:Image id="Image1" style="Z-INDEX: 138; LEFT: 349px; POSITION: absolute; TOP: 8px" runat="server" Width="668px" Height="112px" ImageUrl="pic\testc.jpg"></asp:Image>
			<asp:Label id="Label8" style="Z-INDEX: 140; LEFT: 60px; POSITION: absolute; TOP: 511px" runat="server" Height="20px" Width="141px">
				<a href="webformcheckstatusselled.aspx">ตรวจสอบสินค้าที่ซื้อ </a>
			</asp:Label></form>
	</body>
</HTML>
