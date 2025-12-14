<%@ Page language="c#" Codebehind="WebForm2.aspx.cs" AutoEventWireup="false" Inherits="WApplication.WebForm2" %>
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
												<DIV id="Div1" style="OVERFLOW: hidden; WIDTH: 474px; HEIGHT: 20px">
													<DIV class="wpmd">
														<DIV><FONT face="Tahoma"><B><A class="style1" href="index.aspx">หน้าหลัก</A></B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<A class="style1" href="WebForm1.aspx">ค้นหาจากคำ</A>&nbsp;&nbsp;&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;<A class="style1" href="WebForm2.aspx">ค้นหาจากชื่อ</A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B class="style1"><FONT color="#800080"></FONT><FONT face="Tahoma" color="#333333"><B class="style1"><FONT color="#800080"><A class="style1" href="WebQuset.aspx"><FONT color="purple">ถาม-ตอบ</FONT></A></FONT></B></FONT>
																</B></FONT>
														</DIV>
													</DIV>
												</DIV>
											</B></font>
									</div>
								</div>
							</div>
							<P><IMG height="47" alt="" src="/WApplication/image/users_feedback_s.gif"><IMG height="47" alt="" src="/WApplication/image/topmenu_img1.gif"><IMG height="47" alt="" src="/WApplication/image/products_b.gif" width="537"></P>
						</TD>
					</TR>
					<TR>
						<TD style="HEIGHT: 98px" width="204">
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="187" align="center" border="0">
								<TR>
									<TD align="left"><asp:datalist id="DataList_News" runat="server" Height="128px" Font-Size="12px" Width="144px"
											ShowFooter="False" HorizontalAlign="Left">
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
										</asp:datalist></TD>
								</TR>
								<TR>
									<TD align="left"><IMG style="CLEAR: none; DISPLAY: inline" alt="" src="/WApplication/image/new_releases_s2.gif"></TD>
								</TR>
								<TR>
									<TD align="left">
										<marquee style="WIDTH: 187px; HEIGHT: 82px" scrollDelay="250" direction="up" width="187"
											height="82">
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
										</marquee>
									</TD>
								</TR>
							</TABLE>
						</TD>
						<td style="HEIGHT: 98px" width="75%">
							<TABLE id="Table2" style="WIDTH: 496px; HEIGHT: 100%" cellSpacing="0" cellPadding="0" width="496"
								align="center" border="0">
								<TR>
									<TD style="HEIGHT: 29px" colSpan="3"></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 144px; HEIGHT: 26px" align="center"><asp:label id="Label1" runat="server" Height="16px" Font-Size="16px" Width="128px" Font-Bold="True"> ค้นหาจากชื่อ(NAME)</asp:label></TD>
									<TD style="WIDTH: 210px; HEIGHT: 26px"><asp:textbox id="tb_title" runat="server" Width="256px"></asp:textbox></TD>
									<TD style="HEIGHT: 26px"><asp:button id="btn_search" runat="server" Width="70px" Text="ค้นหา"></asp:button></TD>
								</TR>
								<tr>
									<TD style="WIDTH: 144px; HEIGHT: 22px"></TD>
									<TD style="HEIGHT: 22px">&nbsp;
										<asp:radiobutton id="Rdb1" runat="server" Font-Size="12pt" Font-Bold="True" Text="AUTHOR" GroupName="1"
											Checked="True"></asp:radiobutton>&nbsp;&nbsp;&nbsp;&nbsp;
										<asp:radiobutton id="Rdb2" runat="server" Font-Size="12pt" Font-Bold="True" Text="PROFERSSOR" GroupName="1"></asp:radiobutton></TD>
									<TD style="HEIGHT: 22px"></TD>
								</tr>
								<TR>
									<TD style="WIDTH: 144px; HEIGHT: 33px">
										<P><asp:label id="Label3" runat="server" Font-Size="16px">สถาบันการศึกษา</asp:label></P>
									</TD>
									<TD style="WIDTH: 210px; HEIGHT: 33px">
										<P><asp:dropdownlist id="ddl_uname" runat="server" Font-Size="10pt" Width="256px">
												<asp:ListItem Value="none_set" Selected="True">ไม่ระบุ</asp:ListItem>
											</asp:dropdownlist></P>
									</TD>
									<TD style="HEIGHT: 33px"></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 144px; HEIGHT: 38px"></TD>
									<TD style="WIDTH: 210px; HEIGHT: 38px" align="center">
										<asp:Label id="Label2" runat="server" Width="272px" Font-Size="Smaller" Visible="False" ForeColor="Red">!!โปรดระบุชื่อที่ต้องการค้นหา</asp:Label></TD>
									<TD style="HEIGHT: 38px"></TD>
								</TR>
								<tr>
									<td style="WIDTH: 144px; HEIGHT: 1px"></td>
									<td style="HEIGHT: 1px">
										<P>&nbsp;</P>
									</td>
									<td style="HEIGHT: 1px"></td>
								</tr>
								<tr>
									<td style="WIDTH: 144px; HEIGHT: 17px"></td>
									<td></td>
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
