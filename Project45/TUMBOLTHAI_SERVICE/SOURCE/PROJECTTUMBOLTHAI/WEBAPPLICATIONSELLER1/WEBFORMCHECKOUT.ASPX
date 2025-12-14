<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormCheckOut.aspx.vb" Inherits="WebApplicationSeller1.WebFormCheckOut"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormCheckOut</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" BACKGROUND="pic/snows.gif">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma">
				<asp:TextBox id="txtAddress" style="Z-INDEX: 112; LEFT: 159px; POSITION: absolute; TOP: 191px" runat="server" Width="169px" Height="121px"></asp:TextBox>
				<asp:DropDownList id="ddlWaypay" style="Z-INDEX: 115; LEFT: 449px; POSITION: absolute; TOP: 155px" runat="server" Height="26px" Width="219px"></asp:DropDownList>
				<asp:Label id="lblWaypay" style="Z-INDEX: 114; LEFT: 451px; POSITION: absolute; TOP: 191px" runat="server" Height="257px" Width="266px"></asp:Label>
				<asp:Label id="lblNAme" style="Z-INDEX: 110; LEFT: 47px; POSITION: absolute; TOP: 155px" runat="server" Width="84px" Height="23px">ชื่อ สกุล</asp:Label>
				<asp:TextBox id="txtName" style="Z-INDEX: 109; LEFT: 161px; POSITION: absolute; TOP: 154px" runat="server" Width="167px" Height="23px"></asp:TextBox>
				<asp:Label id="Label3" style="Z-INDEX: 106; LEFT: 45px; POSITION: absolute; TOP: 356px" runat="server" Width="92px" Height="22px">รหัสไปรษณีย์</asp:Label>
				<asp:Label id="Label2" style="Z-INDEX: 105; LEFT: 44px; POSITION: absolute; TOP: 327px" runat="server" Width="84px" Height="23px">จังหวัด</asp:Label>
				<asp:TextBox id="TextBox6" style="Z-INDEX: 101; LEFT: 161px; POSITION: absolute; TOP: 326px" runat="server" Width="167px" Height="23px"></asp:TextBox>
				<asp:TextBox id="txtProvince" style="Z-INDEX: 102; LEFT: 161px; POSITION: absolute; TOP: 326px" runat="server" Width="167px" Height="23px"></asp:TextBox>
				<asp:TextBox id="txtZipcode" style="Z-INDEX: 103; LEFT: 162px; POSITION: absolute; TOP: 356px" runat="server" Width="167px" Height="23px"></asp:TextBox>
				<asp:TextBox id="TextBox2" style="Z-INDEX: 100; LEFT: 161px; POSITION: absolute; TOP: 326px" runat="server" Width="167px" Height="23px"></asp:TextBox>
				<asp:Label id="Label1" style="Z-INDEX: 104; LEFT: 45px; POSITION: absolute; TOP: 199px" runat="server" Width="84px" Height="22px">ที่อยู่</asp:Label>
				<asp:Button id="btnOK" style="Z-INDEX: 107; LEFT: 358px; POSITION: absolute; TOP: 347px" runat="server" Width="69px" Height="35px" Text="ตกลง"></asp:Button>
				<asp:Label id="Label4" style="Z-INDEX: 108; LEFT: 53px; POSITION: absolute; TOP: 81px" runat="server" Width="281px" Height="42px">ชื่อและที่อยู่ของผู้รับสินค้า</asp:Label>
				<asp:Label id="lblError" style="Z-INDEX: 111; LEFT: 47px; POSITION: absolute; TOP: 397px" runat="server" Width="262px" Height="23px" ForeColor="Red">คุณต้องทำการเข้าสู่ระบบก่อน</asp:Label></FONT>
		</form>
	</body>
</HTML>
