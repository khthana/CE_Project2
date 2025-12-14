<%@ Page Language="vb" AutoEventWireup="false" Codebehind="addCardPage.aspx.vb" Inherits="Banking.addCardPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Add New Card</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" style="Z-INDEX: 115; LEFT: 24px; POSITION: absolute; TOP: 24px" height="36"
				cellSpacing="0" cellPadding="0" width="167" border="0">
				<TR>
					<TD background="\Banking\Picture\bb00201g.gif">
						<asp:label id="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium"
							ForeColor="White" BackColor="Transparent">Add New Card</asp:label></TD>
				</TR>
			</TABLE>
			<TABLE id="Table2" style="Z-INDEX: 107; LEFT: 184px; WIDTH: 496px; POSITION: absolute; TOP: 24px; HEIGHT: 22px"
				height="22" cellSpacing="0" cellPadding="0" width="496" border="0">
				<TR>
					<TD style="WIDTH: 347px" background="\Banking\Picture\bb00401g.gif"></TD>
					<TD style="WIDTH: 65px" background="\Banking\Picture\bb00403g.gif"></TD>
					<TD style="WIDTH: 62px" background="\Banking\Picture\bg-end.jpg"></TD>
				</TR>
			</TABLE>
			<FONT language="vb" face="Tahoma">
				<TABLE id="Table3" style="Z-INDEX: 102; LEFT: 24px; WIDTH: 656px; POSITION: absolute; TOP: 72px; HEIGHT: 312px"
					borderColor="#660000" cellSpacing="1" cellPadding="1" width="656" border="1">
					<TR>
						<TD background="\Banking\Picture\bg_btm.jpg">
							<DIV style="WIDTH: 648px; POSITION: relative; HEIGHT: 312px" ms_positioning="GridLayout"><asp:label id="Label2" style="Z-INDEX: 116; LEFT: 216px; POSITION: absolute; TOP: 56px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Customer ID</asp:label><asp:label id="Label3" style="Z-INDEX: 116; LEFT: 232px; POSITION: absolute; TOP: 152px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Card No.</asp:label><asp:label id="Label4" style="Z-INDEX: 116; LEFT: 224px; POSITION: absolute; TOP: 120px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Card Type</asp:label><asp:label id="Label5" style="Z-INDEX: 116; LEFT: 216px; POSITION: absolute; TOP: 88px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Account No.</asp:label><asp:label id="Label6" style="Z-INDEX: 116; LEFT: 256px; POSITION: absolute; TOP: 184px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">PIN</asp:label><asp:label id="showtext" style="Z-INDEX: 116; LEFT: 296px; POSITION: absolute; TOP: 216px"
									runat="server" Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent"></asp:label><asp:textbox id="cusIDTextBox" style="Z-INDEX: 116; LEFT: 296px; POSITION: absolute; TOP: 48px"
									runat="server"></asp:textbox><asp:textbox id="accNoTextBox" style="Z-INDEX: 116; LEFT: 296px; POSITION: absolute; TOP: 80px"
									runat="server"></asp:textbox><asp:textbox id="cardNoTextBox" style="Z-INDEX: 116; LEFT: 296px; POSITION: absolute; TOP: 144px"
									runat="server"></asp:textbox><asp:dropdownlist id="cardTypeList" style="Z-INDEX: 116; LEFT: 296px; POSITION: absolute; TOP: 112px"
									runat="server" Width="104px" AutoPostBack="True">
									<asp:ListItem Value="Smart Debit">Smart Debit</asp:ListItem>
									<asp:ListItem Value="Premium">Premium</asp:ListItem>
								</asp:dropdownlist><asp:textbox id="pinTextBox" style="Z-INDEX: 116; LEFT: 296px; POSITION: absolute; TOP: 176px"
									runat="server" Width="104px"></asp:textbox><asp:button id="submitButton" style="Z-INDEX: 116; LEFT: 296px; POSITION: absolute; TOP: 256px"
									runat="server" Text="Submit"></asp:button></DIV>
						</TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
