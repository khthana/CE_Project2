<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormPutIn.aspx.vb" Inherits="WebApplicationCenter.WebFormPutIn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormPutIn</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" BGCOLOR="#ffffcc">
		<form id="Form1" method="post" runat="server">
			<FONT face="MS Sans Serif, Microsoft Sans Serif" size="2">
				<asp:Label id="lblName" style="Z-INDEX: 100; LEFT: 139px; POSITION: absolute; TOP: 72px" runat="server" Width="232px" Height="45px" Font-Bold="True" ForeColor="Black" Font-Size="Larger">Label</asp:Label>
				<asp:Button id="btnInBasket" style="Z-INDEX: 110; LEFT: 297px; POSITION: absolute; TOP: 334px" runat="server" Width="79px" Height="27px" Text="ในตะกร้า" tabIndex="3"></asp:Button>
				<asp:Label id="lblDetail" style="Z-INDEX: 101; LEFT: 143px; POSITION: absolute; TOP: 181px" runat="server" Width="230px" Height="132px">Label</asp:Label>
				<asp:Image id="ImgProduct" style="Z-INDEX: 102; LEFT: 392px; POSITION: absolute; TOP: 67px" runat="server" Width="304px" Height="250px"></asp:Image>
				<asp:TextBox id="txtQuantity" style="Z-INDEX: 103; LEFT: 231px; POSITION: absolute; TOP: 131px" runat="server" Width="45px" Height="30px" MaxLength="3" tabIndex="1"></asp:TextBox>
				<asp:Label id="Label3" style="Z-INDEX: 104; LEFT: 142px; POSITION: absolute; TOP: 130px" runat="server" Width="72" Height="37">จำนวน</asp:Label>
				<asp:Label id="lblUnit" style="Z-INDEX: 105; LEFT: 301px; POSITION: absolute; TOP: 130px" runat="server" Width="72px" Height="37px">Label</asp:Label>
				<asp:Label id="lblPrice" style="Z-INDEX: 106; LEFT: 419px; POSITION: absolute; TOP: 330px" runat="server" Width="260px" Height="24px">Label</asp:Label>
				<asp:Button id="btnOk" style="Z-INDEX: 108; LEFT: 141px; POSITION: absolute; TOP: 332px" runat="server" Width="79px" Height="27px" Text="ตกลง" tabIndex="2"></asp:Button>
				<asp:Label id="lblError" style="Z-INDEX: 109; LEFT: 144px; POSITION: absolute; TOP: 374px" runat="server" Width="550px" Height="25px" Font-Bold="True" ForeColor="Red" Font-Size="Larger" Visible="False"></asp:Label></FONT>
		</form>
	</body>
</HTML>
