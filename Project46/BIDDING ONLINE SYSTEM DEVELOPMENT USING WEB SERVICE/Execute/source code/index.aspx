<%@ Page language="c#" Codebehind="index.aspx.cs" AutoEventWireup="false" Inherits="project.index" Culture="en-US"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>index</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="index" method="post" runat="server">
			<TABLE id="Table2" style="Z-INDEX: 107; LEFT: 218px; WIDTH: 685px; POSITION: absolute; TOP: 61px; HEIGHT: 606px" cellSpacing="1" cellPadding="1" width="685" border="0">
				<TR>
					<TD>
						<P><FONT face="Tahoma"></FONT></P>
						<P><FONT face="Tahoma"></FONT>&nbsp;</P>
						<P>
							<asp:label id="Label8" runat="server" Visible="False">ท่าน login ในฐานะของ</asp:label><FONT face="Tahoma">&nbsp;
							</FONT>
							<asp:label id="lblName" runat="server" ForeColor="Red" Visible="False">Label</asp:label><FONT face="Tahoma">&nbsp;&nbsp;
							</FONT>
							<asp:button id="btnLogout" runat="server" Visible="False" Text="logout"></asp:button></P>
						<P><FONT face="Tahoma"></FONT>&nbsp;</P>
						<P><FONT face="Tahoma"></FONT>&nbsp;</P>
						<P><FONT face="Tahoma">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</FONT>
							<asp:label id="Label3" runat="server" ForeColor="Blue" Font-Size="Medium">ประกาศ : การสอบราคา</asp:label></P>
						<P><FONT face="Tahoma">&nbsp; </FONT>
							<asp:datagrid id="dg1" runat="server" OnPageIndexChanged="DataGrid_Page1" PageSize="6" AllowPaging="True" AutoGenerateColumns="False" Height="64px" Width="344px" BorderStyle="None">
								<Columns>
									<asp:BoundColumn DataField="NameBidding" HeaderText="ชือผลิตภัณฑ์ที่ประกวด"></asp:BoundColumn>
									<asp:BoundColumn DataField="EndSubmit" HeaderText="วันหมดเขตประกวด(เดือน/วัน/ปี)"></asp:BoundColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											กด link เพื่อดูรายละเอียด
										</HeaderTemplate>
										<ItemTemplate>
											<TABLE>
												<TR>
													<TD><A href='2.aspx?idb=<%# DataBinder.Eval(Container.DataItem,"IDBidding") %>&amp;idp=<%# DataBinder.Eval(Container.DataItem,"IDPlace")%>'>link</A>
													</TD>
												</TR>
											</TABLE>
										</ItemTemplate>
									</asp:TemplateColumn>
								</Columns>
								<PagerStyle HorizontalAlign="Left" Mode="NumericPages"></PagerStyle>
							</asp:datagrid></P>
						<P><FONT face="Tahoma"></FONT>&nbsp;</P>
						<P><FONT face="Tahoma"></FONT>&nbsp;</P>
						<P><FONT face="Tahoma">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</FONT>
							<asp:label id="Label4" runat="server" ForeColor="Blue" Font-Size="Medium">ประกาศผลการสอบราคาที่ผ่านมา</asp:label></P>
						<P><FONT face="Tahoma">&nbsp; </FONT>
							<asp:datagrid id="dg2" runat="server" OnPageIndexChanged="DataGrid_Page2" PageSize="6" AllowPaging="True" AutoGenerateColumns="False" Height="116px" Width="372px">
								<Columns>
									<asp:BoundColumn DataField="NameBidding" HeaderText="ชื่อผลิตภัณฑ์ที่หมดเขตการประกวดแล้ว"></asp:BoundColumn>
									<asp:BoundColumn DataField="EndSubmit" HeaderText="วันหมดเขตประกวด(เดือน/วัน/ปี)"></asp:BoundColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											กด link เพื่อดูรายละเอียด
										</HeaderTemplate>
										<ItemTemplate>
											<TABLE>
												<TR>
													<TD><A href='2.aspx?idb=<%# DataBinder.Eval(Container.DataItem,"IDBidding") %>&amp;idp=<%# DataBinder.Eval(Container.DataItem,"IDPlace")%>'>link</A>
													</TD>
												</TR>
											</TABLE>
										</ItemTemplate>
										<EditItemTemplate>
										</EditItemTemplate>
									</asp:TemplateColumn>
								</Columns>
								<PagerStyle HorizontalAlign="Left" Mode="NumericPages"></PagerStyle>
							</asp:datagrid></P>
						<P><FONT face="Tahoma">&nbsp;&nbsp; </FONT>
						</P>
						<FONT face="Tahoma">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
						<TABLE id="Table1" style="WIDTH: 377px; HEIGHT: 90px" cellSpacing="1" cellPadding="1" width="377" border="0">
							<TR>
								<TD><asp:label id="Label1" runat="server">UserName</asp:label></TD>
								<TD><asp:textbox id="UserName" runat="server"></asp:textbox></TD>
								<TD><FONT face="Tahoma"></FONT></TD>
							</TR>
							<TR>
								<TD style="HEIGHT: 27px"><FONT face="Tahoma"></FONT><asp:label id="Label2" runat="server">Password</asp:label></TD>
								<TD style="HEIGHT: 27px"><asp:textbox id="Password" runat="server" TextMode="Password"></asp:textbox></TD>
								<TD style="HEIGHT: 27px"><FONT face="Tahoma"></FONT></TD>
							</TR>
							<TR>
								<TD><asp:button id="Button1" runat="server" Text="login" h></asp:button>
									<INPUT type="reset" value="Reset"></TD>
								<TD><FONT face="Tahoma"><asp:linkbutton id="LinkButton1" runat="server">สมัครสมาชิกใหม่(ราชการ)</asp:linkbutton></FONT></TD>
								<TD><FONT face="Tahoma"></FONT></TD>
							</TR>
							<TR>
								<TD><FONT face="Tahoma"></FONT></TD>
								<TD><FONT face="Tahoma"></FONT></TD>
								<TD><FONT face="Tahoma">&nbsp;</FONT></TD>
							</TR>
						</TABLE>
						<P><FONT face="Tahoma"></FONT>&nbsp;</P>
						<TABLE id="Table3" style="WIDTH: 302px; HEIGHT: 80px" cellSpacing="1" cellPadding="1" width="302" border="0">
							<TR>
								<TD style="WIDTH: 46px; HEIGHT: 28px"><asp:label id="Label6" runat="server">UserName</asp:label></TD>
								<TD style="HEIGHT: 28px"><asp:textbox id="txtUserName" runat="server"></asp:textbox></TD>
								<TD style="HEIGHT: 28px"><FONT face="Tahoma"></FONT></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 46px"><asp:label id="Label7" runat="server">Password</asp:label></TD>
								<TD><asp:textbox id="txtPassword" runat="server" TextMode="Password"></asp:textbox></TD>
								<TD><FONT face="Tahoma"></FONT></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 46px"><asp:button id="Button2" runat="server" Text="login"></asp:button></TD>
								<TD><INPUT type="reset" value="Reset"></TD>
								<TD><FONT face="Tahoma"></FONT></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 46px"></TD>
								<TD><asp:linkbutton id="submitCompany" runat="server">สมัครสมาชิกใหม่(ผู้ประกอบการ)</asp:linkbutton></TD>
								<TD><FONT face="Tahoma"></FONT></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
