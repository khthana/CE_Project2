<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormUpdateRegis.aspx.vb" Inherits="WebApplicationCenter.WebFormUpdateRegis"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormUpdateRegis</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" bgColor="#ffffcc">
		<form id="Form1" method="post" runat="server">
			<FONT face="MS Sans Serif, Microsoft Sans Serif" size="2">
				<asp:TextBox id="txtName" style="Z-INDEX: 100; LEFT: 193px; POSITION: absolute; TOP: 181px" runat="server" Width="143px" Height="22px" MaxLength="50" ForeColor="Black" BackColor="White" tabIndex="1"></asp:TextBox>
				<asp:Label id="Label12" style="Z-INDEX: 137; LEFT: 214px; POSITION: absolute; TOP: 37px" runat="server" Height="60px" Width="362px" Font-Bold="True" Font-Size="XX-Large">แก้ไขข้อมูลสมาชิก</asp:Label>
				<asp:Button id="btnCancel" style="Z-INDEX: 134; LEFT: 568px; POSITION: absolute; TOP: 485px" runat="server" Width="68px" Height="41px" Text="ยกเลิก" tabIndex="12"></asp:Button>
				<asp:Label id="lblChkMobile" style="Z-INDEX: 132; LEFT: 493px; POSITION: absolute; TOP: 340px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="lblChkZipcode" style="Z-INDEX: 131; LEFT: 493px; POSITION: absolute; TOP: 297px" runat="server" Width="11px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="lblChkPhone" style="Z-INDEX: 130; LEFT: 171px; POSITION: absolute; TOP: 338px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="lblChkEmail" style="Z-INDEX: 129; LEFT: 171px; POSITION: absolute; TOP: 377px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="lblChkUsername" style="Z-INDEX: 128; LEFT: 171px; POSITION: absolute; TOP: 417px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="lblChkPassword" style="Z-INDEX: 127; LEFT: 171px; POSITION: absolute; TOP: 460px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="lblChkRepassword" style="Z-INDEX: 126; LEFT: 171px; POSITION: absolute; TOP: 503px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="lblChkSurname" style="Z-INDEX: 125; LEFT: 493px; POSITION: absolute; TOP: 188px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="lblchkProvince" style="Z-INDEX: 124; LEFT: 493px; POSITION: absolute; TOP: 237px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="lblChkAddress" style="Z-INDEX: 123; LEFT: 171px; POSITION: absolute; TOP: 227px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Label id="Label11" style="Z-INDEX: 121; LEFT: 380px; POSITION: absolute; TOP: 334px" runat="server" Width="101px" Height="21px">เบอร์โทรมือถือ</asp:Label>
				<asp:Label id="Label10" style="Z-INDEX: 120; LEFT: 41px; POSITION: absolute; TOP: 503px" runat="server" Width="118px" Height="21px">รหัสสมาชิกอีกครั้ง</asp:Label>
				<asp:Label id="Label9" style="Z-INDEX: 119; LEFT: 41px; POSITION: absolute; TOP: 459px" runat="server" Width="79px" Height="21px">รหัสสมาชิก</asp:Label>
				<asp:Label id="Label8" style="Z-INDEX: 118; LEFT: 41px; POSITION: absolute; TOP: 418px" runat="server" Width="73px" Height="21px">ชื่อสมาชิก</asp:Label>
				<asp:Label id="Label7" style="Z-INDEX: 117; LEFT: 41px; POSITION: absolute; TOP: 379px" runat="server" Width="41px" Height="21px">Email</asp:Label>
				<asp:Label id="Label6" style="Z-INDEX: 116; LEFT: 41px; POSITION: absolute; TOP: 333px" runat="server" Width="90px" Height="21px">เบอร์โทรทีพัก</asp:Label>
				<asp:Label id="Label5" style="Z-INDEX: 115; LEFT: 380px; POSITION: absolute; TOP: 234px" runat="server" Width="90px" Height="21px">จังหวัด</asp:Label>
				<asp:Label id="Label4" style="Z-INDEX: 113; LEFT: 380px; POSITION: absolute; TOP: 291px" runat="server" Width="90px" Height="21px">รหัสไปรษณีย์</asp:Label>
				<asp:Label id="Label3" style="Z-INDEX: 112; LEFT: 41px; POSITION: absolute; TOP: 226px" runat="server" Width="34px" Height="21px">ที่อยู่</asp:Label>
				<asp:Label id="Label2" style="Z-INDEX: 111; LEFT: 380px; POSITION: absolute; TOP: 183px" runat="server" Width="59px" Height="21px">นามสกุล</asp:Label>
				<asp:TextBox id="txtRepassword" style="Z-INDEX: 109; LEFT: 196px; POSITION: absolute; TOP: 502px" runat="server" Width="143px" Height="22px" MaxLength="20" TextMode="Password" tabIndex="10"></asp:TextBox>
				<asp:TextBox id="txtPassword" style="Z-INDEX: 108; LEFT: 196px; POSITION: absolute; TOP: 457px" runat="server" Width="143px" Height="22px" TextMode="Password" MaxLength="20" tabIndex="9"></asp:TextBox>
				<asp:TextBox id="txtUsername" style="Z-INDEX: 107; LEFT: 195px; POSITION: absolute; TOP: 416px" runat="server" Width="143px" Height="22px" MaxLength="20" BackColor="#C0FFC0" Enabled="False" ForeColor="Black"></asp:TextBox>
				<asp:TextBox id="txtEmail" style="Z-INDEX: 106; LEFT: 196px; POSITION: absolute; TOP: 375px" runat="server" Width="141px" Height="22px" MaxLength="50" tabIndex="8"></asp:TextBox>
				<asp:TextBox id="txtMobile" style="Z-INDEX: 105; LEFT: 521px; POSITION: absolute; TOP: 335px" runat="server" Width="143px" Height="22px" MaxLength="20" tabIndex="7"></asp:TextBox>
				<asp:TextBox id="txtPhone" style="Z-INDEX: 104; LEFT: 195px; POSITION: absolute; TOP: 334px" runat="server" Width="143px" Height="22px" MaxLength="20" tabIndex="6"></asp:TextBox>
				<asp:TextBox id="txtZipcode" style="Z-INDEX: 103; LEFT: 520px; POSITION: absolute; TOP: 293px" runat="server" Width="143px" Height="22px" MaxLength="10" tabIndex="5"></asp:TextBox>
				<asp:TextBox id="txtAddress" style="Z-INDEX: 102; LEFT: 194px; POSITION: absolute; TOP: 222px" runat="server" Width="144px" Height="93px" TextMode="MultiLine" MaxLength="255" tabIndex="3"></asp:TextBox>
				<asp:TextBox id="txtSurname" style="Z-INDEX: 101; LEFT: 518px; POSITION: absolute; TOP: 185px" runat="server" Width="143px" Height="22px" MaxLength="50" tabIndex="2"></asp:TextBox>
				<asp:Label id="Label1" style="Z-INDEX: 110; LEFT: 41px; POSITION: absolute; TOP: 187px" runat="server" Width="36px" Height="21px">ชื่อ</asp:Label>
				<asp:DropDownList id="ddlProvince" style="Z-INDEX: 114; LEFT: 518px; POSITION: absolute; TOP: 236px" runat="server" Width="147px" Height="20px" tabIndex="4">
					<asp:ListItem Value="กรุงเทพ" Selected="True">กรุงเทพ</asp:ListItem>
					<asp:ListItem Value="ฉะเชิงเทรา">ฉะเชิงเทรา</asp:ListItem>
				</asp:DropDownList>
				<asp:Label id="lblChkName" style="Z-INDEX: 122; LEFT: 171px; POSITION: absolute; TOP: 185px" runat="server" Width="13px" Height="13px" ForeColor="Red" Font-Bold="True" Visible="False">*</asp:Label>
				<asp:Button id="btnOK" style="Z-INDEX: 133; LEFT: 409px; POSITION: absolute; TOP: 485px" runat="server" Width="68px" Height="41px" Text="ยืนยัน" tabIndex="11"></asp:Button>
				<asp:Label id="lblError" style="Z-INDEX: 136; LEFT: 405px; POSITION: absolute; TOP: 387px" runat="server" Height="71px" Width="236px" Visible="False" Font-Bold="True" ForeColor="Red" Font-Size="Larger">กรุณาเข้าสู่ระบบก่อนแก้ไขข้อมูลสมาชิก</asp:Label></FONT>
		</form>
	</body>
</HTML>
