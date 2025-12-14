<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormCheckOut.aspx.vb" Inherits="WebApplicationSeller2.WebFormCheckOut"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormCheckOut</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body bgColor="#cc9966" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="MS Sans Serif, Microsoft Sans Serif" size="2">
				<asp:textbox id="txtAddress" style="Z-INDEX: 101; LEFT: 161px; POSITION: absolute; TOP: 194px" runat="server" Height="121px" Width="169px"></asp:textbox>
				<asp:DropDownList id="ddlWaypay" style="Z-INDEX: 115; LEFT: 451px; POSITION: absolute; TOP: 153px" runat="server" Width="219px" Height="26px"></asp:DropDownList>
				<asp:Label id="lblWaypay" style="Z-INDEX: 114; LEFT: 451px; POSITION: absolute; TOP: 191px" runat="server" Width="266px" Height="257px"></asp:Label><asp:label id="lblNAme" style="Z-INDEX: 112; LEFT: 47px; POSITION: absolute; TOP: 155px" runat="server" Height="23px" Width="84px">ชื่อ สกุล</asp:label><asp:textbox id="txtName" style="Z-INDEX: 111; LEFT: 161px; POSITION: absolute; TOP: 154px" runat="server" Height="23px" Width="167px"></asp:textbox><asp:label id="Label3" style="Z-INDEX: 108; LEFT: 45px; POSITION: absolute; TOP: 356px" runat="server" Height="22px" Width="92px">รหัสไปรษณีย์</asp:label><asp:label id="Label2" style="Z-INDEX: 107; LEFT: 44px; POSITION: absolute; TOP: 327px" runat="server" Height="23px" Width="84px">จังหวัด</asp:label><asp:textbox id="TextBox6" style="Z-INDEX: 103; LEFT: 161px; POSITION: absolute; TOP: 326px" runat="server" Height="23px" Width="167px"></asp:textbox><asp:textbox id="txtProvince" style="Z-INDEX: 104; LEFT: 161px; POSITION: absolute; TOP: 326px" runat="server" Height="23px" Width="167px"></asp:textbox><asp:textbox id="txtZipcode" style="Z-INDEX: 105; LEFT: 162px; POSITION: absolute; TOP: 356px" runat="server" Height="23px" Width="167px"></asp:textbox><asp:textbox id="TextBox2" style="Z-INDEX: 102; LEFT: 161px; POSITION: absolute; TOP: 326px" runat="server" Height="23px" Width="167px"></asp:textbox><asp:label id="Label1" style="Z-INDEX: 106; LEFT: 45px; POSITION: absolute; TOP: 199px" runat="server" Height="22px" Width="84px">ที่อยู่</asp:label><asp:button id="btnOK" style="Z-INDEX: 109; LEFT: 358px; POSITION: absolute; TOP: 347px" runat="server" Height="35px" Width="69px" Text="ตกลง"></asp:button><asp:label id="Label4" style="Z-INDEX: 110; LEFT: 53px; POSITION: absolute; TOP: 81px" runat="server" Height="42px" Width="281px">ชื่อและที่อยู่ของผู้รับสินค้า</asp:label><asp:label id="lblError" style="Z-INDEX: 113; LEFT: 47px; POSITION: absolute; TOP: 397px" runat="server" Height="23px" Width="262px" ForeColor="Red">คุณต้องทำการเข้าสู่ระบบก่อน</asp:label></FONT></form>
	</body>
</HTML>
