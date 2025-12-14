<%@ Page language="c#" Codebehind="query.aspx.cs" AutoEventWireup="false" Inherits="queryHealthy.WebForm2" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>สอบถามข้อมูลประกันสุขภาพ</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio 7.0">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="WebForm2" method="post" runat="server">
			<FONT face="Tahoma">
				<asp:Label id="Label1" style="Z-INDEX: 100; LEFT: 16px; POSITION: absolute; TOP: 10px" runat="server" Height="12px" Width="230px">ประเภทประกันสุขภาพ :</asp:Label>
				<asp:Label id="Label38" style="Z-INDEX: 138; LEFT: 264px; POSITION: absolute; TOP: 729px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label>
				<asp:Label id="Label37" style="Z-INDEX: 137; LEFT: 16px; POSITION: absolute; TOP: 730px" runat="server" Width="230px" Height="12px"></asp:Label>
				<asp:Label id="Label36" style="Z-INDEX: 136; LEFT: 264px; POSITION: absolute; TOP: 689px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label>
				<asp:Label id="Label35" style="Z-INDEX: 135; LEFT: 16px; POSITION: absolute; TOP: 690px" runat="server" Width="230px" Height="12px"></asp:Label>
				<asp:Label id="Label34" style="Z-INDEX: 134; LEFT: 264px; POSITION: absolute; TOP: 650px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label>
				<asp:Label id="Label33" style="Z-INDEX: 133; LEFT: 16px; POSITION: absolute; TOP: 650px" runat="server" Width="230px" Height="12px"></asp:Label>
				<asp:Label id="Label32" style="Z-INDEX: 132; LEFT: 264px; POSITION: absolute; TOP: 609px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label>
				<asp:Label id="Label31" style="Z-INDEX: 131; LEFT: 16px; POSITION: absolute; TOP: 609px" runat="server" Width="230px" Height="12px"></asp:Label>
				<asp:Label id="Label30" style="Z-INDEX: 130; LEFT: 264px; POSITION: absolute; TOP: 570px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label>
				<asp:Label id="Label29" style="Z-INDEX: 129; LEFT: 16px; POSITION: absolute; TOP: 570px" runat="server" Width="230px" Height="12px"></asp:Label>
				<asp:Label id="Label28" style="Z-INDEX: 128; LEFT: 264px; POSITION: absolute; TOP: 529px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label>
				<asp:Label id="Label27" style="Z-INDEX: 127; LEFT: 16px; POSITION: absolute; TOP: 530px" runat="server" Width="230px" Height="12px"></asp:Label>
				<asp:Label id="Label26" style="Z-INDEX: 126; LEFT: 264px; POSITION: absolute; TOP: 490px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label>
				<asp:Label id="Label25" style="Z-INDEX: 125; LEFT: 16px; POSITION: absolute; TOP: 491px" runat="server" Width="230px" Height="12px"></asp:Label>
				<asp:Label id="Label24" style="Z-INDEX: 124; LEFT: 264px; POSITION: absolute; TOP: 449px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label>
				<asp:Label id="Label23" style="Z-INDEX: 123; LEFT: 16px; POSITION: absolute; TOP: 450px" runat="server" Width="230px" Height="12px"></asp:Label>
				<asp:Label id="Label22" style="Z-INDEX: 122; LEFT: 264px; POSITION: absolute; TOP: 409px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label>
				<asp:Label id="Label21" style="Z-INDEX: 121; LEFT: 16px; POSITION: absolute; TOP: 410px" runat="server" Width="230px" Height="12px"></asp:Label>
				<asp:Label id="Label20" style="Z-INDEX: 120; LEFT: 264px; POSITION: absolute; TOP: 370px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label>
				<asp:Label id="Label19" style="Z-INDEX: 119; LEFT: 16px; POSITION: absolute; TOP: 370px" runat="server" Width="230px" Height="12px"></asp:Label>
				<asp:Label id="Label18" style="Z-INDEX: 117; LEFT: 264px; POSITION: absolute; TOP: 330px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label>
				<asp:Label id="Label17" style="Z-INDEX: 116; LEFT: 16px; POSITION: absolute; TOP: 330px" runat="server" Width="230px" Height="12px"></asp:Label>
				<asp:Label id="Label16" style="Z-INDEX: 115; LEFT: 264px; POSITION: absolute; TOP: 289px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label>
				<asp:Label id="Label15" style="Z-INDEX: 114; LEFT: 16px; POSITION: absolute; TOP: 290px" runat="server" Width="230px" Height="12px"></asp:Label>
				<asp:Label id="Label14" style="Z-INDEX: 113; LEFT: 264px; POSITION: absolute; TOP: 250px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label>
				<asp:Label id="Label13" style="Z-INDEX: 112; LEFT: 16px; POSITION: absolute; TOP: 249px" runat="server" Width="230px" Height="12px"></asp:Label>
				<asp:Label id="Label12" style="Z-INDEX: 111; LEFT: 264px; POSITION: absolute; TOP: 209px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label>
				<asp:Label id="Label11" style="Z-INDEX: 110; LEFT: 17px; POSITION: absolute; TOP: 210px" runat="server" Width="230px" Height="12px"></asp:Label>
				<asp:Label id="Label10" style="Z-INDEX: 109; LEFT: 264px; POSITION: absolute; TOP: 171px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label>
				<asp:Label id="Label9" style="Z-INDEX: 108; LEFT: 16px; POSITION: absolute; TOP: 170px" runat="server" Width="230px" Height="12px"></asp:Label>
				<asp:Label id="Label8" style="Z-INDEX: 107; LEFT: 264px; POSITION: absolute; TOP: 133px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label>
				<asp:Label id="Label7" style="Z-INDEX: 106; LEFT: 16px; POSITION: absolute; TOP: 130px" runat="server" Width="230px" Height="12px"></asp:Label>
				<asp:Label id="Label6" style="Z-INDEX: 105; LEFT: 264px; POSITION: absolute; TOP: 89px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label>
				<asp:Label id="Label5" style="Z-INDEX: 104; LEFT: 16px; POSITION: absolute; TOP: 89px" runat="server" Width="230px" Height="12px"></asp:Label>
				<asp:Label id="Label3" style="Z-INDEX: 103; LEFT: 17px; POSITION: absolute; TOP: 49px" runat="server" Width="230px" Height="12px"></asp:Label>
				<asp:Label id="Label4" style="Z-INDEX: 102; LEFT: 263px; POSITION: absolute; TOP: 50px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label>
				<asp:Label id="Label2" style="Z-INDEX: 101; LEFT: 264px; POSITION: absolute; TOP: 10px" runat="server" Width="250px" Height="12px" ForeColor="#FF8000"></asp:Label></FONT>
		</form>
	</body>
</HTML>
