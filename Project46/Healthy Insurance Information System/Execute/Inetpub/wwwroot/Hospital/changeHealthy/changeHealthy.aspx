<%@ Page language="c#" Codebehind="changeHealthy.aspx.cs" AutoEventWireup="false" Inherits="Hospital.changeHealthy.Form1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>changeHealthy</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" action="resultpage.aspx" method="post" runat="server">
			<FONT face="Tahoma">
				<asp:label id="Label1" style="Z-INDEX: 111; LEFT: 18px; POSITION: absolute; TOP: 8px" runat="server" Height="12px" Width="163px">รหัสประจำตัวประชาชน :</asp:label><asp:label id="Label11" style="Z-INDEX: 112; LEFT: 18px; POSITION: absolute; TOP: 210px" runat="server" Height="12px" Width="189px">เปลี่ยนโรงพยาบาลหลักเป็น :</asp:label><asp:label id="Label13" style="Z-INDEX: 110; LEFT: 16px; POSITION: absolute; TOP: 249px" runat="server" Height="12px" Width="192px">เปลี่ยนโรงพยาบาลรองเป็น :</asp:label><asp:label id="Label2" style="Z-INDEX: 101; LEFT: 224px; POSITION: absolute; TOP: 10px" runat="server" Height="12px" Width="250px" ForeColor="#FF8000"></asp:label><asp:label id="Label3" style="Z-INDEX: 103; LEFT: 17px; POSITION: absolute; TOP: 49px" runat="server" Height="12px" Width="153px">ชื่อ :</asp:label><asp:label id="Label4" style="Z-INDEX: 102; LEFT: 224px; POSITION: absolute; TOP: 50px" runat="server" Height="12px" Width="250px" ForeColor="#FF8000"></asp:label><asp:label id="Label5" style="Z-INDEX: 104; LEFT: 16px; POSITION: absolute; TOP: 89px" runat="server" Height="12px" Width="153px">นามสกุล :</asp:label><asp:label id="Label6" style="Z-INDEX: 105; LEFT: 224px; POSITION: absolute; TOP: 89px" runat="server" Height="12px" Width="250px" ForeColor="#FF8000"></asp:label><asp:label id="Label7" style="Z-INDEX: 106; LEFT: 16px; POSITION: absolute; TOP: 130px" runat="server" Height="12px" Width="155px">โรงพยาบาลหลัก :</asp:label><asp:label id="Label8" style="Z-INDEX: 107; LEFT: 224px; POSITION: absolute; TOP: 133px" runat="server" Height="12px" Width="250px" ForeColor="#FF8000"></asp:label><asp:label id="Label9" style="Z-INDEX: 108; LEFT: 16px; POSITION: absolute; TOP: 170px" runat="server" Height="12px" Width="151px">โรงพยาบาลรอง :</asp:label><asp:label id="Label10" style="Z-INDEX: 109; LEFT: 224px; POSITION: absolute; TOP: 171px" runat="server" Height="12px" Width="250px" ForeColor="#FF8000"></asp:label><asp:dropdownlist id="DropDownList1" style="Z-INDEX: 113; LEFT: 221px; POSITION: absolute; TOP: 209px" runat="server" Height="25px" Width="234px"></asp:dropdownlist><asp:dropdownlist id="DropDownList2" style="Z-INDEX: 114; LEFT: 222px; POSITION: absolute; TOP: 248px" runat="server" Height="26px" Width="233px"></asp:dropdownlist><asp:button id="Button1" style="Z-INDEX: 115; LEFT: 128px; POSITION: absolute; TOP: 288px" onclick="cmd1_Click" runat="server" Height="24px" Width="80px" Text="Submit"></asp:button></FONT></form>
	</body>
</HTML>
