<%@ Page language="c#" Codebehind="Register.aspx.cs" AutoEventWireup="false" Inherits="Register.WebForm1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>WebForm1</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma">
				<asp:TextBox id="fTextFirstName" style="Z-INDEX: 100; LEFT: 304px; POSITION: absolute; TOP: 80px"
					runat="server"></asp:TextBox>
				<asp:Label id="Label11" style="Z-INDEX: 123; LEFT: 192px; POSITION: absolute; TOP: 120px" runat="server"
					ForeColor="HotTrack" Width="48px">Surname :</asp:Label>
				<asp:TextBox id="fTextLastName" style="Z-INDEX: 121; LEFT: 304px; POSITION: absolute; TOP: 120px"
					runat="server"></asp:TextBox>
				<asp:Label id="Label6" style="Z-INDEX: 116; LEFT: 192px; POSITION: absolute; TOP: 360px" runat="server"
					ForeColor="HotTrack" Width="56px">Telephone :</asp:Label>
				<asp:Label id="Label4" style="Z-INDEX: 115; LEFT: 472px; POSITION: absolute; TOP: 240px" runat="server"
					Font-Size="10pt" ForeColor="Gray">(Password )</asp:Label>
				<asp:Label id="Label5" style="Z-INDEX: 114; LEFT: 472px; POSITION: absolute; TOP: 200px" runat="server"
					Font-Size="10pt" ForeColor="Gray">(Password)</asp:Label>
				<asp:Label id="Label3" style="Z-INDEX: 113; LEFT: 192px; POSITION: absolute; TOP: 240px" runat="server"
					ForeColor="HotTrack">Re-Password :</asp:Label>
				<asp:Label id="Label2" style="Z-INDEX: 109; LEFT: 192px; POSITION: absolute; TOP: 200px" runat="server"
					ForeColor="HotTrack">Password :</asp:Label>
				<asp:TextBox id="fIntTelephone" style="Z-INDEX: 112; LEFT: 304px; POSITION: absolute; TOP: 360px"
					runat="server"></asp:TextBox>
				<asp:Label id="Label13" style="Z-INDEX: 111; LEFT: 192px; POSITION: absolute; TOP: 320px" runat="server"
					ForeColor="HotTrack">Sex :</asp:Label>
				<asp:Label id="Label12" style="Z-INDEX: 110; LEFT: 192px; POSITION: absolute; TOP: 280px" runat="server"
					ForeColor="HotTrack">Age :</asp:Label>
				<asp:Label id="Label9" style="Z-INDEX: 107; LEFT: 192px; POSITION: absolute; TOP: 80px" runat="server"
					ForeColor="HotTrack" Width="48px"> Name :</asp:Label>
				<asp:Label id="Label8" style="Z-INDEX: 106; LEFT: 192px; POSITION: absolute; TOP: 160px" runat="server"
					ForeColor="HotTrack" Width="56px"> E-Mail :</asp:Label>
				<asp:DropDownList id="fDropSex" style="Z-INDEX: 104; LEFT: 304px; POSITION: absolute; TOP: 320px"
					runat="server" Width="152px" Height="40px">
					<asp:ListItem Value="null" Selected="True">ระบุเพศ</asp:ListItem>
					<asp:ListItem Value="Male">Male</asp:ListItem>
					<asp:ListItem Value="Female">Female</asp:ListItem>
				</asp:DropDownList>
				<asp:TextBox id="fTextmail" style="Z-INDEX: 101; LEFT: 304px; POSITION: absolute; TOP: 160px"
					runat="server"></asp:TextBox>
				<asp:Label id="Label1" style="Z-INDEX: 102; LEFT: 208px; POSITION: absolute; TOP: 8px" runat="server"
					Width="472px" Height="32px" Font-Size="X-Large" ForeColor="Desktop" Font-Names="Comic Sans MS">Register Olala Portal</asp:Label>
				<asp:DropDownList id="fDropAge" style="Z-INDEX: 103; LEFT: 304px; POSITION: absolute; TOP: 280px"
					runat="server" Width="152px" Height="40px">
					<asp:ListItem Value="10">น้อยกว่า 10</asp:ListItem>
					<asp:ListItem Value="11">10-14</asp:ListItem>
					<asp:ListItem Value="15">15</asp:ListItem>
					<asp:ListItem Value="16">16</asp:ListItem>
					<asp:ListItem Value="17">17</asp:ListItem>
					<asp:ListItem Value="18">18</asp:ListItem>
					<asp:ListItem Value="19">19</asp:ListItem>
					<asp:ListItem Value="29">20-25</asp:ListItem>
					<asp:ListItem Value="30">26-30</asp:ListItem>
					<asp:ListItem Value="30up">มากกว่า 30</asp:ListItem>
					<asp:ListItem Value="null" Selected="True">ระบุอายุ</asp:ListItem>
				</asp:DropDownList>
				<asp:Label id="Label7" style="Z-INDEX: 105; LEFT: 472px; POSITION: absolute; TOP: 160px" runat="server"
					Font-Size="10pt" ForeColor="Gray">( Username)</asp:Label></FONT>
			<asp:Button id="Button1" style="Z-INDEX: 117; LEFT: 344px; POSITION: absolute; TOP: 400px" runat="server"
				Width="64px" Text=" Register " ForeColor="HotTrack"></asp:Button>
			<asp:TextBox id="fTextPass" style="Z-INDEX: 118; LEFT: 304px; POSITION: absolute; TOP: 200px"
				runat="server" Width="152px" TextMode="Password"></asp:TextBox>
			<asp:TextBox id="fTextPass2" style="Z-INDEX: 119; LEFT: 304px; POSITION: absolute; TOP: 240px"
				runat="server" Width="152px" TextMode="Password"></asp:TextBox>
			<asp:TextBox id="fTextError" style="Z-INDEX: 120; LEFT: 488px; POSITION: absolute; TOP: 288px"
				runat="server" Width="272px" Height="97px" Visible="False"></asp:TextBox>
		</form>
	</body>
</HTML>
