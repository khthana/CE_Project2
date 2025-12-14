<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormRegis.aspx.vb" Inherits="WebApplicationSeller1.WebFormRegis"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormRegis</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" BACKGROUND="pic\snows.gif">
		<FONT face="Tahoma">
			<FORM id="Form1" method="post" runat="server">
				<asp:TextBox id="txtName" style="Z-INDEX: 101; LEFT: 193px; POSITION: absolute; TOP: 183px" runat="server" Width="143px" Height="22px" MaxLength="50"></asp:TextBox>
				<asp:Button id="BtnCheckUsername" style="Z-INDEX: 139; LEFT: 350px; POSITION: absolute; TOP: 420px" runat="server" Height="21px" Width="62px" Text="ตรวจสอบ"></asp:Button>
				<asp:Label id="lblDetailUsername" style="Z-INDEX: 138; LEFT: 425px; POSITION: absolute; TOP: 419px" runat="server" Height="26px" Width="139px">ตรวจสอบชื่อสมาชิก</asp:Label>
				<asp:Button id="btnCancel" style="Z-INDEX: 135; LEFT: 568px; POSITION: absolute; TOP: 487px" runat="server" Width="68px" Height="41px" Text="ยกเลิก"></asp:Button>
				<asp:Label id="lblChkMobile" style="Z-INDEX: 133; LEFT: 493px; POSITION: absolute; TOP: 342px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="lblChkZipcode" style="Z-INDEX: 132; LEFT: 493px; POSITION: absolute; TOP: 299px" runat="server" Width="11px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="lblChkPhone" style="Z-INDEX: 131; LEFT: 171px; POSITION: absolute; TOP: 340px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="lblChkEmail" style="Z-INDEX: 130; LEFT: 171px; POSITION: absolute; TOP: 379px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="lblChkUsername" style="Z-INDEX: 129; LEFT: 171px; POSITION: absolute; TOP: 419px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="lblChkPassword" style="Z-INDEX: 128; LEFT: 171px; POSITION: absolute; TOP: 462px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="lblChkRepassword" style="Z-INDEX: 127; LEFT: 171px; POSITION: absolute; TOP: 505px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="lblChkSurname" style="Z-INDEX: 126; LEFT: 493px; POSITION: absolute; TOP: 190px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="lblchkProvince" style="Z-INDEX: 125; LEFT: 493px; POSITION: absolute; TOP: 239px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="lblChkAddress" style="Z-INDEX: 124; LEFT: 171px; POSITION: absolute; TOP: 229px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="Label11" style="Z-INDEX: 122; LEFT: 380px; POSITION: absolute; TOP: 336px" runat="server" Width="101px" Height="21px">เบอร์โทรมือถือ</asp:Label>
				<asp:Label id="Label10" style="Z-INDEX: 121; LEFT: 41px; POSITION: absolute; TOP: 505px" runat="server" Width="118px" Height="21px">รหัสสมาชิกอีกครั้ง</asp:Label>
				<asp:Label id="Label9" style="Z-INDEX: 120; LEFT: 41px; POSITION: absolute; TOP: 461px" runat="server" Width="79px" Height="21px">รหัสสมาชืก</asp:Label>
				<asp:Label id="Label8" style="Z-INDEX: 119; LEFT: 41px; POSITION: absolute; TOP: 420px" runat="server" Width="73px" Height="21px">ชื่อสมาชิก</asp:Label>
				<asp:Label id="Label7" style="Z-INDEX: 118; LEFT: 41px; POSITION: absolute; TOP: 381px" runat="server" Width="41px" Height="21px">Email</asp:Label>
				<asp:Label id="Label6" style="Z-INDEX: 117; LEFT: 41px; POSITION: absolute; TOP: 335px" runat="server" Width="90px" Height="21px">เบอร์โทรทีพัก</asp:Label>
				<asp:Label id="Label5" style="Z-INDEX: 116; LEFT: 380px; POSITION: absolute; TOP: 236px" runat="server" Width="90px" Height="21px">จังหวัด</asp:Label>
				<asp:Label id="Label4" style="Z-INDEX: 114; LEFT: 380px; POSITION: absolute; TOP: 293px" runat="server" Width="90px" Height="21px">รหัสไปรษณีย์</asp:Label>
				<asp:Label id="Label3" style="Z-INDEX: 113; LEFT: 41px; POSITION: absolute; TOP: 228px" runat="server" Width="34px" Height="21px">ที่อยู่</asp:Label>
				<asp:Label id="Label2" style="Z-INDEX: 112; LEFT: 380px; POSITION: absolute; TOP: 185px" runat="server" Width="59px" Height="21px">นามสกุล</asp:Label>
				<asp:TextBox id="txtRepassword" style="Z-INDEX: 110; LEFT: 196px; POSITION: absolute; TOP: 504px" runat="server" Width="143px" Height="22px" MaxLength="20" TextMode="Password"></asp:TextBox>
				<asp:TextBox id="txtPassword" style="Z-INDEX: 109; LEFT: 196px; POSITION: absolute; TOP: 459px" runat="server" Width="143px" Height="22px" TextMode="Password" MaxLength="20"></asp:TextBox>
				<asp:TextBox id="txtUsername" style="Z-INDEX: 108; LEFT: 195px; POSITION: absolute; TOP: 418px" runat="server" Width="143px" Height="22px" MaxLength="20"></asp:TextBox>
				<asp:TextBox id="txtEmail" style="Z-INDEX: 107; LEFT: 196px; POSITION: absolute; TOP: 377px" runat="server" Width="141px" Height="22px" MaxLength="50"></asp:TextBox>
				<asp:TextBox id="txtMobile" style="Z-INDEX: 106; LEFT: 521px; POSITION: absolute; TOP: 337px" runat="server" Width="143px" Height="22px" MaxLength="20"></asp:TextBox>
				<asp:TextBox id="txtPhone" style="Z-INDEX: 105; LEFT: 195px; POSITION: absolute; TOP: 336px" runat="server" Width="143px" Height="22px" MaxLength="20"></asp:TextBox>
				<asp:TextBox id="txtZipcode" style="Z-INDEX: 104; LEFT: 520px; POSITION: absolute; TOP: 295px" runat="server" Width="143px" Height="22px" MaxLength="10"></asp:TextBox>
				<asp:TextBox id="txtAddress" style="Z-INDEX: 103; LEFT: 194px; POSITION: absolute; TOP: 224px" runat="server" Width="144px" Height="93px" TextMode="MultiLine" MaxLength="255"></asp:TextBox>
				<asp:TextBox id="txtSurname" style="Z-INDEX: 102; LEFT: 518px; POSITION: absolute; TOP: 187px" runat="server" Width="143px" Height="22px" MaxLength="50"></asp:TextBox>
				<asp:Label id="Label1" style="Z-INDEX: 111; LEFT: 41px; POSITION: absolute; TOP: 189px" runat="server" Width="36px" Height="21px">ชื่อ</asp:Label>
				<asp:DropDownList id="ddlProvince" style="Z-INDEX: 115; LEFT: 518px; POSITION: absolute; TOP: 238px" runat="server" Width="147px" Height="20px">
					<asp:ListItem Value="กรุงเทพ" Selected="True">กรุงเทพ</asp:ListItem>
					<asp:ListItem Value="ฉะเชิงเทรา">ฉะเชิงเทรา</asp:ListItem>
				</asp:DropDownList>
				<asp:Label id="lblChkName" style="Z-INDEX: 123; LEFT: 171px; POSITION: absolute; TOP: 187px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Button id="btnOK" style="Z-INDEX: 134; LEFT: 409px; POSITION: absolute; TOP: 487px" runat="server" Width="68px" Height="41px" Text="ยืนยัน"></asp:Button>
		</FONT></FORM>
	</body>
</HTML>
