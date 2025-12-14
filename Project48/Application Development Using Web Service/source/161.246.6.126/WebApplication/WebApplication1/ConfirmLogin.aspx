<%@ Page language="c#" Codebehind="ConfirmLogin.aspx.cs" AutoEventWireup="false" Inherits="WebApplication1.ConfirmLogin" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>ConfirmLogin</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma"></FONT>
			<asp:label id="Label4" style="Z-INDEX: 117; LEFT: 264px; POSITION: absolute; TOP: 8px" runat="server"
				ForeColor="#C0C0FF" Font-Bold="True" Font-Italic="True" Font-Size="30pt" Width="440px">Confirm Log In</asp:label><br>
			<br>
			<br>
			<div align="center"><FONT face="Tahoma"></FONT><FONT face="Tahoma"></FONT><FONT face="Tahoma"></FONT><FONT face="Tahoma"></FONT><br>
				<table height="176" cellSpacing="0" cellPadding="0" width="160" background="images/fon_l.gif"
					border="0">
					<tr>
						<td><IMG height="26" src="images/l6.gif" width="160" border="0"></td>
					</tr>
					<tr>
						<td style="PADDING-LEFT: 21px"><IMG height="18" src="images/log.gif" width="83" border="0"><br>
							<asp:textbox id="TextBox1" runat="server" Width="119px"></asp:textbox></td>
					</tr>
					<tr>
						<td style="PADDING-LEFT: 21px"><IMG height="14" src="images/pas.gif" width="83" border="0"><br>
							<asp:textbox id="TextBox2" runat="server" Width="119px" TextMode="Password"></asp:textbox></td>
					</tr>
					<tr>
						<TD vAlign="bottom">
							<DIV align="center"><asp:button id="Button1" runat="server" Text="Log in"></asp:button>&nbsp;
								<asp:button id="Button2" runat="server" Text="Cancel"></asp:button></DIV>
						</TD>
					</tr>
					<TR>
						<td vAlign="bottom" height="32">
							<div align="center"><asp:imagebutton id="ImageButton1" runat="server" Width="115px" ImageUrl="http://161.246.6.126/WebApplication1/images/more_regiter.gif"
									Height="17px"></asp:imagebutton>&nbsp;
							</div>
						</td>
					</TR>
				</table>
				<IMG height="39" src="images/l5.gif" width="160" border="0"><br>
			</div>
			<asp:datagrid id="DataGrid1" style="Z-INDEX: 108; LEFT: 536px; POSITION: absolute; TOP: 168px"
				runat="server"></asp:datagrid></form>
	</body>
</HTML>
