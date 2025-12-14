<%@ Page language="c#" Codebehind="Paying.aspx.cs" AutoEventWireup="false" Inherits="WebApplication1.Paying" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Paying</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<meta http-equiv="Content-Type" content="text/html;">
		<style>TD { FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: verdana,arial }
		</style>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:DataGrid id="DataGrid1" style="Z-INDEX: 100; LEFT: 32px; POSITION: absolute; TOP: 216px"
				runat="server" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" BackColor="White"
				CellPadding="3" GridLines="Horizontal">
				<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
				<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
				<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
				<ItemStyle ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
				<HeaderStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
				<PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
			</asp:DataGrid>
			<asp:Label id="Label4" style="Z-INDEX: 117; LEFT: 256px; POSITION: absolute; TOP: -8px" runat="server"
				Width="344px" Font-Size="30pt" Font-Italic="True" Font-Bold="True" ForeColor="#C0C0FF">Payment</asp:Label>
			<asp:Label id="Label1" style="Z-INDEX: 116; LEFT: 16px; POSITION: absolute; TOP: 168px" runat="server">ยอดเงินที่ต้องชำระ :</asp:Label>
			<asp:TextBox id="fTextTotalCost" style="Z-INDEX: 101; LEFT: 160px; POSITION: absolute; TOP: 168px"
				runat="server" Width="144px">0</asp:TextBox>
			<asp:TextBox id="fTextCreditNo" style="Z-INDEX: 102; LEFT: 160px; POSITION: absolute; TOP: 56px"
				runat="server" MaxLength="16"></asp:TextBox>
			<asp:TextBox id="fTextVerifyNo" style="Z-INDEX: 103; LEFT: 160px; POSITION: absolute; TOP: 80px"
				runat="server" Width="88px" MaxLength="3" TextMode="Password"></asp:TextBox>
			<asp:DropDownList id="fComboCardType" style="Z-INDEX: 104; LEFT: 160px; POSITION: absolute; TOP: 104px"
				runat="server">
				<asp:ListItem Value="VISA">VISA</asp:ListItem>
				<asp:ListItem Value="MASTER">MASTER</asp:ListItem>
			</asp:DropDownList>
			<asp:DropDownList id="fComboMonth" style="Z-INDEX: 105; LEFT: 200px; POSITION: absolute; TOP: 136px"
				runat="server">
				<asp:ListItem Value="1">Jan</asp:ListItem>
				<asp:ListItem Value="2">Feb</asp:ListItem>
				<asp:ListItem Value="3">Mar</asp:ListItem>
				<asp:ListItem Value="4">Apr</asp:ListItem>
				<asp:ListItem Value="5">May</asp:ListItem>
				<asp:ListItem Value="6">Jun</asp:ListItem>
				<asp:ListItem Value="7">Jul</asp:ListItem>
				<asp:ListItem Value="8">Aug</asp:ListItem>
				<asp:ListItem Value="9">Sep</asp:ListItem>
				<asp:ListItem Value="10">Oct</asp:ListItem>
				<asp:ListItem Value="11">Nov</asp:ListItem>
				<asp:ListItem Value="12">Dec</asp:ListItem>
			</asp:DropDownList>
			<asp:DropDownList id="fComboYear" style="Z-INDEX: 106; LEFT: 288px; POSITION: absolute; TOP: 136px"
				runat="server">
				<asp:ListItem Value="2006">2006</asp:ListItem>
				<asp:ListItem Value="2007">2007</asp:ListItem>
				<asp:ListItem Value="2008">2008</asp:ListItem>
				<asp:ListItem Value="2009">2009</asp:ListItem>
				<asp:ListItem Value="2010">2010</asp:ListItem>
				<asp:ListItem Value="2011">2011</asp:ListItem>
				<asp:ListItem Value="2012">2012</asp:ListItem>
				<asp:ListItem Value="2013">2013</asp:ListItem>
				<asp:ListItem Value="2014">2014</asp:ListItem>
				<asp:ListItem Value="2015">2015</asp:ListItem>
			</asp:DropDownList>
			<asp:Label id="fLableCreditNo" style="Z-INDEX: 107; LEFT: 40px; POSITION: absolute; TOP: 56px"
				runat="server">เลขบัตรเครดิต</asp:Label>
			<asp:Label id="fLabelVerifyNo" style="Z-INDEX: 108; LEFT: 56px; POSITION: absolute; TOP: 80px"
				runat="server">รหัสหลังบัตร</asp:Label>
			<asp:Label id="fLableCardType" style="Z-INDEX: 109; LEFT: 80px; POSITION: absolute; TOP: 104px"
				runat="server">ชนิดบัตร</asp:Label>
			<asp:Label id="fLabelYear" style="Z-INDEX: 110; LEFT: 272px; POSITION: absolute; TOP: 136px"
				runat="server">ปี</asp:Label>
			<asp:Label id="fLableExpire" style="Z-INDEX: 111; LEFT: 40px; POSITION: absolute; TOP: 136px"
				runat="server">วันหมดอายุบัตร</asp:Label>
			<asp:Label id="fLabelMonth" style="Z-INDEX: 113; LEFT: 160px; POSITION: absolute; TOP: 136px"
				runat="server">เดือน</asp:Label>
			<asp:Button id="Button1" style="Z-INDEX: 114; LEFT: 432px; POSITION: absolute; TOP: 72px" runat="server"
				Text="ยืนยันจ่ายเงิน"></asp:Button>
			<asp:Button id="fButtonCancel" style="Z-INDEX: 115; LEFT: 432px; POSITION: absolute; TOP: 120px"
				runat="server" Text="ยกเลิกการจ่ายเงิน"></asp:Button>
		</form>
	</body>
</HTML>
