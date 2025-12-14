<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormEditInBasket.aspx.vb" Inherits="WebApplicationSeller2.WebFormEditInBasket"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormEditInBasket</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" BGCOLOR="#cc9966">
		<form id="Form1" method="post" runat="server">
			<FONT face="MS Sans Serif, Microsoft Sans Serif" size="2">
				<asp:label id="lblName" style="Z-INDEX: 110; LEFT: 144px; POSITION: absolute; TOP: 70px" runat="server" Width="232px" Height="45px" Font-Bold="True" ForeColor="White" Font-Size="Larger">Label</asp:label><asp:button id="btnDelete" style="Z-INDEX: 111; LEFT: 293px; POSITION: absolute; TOP: 333px" runat="server" Width="79px" Height="27px" Text="ลบ"></asp:button><asp:label id="lblDetail" style="Z-INDEX: 100; LEFT: 143px; POSITION: absolute; TOP: 181px" runat="server" Width="230px" Height="132px">Label</asp:label><asp:image id="ImgProduct" style="Z-INDEX: 101; LEFT: 392px; POSITION: absolute; TOP: 67px" runat="server" Width="304px" Height="250px"></asp:image><asp:textbox id="txtQuantity" style="Z-INDEX: 102; LEFT: 231px; POSITION: absolute; TOP: 131px" runat="server" Width="45px" Height="30px" MaxLength="3"></asp:textbox><asp:label id="Label3" style="Z-INDEX: 103; LEFT: 142px; POSITION: absolute; TOP: 130px" runat="server" Width="72" Height="37">จำนวน</asp:label><asp:label id="lblUnit" style="Z-INDEX: 104; LEFT: 301px; POSITION: absolute; TOP: 130px" runat="server" Width="72px" Height="37px">Label</asp:label><asp:label id="lblPrice" style="Z-INDEX: 105; LEFT: 419px; POSITION: absolute; TOP: 330px" runat="server" Width="260px" Height="24px">Label</asp:label><asp:button id="btnEdit" style="Z-INDEX: 106; LEFT: 141px; POSITION: absolute; TOP: 332px" runat="server" Width="79px" Height="27px" Text="แก้ไข"></asp:button><asp:label id="lblError" style="Z-INDEX: 108; LEFT: 144px; POSITION: absolute; TOP: 374px" runat="server" Width="550px" Height="25px" Font-Bold="True" ForeColor="Red" Font-Size="Larger" Visible="False"></asp:label></FONT>
		</form>
	</body>
</HTML>
