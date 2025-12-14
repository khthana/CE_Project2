<%@ Page language="c#" Codebehind="WebForm1.aspx.cs" AutoEventWireup="false" Inherits="WApplication.WebForm1" %>
<%@ Import Namespace="System.Data.SqlClient"%>
<%@ Import Namespace="System.Web"%>
<%@ Import Namespace="System.Data"%>
<%@ Import Namespace="System"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Thesis Of Universities</title>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<style type="text/css">BODY { FONT-SIZE: 24px }
	TD { FONT-SIZE: 24px }
	TH { FONT-SIZE: 24px }
	.wpmd { FONT-WEIGHT: normal; FONT-SIZE: 13px; FONT-STYLE: normal; FONT-FAMILY: 'Arial'; TEXT-DECORATION: none }
	.ws11 { FONT-SIZE: 15px }
	.ws9 { FONT-SIZE: 12px }
		</style>
		<style type="text/css">DIV#container { MARGIN-TOP: 0px; MARGIN-LEFT: auto; WIDTH: 750px; MARGIN-RIGHT: auto; POSITION: relative; TEXT-ALIGN: left }
	BODY { MARGIN: 0px; TEXT-ALIGN: center }
	.style2 { FONT-SIZE: 18px }
	.style3 { FONT-SIZE: 22px }
		</style>
	</HEAD>
	<body>
		<FORM id="Form1" method="post" runat="server">
			<FONT face="Tahoma"></FONT>
			<DIV id="container" style="WIDTH: 755px; HEIGHT: 100%">
				<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
					<TR>
						<TD colSpan="2"><IMG alt="left" src="/WApplication/image/main_left.jpg" DESIGNTIMEDRAGDROP="7557"><IMG height="141" alt="left" src="/WApplication/image/b001main_right.jpg" width="346"></TD>
					</TR>
					<TR height="46">
						<TD colSpan="2">
							<div id="text9" style="Z-INDEX: 104; LEFT: 560px; WIDTH: 192px; POSITION: absolute; TOP: 96px; HEIGHT: 48px">
								<div class="wpmd">
									<div align="right"><font class="ws11" face="Tahoma" color="#ffffff"><B><I>The Unity of Thesis 
													in Thailand Universities</I></B></font></div>
									<div><font class="ws11" face="Tahoma" color="#000000"><B><I><BR>
												</I></B></font>
									</div>
								</div>
							</div>
							<div id="text6" style="Z-INDEX: 103; LEFT: 16px; OVERFLOW: hidden; WIDTH: 156px; POSITION: absolute; TOP: 160px; HEIGHT: 12px">
								<div class="wpmd">
									<div>
										<div align="center"><font class="ws9" color="#666699"><B>What's NEW?</B></font></div>
									</div>
								</div>
							</div>
							<div id="text8" style="Z-INDEX: 105; LEFT: 280px; OVERFLOW: hidden; WIDTH: 474px; POSITION: absolute; TOP: 160px; HEIGHT: 20px">
								<div class="wpmd">
									<div><font face="Tahoma"><B>
												<DIV><FONT face="Tahoma"><B><A class="style1" href="index.aspx">หน้าหลัก</A></B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<A class="style1" href="WebForm1.aspx">ค้นหาจากคำ</A>&nbsp;&nbsp;&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;<A class="style1" href="WebForm2.aspx">ค้นหาจากชื่อ</A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B class="style1"><FONT face="Tahoma" color="#333333"><B class="style1"><FONT color="#800080"><A class="style1" href="WebQuset.aspx"><FONT color="purple">ถาม-ตอบ</FONT></A></FONT></B></FONT>
														</B></FONT>
												</DIV>
											</B></font>
									</div>
								</div>
							</div>
							<P><IMG height="47" alt="" src="/WApplication/image/users_feedback_s.gif"><IMG height="47" alt="" src="/WApplication/image/topmenu_img1.gif"><IMG height="47" alt="" src="/WApplication/image/products_b.gif" width="537"></P>
						</TD>
					</TR>
					<TR>
						<TD style="HEIGHT: 251px" width="204">
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="187" align="center" border="0">
								<tr>
									<td>
										<asp:datalist id="DataList_News" runat="server" HorizontalAlign="Left" ShowFooter="False" Width="144px"
											Font-Size="12px" Height="128px">
											<EditItemStyle HorizontalAlign="Left" VerticalAlign="Top"></EditItemStyle>
											<ItemStyle Font-Size="Smaller" Font-Names="AngsanaUPC" HorizontalAlign="Left"></ItemStyle>
											<ItemTemplate>
												<FONT face="Tahoma">
													<P>
														<asp:Label id="Label8" runat="server">
															<%#DataBinder.Eval(Container,"DataItem.DATE")%>
														</asp:Label><BR>
														<asp:Label id="Label9" runat="server">
															<%#DataBinder.Eval(Container,"DataItem.NEWS")%>
														</asp:Label></P>
												</FONT>
											</ItemTemplate>
										</asp:datalist></td>
								</tr>
								<tr>
									<td>
										<P><IMG style="CLEAR: none; DISPLAY: inline" alt="" src="/WApplication/image/new_releases_s2.gif"></P>
									</td>
								</tr>
								<tr>
									<td>
										<MARQUEE style="WIDTH: 187px; HEIGHT: 82px" scrollDelay="250" direction="up" width="187"
											height="82" DESIGNTIMEDRAGDROP="877">
											<DIV class="wpmd">
												<DIV align="center"><FONT class="ws9" color="#666699">สถาบันA</FONT></DIV>
												<DIV align="center"><FONT class="ws9" color="#666699"><FONT class="ws9" color="#666699">มหาวิทยาลัยB</FONT></DIV>
												<DIV align="center">
													<DIV align="center"><FONT class="ws9" color="#666699"><FONT class="ws9" color="#666699">มหาวิทยาลัยC</FONT></FONT></FONT><FONT class="ws9" color="#666699"><BR>
														</FONT>
													</DIV>
												</DIV>
												<DIV><FONT class="ws9" color="#666699"><B><BR>
														</B></FONT>
												</DIV>
											</DIV>
										</MARQUEE>
									</td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td>
										<P>&nbsp;</P>
									</td>
								</tr>
								<TR>
									<TD align="left"></TD>
								</TR>
							</TABLE>
						</TD>
						<td style="HEIGHT: 251px" width="75%">
							<TABLE id="Table2" style="WIDTH: 496px; HEIGHT: 100%" cellSpacing="0" cellPadding="0" width="496"
								align="center" border="0">
								<tr>
									<td style="HEIGHT: 21px"></td>
									<td style="HEIGHT: 21px">
										<P style="FONT-SIZE: 16pt; COLOR: #3366ff" align="center"><BR>
											ค้นหาจากคำ
										</P>
									</td>
									<td style="HEIGHT: 21px"></td>
								</tr>
								<TR>
									<TD style="WIDTH: 137px; HEIGHT: 26px" align="right"><asp:label id="Label1" runat="server" Height="16px" Font-Size="16px" Width="72px" Font-Bold="True"> ค้นหาจาก</asp:label></TD>
									<TD style="WIDTH: 264px; HEIGHT: 26px" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<asp:radiobutton id="Rdb1" runat="server" Font-Size="12pt" Font-Bold="True" Text="หัวข้อ" Checked="True"
											GroupName="1"></asp:radiobutton>&nbsp;&nbsp;
										<asp:radiobutton id="Rdb2" runat="server" Font-Size="12pt" Font-Bold="True" Text="คำสำคัญ" GroupName="1"></asp:radiobutton></TD>
									<TD style="WIDTH: 144px; HEIGHT: 26px"></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 137px; HEIGHT: 26px" align="center"></TD>
									<TD style="WIDTH: 264px; HEIGHT: 26px" align="right"><asp:textbox id="tb_title" runat="server" Width="254px"></asp:textbox></TD>
									<TD style="HEIGHT: 26px">&nbsp;<asp:button id="Button1" runat="server" Width="64px" Text="ค้นหา"></asp:button></TD>
								</TR>
								<tr>
									<TD style="WIDTH: 137px; HEIGHT: 22px"></TD>
									<TD style="WIDTH: 264px; HEIGHT: 22px">&nbsp;<asp:label id="Label2" runat="server" Font-Size="10pt">หาแบบ:</asp:label>&nbsp;
										<asp:RadioButton id="Rdb3" runat="server" Font-Size="12pt" Text="ทุกคำ" Checked="True" GroupName="2"></asp:RadioButton>&nbsp;&nbsp;
										<asp:RadioButton id="Rdb4" runat="server" Font-Size="12pt" Text="บางคำ" GroupName="2"></asp:RadioButton>
									</TD>
									<TD style="HEIGHT: 22px"></TD>
								</tr>
								<TR>
									<TD style="WIDTH: 137px; HEIGHT: 33px">
										<P align="right"><asp:label id="Label3" runat="server" Font-Size="16px" Width="112px">สถาบันการศึกษา</asp:label></P>
									</TD>
									<TD style="WIDTH: 264px; HEIGHT: 33px">
										<P align="right"><asp:dropdownlist id="ddl_uname" runat="server" Font-Size="10pt" Width="254px" AutoPostBack="True">
												<asp:ListItem Value="none_set" Selected="True">ไม่ระบุ</asp:ListItem>
											</asp:dropdownlist></P>
									</TD>
									<TD style="HEIGHT: 33px"></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 137px; HEIGHT: 40px" align="right"><asp:label id="Label4" runat="server" Font-Size="16px" Visible="False">คณะ</asp:label></TD>
									<TD style="WIDTH: 264px; HEIGHT: 40px" align="right"><asp:dropdownlist id="ddl_fac" runat="server" Font-Size="10pt" Width="254px" AutoPostBack="True" Visible="False">
											<asp:ListItem Value="none_set" Selected="True">ไม่ระบุ</asp:ListItem>
										</asp:dropdownlist></TD>
									<TD style="HEIGHT: 40px"></TD>
								</TR>
								<tr>
									<td style="WIDTH: 137px; HEIGHT: 43px" align="right"><asp:label id="Label5" runat="server" Font-Size="16px" Visible="False">ภาควิชา</asp:label></td>
									<td style="WIDTH: 264px; HEIGHT: 43px">
										<P align="right"><asp:dropdownlist id="ddl_dept" runat="server" Font-Size="10pt" Width="254px" AutoPostBack="True"
												Visible="False">
												<asp:ListItem Value="none_set" Selected="True">ไม่ระบุ</asp:ListItem>
											</asp:dropdownlist></P>
									</td>
									<td style="HEIGHT: 43px"></td>
								</tr>
								<tr>
									<td style="WIDTH: 137px; HEIGHT: 17px" align="right"><asp:label id="Label6" runat="server" Font-Size="16px" Visible="False">ปีการศึกษา</asp:label></td>
									<td style="WIDTH: 264px">&nbsp;<asp:dropdownlist id="ddl_year" runat="server" Width="88px" Visible="False">
											<asp:ListItem Value="none_set" Selected="True">ไม่ระบุ</asp:ListItem>
										</asp:dropdownlist></td>
									<td></td>
								</tr>
							</TABLE>
						</td>
					</TR>
					<tr>
						<td colSpan="2">
							<P><IMG alt="" src="/WApplication/image/bot1.gif"><IMG height="47" src="/WApplication/image/bot2.gif" width="28"><IMG height="47" src="/WApplication/image/botmenu_bg.gif" width="539"></P>
						</td>
					</tr>
					<tr bgColor="#94a8b4">
						<td colSpan="5" height="15">
							<div align="left">&nbsp;</div>
						</td>
					</tr>
				</table>
				<P>&nbsp;</P>
			</DIV>
			<P>&nbsp;</P>
			<P>&nbsp;</P>
			<P>&nbsp;</P>
			<P>&nbsp;</P>
		</FORM>
	</body>
</HTML>
