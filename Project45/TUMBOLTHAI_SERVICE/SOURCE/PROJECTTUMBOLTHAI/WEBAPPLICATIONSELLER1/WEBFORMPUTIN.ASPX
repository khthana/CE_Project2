<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormPutIn.aspx.vb" Inherits="WebApplicationSeller1.WebFormPutIn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormPutIn</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" BACKGROUND="pic/snows.gif">
		<form id="Form1" method="post" runat="server">
			<asp:label id="lblName" style="Z-INDEX: 113; LEFT: 194px; POSITION: absolute; TOP: 54px" runat="server" Font-Size="Larger" ForeColor="#8080FF" Font-Bold="True" Height="48px" Width="228px"></asp:label>
			<asp:button id="btnInBasket" style="Z-INDEX: 112; LEFT: 347px; POSITION: absolute; TOP: 320px" runat="server" Height="27px" Width="79px" Text="ในตะกร้า"></asp:button>
			<asp:label id="lblDetail" style="Z-INDEX: 101; LEFT: 193px; POSITION: absolute; TOP: 167px" runat="server" Height="132px" Width="230px">Label</asp:label>
			<asp:image id="ImgProduct" style="Z-INDEX: 102; LEFT: 442px; POSITION: absolute; TOP: 53px" runat="server" Height="250px" Width="304px"></asp:image>
			<asp:textbox id="txtQuantity" style="Z-INDEX: 104; LEFT: 281px; POSITION: absolute; TOP: 117px" runat="server" Height="30px" Width="45px" MaxLength="3"></asp:textbox>
			<asp:label id="Label3" style="Z-INDEX: 105; LEFT: 192px; POSITION: absolute; TOP: 116px" runat="server" Height="37" Width="72">จำนวน</asp:label>
			<asp:label id="lblUnit" style="Z-INDEX: 107; LEFT: 351px; POSITION: absolute; TOP: 116px" runat="server" Height="37px" Width="72px">Label</asp:label>
			<asp:label id="lblPrice" style="Z-INDEX: 108; LEFT: 469px; POSITION: absolute; TOP: 316px" runat="server" Height="24px" Width="260px">Label</asp:label>
			<asp:button id="btnOk" style="Z-INDEX: 109; LEFT: 191px; POSITION: absolute; TOP: 318px" runat="server" Height="27px" Width="79px" Text="ตกลง"></asp:button>
			<asp:label id="lblError" style="Z-INDEX: 110; LEFT: 194px; POSITION: absolute; TOP: 360px" runat="server" Font-Size="Larger" ForeColor="Red" Font-Bold="True" Height="25px" Width="550px" Visible="False"></asp:label>
		</form>
	</body>
</HTML>
