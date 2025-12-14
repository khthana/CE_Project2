<%@ Page Language="vb" AutoEventWireup="false" Codebehind="addAtmPage.aspx.vb" Inherits="Banking.addAtmPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Add New ATM</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma">
				<TABLE id="Table1" style="Z-INDEX: 118; LEFT: 24px; POSITION: absolute; TOP: 24px" height="36"
					cellSpacing="0" cellPadding="0" width="167" border="0">
					<TR>
						<TD background="\Banking\Picture\bb00201g.gif">
							<asp:Label id="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium"
								ForeColor="White" BackColor="Transparent">Add New ATM</asp:Label></TD>
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
					<TABLE id="Table3" style="Z-INDEX: 100; LEFT: 24px; WIDTH: 657px; POSITION: absolute; TOP: 72px; HEIGHT: 360px"
						borderColor="#660000" cellSpacing="1" cellPadding="1" width="657" border="1">
						<TR>
							<TD background="\Banking\Picture\bg_btm.jpg">
								<DIV style="WIDTH: 648px; POSITION: relative; HEIGHT: 368px" ms_positioning="GridLayout">
									<asp:Label id="Label3" style="Z-INDEX: 119; LEFT: 224px; POSITION: absolute; TOP: 80px" runat="server"
										Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Bank code</asp:Label>
									<asp:Label id="Label5" style="Z-INDEX: 119; LEFT: 224px; POSITION: absolute; TOP: 128px" runat="server"
										Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Area code</asp:Label>
									<asp:Label id="Label4" style="Z-INDEX: 119; LEFT: 232px; POSITION: absolute; TOP: 104px" runat="server"
										Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Location</asp:Label>
									<asp:Label id="Label2" style="Z-INDEX: 119; LEFT: 224px; POSITION: absolute; TOP: 56px" runat="server"
										Font-Size="Smaller" ForeColor="White" BackColor="Transparent">ATM code</asp:Label>
									<asp:TextBox id="atmCodeTextBox" style="Z-INDEX: 119; LEFT: 288px; POSITION: absolute; TOP: 48px"
										runat="server" Width="128px"></asp:TextBox>
									<asp:TextBox id="bankCodeTextBox" style="Z-INDEX: 119; LEFT: 288px; POSITION: absolute; TOP: 72px"
										runat="server" Width="128px"></asp:TextBox>
									<asp:TextBox id="areaCodeTextBox" style="Z-INDEX: 119; LEFT: 288px; POSITION: absolute; TOP: 128px"
										runat="server" Width="96px"></asp:TextBox>
									<asp:Button id="submitButton" style="Z-INDEX: 119; LEFT: 288px; POSITION: absolute; TOP: 264px"
										runat="server" Text="Submit"></asp:Button>
									<asp:Label id="showtext" style="Z-INDEX: 119; LEFT: 288px; POSITION: absolute; TOP: 232px"
										runat="server" Font-Size="Smaller" ForeColor="White" BackColor="Transparent"></asp:Label>
									<asp:TextBox id="locationTextBox" style="Z-INDEX: 119; LEFT: 288px; POSITION: absolute; TOP: 96px"
										runat="server" Width="208px"></asp:TextBox>
									<asp:Label id="Label6" style="Z-INDEX: 119; LEFT: 256px; POSITION: absolute; TOP: 160px" runat="server"
										Font-Size="Smaller" ForeColor="White" BackColor="Transparent">City</asp:Label>
									<asp:DropDownList id="cityList" style="Z-INDEX: 119; LEFT: 288px; POSITION: absolute; TOP: 160px"
										runat="server" Width="128px" AutoPostBack="True">
										<asp:ListItem Value="Bangkok">Bangkok</asp:ListItem>
									</asp:DropDownList>
									<asp:Label id="Label8" style="Z-INDEX: 119; LEFT: 200px; POSITION: absolute; TOP: 192px" runat="server"
										Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">System Used</asp:Label>
									<asp:DropDownList id="systemUsedList" style="Z-INDEX: 119; LEFT: 288px; POSITION: absolute; TOP: 192px"
										runat="server" Width="128px">
										<asp:ListItem Value="CapitalSystem">Capital System</asp:ListItem>
										<asp:ListItem Value="ProvinceSystem">ProvinceSystem</asp:ListItem>
										<asp:ListItem Value="DistrictSystem">DistrictSystem</asp:ListItem>
									</asp:DropDownList></DIV>
							</TD>
						</TR>
					</TABLE>
				</FONT></FONT>
		</form>
	</body>
</HTML>
