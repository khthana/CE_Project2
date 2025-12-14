<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormBuyer.aspx.vb" Inherits="WebApplicationSeller1.WebFormBuyer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormBuyer</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" BACKGROUND="pic/snows.gif">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma">
				<asp:DataGrid id=DataGrid1 style="Z-INDEX: 112; LEFT: 108px; POSITION: absolute; TOP: 428px" runat="server" Width="477px" Height="117px" DataSource="<%# DataSet1 %>">
				</asp:DataGrid>
				<asp:TextBox id="txtEmail" style="Z-INDEX: 115; LEFT: 95px; POSITION: absolute; TOP: 331px" runat="server" Height="25px" Width="184px"></asp:TextBox>
				<asp:Label id="Label3" style="Z-INDEX: 114; LEFT: 310px; POSITION: absolute; TOP: 320px" runat="server" Height="30px" Width="313px">*กรุณาตรวจสอบ  Email ของท่านอีกครังเพือทางระบบจะส่งจดหมายยืนยันการซื้อขายไปให้</asp:Label>
				<asp:Button id="btnOK" style="Z-INDEX: 110; LEFT: 457px; POSITION: absolute; TOP: 186px" runat="server" Width="90px" Height="31px" Text="ตกลง"></asp:Button>
				<asp:Label id="Label6" style="Z-INDEX: 109; LEFT: 307px; POSITION: absolute; TOP: 140px" runat="server" Width="110px" Height="21px">รหัสอีกครั้ง</asp:Label>
				<asp:Label id="Label5" style="Z-INDEX: 108; LEFT: 305px; POSITION: absolute; TOP: 114px" runat="server" Width="110px" Height="21px">รหัสบัตรเครดิต</asp:Label>
				<asp:TextBox id="txtRePassword" style="Z-INDEX: 106; LEFT: 433px; POSITION: absolute; TOP: 142px" runat="server" Width="118px" Height="19px" TextMode="Password" MaxLength="20"></asp:TextBox>
				<asp:TextBox id="txtPassword" style="Z-INDEX: 105; LEFT: 433px; POSITION: absolute; TOP: 115px" runat="server" Width="118px" Height="19px" TextMode="Password" MaxLength="20"></asp:TextBox>
				<asp:Label id="lblSum" style="Z-INDEX: 102; LEFT: 333px; POSITION: absolute; TOP: 387px" runat="server" Width="160px" Height="32px"></asp:Label>
				<asp:Label id="Label1" style="Z-INDEX: 100; LEFT: 232px; POSITION: absolute; TOP: 387px" runat="server" Width="92px" Height="29px">รวมเงินทั้งสิ้น</asp:Label>
				<asp:Label id="Label2" style="Z-INDEX: 101; LEFT: 504px; POSITION: absolute; TOP: 389px" runat="server" Width="67px" Height="29px">บาท</asp:Label>
				<asp:TextBox id="txtID" style="Z-INDEX: 103; LEFT: 433px; POSITION: absolute; TOP: 86px" runat="server" Width="118px" Height="19px" MaxLength="50"></asp:TextBox>
				<asp:Label id="lblTo" style="Z-INDEX: 104; LEFT: 96px; POSITION: absolute; TOP: 86px" runat="server" Width="174px" Height="205px"></asp:Label>
				<asp:Label id="Label4" style="Z-INDEX: 107; LEFT: 304px; POSITION: absolute; TOP: 87px" runat="server" Width="110px" Height="21px">เลขที่บัตรเครดิต</asp:Label>
				<asp:Label id="lblError" style="Z-INDEX: 111; LEFT: 309px; POSITION: absolute; TOP: 247px" runat="server" Width="251px" Height="34px" ForeColor="Red"></asp:Label></FONT>
		</form>
	</body>
</HTML>
