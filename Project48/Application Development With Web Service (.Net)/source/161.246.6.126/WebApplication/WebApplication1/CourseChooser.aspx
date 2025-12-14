<%@ Page language="c#" Codebehind="CourseChooser.aspx.cs" AutoEventWireup="false" Inherits="WebApplication1.CourseChooser" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>WebForm1</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html;">
		<style>TD { FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: verdana,arial }
		</style>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<table>
			<tr>
				<td>
					<form id="Form1" method="post" runat="server">
						<FONT face="Tahoma">
							<asp:dropdownlist id="fComboSubject" style="Z-INDEX: 101; LEFT: 112px; POSITION: absolute; TOP: 64px"
								runat="server" AutoPostBack="True" Height="24px" Width="160px">
								<asp:ListItem Value="math">คณิตศาสตร์</asp:ListItem>
								<asp:ListItem Value="chem">เคมี</asp:ListItem>
								<asp:ListItem Value="physic">ฟิสิกส์</asp:ListItem>
								<asp:ListItem Value="select subject" Selected="True">กรุณาเลือกวิชา</asp:ListItem>
							</asp:dropdownlist><asp:label id="Label3" style="Z-INDEX: 108; LEFT: 16px; POSITION: absolute; TOP: 112px" runat="server"
								Height="32px" Width="72px" Visible="False">เลือกเวลา</asp:label><asp:label id="Label2" style="Z-INDEX: 107; LEFT: 16px; POSITION: absolute; TOP: 88px" runat="server"
								Height="32px" Width="96px" Visible="False">เลือกสถาบัน</asp:label><asp:dropdownlist id="fComboPeriod" style="Z-INDEX: 105; LEFT: 112px; POSITION: absolute; TOP: 112px"
								runat="server" AutoPostBack="True" Height="24px" Width="160px" Visible="False">
								<asp:ListItem Value="Term1">เทอม1 (พ.ค.-ก.ย.)</asp:ListItem>
								<asp:ListItem Value="Term2">เทอม2 (พ.ย.-ก.พ.)</asp:ListItem>
								<asp:ListItem Value="Summer1">Summer1 (ก.ย.-ต.ค.)</asp:ListItem>
								<asp:ListItem Value="Summer2">Summer2 (มี.ค.-มิ.ย.)</asp:ListItem>
							</asp:dropdownlist><asp:button id="fButtonSelectCourse" style="Z-INDEX: 104; LEFT: 112px; POSITION: absolute; TOP: 136px"
								runat="server" Width="104px" Visible="False" Text="เลือกวิชานี้"></asp:button><asp:textbox id="TextBox1" style="Z-INDEX: 102; LEFT: 504px; POSITION: absolute; TOP: 64px" runat="server"
								Height="32px" Width="80px" Visible="False"></asp:textbox><asp:dropdownlist id="fComboSchool" style="Z-INDEX: 103; LEFT: 112px; POSITION: absolute; TOP: 88px"
								runat="server" AutoPostBack="True" Height="24px" Width="160px" Visible="False"></asp:dropdownlist><asp:label id="Label1" style="Z-INDEX: 106; LEFT: 16px; POSITION: absolute; TOP: 64px" runat="server"
								Height="32px" Width="72px">เลือกวิชา</asp:label><asp:datagrid id=DataGrid1 style="Z-INDEX: 109; LEFT: 16px; POSITION: absolute; TOP: 176px" tabIndex=1 runat="server" Width="516px" BorderStyle="None" GridLines="Horizontal" CellPadding="3" BackColor="White" BorderWidth="1px" BorderColor="#E7E7FF" Caption="วิชาที่เลือก" DataSource="<%# dataSet1 %>">
								<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
								<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
								<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
								<ItemStyle ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
								<HeaderStyle Font-Bold="True"  ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
								<Columns>
									<asp:ButtonColumn Text="Delete" HeaderText="Contract" CommandName="Delete"></asp:ButtonColumn>
								</Columns>
								<PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
							</asp:datagrid><asp:textbox id="TextBox2" style="Z-INDEX: 110; LEFT: 416px; POSITION: absolute; TOP: 64px" runat="server"
								Height="32px" Width="72px" Visible="False"></asp:textbox>
							<asp:button id="fButtonSubmit" style="Z-INDEX: 111; LEFT: 552px; POSITION: absolute; TOP: 192px"
								runat="server" Width="56px" Height="24px" Text="ตกลง"></asp:button>
							<asp:textbox id="TextBox3" style="Z-INDEX: 112; LEFT: 392px; POSITION: absolute; TOP: 128px"
								runat="server" Width="192px" Visible="False" ReadOnly="True"></asp:textbox></FONT></form>
				</td>
			</tr>
		</table>
		<asp:Label id="Label4" style="Z-INDEX: 113; LEFT: 132px; POSITION: absolute; TOP: 8px" runat="server"
			Width="472px" ForeColor="#C0C0FF" Font-Bold="True" Font-Italic="True" Font-Size="30pt">Course Chooser</asp:Label>
	</body>
</HTML>
