<%@ Page Language="vb" AutoEventWireup="false" Codebehind="mainmenuPage.aspx.vb" Inherits="Banking.mainmenuPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Main Menu</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" style="Z-INDEX: 125; LEFT: 24px; POSITION: absolute; TOP: 24px" height="36"
				cellSpacing="0" cellPadding="0" width="167" border="0">
				<TR>
					<TD background="\Banking\Picture\bb00201g.gif">
						<asp:Label id="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium"
							ForeColor="White" BackColor="Transparent">Main Menu</asp:Label></TD>
				</TR>
			</TABLE>
			<TABLE id="Table3" style="Z-INDEX: 126; LEFT: 24px; WIDTH: 657px; POSITION: absolute; TOP: 72px; HEIGHT: 390px"
				borderColor="#660000" cellSpacing="1" cellPadding="1" width="657" border="1">
				<TR>
					<TD background="\Banking\Picture\bg_btm.jpg">
						<DIV style="WIDTH: 648px; POSITION: relative; HEIGHT: 392px" ms_positioning="GridLayout"><FONT face="Tahoma"></FONT>
							<asp:HyperLink id="HyperLink7" style="Z-INDEX: 127; LEFT: 416px; POSITION: absolute; TOP: 176px"
								runat="server" ForeColor="White" Font-Size="Smaller" Font-Names="Microsoft Sans Serif" BackColor="Transparent">ATM Search</asp:HyperLink>
							<asp:HyperLink id="HyperLink6" style="Z-INDEX: 127; LEFT: 416px; POSITION: absolute; TOP: 152px"
								runat="server" NavigateUrl="/Banking/addAtmPage.aspx" ForeColor="White" Font-Size="Smaller"
								Font-Names="Microsoft Sans Serif" BackColor="Transparent">Add New ATM</asp:HyperLink>
							<asp:HyperLink id="HyperLink4" style="Z-INDEX: 127; LEFT: 200px; POSITION: absolute; TOP: 176px"
								runat="server" ForeColor="White" Font-Size="Smaller" Font-Names="Microsoft Sans Serif" BackColor="Transparent">Account Search</asp:HyperLink>
							<asp:HyperLink id="HyperLink3" style="Z-INDEX: 127; LEFT: 200px; POSITION: absolute; TOP: 152px"
								runat="server" NavigateUrl="/Banking/addAccPage.aspx" ForeColor="White" Font-Size="Smaller"
								Font-Names="Microsoft Sans Serif" BackColor="Transparent">Add New Account</asp:HyperLink>
							<asp:HyperLink id="HyperLink1" style="Z-INDEX: 127; LEFT: 200px; POSITION: absolute; TOP: 72px"
								runat="server" NavigateUrl="/Banking/addCusPage.aspx" ForeColor="White" Font-Size="Smaller"
								Font-Names="Microsoft Sans Serif" BackColor="Transparent">Add New Customer</asp:HyperLink>
							<asp:HyperLink id="HyperLink2" style="Z-INDEX: 127; LEFT: 200px; POSITION: absolute; TOP: 96px"
								runat="server" ForeColor="White" Font-Size="Smaller" Font-Names="Microsoft Sans Serif" BackColor="Transparent">Customer Search</asp:HyperLink>
							<asp:Label id="Label2" style="Z-INDEX: 127; LEFT: 176px; POSITION: absolute; TOP: 48px" runat="server"
								Font-Bold="True" ForeColor="White" Font-Size="Smaller" Font-Names="Arial" BackColor="Transparent">Customer</asp:Label>
							<asp:Label id="Label3" style="Z-INDEX: 127; LEFT: 176px; POSITION: absolute; TOP: 128px" runat="server"
								Font-Bold="True" ForeColor="White" Font-Size="Smaller" Font-Names="Arial" BackColor="Transparent">Account</asp:Label>
							<asp:HyperLink id="HyperLink5" style="Z-INDEX: 127; LEFT: 200px; POSITION: absolute; TOP: 200px"
								runat="server" ForeColor="White" Font-Size="Smaller" Font-Names="Microsoft Sans Serif" BackColor="Transparent">Account History</asp:HyperLink>
							<asp:Label id="Label4" style="Z-INDEX: 127; LEFT: 376px; POSITION: absolute; TOP: 128px" runat="server"
								Font-Bold="True" ForeColor="White" Font-Size="Smaller" Font-Names="Arial" BackColor="Transparent">ATM</asp:Label>
							<asp:Label id="Label5" style="Z-INDEX: 127; LEFT: 176px; POSITION: absolute; TOP: 232px" runat="server"
								Font-Bold="True" ForeColor="White" Font-Size="Smaller" Font-Names="Arial" BackColor="Transparent">Transaction</asp:Label>
							<asp:Label id="Label6" style="Z-INDEX: 127; LEFT: 376px; POSITION: absolute; TOP: 232px" runat="server"
								Font-Bold="True" ForeColor="White" Font-Size="Smaller" Font-Names="Arial" BackColor="Transparent">Constraint Setup</asp:Label>
							<asp:Label id="Label7" style="Z-INDEX: 127; LEFT: 376px; POSITION: absolute; TOP: 48px" runat="server"
								Font-Bold="True" ForeColor="White" Font-Size="Smaller" Font-Names="Arial" BackColor="Transparent">Card</asp:Label>
							<asp:HyperLink id="HyperLink10" style="Z-INDEX: 127; LEFT: 416px; POSITION: absolute; TOP: 72px"
								runat="server" NavigateUrl="/Banking/addCardPage.aspx" ForeColor="White" Font-Size="Smaller"
								Font-Names="Microsoft Sans Serif" BackColor="Transparent">Add New Card</asp:HyperLink>
							<asp:HyperLink id="HyperLink13" style="Z-INDEX: 127; LEFT: 200px; POSITION: absolute; TOP: 328px"
								runat="server" Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" NavigateUrl="/Banking/addMerchantPage.aspx"
								BackColor="Transparent">Add New Merchant</asp:HyperLink>
							<asp:Label id="Label9" style="Z-INDEX: 127; LEFT: 176px; POSITION: absolute; TOP: 304px" runat="server"
								Font-Size="Smaller" Font-Names="Arial" Font-Bold="True" ForeColor="White" BackColor="Transparent">Merchant</asp:Label>
							<asp:HyperLink id="HyperLink12" style="Z-INDEX: 127; LEFT: 200px; POSITION: absolute; TOP: 272px"
								runat="server" Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Transaction Search</asp:HyperLink>
							<asp:HyperLink id="HyperLink8" style="Z-INDEX: 127; LEFT: 416px; POSITION: absolute; TOP: 272px"
								runat="server" ForeColor="White" Font-Size="Smaller" Font-Names="Microsoft Sans Serif" BackColor="Transparent">System Constraint</asp:HyperLink>
							<asp:HyperLink id="HyperLink9" style="Z-INDEX: 127; LEFT: 200px; POSITION: absolute; TOP: 272px"
								runat="server" ForeColor="White" Font-Size="Smaller" Font-Names="Microsoft Sans Serif" BackColor="Transparent">Transaction Search</asp:HyperLink>
							<asp:HyperLink id="HyperLink11" style="Z-INDEX: 127; LEFT: 416px; POSITION: absolute; TOP: 296px"
								runat="server" Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" NavigateUrl="/Banking/addForexRate.aspx"
								BackColor="Transparent">Foreign Exchange Rate</asp:HyperLink></DIV>
					</TD>
				</TR>
			</TABLE>
			<TABLE id="Table2" style="Z-INDEX: 106; LEFT: 184px; WIDTH: 496px; POSITION: absolute; TOP: 24px; HEIGHT: 22px"
				height="22" cellSpacing="0" cellPadding="0" width="496" border="0">
				<TR>
					<TD style="WIDTH: 347px" background="\Banking\Picture\bb00401g.gif"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 65px" background="\Banking\Picture\bb00403g.gif"></TD>
					<TD style="WIDTH: 62px" background="\Banking\Picture\bg-end.jpg"></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
