<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormSearch.aspx.vb" Inherits="WebApplicationCenter.WebFormSearch"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormSearch</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" bgColor="#ffffcc">
		<form id="Form1" method="post" runat="server">
			<FONT face="MS Sans Serif, Microsoft Sans Serif" size="2">
				<asp:Label id="Label3" style="Z-INDEX: 103; LEFT: 30px; POSITION: absolute; TOP: 52px" runat="server" Width="50px" Height="23px" ForeColor="Black" Font-Bold="True">ค้นหา</asp:Label>
				<asp:Label id="Label4" style="Z-INDEX: 111; LEFT: 411px; POSITION: absolute; TOP: 18px" runat="server" Font-Bold="True" ForeColor="#404040" Height="23px" Width="71px">ราคาไม่เกิน</asp:Label>
				<asp:Label id="Label1" style="Z-INDEX: 110; LEFT: 250px; POSITION: absolute; TOP: 19px" runat="server" Font-Bold="True" ForeColor="#404040" Height="23px" Width="111px">รายละเอียดเพิ่มเติม</asp:Label>
				<asp:TextBox id="txtPrice" style="Z-INDEX: 109; LEFT: 409px; POSITION: absolute; TOP: 52px" runat="server" Height="22px" Width="77px" tabIndex="3"></asp:TextBox>
				<asp:TextBox id="txtDetail" style="Z-INDEX: 108; LEFT: 247px; POSITION: absolute; TOP: 52px" runat="server" Height="22px" Width="151px" tabIndex="2"></asp:TextBox>
				<asp:Label id="Label2" style="Z-INDEX: 101; LEFT: 95px; POSITION: absolute; TOP: 18px" runat="server" Width="64px" Height="23px" ForeColor="#404040" Font-Bold="True">ชื่อสินค้า</asp:Label>
				<asp:TextBox id="txtNameProduct" style="Z-INDEX: 100; LEFT: 87px; POSITION: absolute; TOP: 51px" runat="server" Width="151px" Height="22px" tabIndex="1"></asp:TextBox>
				<asp:Button id="btnSearch" style="Z-INDEX: 104; LEFT: 502px; POSITION: absolute; TOP: 46px" runat="server" Width="84px" Height="29px" Text="ค้นหา" tabIndex="4"></asp:Button>
				<asp:Label id="lblerror" style="Z-INDEX: 105; LEFT: 85px; POSITION: absolute; TOP: 84px" runat="server" Width="132px" Height="24px" ForeColor="Red" Visible="False">* กรุณาใส่ชื่อสินค้าด้วยครับ</asp:Label>
				<asp:DataGrid id=DataGrid1 style="Z-INDEX: 106; LEFT: 34px; POSITION: absolute; TOP: 147px" runat="server" Width="679px" Height="215px" DataSource="<%# DataSet1 %>" BorderColor="White" GridLines="None">
				</asp:DataGrid>
				<HR style="Z-INDEX: 107; LEFT: 0px; POSITION: absolute; TOP: 124px; HEIGHT: 5px" width="100%" SIZE="5">
			</FONT>
		</form>
	</body>
</HTML>
