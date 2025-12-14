<%@ Page language="c#" Codebehind="people.aspx.cs" AutoEventWireup="false" Inherits="PeopleApp.WebForm1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>WebForm1</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio 7.0">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" bgcolor="#ffcccc">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma">
				<asp:TextBox id="IDTextBox" style="Z-INDEX: 101; LEFT: 243px; POSITION: absolute; TOP: 69px" runat="server" Width="228px" Height="23px"></asp:TextBox>
				<asp:Button id="SaveButton" style="Z-INDEX: 133; LEFT: 413px; POSITION: absolute; TOP: 364px" runat="server" Height="22px" Width="68px" Text="Save"></asp:Button>
				<asp:Label id="FoundLabel" style="Z-INDEX: 132; LEFT: 569px; POSITION: absolute; TOP: 68px" runat="server" Height="25px" Width="117px"></asp:Label>
				<asp:Button id="SearchButton" style="Z-INDEX: 131; LEFT: 487px; POSITION: absolute; TOP: 64px" runat="server" Width="69px" Height="30px" Text="Search"></asp:Button>
				<asp:Button id="DeleteButton" style="Z-INDEX: 130; LEFT: 493px; POSITION: absolute; TOP: 362px" runat="server" Width="70px" Height="23px" Text="Delete"></asp:Button>
				<asp:TextBox id="CCAA_OLDTextBox" style="Z-INDEX: 128; LEFT: 134px; POSITION: absolute; TOP: 361px" runat="server" Width="148px" Height="23px"></asp:TextBox>
				<asp:Label id="CCAA_OLDLabel" style="Z-INDEX: 127; LEFT: 35px; POSITION: absolute; TOP: 365px" runat="server" Width="62px" Height="22px">CCAA_OLD</asp:Label>
				<asp:TextBox id="CCAATTMMTextBox" style="Z-INDEX: 126; LEFT: 437px; POSITION: absolute; TOP: 323px" runat="server" Width="148px" Height="23px"></asp:TextBox>
				<asp:Label id="CCAATTMMLabel" style="Z-INDEX: 125; LEFT: 334px; POSITION: absolute; TOP: 324px" runat="server" Width="62px" Height="22px">CCAATTMM</asp:Label>
				<asp:TextBox id="ThanonTextBox" style="Z-INDEX: 124; LEFT: 136px; POSITION: absolute; TOP: 322px" runat="server" Width="148px" Height="23px"></asp:TextBox>
				<asp:Label id="ThanonLabel" style="Z-INDEX: 123; LEFT: 36px; POSITION: absolute; TOP: 322px" runat="server" Width="62px" Height="22px">ถนน</asp:Label>
				<asp:TextBox id="SoiTextBox" style="Z-INDEX: 122; LEFT: 437px; POSITION: absolute; TOP: 284px" runat="server" Width="148px" Height="23px"></asp:TextBox>
				<asp:Label id="SoiLabel" style="Z-INDEX: 121; LEFT: 333px; POSITION: absolute; TOP: 288px" runat="server" Width="62px" Height="22px">ซอย</asp:Label>
				<asp:TextBox id="TrokTextBox" style="Z-INDEX: 120; LEFT: 136px; POSITION: absolute; TOP: 284px" runat="server" Width="148px" Height="23px"></asp:TextBox>
				<asp:Label id="TrokLabel" style="Z-INDEX: 119; LEFT: 36px; POSITION: absolute; TOP: 281px" runat="server" Width="62px" Height="22px">ตรอก</asp:Label>
				<asp:TextBox id="HnoTextBox" style="Z-INDEX: 118; LEFT: 438px; POSITION: absolute; TOP: 240px" runat="server" Width="148px" Height="23px"></asp:TextBox>
				<asp:Label id="HnoLabel" style="Z-INDEX: 117; LEFT: 334px; POSITION: absolute; TOP: 243px" runat="server" Width="74px" Height="22px">บ้านเลขที่</asp:Label>
				<asp:TextBox id="HidTextBox" style="Z-INDEX: 116; LEFT: 134px; POSITION: absolute; TOP: 243px" runat="server" Width="148px" Height="23px"></asp:TextBox>
				<asp:Label id="HidLabel" style="Z-INDEX: 115; LEFT: 37px; POSITION: absolute; TOP: 242px" runat="server" Width="74px" Height="22px">ที่อยู่</asp:Label>
				<asp:TextBox id="POP_STTextBox" style="Z-INDEX: 114; LEFT: 437px; POSITION: absolute; TOP: 200px" runat="server" Width="148px" Height="23px"></asp:TextBox>
				<asp:Label id="POP_STLabel" style="Z-INDEX: 113; LEFT: 334px; POSITION: absolute; TOP: 205px" runat="server" Width="74px" Height="22px">POP_ST</asp:Label>
				<asp:TextBox id="DobTextBox" style="Z-INDEX: 112; LEFT: 135px; POSITION: absolute; TOP: 201px" runat="server" Width="148px" Height="23px"></asp:TextBox>
				<asp:Label id="DobLabel" style="Z-INDEX: 111; LEFT: 39px; POSITION: absolute; TOP: 198px" runat="server" Width="74px" Height="22px">วันเกิด</asp:Label>
				<asp:TextBox id="SexTextBox" style="Z-INDEX: 110; LEFT: 436px; POSITION: absolute; TOP: 119px" runat="server" Width="148px" Height="23px"></asp:TextBox>
				<asp:Label id="SexLabel" style="Z-INDEX: 109; LEFT: 330px; POSITION: absolute; TOP: 118px" runat="server" Width="50px" Height="22px">เพศ</asp:Label>
				<asp:TextBox id="LnameTextBox" style="Z-INDEX: 108; LEFT: 435px; POSITION: absolute; TOP: 159px" runat="server" Width="148px" Height="23px"></asp:TextBox>
				<asp:Label id="LnameLabel" style="Z-INDEX: 107; LEFT: 332px; POSITION: absolute; TOP: 158px" runat="server" Width="60px" Height="25px">นามสกุล</asp:Label>
				<asp:TextBox id="TitleTextBox" style="Z-INDEX: 106; LEFT: 134px; POSITION: absolute; TOP: 119px" runat="server" Width="151px" Height="23px"></asp:TextBox>
				<asp:Label id="TitleLabel" style="Z-INDEX: 105; LEFT: 38px; POSITION: absolute; TOP: 121px" runat="server" Width="74px" Height="22px">คำนำหน้า</asp:Label>
				<asp:TextBox id="FnameTextBox" style="Z-INDEX: 104; LEFT: 135px; POSITION: absolute; TOP: 159px" runat="server" Width="148px" Height="23px"></asp:TextBox>
				<asp:Label id="FnameLabel" style="Z-INDEX: 103; LEFT: 39px; POSITION: absolute; TOP: 157px" runat="server" Width="32px" Height="25px">ชื่อ</asp:Label>
				<asp:Label id="IDLabel" style="Z-INDEX: 102; LEFT: 20px; POSITION: absolute; TOP: 72px" runat="server" Width="212px" Height="25px">หมายเลขบัตรประจำตัวประชาชน</asp:Label>
				<asp:Button id="ClearButton" style="Z-INDEX: 129; LEFT: 337px; POSITION: absolute; TOP: 364px" runat="server" Width="68px" Height="22px" Text="Clear"></asp:Button>
				<TABLE id="Table1" style="Z-INDEX: 135; LEFT: 77px; WIDTH: 500px; POSITION: absolute; TOP: 19px; HEIGHT: 30px" cellSpacing="1" cellPadding="1" width="500" border="1" bgcolor="#ffffcc">
					<TR>
						<TD align="middle">
							<asp:HyperLink id="HyperLink1" runat="server" Height="17px" Width="180px" ForeColor="Black" Font-Bold="True" NavigateUrl="officer.aspx">OTHER DATA TABLE</asp:HyperLink></TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
