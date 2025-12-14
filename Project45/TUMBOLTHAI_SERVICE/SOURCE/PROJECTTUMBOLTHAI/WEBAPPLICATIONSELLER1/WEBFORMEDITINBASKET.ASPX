<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormEditInBasket.aspx.vb" Inherits="WebApplicationSeller1.WebFormEditInBasket"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormEditInBasket</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body background="pic/snows.gif" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma">
				<asp:label id="lblName" style="Z-INDEX: 112; LEFT: 142px; POSITION: absolute; TOP: 72px" runat="server" Font-Size="Larger" ForeColor="#8080FF" Font-Bold="True" Height="45px" Width="232px">Label</asp:label><asp:button id="btnDelete" style="Z-INDEX: 111; LEFT: 293px; POSITION: absolute; TOP: 333px" runat="server" Height="27px" Width="79px" Text="ลบ"></asp:button><asp:label id="lblDetail" style="Z-INDEX: 100; LEFT: 143px; POSITION: absolute; TOP: 181px" runat="server" Height="132px" Width="230px">Label</asp:label><asp:image id="ImgProduct" style="Z-INDEX: 101; LEFT: 392px; POSITION: absolute; TOP: 67px" runat="server" Height="250px" Width="304px"></asp:image><asp:textbox id="txtQuantity" style="Z-INDEX: 102; LEFT: 231px; POSITION: absolute; TOP: 131px" runat="server" Height="30px" Width="45px" MaxLength="3"></asp:textbox><asp:label id="Label3" style="Z-INDEX: 103; LEFT: 142px; POSITION: absolute; TOP: 130px" runat="server" Height="37" Width="72">จำนวน</asp:label><asp:label id="lblUnit" style="Z-INDEX: 104; LEFT: 301px; POSITION: absolute; TOP: 130px" runat="server" Height="37px" Width="72px">Label</asp:label><asp:label id="lblPrice" style="Z-INDEX: 105; LEFT: 419px; POSITION: absolute; TOP: 330px" runat="server" Height="24px" Width="260px">Label</asp:label><asp:button id="btnEdit" style="Z-INDEX: 106; LEFT: 141px; POSITION: absolute; TOP: 332px" runat="server" Height="27px" Width="79px" Text="แก้ไข"></asp:button><asp:label id="lblError" style="Z-INDEX: 108; LEFT: 144px; POSITION: absolute; TOP: 374px" runat="server" Font-Size="Larger" ForeColor="Red" Font-Bold="True" Height="25px" Width="550px" Visible="False"></asp:label></FONT></form>
	</body>
</HTML>
