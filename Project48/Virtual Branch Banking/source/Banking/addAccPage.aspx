<%@ Page Language="vb" AutoEventWireup="false" Codebehind="addAccPage.aspx.vb" Inherits="Banking.addAccPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Add New Account</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma">
				<TABLE id="Table1" style="Z-INDEX: 114; LEFT: 24px; POSITION: absolute; TOP: 24px" height="36"
					cellSpacing="0" cellPadding="0" width="167" border="0">
					<TR>
						<TD background="\Banking\Picture\bb00201g.gif">
							<asp:Label id="Label1" runat="server" Font-Bold="True" Font-Size="Medium" Font-Names="Arial"
								ForeColor="White" BackColor="Transparent">Add New Account</asp:Label></TD>
					</TR>
				</TABLE>
				<TABLE id="Table2" style="Z-INDEX: 106; LEFT: 184px; WIDTH: 496px; POSITION: absolute; TOP: 24px; HEIGHT: 22px"
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
									<asp:Label id="Label5" style="Z-INDEX: 115; LEFT: 240px; POSITION: absolute; TOP: 144px" runat="server"
										Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Balance</asp:Label>
									<asp:Label id="Label4" style="Z-INDEX: 115; LEFT: 208px; POSITION: absolute; TOP: 112px" runat="server"
										Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Account Type</asp:Label>
									<asp:Label id="Label3" style="Z-INDEX: 115; LEFT: 192px; POSITION: absolute; TOP: 80px" runat="server"
										Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Account Number</asp:Label>
									<asp:Label id="Label2" style="Z-INDEX: 115; LEFT: 216px; POSITION: absolute; TOP: 56px" runat="server"
										Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Customer ID</asp:Label>
									<asp:TextBox id="cusIDTextBox" style="Z-INDEX: 115; LEFT: 296px; POSITION: absolute; TOP: 48px"
										runat="server"></asp:TextBox>
									<asp:TextBox id="accNoTextBox" style="Z-INDEX: 115; LEFT: 296px; POSITION: absolute; TOP: 72px"
										runat="server"></asp:TextBox>
									<asp:DropDownList id="accTypeList" style="Z-INDEX: 115; LEFT: 296px; POSITION: absolute; TOP: 112px"
										runat="server" Width="152px" AutoPostBack="True">
										<asp:ListItem Value="Saving">Saving Account</asp:ListItem>
										<asp:ListItem Value="Checking">Checking Account</asp:ListItem>
										<asp:ListItem Value="TimeDeposit">Time Deposit Account</asp:ListItem>
									</asp:DropDownList>
									<asp:TextBox id="balanceTextBox" style="Z-INDEX: 115; LEFT: 296px; POSITION: absolute; TOP: 144px"
										runat="server" Width="96px"></asp:TextBox>
									<asp:Button id="submitButton" style="Z-INDEX: 115; LEFT: 296px; POSITION: absolute; TOP: 200px"
										runat="server" Text="Submit"></asp:Button>
									<asp:Label id="showtext" style="Z-INDEX: 115; LEFT: 296px; POSITION: absolute; TOP: 176px"
										runat="server" Font-Size="Smaller" ForeColor="White" BackColor="Transparent"></asp:Label></DIV>
							</TD>
						</TR>
					</TABLE>
				</FONT></FONT>
		</form>
	</body>
</HTML>
