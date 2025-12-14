<%@ Page Language="vb" AutoEventWireup="false" Codebehind="addCusPage.aspx.vb" Inherits="Banking.addCusPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Add New Customer</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" style="Z-INDEX: 158; LEFT: 24px; POSITION: absolute; TOP: 24px" height="36"
				cellSpacing="0" cellPadding="0" width="167" border="0">
				<TR>
					<TD background="\Banking\Picture\bb00201g.gif">
						<asp:label id="Label1" runat="server" Font-Size="Small" Font-Names="Arial" Font-Bold="True"
							ForeColor="White" BackColor="Transparent">Add New Customer</asp:label></TD>
				</TR>
			</TABLE>
			<TABLE id="Table2" style="Z-INDEX: 108; LEFT: 184px; WIDTH: 496px; POSITION: absolute; TOP: 24px; HEIGHT: 22px"
				height="22" cellSpacing="0" cellPadding="0" width="496" border="0">
				<TR>
					<TD style="WIDTH: 347px" background="\Banking\Picture\bb00401g.gif"></TD>
					<TD style="WIDTH: 65px" background="\Banking\Picture\bb00403g.gif"></TD>
					<TD style="WIDTH: 62px" background="\Banking\Picture\bg-end.jpg"></TD>
				</TR>
			</TABLE>
			<FONT language="vb" face="Tahoma">
				<TABLE id="Table3" style="Z-INDEX: 102; LEFT: 24px; WIDTH: 657px; POSITION: absolute; TOP: 72px; HEIGHT: 714px"
					borderColor="#660000" cellSpacing="1" cellPadding="1" width="657" border="1">
					<TR>
						<TD background="\Banking\Picture\bg_btm.jpg">
							<DIV style="WIDTH: 648px; POSITION: relative; HEIGHT: 792px" ms_positioning="GridLayout"><asp:dropdownlist id="yBirthList" style="Z-INDEX: 159; LEFT: 376px; POSITION: absolute; TOP: 208px"
									runat="server" Width="63px" AutoPostBack="True"></asp:dropdownlist><asp:dropdownlist id="mBirthList" style="Z-INDEX: 159; LEFT: 328px; POSITION: absolute; TOP: 208px"
									runat="server" Width="47px" AutoPostBack="True"></asp:dropdownlist><asp:label id="Label12" style="Z-INDEX: 159; LEFT: 232px; POSITION: absolute; TOP: 336px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Salary</asp:label><asp:label id="Label11" style="Z-INDEX: 159; LEFT: 200px; POSITION: absolute; TOP: 312px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Occupation</asp:label><asp:label id="Label10" style="Z-INDEX: 159; LEFT: 232px; POSITION: absolute; TOP: 288px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Email</asp:label><asp:label id="Label9" style="Z-INDEX: 159; LEFT: 224px; POSITION: absolute; TOP: 264px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Gender</asp:label><asp:label id="Label8" style="Z-INDEX: 159; LEFT: 240px; POSITION: absolute; TOP: 240px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Age</asp:label><asp:label id="Label7" style="Z-INDEX: 159; LEFT: 200px; POSITION: absolute; TOP: 208px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Date of Birth</asp:label><asp:label id="Label6" style="Z-INDEX: 159; LEFT: 224px; POSITION: absolute; TOP: 184px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">นามสกุล</asp:label><asp:label id="Label5" style="Z-INDEX: 159; LEFT: 200px; POSITION: absolute; TOP: 160px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">ชื่อ (ภาษาไทย)</asp:label><asp:label id="Label4" style="Z-INDEX: 159; LEFT: 216px; POSITION: absolute; TOP: 136px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Surname</asp:label><asp:label id="Label2" style="Z-INDEX: 159; LEFT: 200px; POSITION: absolute; TOP: 88px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Personal ID</asp:label><asp:textbox id="personalIDTextBox" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 80px"
									runat="server"></asp:textbox><asp:label id="Label3" style="Z-INDEX: 159; LEFT: 176px; POSITION: absolute; TOP: 112px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">First Name (Eng)</asp:label><asp:label id="Label27" style="Z-INDEX: 159; LEFT: 96px; POSITION: absolute; TOP: 56px" runat="server"
									Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Personal Information</asp:label><asp:textbox id="enNameTextBox" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 104px"
									runat="server"></asp:textbox><asp:textbox id="enSurnameTextBox" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 128px"
									runat="server"></asp:textbox><asp:textbox id="thNameTextBox" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 152px"
									runat="server"></asp:textbox><asp:textbox id="thSurnameTextBox" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 176px"
									runat="server"></asp:textbox><asp:dropdownlist id="dBirthList" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 208px"
									runat="server" Width="47px" AutoPostBack="True"></asp:dropdownlist><asp:textbox id="ageTextBox" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 240px"
									runat="server" Width="40px"></asp:textbox><asp:dropdownlist id="genderList" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 264px"
									runat="server" Width="112px" AutoPostBack="True">
									<asp:ListItem Value="male">male</asp:ListItem>
									<asp:ListItem Value="female">female</asp:ListItem>
								</asp:dropdownlist><asp:textbox id="emailTextBox" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 288px"
									runat="server" Width="208px"></asp:textbox><asp:dropdownlist id="occupationList" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 312px"
									runat="server" Width="112px" AutoPostBack="True">
									<asp:ListItem Value="engineering">engineering</asp:ListItem>
									<asp:ListItem Value="banker">banker</asp:ListItem>
									<asp:ListItem Value="developer">developer</asp:ListItem>
									<asp:ListItem Value="artist">artist</asp:ListItem>
									<asp:ListItem Value="teacher">teacher</asp:ListItem>
								</asp:dropdownlist><asp:textbox id="salaryTextBox" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 336px"
									runat="server" Width="112px"></asp:textbox><asp:label id="showtext" style="Z-INDEX: 159; LEFT: 432px; POSITION: absolute; TOP: 56px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent"></asp:label><asp:textbox id="faxnoTextBox" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 720px"
									runat="server"></asp:textbox><asp:textbox id="mobilePhoneTextBox" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 696px"
									runat="server"></asp:textbox><asp:textbox id="officePhoneTextBox" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 672px"
									runat="server"></asp:textbox><asp:textbox id="postcodeTextBox" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 576px"
									runat="server" Width="80px"></asp:textbox><asp:textbox id="soiTextBox" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 456px"
									runat="server"></asp:textbox><asp:label id="Label25" style="Z-INDEX: 159; LEFT: 208px; POSITION: absolute; TOP: 576px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Post Code</asp:label><asp:label id="Label24" style="Z-INDEX: 159; LEFT: 240px; POSITION: absolute; TOP: 552px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">State</asp:label><asp:label id="Label23" style="Z-INDEX: 159; LEFT: 248px; POSITION: absolute; TOP: 528px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">City</asp:label><asp:label id="Label22" style="Z-INDEX: 159; LEFT: 224px; POSITION: absolute; TOP: 504px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">District</asp:label><asp:label id="Label21" style="Z-INDEX: 159; LEFT: 232px; POSITION: absolute; TOP: 480px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Street</asp:label><asp:label id="Label20" style="Z-INDEX: 159; LEFT: 248px; POSITION: absolute; TOP: 456px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Soi</asp:label><asp:label id="Label19" style="Z-INDEX: 159; LEFT: 200px; POSITION: absolute; TOP: 432px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Address No.</asp:label><asp:label id="Label18" style="Z-INDEX: 159; LEFT: 184px; POSITION: absolute; TOP: 408px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Address Type</asp:label><asp:label id="Label16" style="Z-INDEX: 159; LEFT: 224px; POSITION: absolute; TOP: 728px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Fax No.</asp:label><asp:label id="Label15" style="Z-INDEX: 159; LEFT: 168px; POSITION: absolute; TOP: 680px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Office Phone No.</asp:label><asp:label id="Label14" style="Z-INDEX: 159; LEFT: 160px; POSITION: absolute; TOP: 704px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Mobile Phone No.</asp:label><asp:label id="Label13" style="Z-INDEX: 159; LEFT: 168px; POSITION: absolute; TOP: 656px" runat="server"
									Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Home Phone No.</asp:label><asp:label id="Label17" style="Z-INDEX: 159; LEFT: 184px; POSITION: absolute; TOP: 376px" runat="server"
									Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Address</asp:label><asp:label id="Label26" style="Z-INDEX: 159; LEFT: 144px; POSITION: absolute; TOP: 616px" runat="server"
									Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" BackColor="Transparent">Phone Number</asp:label><asp:textbox id="addNoTextBox" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 432px"
									runat="server" Width="104px"></asp:textbox><asp:dropdownlist id="addTypeList" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 408px"
									runat="server" Width="104px" AutoPostBack="True">
									<asp:ListItem Value="Home">Home</asp:ListItem>
									<asp:ListItem Value="Apartment">Apartment</asp:ListItem>
									<asp:ListItem Value="Condominium">Condominium</asp:ListItem>
								</asp:dropdownlist><asp:textbox id="streetTextBox" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 480px"
									runat="server"></asp:textbox><asp:textbox id="districtTextBox" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 504px"
									runat="server" Width="128px"></asp:textbox><asp:dropdownlist id="cityList" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 528px"
									runat="server" Width="104px" AutoPostBack="True">
									<asp:ListItem Value="Bangkok">Bangkok</asp:ListItem>
								</asp:dropdownlist><asp:dropdownlist id="stateList" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 552px"
									runat="server" Width="104px" AutoPostBack="True">
									<asp:ListItem Value="Thailand">Thailand</asp:ListItem>
								</asp:dropdownlist><asp:textbox id="homePhoneTextBox" style="Z-INDEX: 159; LEFT: 280px; POSITION: absolute; TOP: 648px"
									runat="server"></asp:textbox><asp:button id="submitButton" style="Z-INDEX: 159; LEFT: 432px; POSITION: absolute; TOP: 768px"
									tabIndex="2" runat="server" Text="Submit"></asp:button><asp:button id="clearButton" style="Z-INDEX: 159; LEFT: 528px; POSITION: absolute; TOP: 768px"
									tabIndex="1" runat="server" Text="Clear"></asp:button></DIV>
						</TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
