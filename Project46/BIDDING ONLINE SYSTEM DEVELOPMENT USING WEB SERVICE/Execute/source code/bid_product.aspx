<%@ Page language="c#" Codebehind="bid_product.aspx.cs" AutoEventWireup="false" Inherits="project.bid_product" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>bid_product</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="bid_product" method="post" runat="server">
			<TABLE id="Table2" style="Z-INDEX: 103; LEFT: 128px; WIDTH: 541px; POSITION: absolute; TOP: 189px; HEIGHT: 251px" cellSpacing="1" cellPadding="1" width="541" border="0">
				<TR>
					<TD><FONT face="Tahoma">
							<P><asp:label id="Label5" runat="server">สเปคของราชการ</asp:label></P>
						</FONT>
					</TD>
					<TD>
						<P><FONT face="Tahoma"><asp:label id="Label6" runat="server">สเปคที่เอกชนเสนอ</asp:label></FONT></P>
					</TD>
					<TD></TD>
				</TR>
				<TR>
					<TD><FONT face="Tahoma">
							<P><asp:datagrid id="dgG1" runat="server" BackColor="#C0FFC0" AutoGenerateColumns="False" Width="247px">
									<Columns>
										<asp:BoundColumn DataField="Detail" HeaderText="ชื่อสเปค"></asp:BoundColumn>
										<asp:BoundColumn DataField="Number" HeaderText="ขนาด"></asp:BoundColumn>
										<asp:BoundColumn DataField="Unit" HeaderText="หน่วย"></asp:BoundColumn>
									</Columns>
								</asp:datagrid></P>
						</FONT>
					</TD>
					<TD>
						<P><FONT face="Tahoma"><asp:datagrid id="dgC1" runat="server" BackColor="#C0FFC0" AutoGenerateColumns="False" Width="252px">
									<Columns>
										<asp:BoundColumn DataField="Detail" HeaderText="ชื่อสเปค"></asp:BoundColumn>
										<asp:BoundColumn DataField="Number" HeaderText="ขนาด"></asp:BoundColumn>
										<asp:BoundColumn DataField="Unit" HeaderText="หน่วย"></asp:BoundColumn>
									</Columns>
								</asp:datagrid></P>
						</FONT></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD><asp:datagrid id="dgG2" runat="server" BackColor="#C0FFFF" AutoGenerateColumns="False" Width="240px">
							<Columns>
								<asp:BoundColumn DataField="Detail" HeaderText="ชื่อสเปค"></asp:BoundColumn>
								<asp:BoundColumn DataField="Number" HeaderText="ขนาด"></asp:BoundColumn>
								<asp:BoundColumn DataField="Unit" HeaderText="หน่วย"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></TD>
					<TD><asp:datagrid id="dgC2" runat="server" BackColor="#C0FFFF" AutoGenerateColumns="False" Width="241px">
							<Columns>
								<asp:BoundColumn DataField="Detail" HeaderText="ชื่อสเปค"></asp:BoundColumn>
								<asp:BoundColumn DataField="Number" HeaderText="ขนาด"></asp:BoundColumn>
								<asp:BoundColumn DataField="Unit" HeaderText="หน่วย"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD><asp:datagrid id="dgG3" runat="server" BackColor="#FFFFC0" AutoGenerateColumns="False" Width="242px">
							<Columns>
								<asp:BoundColumn DataField="Detail" HeaderText="สิ่งที่ต้องมี"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></TD>
					<TD><asp:datagrid id="dgC3" runat="server" BackColor="#FFFFC0" AutoGenerateColumns="False" Width="242px">
							<Columns>
								<asp:BoundColumn DataField="Detail" HeaderText="สิ่งที่ผู้ประกอบการเสนอ"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD><FONT face="Tahoma"></FONT></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD>
						<asp:Button id="Button2" runat="server" Text="เลือกผู้ประกอบการรายนี้เป็นผู้ชนะ"></asp:Button></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD><FONT face="Tahoma">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:Button id="Button1" runat="server" Text="ดูผู้ประกอบการรายอื่น"></asp:Button></FONT></TD>
					<TD></TD>
					<TD></TD>
				</TR>
			</TABLE>
			<TABLE id="Table1" style="Z-INDEX: 101; LEFT: 197px; POSITION: absolute; TOP: 84px" cellSpacing="1" cellPadding="1" width="300" border="0">
				<TR>
					<TD style="WIDTH: 125px"><asp:label id="Label1" runat="server">ชื่อครุภัณฑ์</asp:label></TD>
					<TD><FONT face="Tahoma"><asp:label id="Label3" runat="server">Label</asp:label></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 125px; HEIGHT: 3px"><FONT face="Tahoma"><asp:label id="Label2" runat="server">ชื่อเอกชน</asp:label></FONT></TD>
					<TD style="HEIGHT: 3px"><asp:label id="Label4" runat="server">Label</asp:label></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 125px"><FONT face="Tahoma"></FONT></TD>
					<TD><FONT face="Tahoma"></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 125px"><FONT face="Tahoma"></FONT></TD>
					<TD><FONT face="Tahoma"></FONT></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
