<%@ Page Language="vb" AutoEventWireup="false" Codebehind="addMerchantPage.aspx.vb" Inherits="Banking.addMerchantPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>addMerchantPage</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" style="Z-INDEX: 144; LEFT: 24px; POSITION: absolute; TOP: 24px" height="36"
				cellSpacing="0" cellPadding="0" width="167" border="0">
				<TR>
					<TD background="\Banking\Picture\bb00201g.gif">
						<asp:Label id="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small"
							ForeColor="White" BackColor="Transparent">Add New Merchant</asp:Label></TD>
				</TR>
			</TABLE>
			<TABLE id="Table2" style="Z-INDEX: 107; LEFT: 184px; WIDTH: 496px; POSITION: absolute; TOP: 24px; HEIGHT: 22px"
				height="22" cellSpacing="0" cellPadding="0" width="496" border="0">
				<TR>
					<TD style="WIDTH: 347px" background="\Banking\Picture\bb00401g.gif"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 65px" background="\Banking\Picture\bb00403g.gif"></TD>
					<TD style="WIDTH: 62px" background="\Banking\Picture\bg-end.jpg"></TD>
				</TR>
			</TABLE>
			<FONT language="vb" face="Tahoma">
				<TABLE id="Table3" style="Z-INDEX: 102; LEFT: 24px; WIDTH: 657px; POSITION: absolute; TOP: 72px; HEIGHT: 642px"
					borderColor="#660000" cellSpacing="1" cellPadding="1" width="657" border="1">
					<TR>
						<TD background="\Banking\Picture\bg_btm.jpg">
							<DIV style="WIDTH: 648px; POSITION: relative; HEIGHT: 746px" ms_positioning="GridLayout">
								<asp:textbox id="faxnoTextBox" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 240px"
									runat="server"></asp:textbox>
								<asp:textbox id="officePhoneTextBox" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 216px"
									runat="server"></asp:textbox>
								<asp:textbox id="postcodeTextBox" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 480px"
									runat="server" Width="80px"></asp:textbox>
								<asp:textbox id="soiTextBox" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 360px"
									runat="server"></asp:textbox>
								<asp:label id="Label25" style="Z-INDEX: 145; LEFT: 192px; POSITION: absolute; TOP: 480px" runat="server"
									Font-Names="Microsoft Sans Serif" Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Post Code</asp:label>
								<asp:label id="Label24" style="Z-INDEX: 145; LEFT: 224px; POSITION: absolute; TOP: 456px" runat="server"
									Font-Names="Microsoft Sans Serif" Font-Size="Smaller" ForeColor="White" BackColor="Transparent">State</asp:label>
								<asp:label id="Label23" style="Z-INDEX: 145; LEFT: 232px; POSITION: absolute; TOP: 432px" runat="server"
									Font-Names="Microsoft Sans Serif" Font-Size="Smaller" ForeColor="White" BackColor="Transparent">City</asp:label>
								<asp:label id="Label22" style="Z-INDEX: 145; LEFT: 216px; POSITION: absolute; TOP: 416px" runat="server"
									Font-Names="Microsoft Sans Serif" Font-Size="Smaller" ForeColor="White" BackColor="Transparent">District</asp:label>
								<asp:label id="Label21" style="Z-INDEX: 145; LEFT: 224px; POSITION: absolute; TOP: 392px" runat="server"
									Font-Names="Microsoft Sans Serif" Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Street</asp:label>
								<asp:label id="Label20" style="Z-INDEX: 145; LEFT: 232px; POSITION: absolute; TOP: 368px" runat="server"
									Font-Names="Microsoft Sans Serif" Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Soi</asp:label>
								<asp:label id="Label19" style="Z-INDEX: 145; LEFT: 184px; POSITION: absolute; TOP: 304px" runat="server"
									Font-Names="Microsoft Sans Serif" Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Address No.</asp:label>
								<asp:label id="Label18" style="Z-INDEX: 145; LEFT: 168px; POSITION: absolute; TOP: 336px" runat="server"
									Font-Names="Microsoft Sans Serif" Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Address Type</asp:label>
								<asp:label id="Label16" style="Z-INDEX: 145; LEFT: 216px; POSITION: absolute; TOP: 248px" runat="server"
									Font-Names="Microsoft Sans Serif" Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Fax No.</asp:label>
								<asp:label id="Label15" style="Z-INDEX: 145; LEFT: 160px; POSITION: absolute; TOP: 216px" runat="server"
									Font-Names="Microsoft Sans Serif" Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Office Phone No.</asp:label>
								<asp:label id="Label17" style="Z-INDEX: 145; LEFT: 112px; POSITION: absolute; TOP: 272px" runat="server"
									Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Address</asp:label>
								<asp:label id="Label26" style="Z-INDEX: 145; LEFT: 112px; POSITION: absolute; TOP: 184px" runat="server"
									Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Phone Number</asp:label>
								<asp:textbox id="addNoTextBox" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 304px"
									runat="server" Width="104px"></asp:textbox>
								<asp:dropdownlist id="addTypeList" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 336px"
									runat="server" Width="104px" AutoPostBack="True">
									<asp:ListItem Value="Home">Home</asp:ListItem>
									<asp:ListItem Value="Apartment">Apartment</asp:ListItem>
									<asp:ListItem Value="Condominium">Condominium</asp:ListItem>
								</asp:dropdownlist>
								<asp:textbox id="streetTextBox" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 384px"
									runat="server"></asp:textbox>
								<asp:textbox id="districtTextBox" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 408px"
									runat="server" Width="128px"></asp:textbox>
								<asp:dropdownlist id="cityList" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 432px"
									runat="server" Width="104px" AutoPostBack="True">
									<asp:ListItem Value="Bangkok">Bangkok</asp:ListItem>
								</asp:dropdownlist>
								<asp:dropdownlist id="stateList" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 456px"
									runat="server" Width="104px" AutoPostBack="True">
									<asp:ListItem Value="Thailand">Thailand</asp:ListItem>
								</asp:dropdownlist>
								<asp:Label id="Label2" style="Z-INDEX: 145; LEFT: 176px; POSITION: absolute; TOP: 160px" runat="server"
									Font-Names="Arial" Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Product Name</asp:Label>
								<asp:TextBox id="productNameTextBox" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 160px"
									runat="server" Width="128px"></asp:TextBox>
								<asp:Label id="Label6" style="Z-INDEX: 145; LEFT: 176px; POSITION: absolute; TOP: 136px" runat="server"
									Font-Names="Arial" Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Merchant Type</asp:Label>
								<asp:DropDownList id="merTypeList" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 136px"
									runat="server" Width="152px" AutoPostBack="True">
									<asp:ListItem Value="Shopping">Shopping</asp:ListItem>
									<asp:ListItem Value="HomeLiving">Home Living</asp:ListItem>
									<asp:ListItem Value="ComputerVender">Computer Vender</asp:ListItem>
									<asp:ListItem Value="Phone">Phone</asp:ListItem>
									<asp:ListItem Value="Insurance">Insurance</asp:ListItem>
									<asp:ListItem Value="Loan">Loan</asp:ListItem>
									<asp:ListItem Value="CarVender">Car Vender</asp:ListItem>
									<asp:ListItem Value="Education">University</asp:ListItem>
									<asp:ListItem Value="Education">School</asp:ListItem>
									<asp:ListItem Value="Hotel">Hotel</asp:ListItem>
								</asp:DropDownList>
								<asp:Label id="Label3" style="Z-INDEX: 145; LEFT: 168px; POSITION: absolute; TOP: 112px" runat="server"
									Font-Names="Arial" Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Merchant Name</asp:Label>
								<asp:TextBox id="merNameTextBox" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 112px"
									runat="server"></asp:TextBox>
								<asp:Label id="Label9" style="Z-INDEX: 145; LEFT: 112px; POSITION: absolute; TOP: 56px" runat="server"
									Font-Names="Arial" Font-Size="Medium" ForeColor="White" BackColor="Transparent">Merchant Information</asp:Label>
								<asp:Label id="Label11" style="Z-INDEX: 145; LEFT: 184px; POSITION: absolute; TOP: 88px" runat="server"
									Font-Names="Arial" Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Merchant ID</asp:Label>
								<asp:TextBox id="merIDTextBox" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 88px"
									runat="server"></asp:TextBox>
								<asp:Label id="Label8" style="Z-INDEX: 145; LEFT: 160px; POSITION: absolute; TOP: 560px" runat="server"
									Font-Names="Arial" Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Account Number</asp:Label>
								<asp:TextBox id="accNoTextBox" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 552px"
									runat="server"></asp:TextBox>
								<asp:DropDownList id="accTypeList" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 584px"
									runat="server" Width="152px" AutoPostBack="True">
									<asp:ListItem Value="Checking">Checking Account</asp:ListItem>
								</asp:DropDownList>
								<asp:Label id="Label4" style="Z-INDEX: 145; LEFT: 176px; POSITION: absolute; TOP: 592px" runat="server"
									Font-Names="Arial" Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Account Type</asp:Label>
								<asp:Label id="Label5" style="Z-INDEX: 145; LEFT: 208px; POSITION: absolute; TOP: 616px" runat="server"
									Font-Names="Arial" Font-Size="Smaller" ForeColor="White" BackColor="Transparent">Balance</asp:Label>
								<asp:TextBox id="balanceTextBox" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 616px"
									runat="server" Width="96px"></asp:TextBox>
								<asp:Button id="submitButton" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 704px"
									runat="server" Text="Submit"></asp:Button>
								<asp:Label id="showtext" style="Z-INDEX: 145; LEFT: 264px; POSITION: absolute; TOP: 680px"
									runat="server" Font-Names="Arial" Font-Size="Smaller" ForeColor="White" BackColor="Transparent"></asp:Label>
								<asp:Label id="Label10" style="Z-INDEX: 145; LEFT: 120px; POSITION: absolute; TOP: 520px" runat="server"
									Font-Names="Arial" Font-Size="Medium" ForeColor="White" BackColor="Transparent">Account Information</asp:Label></DIV>
						</TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
