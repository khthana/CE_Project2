<%@ Page language="c#" Codebehind="officer.aspx.cs" AutoEventWireup="false" Inherits="PeopleApp.officer" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>officer</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body bgColor="#ffcccc" MS_POSITIONING="GridLayout">
		<form id="officer" method="post" runat="server">
			<FONT face="Tahoma">
				<asp:TextBox id="TextBox1" style="Z-INDEX: 100; LEFT: 138px; POSITION: absolute; TOP: 62px" runat="server" Width="153px" Height="27px"></asp:TextBox>
				<asp:Label id="Label14" style="Z-INDEX: 142; LEFT: 455px; POSITION: absolute; TOP: 476px" runat="server" Width="84px" Height="24px" ForeColor="Red" Font-Bold="True"></asp:Label>
				<asp:Label id="Label12" style="Z-INDEX: 141; LEFT: 438px; POSITION: absolute; TOP: 186px" runat="server" Width="84px" Height="24px" ForeColor="Red" Font-Bold="True"></asp:Label>
				<asp:Label id="Label13" style="Z-INDEX: 139; LEFT: 436px; POSITION: absolute; TOP: 310px" runat="server" Width="84px" Height="24px" ForeColor="Red" Font-Bold="True"></asp:Label>
				<TABLE id="Table3" style="Z-INDEX: 138; LEFT: 72px; WIDTH: 442px; POSITION: absolute; TOP: 230px; HEIGHT: 11px" cellSpacing="1" cellPadding="1" width="300" border="1" bgcolor="#ffffcc">
					<TR>
						<TD align="middle"><FONT face="Tahoma">Table หน่วยงานของข้าราชการแต่ละคน</FONT></TD>
					</TR>
				</TABLE>
				<TABLE id="Table2" style="Z-INDEX: 137; LEFT: 76px; WIDTH: 442px; POSITION: absolute; TOP: 361px; HEIGHT: 11px" cellSpacing="1" cellPadding="1" width="300" border="1" bgcolor="#ffffcc">
					<TR>
						<TD align="middle"><FONT face="Tahoma">Table รายละเอียดหน่วยงาน</FONT></TD>
					</TR>
				</TABLE>
				<asp:Button id="Button12" style="Z-INDEX: 133; LEFT: 354px; POSITION: absolute; TOP: 482px" runat="server" Width="74px" Height="28px" Text="Clear"></asp:Button>
				<asp:Button id="Button11" style="Z-INDEX: 132; LEFT: 260px; POSITION: absolute; TOP: 482px" runat="server" Width="74px" Height="28px" Text="Delete"></asp:Button>
				<asp:Button id="Button10" style="Z-INDEX: 131; LEFT: 176px; POSITION: absolute; TOP: 483px" runat="server" Width="74px" Height="28px" Text="Save"></asp:Button>
				<asp:Label id="Label11" style="Z-INDEX: 129; LEFT: 322px; POSITION: absolute; TOP: 434px" runat="server" Width="72px" Height="13px">DEPT_ABBR</asp:Label>
				<asp:Label id="Label10" style="Z-INDEX: 128; LEFT: 321px; POSITION: absolute; TOP: 399px" runat="server" Width="72px" Height="13px">DEPT_DESC</asp:Label>
				<asp:Label id="Label9" style="Z-INDEX: 127; LEFT: 32px; POSITION: absolute; TOP: 407px" runat="server" Width="72px" Height="13px">DEPT_CODE</asp:Label>
				<asp:TextBox id="TextBox11" style="Z-INDEX: 125; LEFT: 422px; POSITION: absolute; TOP: 431px" runat="server" Width="150px" Height="25px"></asp:TextBox>
				<asp:TextBox id="TextBox10" style="Z-INDEX: 124; LEFT: 424px; POSITION: absolute; TOP: 396px" runat="server" Width="150px" Height="25px"></asp:TextBox>
				<asp:TextBox id="TextBox9" style="Z-INDEX: 123; LEFT: 153px; POSITION: absolute; TOP: 432px" runat="server" Width="150px" Height="25px"></asp:TextBox>
				<asp:Button id="Button8" style="Z-INDEX: 121; LEFT: 345px; POSITION: absolute; TOP: 313px" runat="server" Width="67px" Height="23px" Text="Clear"></asp:Button>
				<asp:Button id="Button7" style="Z-INDEX: 120; LEFT: 265px; POSITION: absolute; TOP: 314px" runat="server" Width="67px" Height="23px" Text="Delete"></asp:Button>
				<asp:Button id="Button6" style="Z-INDEX: 119; LEFT: 187px; POSITION: absolute; TOP: 314px" runat="server" Width="67px" Height="23px" Text="Save"></asp:Button>
				<asp:Button id="Button5" style="Z-INDEX: 118; LEFT: 106px; POSITION: absolute; TOP: 313px" runat="server" Width="67px" Height="23px" Text="Search"></asp:Button>
				<asp:Label id="Label7" style="Z-INDEX: 117; LEFT: 324px; POSITION: absolute; TOP: 271px" runat="server" Width="27px" Height="7px">DEPT</asp:Label>
				<asp:Label id="Label6" style="Z-INDEX: 116; LEFT: 32px; POSITION: absolute; TOP: 268px" runat="server" Width="78px" Height="8px">Officer PID</asp:Label>
				<asp:TextBox id="TextBox7" style="Z-INDEX: 115; LEFT: 388px; POSITION: absolute; TOP: 266px" runat="server" Width="153px" Height="28px"></asp:TextBox>
				<asp:TextBox id="TextBox6" style="Z-INDEX: 114; LEFT: 129px; POSITION: absolute; TOP: 265px" runat="server" Width="153px" Height="28px"></asp:TextBox>
				<asp:Label id="Label5" style="Z-INDEX: 109; LEFT: 336px; POSITION: absolute; TOP: 142px" runat="server" Width="43px" Height="8px">FLAG</asp:Label>
				<asp:Label id="Label4" style="Z-INDEX: 108; LEFT: 310px; POSITION: absolute; TOP: 103px" runat="server" Width="78px" Height="8px">Officer PID</asp:Label>
				<asp:Label id="Label2" style="Z-INDEX: 106; LEFT: 30px; POSITION: absolute; TOP: 107px" runat="server" Width="81px" Height="7px">Father PID</asp:Label>
				<asp:Label id="Label1" style="Z-INDEX: 105; LEFT: 47px; POSITION: absolute; TOP: 71px" runat="server" Width="27px" Height="7px">PID</asp:Label>
				<asp:TextBox id="TextBox2" style="Z-INDEX: 101; LEFT: 138px; POSITION: absolute; TOP: 97px" runat="server" Width="154px" Height="25px"></asp:TextBox>
				<asp:TextBox id="TextBox3" style="Z-INDEX: 102; LEFT: 138px; POSITION: absolute; TOP: 138px" runat="server" Width="152px" Height="23px"></asp:TextBox>
				<asp:TextBox id="TextBox4" style="Z-INDEX: 103; LEFT: 407px; POSITION: absolute; TOP: 98px" runat="server" Width="153px" Height="22px"></asp:TextBox>
				<asp:TextBox id="TextBox5" style="Z-INDEX: 104; LEFT: 407px; POSITION: absolute; TOP: 135px" runat="server" Width="152px" Height="24px"></asp:TextBox>
				<asp:Label id="Label3" style="Z-INDEX: 107; LEFT: 27px; POSITION: absolute; TOP: 143px" runat="server" Width="88px" Height="8px">Mother PID</asp:Label>
				<asp:Button id="Button1" style="Z-INDEX: 110; LEFT: 319px; POSITION: absolute; TOP: 61px" runat="server" Width="67px" Height="28px" Text="Search"></asp:Button>
				<asp:Button id="Button2" style="Z-INDEX: 111; LEFT: 198px; POSITION: absolute; TOP: 185px" runat="server" Width="91px" Height="25px" Text="Save"></asp:Button>
				<asp:Button id="Button3" style="Z-INDEX: 112; LEFT: 297px; POSITION: absolute; TOP: 185px" runat="server" Width="92px" Height="26px" Text="Delete"></asp:Button>
				<asp:Button id="Button4" style="Z-INDEX: 113; LEFT: 97px; POSITION: absolute; TOP: 185px" runat="server" Width="92px" Height="26px" Text="Clear"></asp:Button></FONT>
			<asp:TextBox id="TextBox8" style="Z-INDEX: 122; LEFT: 154px; POSITION: absolute; TOP: 399px" runat="server" Width="150px" Height="25px"></asp:TextBox>
			<asp:Label id="Label8" style="Z-INDEX: 126; LEFT: 15px; POSITION: absolute; TOP: 434px" runat="server" Width="72px" Height="30px">MINISTRY_CODE</asp:Label>
			<asp:Button id="Button9" style="Z-INDEX: 130; LEFT: 92px; POSITION: absolute; TOP: 483px" runat="server" Width="74px" Height="28px" Text="Search"></asp:Button>
			<HR style="Z-INDEX: 134; LEFT: 12px; WIDTH: 98.23%; POSITION: absolute; TOP: 218px; HEIGHT: 3px" width="98.23%" SIZE="3">
			<HR style="Z-INDEX: 135; LEFT: 10px; WIDTH: 98.23%; POSITION: absolute; TOP: 345px; HEIGHT: 3px" width="98.23%" SIZE="3">
			<TABLE id="Table1" style="Z-INDEX: 136; LEFT: 67px; WIDTH: 442px; POSITION: absolute; TOP: 16px; HEIGHT: 11px" cellSpacing="1" cellPadding="1" width="300" border="1" bgcolor="#ffffcc">
				<TR>
					<TD align="middle"><FONT face="Tahoma">Table ได้รับสิทธิ์ข้าราชการ</FONT></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
