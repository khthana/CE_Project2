<%@ Page language="c#" Codebehind="Profile.aspx.cs" AutoEventWireup="false" Inherits="WebApplication1.Profile" aspCompat="True"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Profile</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html;">
		<style>TD { FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: verdana,arial }
		</style>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server" target="_blank">
			<asp:datagrid id="DataGrid1" style="Z-INDEX: 101; LEFT: 40px; POSITION: absolute; TOP: 144px"
				runat="server" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" BackColor="White"
				CellPadding="3" GridLines="Horizontal">
				<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
				<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
				<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
				<ItemStyle ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
				<HeaderStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
				<Columns>
					<asp:TemplateColumn>
						<ItemTemplate>
							<asp:CheckBox id="CheckBox1" runat="server" Enabled="False"></asp:CheckBox>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:ButtonColumn Text="print" CommandName="Delete"></asp:ButtonColumn>
				</Columns>
				<PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
			</asp:datagrid>
			<asp:Label id="Label4" style="Z-INDEX: 113; LEFT: 96px; POSITION: absolute; TOP: 16px" runat="server"
				Font-Size="30pt" Font-Italic="True" Font-Bold="True" ForeColor="#C0C0FF" Width="416px">Profile User</asp:Label><asp:button id="fButtonCancel" style="Z-INDEX: 102; LEFT: 240px; POSITION: absolute; TOP: 88px"
				runat="server" Text="ยกเลิก"></asp:button>
			<asp:button id="fButtonBuy" style="Z-INDEX: 103; LEFT: 136px; POSITION: absolute; TOP: 88px"
				runat="server" Text="ชำระเงิน"></asp:button>
			<asp:button id="Button1" style="Z-INDEX: 104; LEFT: 40px; POSITION: absolute; TOP: 88px" runat="server"
				Text="จองเพิ่ม"></asp:button></form>
	</body>
</HTML>
