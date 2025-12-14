<%@ Page language="c#" Codebehind="detail_person.aspx.cs" AutoEventWireup="false" Inherits="project.detail_person" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>detail_person</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="detail_person" method="post" runat="server">
			<FONT face="Tahoma">
				<TABLE id="Table1" style="Z-INDEX: 101; LEFT: 91px; WIDTH: 558px; POSITION: absolute; TOP: 94px; HEIGHT: 98px" cellSpacing="1" cellPadding="1" width="558" border="0">
					<TR>
						<TD style="WIDTH: 95px"></TD>
						<TD style="WIDTH: 120px"></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 95px"><asp:label id="Label2" runat="server">บริษัทห้างร้าน</asp:label></TD>
						<TD style="WIDTH: 120px">
							<asp:Label id="Label7" runat="server" ForeColor="Red">Label</asp:Label></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 95px"><asp:label id="Label3" runat="server">สถานที่ตั้ง</asp:label></TD>
						<TD style="WIDTH: 120px">
							<asp:Label id="Label1" runat="server" ForeColor="Red">Label</asp:Label></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 95px"><asp:label id="Label4" runat="server">เบอร์โทรศัพท์</asp:label></TD>
						<TD style="WIDTH: 120px">
							<asp:Label id="Label8" runat="server" ForeColor="Red">Label</asp:Label></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 95px">
							<asp:Label id="Label6" runat="server">Email</asp:Label></TD>
						<TD style="WIDTH: 120px">
							<asp:Label id="Label9" runat="server" ForeColor="Red">Label</asp:Label></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 95px">
							<asp:Label id="Label13" runat="server">ราคาต่อหน่วย</asp:Label></TD>
						<TD style="WIDTH: 120px">
							<asp:Label id="Label5" runat="server" ForeColor="Red">Label</asp:Label></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 95px">
							<asp:Label id="Label14" runat="server">จำนวน</asp:Label></TD>
						<TD style="WIDTH: 120px">
							<asp:Label id="Label16" runat="server" ForeColor="Red">Label</asp:Label></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 95px">
							<asp:Label id="Label10" runat="server">ราคารวมทั้งหมด</asp:Label></TD>
						<TD style="WIDTH: 120px">
							<asp:Label id="Label22" runat="server" ForeColor="Red">Label</asp:Label></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 95px">
							<asp:Label id="Label31" runat="server">ราคา(ภาษาไทย)</asp:Label></TD>
						<TD style="WIDTH: 120px">
							<asp:Label id="Label32" runat="server" ForeColor="Red">Label</asp:Label></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 95px">
							<asp:Label id="Label11" runat="server">วันที่ยื่นซอง</asp:Label></TD>
						<TD style="WIDTH: 120px">
							<asp:Label id="Label23" runat="server" ForeColor="Red">Label</asp:Label></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 95px">
							<asp:Label id="Label12" runat="server">วันที่ส่งผลิตภัณฑ์ได้</asp:Label></TD>
						<TD style="WIDTH: 120px">
							<asp:Label id="Label24" runat="server" ForeColor="Red">Label</asp:Label></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 95px">
							<asp:label id="Label17" runat="server">ยี่ห้อ</asp:label></TD>
						<TD style="WIDTH: 120px">
							<asp:Label id="Label25" runat="server" ForeColor="Red">Label</asp:Label></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 95px">
							<asp:label id="Label15" runat="server">แบบ</asp:label></TD>
						<TD style="WIDTH: 120px">
							<asp:Label id="Label26" runat="server" ForeColor="Red">Label</asp:Label></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 95px">
							<asp:label id="Label19" runat="server">ผู้ผลิต</asp:label></TD>
						<TD style="WIDTH: 120px">
							<asp:Label id="Label27" runat="server" ForeColor="Red">Label</asp:Label></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 95px">
							<asp:label id="Label20" runat="server">ประเทศผู้ผลิต</asp:label></TD>
						<TD style="WIDTH: 120px">
							<asp:Label id="Label28" runat="server" ForeColor="Red">Label</asp:Label></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 95px">
							<asp:Label id="Label18" runat="server">ชื่อผู้เสนอ</asp:Label></TD>
						<TD style="WIDTH: 120px">
							<asp:Label id="Label29" runat="server" ForeColor="Red">Label</asp:Label></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 95px">
							<asp:Label id="Label21" runat="server">ตำแหน่ง</asp:Label></TD>
						<TD style="WIDTH: 120px">
							<asp:Label id="Label30" runat="server" ForeColor="Red">Label</asp:Label></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 95px"></TD>
						<TD style="WIDTH: 120px">
							<asp:Button id="Button1" runat="server" Text="ดูรายละเอียดบริษัทอื่น"></asp:Button></TD>
						<TD>
							<asp:LinkButton id="LinkButton1" runat="server">ไปหน้าแรก</asp:LinkButton></TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
