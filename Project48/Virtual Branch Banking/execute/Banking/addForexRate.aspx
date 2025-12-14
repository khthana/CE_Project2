<%@ Page Language="vb" AutoEventWireup="false" Codebehind="addForexRate.aspx.vb" Inherits="Banking.addForexRate"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>addForexRate</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma">
				<TABLE id="Table1" style="Z-INDEX: 109; LEFT: 24px; POSITION: absolute; TOP: 24px" height="36"
					cellSpacing="0" cellPadding="0" width="167" border="0">
					<TR>
						<TD background="\Banking\Picture\bb00201g.gif">
							<asp:Label id="Label1" runat="server" BackColor="Transparent" ForeColor="White" Font-Size="XX-Small"
								Font-Names="Arial" Font-Bold="True">Add Foreign Exchange Rate</asp:Label></TD>
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
					<TABLE id="Table3" style="Z-INDEX: 101; LEFT: 24px; WIDTH: 656px; POSITION: absolute; TOP: 72px; HEIGHT: 312px"
						borderColor="#660000" cellSpacing="1" cellPadding="1" width="656" border="1">
						<TR>
							<TD background="\Banking\Picture\bg_btm.jpg">
								<DIV style="WIDTH: 648px; POSITION: relative; HEIGHT: 284px" ms_positioning="GridLayout">
									<asp:Label id="Label2" style="Z-INDEX: 101; LEFT: 248px; POSITION: absolute; TOP: 104px" runat="server"
										Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Rate</asp:Label>
									<asp:TextBox id="rateTextBox" style="Z-INDEX: 102; LEFT: 280px; POSITION: absolute; TOP: 96px"
										runat="server" Width="128px"></asp:TextBox>
									<asp:Button id="submitButton" style="Z-INDEX: 103; LEFT: 280px; POSITION: absolute; TOP: 152px"
										runat="server" Text="Submit"></asp:Button>
									<asp:Label id="showtext" style="Z-INDEX: 104; LEFT: 280px; POSITION: absolute; TOP: 128px"
										runat="server" Font-Size="Smaller" ForeColor="White" BackColor="Transparent"></asp:Label>
									<asp:Label id="Label6" style="Z-INDEX: 105; LEFT: 224px; POSITION: absolute; TOP: 64px" runat="server"
										Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Currency</asp:Label>
									<asp:DropDownList id="currencyList" style="Z-INDEX: 106; LEFT: 280px; POSITION: absolute; TOP: 64px"
										runat="server" Width="176px" AutoPostBack="True">
										<asp:ListItem Value="USD">(USD) American Dollar</asp:ListItem>
										<asp:ListItem Value="AUD">(AUD) Australian Dollar</asp:ListItem>
										<asp:ListItem Value="BRL">(BRL) Brazilian Real</asp:ListItem>
										<asp:ListItem Value="GBP">(GBP) British Pound</asp:ListItem>
										<asp:ListItem Value="CAD">(CAD) Canadian Dollar</asp:ListItem>
										<asp:ListItem Value="CNY">(CNY) Chinese Yuan</asp:ListItem>
										<asp:ListItem Value="DKK">(DKK) Danish Krone</asp:ListItem>
										<asp:ListItem Value="EUR">(EUR) Euro</asp:ListItem>
										<asp:ListItem Value="HKD">(HKD) Hong Kong Dollar</asp:ListItem>
										<asp:ListItem Value="INR">(INR) Indian Rupee</asp:ListItem>
										<asp:ListItem Value="JPY">(JPY) Japanese Yen</asp:ListItem>
										<asp:ListItem Value="MYR">(MYR) Malaysian Ringgit</asp:ListItem>
										<asp:ListItem Value="MXN">(MXN) Mexican Peso</asp:ListItem>
										<asp:ListItem Value="NZD">(NZD) New Zealand Dollar</asp:ListItem>
										<asp:ListItem Value="SGD">(SGD) Singapore Dollar</asp:ListItem>
										<asp:ListItem Value="KRW">(KRW) South Korean Won</asp:ListItem>
										<asp:ListItem Value="LKR">(LKR) Sri Lanka Rupee</asp:ListItem>
										<asp:ListItem Value="SEK">(SEK) Swedish Krona</asp:ListItem>
										<asp:ListItem Value="CHF">(CHF) Swiss Franc</asp:ListItem>
										<asp:ListItem Value="TWD">(TWD) Taiwan Dollar</asp:ListItem>
										<asp:ListItem Value="THB">(THB) Thai Baht</asp:ListItem>
									</asp:DropDownList></DIV>
							</TD>
						</TR>
					</TABLE>
				</FONT></FONT>
		</form>
	</body>
</HTML>
