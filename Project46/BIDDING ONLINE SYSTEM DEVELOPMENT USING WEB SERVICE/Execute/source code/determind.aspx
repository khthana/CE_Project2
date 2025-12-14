<%@ Page language="c#" Codebehind="determind.aspx.cs" AutoEventWireup="false" Inherits="project.determind" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>determind</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="determind" method="post" runat="server">
			<TABLE id="Table1" style="Z-INDEX: 101; LEFT: 278px; WIDTH: 451px; POSITION: absolute; TOP: 125px; HEIGHT: 80px" cellSpacing="1" cellPadding="1" width="451" border="0">
				<TR>
					<TD style="WIDTH: 125px; HEIGHT: 30px"><FONT face="Tahoma"><FONT face="Tahoma"><asp:label id="Label2" runat="server">ชื่อสำนักงาน</asp:label></FONT></FONT></TD>
					<TD style="WIDTH: 200px; HEIGHT: 30px"><asp:label id="Label7" runat="server">Label</asp:label></TD>
					<TD style="HEIGHT: 30px"><FONT face="Tahoma"></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 125px"><FONT face="Tahoma"><FONT face="Tahoma"></FONT></FONT></TD>
					<TD style="WIDTH: 200px"><FONT face="Tahoma"></FONT></TD>
					<TD><FONT face="Tahoma"></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 125px"><FONT face="Tahoma"><FONT face="Tahoma"></FONT></FONT></TD>
					<TD style="WIDTH: 200px"></TD>
					<TD><FONT face="Tahoma"></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 125px"><asp:label id="Label1" runat="server">ประจำปี</asp:label></TD>
					<TD style="WIDTH: 200px"><asp:dropdownlist id="txtat_year" runat="server">
							<asp:ListItem Value="2547">2547</asp:ListItem>
							<asp:ListItem Value="2548">2548</asp:ListItem>
							<asp:ListItem Value="2549">2549</asp:ListItem>
						</asp:dropdownlist></TD>
					<TD><FONT face="Tahoma"></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 125px"><asp:button id="btnsearch" runat="server" Text="search"></asp:button></TD>
					<TD style="WIDTH: 200px"><asp:label id="Label5" runat="server" Visible="False">ไม่สามารถเข้าดูได้เนื่องจากอยู่ในช่วงประกวด</asp:label></TD>
					<TD><FONT face="Tahoma"></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 125px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 200px"><FONT face="Tahoma"></FONT></TD>
					<TD><FONT face="Tahoma"></FONT></TD>
				</TR>
			</TABLE>
			<TABLE id="Table2" style="Z-INDEX: 104; LEFT: 178px; POSITION: absolute; TOP: 325px" cellSpacing="1" cellPadding="1" width="300" border="1">
				<TR>
					<TD>
						<P><asp:label id="Label4" runat="server" Visible="False">ชื่อผลิตภัณฑ์ที่ยังประกวดอยู่</asp:label></P>
						<P><FONT face="Tahoma"></FONT>
						<asp:datagrid id="dgshow" runat="server" Visible="False" AutoGenerateColumns="False" Height="40px" PageSize="6" AllowPaging="True">
								<Columns>
									<asp:BoundColumn DataField="NameBidding" HeaderText="ชื่อครุภัณฑ์"></asp:BoundColumn>
									<asp:BoundColumn DataField="AtYear" HeaderText="ประจำปี"></asp:BoundColumn>
									<asp:BoundColumn DataField="IDBuying" HeaderText="รหัสการส่งเข้าประกวด"></asp:BoundColumn>
									<asp:BoundColumn DataField="EndSubmit" HeaderText="วันหมดเวลาการประกวด"></asp:BoundColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											ดูรายละเอียดเพิ่มเติม
										</HeaderTemplate>
										<ItemTemplate>
											<a href='Dummy.aspx?idb=<%# DataBinder.Eval(Container.DataItem,"IDBidding") %>&amp;form=1'>
												link</a>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											ส่ง email
										</HeaderTemplate>
										<ItemTemplate>
											<a href='email.aspx?idb=<%# DataBinder.Eval(Container.DataItem,"IDBidding") %>'>send</a>
										</ItemTemplate>
									</asp:TemplateColumn>
								</Columns>
							</asp:datagrid></P>
					</TD>
					<TD>
						<P><FONT face="Tahoma"><asp:label id="Label3" runat="server" Visible="False">ชื่อครุภัณฑ์ที่ ยกเลิกการประกวดแล้ว</asp:label></FONT></P>
						<P><FONT face="Tahoma"><asp:datagrid id="dgCancle" runat="server" Visible="False" AutoGenerateColumns="False" Height="40px" PageSize="6" AllowPaging="True">
									<Columns>
										<asp:BoundColumn DataField="NameBidding" HeaderText="ชื่อครุภัณฑ์"></asp:BoundColumn>
										<asp:BoundColumn DataField="AtYear" HeaderText="ประจำปี"></asp:BoundColumn>
										<asp:BoundColumn DataField="IDBuying" HeaderText="รหัสการส่งเข้าประกวด"></asp:BoundColumn>
										<asp:BoundColumn DataField="EndSubmit" HeaderText="วันหมดเวลาการประกวด"></asp:BoundColumn>
										<asp:TemplateColumn>
											<HeaderTemplate>
												ดูรายละเอียดเพิ่มเติม
											</HeaderTemplate>
											<ItemTemplate>
												<a href='Dummy.aspx?idb=<%# DataBinder.Eval(Container.DataItem,"IDBidding") %>&amp;form=0'>
													link</a>
											</ItemTemplate>
										</asp:TemplateColumn>
									</Columns>
								</asp:datagrid></P>
						</FONT></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
