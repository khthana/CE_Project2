<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormRegis.aspx.vb" Inherits="WebApplicationSeller2.WebFormRegis"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormRegis</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" BGCOLOR="#cc9966">
		<form id="Form1" method="post" runat="server">
			<asp:TextBox id="txtName" style="Z-INDEX: 100; LEFT: 185px; POSITION: absolute; TOP: 91px" runat="server" Width="143px" Height="22px" MaxLength="50"></asp:TextBox>
			<asp:Button id="BtnCheckUsername" style="Z-INDEX: 139; LEFT: 345px; POSITION: absolute; TOP: 329px" runat="server" Height="21px" Width="62px" Text="ตรวจสอบ"></asp:Button>
			<asp:Label id="lblDetailUsername" style="Z-INDEX: 138; LEFT: 421px; POSITION: absolute; TOP: 326px" runat="server" Height="26px" Width="139px">ตรวจสอบชื่อสมาชิก</asp:Label>
			<asp:Button id="btnCancel" style="Z-INDEX: 135; LEFT: 560px; POSITION: absolute; TOP: 395px" runat="server" Width="68px" Height="41px" Text="ยกเลิก"></asp:Button>
			<asp:Label id="lblChkMobile" style="Z-INDEX: 132; LEFT: 485px; POSITION: absolute; TOP: 250px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
			<asp:Label id="lblChkZipcode" style="Z-INDEX: 131; LEFT: 485px; POSITION: absolute; TOP: 207px" runat="server" Width="11px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
			<asp:Label id="lblChkPhone" style="Z-INDEX: 130; LEFT: 163px; POSITION: absolute; TOP: 248px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
			<asp:Label id="lblChkEmail" style="Z-INDEX: 129; LEFT: 163px; POSITION: absolute; TOP: 287px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
			<asp:Label id="lblChkUsername" style="Z-INDEX: 128; LEFT: 163px; POSITION: absolute; TOP: 327px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
			<asp:Label id="lblChkPassword" style="Z-INDEX: 127; LEFT: 163px; POSITION: absolute; TOP: 370px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
			<asp:Label id="lblChkRepassword" style="Z-INDEX: 126; LEFT: 163px; POSITION: absolute; TOP: 413px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
			<asp:Label id="lblChkSurname" style="Z-INDEX: 125; LEFT: 485px; POSITION: absolute; TOP: 98px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
			<asp:Label id="lblchkProvince" style="Z-INDEX: 124; LEFT: 485px; POSITION: absolute; TOP: 147px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
			<asp:Label id="lblChkAddress" style="Z-INDEX: 123; LEFT: 163px; POSITION: absolute; TOP: 137px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
			<asp:Label id="Label11" style="Z-INDEX: 121; LEFT: 372px; POSITION: absolute; TOP: 244px" runat="server" Width="101px" Height="21px">เบอร์โทรมือถือ</asp:Label>
			<asp:Label id="Label10" style="Z-INDEX: 120; LEFT: 33px; POSITION: absolute; TOP: 413px" runat="server" Width="118px" Height="21px">รหัสสมาชิกอีกครั้ง</asp:Label>
			<asp:Label id="Label9" style="Z-INDEX: 119; LEFT: 33px; POSITION: absolute; TOP: 369px" runat="server" Width="79px" Height="21px">รหัสสมาชืก</asp:Label>
			<asp:Label id="Label8" style="Z-INDEX: 118; LEFT: 33px; POSITION: absolute; TOP: 328px" runat="server" Width="73px" Height="21px">ชื่อสมาชิก</asp:Label>
			<asp:Label id="Label7" style="Z-INDEX: 117; LEFT: 33px; POSITION: absolute; TOP: 289px" runat="server" Width="41px" Height="21px">Email</asp:Label>
			<asp:Label id="Label6" style="Z-INDEX: 116; LEFT: 33px; POSITION: absolute; TOP: 243px" runat="server" Width="90px" Height="21px">เบอร์โทรทีพัก</asp:Label>
			<asp:Label id="Label5" style="Z-INDEX: 115; LEFT: 372px; POSITION: absolute; TOP: 144px" runat="server" Width="90px" Height="21px">จังหวัด</asp:Label>
			<asp:Label id="Label4" style="Z-INDEX: 113; LEFT: 372px; POSITION: absolute; TOP: 201px" runat="server" Width="90px" Height="21px">รหัสไปรษณีย์</asp:Label>
			<asp:Label id="Label3" style="Z-INDEX: 112; LEFT: 33px; POSITION: absolute; TOP: 136px" runat="server" Width="34px" Height="21px">ที่อยู่</asp:Label>
			<asp:Label id="Label2" style="Z-INDEX: 111; LEFT: 372px; POSITION: absolute; TOP: 93px" runat="server" Width="59px" Height="21px">นามสกุล</asp:Label>
			<asp:TextBox id="txtRepassword" style="Z-INDEX: 109; LEFT: 188px; POSITION: absolute; TOP: 412px" runat="server" Width="143px" Height="22px" MaxLength="20" TextMode="Password"></asp:TextBox>
			<asp:TextBox id="txtPassword" style="Z-INDEX: 108; LEFT: 188px; POSITION: absolute; TOP: 367px" runat="server" Width="143px" Height="22px" TextMode="Password" MaxLength="20"></asp:TextBox>
			<asp:TextBox id="txtUsername" style="Z-INDEX: 107; LEFT: 187px; POSITION: absolute; TOP: 326px" runat="server" Width="143px" Height="22px" MaxLength="20"></asp:TextBox>
			<asp:TextBox id="txtEmail" style="Z-INDEX: 106; LEFT: 188px; POSITION: absolute; TOP: 285px" runat="server" Width="141px" Height="22px" MaxLength="50"></asp:TextBox>
			<asp:TextBox id="txtMobile" style="Z-INDEX: 105; LEFT: 513px; POSITION: absolute; TOP: 245px" runat="server" Width="143px" Height="22px" MaxLength="20"></asp:TextBox>
			<asp:TextBox id="txtPhone" style="Z-INDEX: 104; LEFT: 187px; POSITION: absolute; TOP: 244px" runat="server" Width="143px" Height="22px" MaxLength="20"></asp:TextBox>
			<asp:TextBox id="txtZipcode" style="Z-INDEX: 103; LEFT: 512px; POSITION: absolute; TOP: 203px" runat="server" Width="143px" Height="22px" MaxLength="10"></asp:TextBox>
			<asp:TextBox id="txtAddress" style="Z-INDEX: 102; LEFT: 186px; POSITION: absolute; TOP: 132px" runat="server" Width="144px" Height="93px" TextMode="MultiLine" MaxLength="255"></asp:TextBox>
			<asp:TextBox id="txtSurname" style="Z-INDEX: 101; LEFT: 510px; POSITION: absolute; TOP: 95px" runat="server" Width="143px" Height="22px" MaxLength="50"></asp:TextBox>
			<asp:Label id="Label1" style="Z-INDEX: 110; LEFT: 33px; POSITION: absolute; TOP: 97px" runat="server" Width="36px" Height="21px">ชื่อ</asp:Label>
			<asp:DropDownList id="ddlProvince" style="Z-INDEX: 114; LEFT: 510px; POSITION: absolute; TOP: 146px" runat="server" Width="147px" Height="20px">
				<asp:ListItem Value="กรุงเทพ" Selected="True">กรุงเทพ</asp:ListItem>
				<asp:ListItem Value="ฉะเชิงเทรา">ฉะเชิงเทรา</asp:ListItem>
			</asp:DropDownList>
			<asp:Label id="lblChkName" style="Z-INDEX: 122; LEFT: 163px; POSITION: absolute; TOP: 95px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
			<asp:Button id="btnOK" style="Z-INDEX: 134; LEFT: 401px; POSITION: absolute; TOP: 395px" runat="server" Width="68px" Height="41px" Text="ยืนยัน"></asp:Button></FONT>
		</form>
	</body>
</HTML>
