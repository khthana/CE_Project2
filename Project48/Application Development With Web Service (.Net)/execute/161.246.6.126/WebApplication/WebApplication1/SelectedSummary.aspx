<%@ Page language="c#" Codebehind="SelectedSummary.aspx.cs" AutoEventWireup="false" Inherits="WebApplication1.SelectedSummary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>SelectedSummary</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html;">
		<style>TD { FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: verdana,arial }
		</style>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<asp:Label id="Label4" style="Z-INDEX: 113; LEFT: 264px; POSITION: absolute; TOP: 8px" runat="server"
			Width="400px" ForeColor="#C0C0FF" Font-Size="30pt" Font-Italic="True" Font-Bold="True">Select Course</asp:Label>
		<table>
			<tr>
				<td>
					<form id="Form1" method="post" runat="server">
						<asp:DataGrid id="DataGrid1" runat="server" Width="950" AutoGenerateColumns="False" style="Z-INDEX: 104; LEFT: 24px; POSITION: absolute; TOP: 136px"
							BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" BackColor="White" CellPadding="3"
							GridLines="Horizontal">
							<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
							<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
							<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
							<ItemStyle ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
							<HeaderStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
							<Columns>
								<asp:TemplateColumn HeaderText="Contract">
									<HeaderTemplate>
										<FONT face="Tahoma" color=#FFFFFF></FONT>
									</HeaderTemplate>
									<ItemTemplate>
										<asp:checkbox id="CheckBox1" runat="server" Width="20px" ForeColor="White"></asp:checkbox>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="id" HeaderText="ลำดับ" HeaderStyle-ForeColor=#ffffff>
									<HeaderStyle Width="30"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="ClassID" HeaderText="รหัสวิชา" HeaderStyle-ForeColor=#ffffff>
									<HeaderStyle Width="50"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="Subject" HeaderText="วิชา" HeaderStyle-ForeColor=#ffffff>
									<HeaderStyle Width="50"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="School" HeaderText="สถาบัน" HeaderStyle-ForeColor=#ffffff>
									<HeaderStyle Width="70px"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="StartDate" HeaderText="วันที่เริ่ม" HeaderStyle-ForeColor=#ffffff>
									<HeaderStyle Width="120"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="FinishDate" HeaderText="วันสุดท้าย" HeaderStyle-ForeColor=#ffffff>
									<HeaderStyle Width="120"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="StartTime" HeaderText="เวลาเริ่มเรียน" HeaderStyle-ForeColor=#ffffff>
									<HeaderStyle Width="100"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="FinishTime" HeaderText="เวลาเลิกเรียน" HeaderStyle-ForeColor=#ffffff>
									<HeaderStyle Width="100"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="CourseDate" HeaderText="วันเรียน" HeaderStyle-ForeColor=#ffffff>
									<HeaderStyle Width="100"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="Teacher" HeaderText="ผู้สอน" HeaderStyle-ForeColor=#ffffff>
									<HeaderStyle Width="70"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="Area" HeaderText="สาขา" HeaderStyle-ForeColor=#ffffff>
									<HeaderStyle Width="70"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="TotalSeat" HeaderText="ที่นั่งทั้งหมด" HeaderStyle-ForeColor=#ffffff>
									<HeaderStyle Width="120"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="AvailableSeat" HeaderText="ที่นั่งที่เหลือ" HeaderStyle-ForeColor=#ffffff>
									<HeaderStyle Width="120"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="Cost" HeaderText="ราคา" HeaderStyle-ForeColor=#ffffff>
									<HeaderStyle Width="100"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="Period" HeaderText="ช่วงเวลา" HeaderStyle-ForeColor=#ffffff>
									<HeaderStyle Width="100"></HeaderStyle>
								</asp:BoundColumn>
							</Columns>
							<PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
						</asp:DataGrid>
						<asp:Label id="Label1" style="Z-INDEX: 105; LEFT: 24px; POSITION: absolute; TOP: 48px" runat="server"
							Width="122px" Font-Size="8pt">รวมราคาคอร์สทั้งหมด :</asp:Label>
						<asp:TextBox id="TextBox1" style="Z-INDEX: 106; LEFT: 72px; POSITION: absolute; TOP: 64px" runat="server"
							Width="152px">0</asp:TextBox>
						<asp:Button id="Button3" style="Z-INDEX: 107; LEFT: 72px; POSITION: absolute; TOP: 104px" runat="server"
							Text="จอง คอร์สที่เลือก"></asp:Button>
						<asp:Button id="Button1" style="Z-INDEX: 108; LEFT: 240px; POSITION: absolute; TOP: 104px" runat="server"
							Text="จบการค้นหา"></asp:Button></form>
				</td>
			</tr>
		</table>
	</body>
</HTML>
