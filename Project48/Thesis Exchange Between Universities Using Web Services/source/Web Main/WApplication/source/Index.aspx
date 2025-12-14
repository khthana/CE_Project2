<%@ Page language="c#" Codebehind="index.aspx.cs" AutoEventWireup="false" Inherits="WApplication.index" %>
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
			<DIV id="container" style="WIDTH: 757px; HEIGHT: 558px">
				<!--------------------------------------------------------------------------------->
				<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="1">
					<TR>
						<TD colSpan="2"><IMG alt="left" src="/WApplication/image/main_left.jpg" DESIGNTIMEDRAGDROP="7557"><IMG height="141" alt="left" src="/WApplication/image/b001main_right.jpg" width="346"></TD>
					</TR>
					<TR height="47">
						<TD colSpan="2">
							<div id="text9" style="Z-INDEX: 104; LEFT: 560px; WIDTH: 192px; POSITION: absolute; TOP: 104px; HEIGHT: 40px">
								<div class="wpmd">
									<div align="right"><font class="ws11" face="Tahoma" color="#ffffff"><B><I>The Unity of Thesis 
													in Thailand Universities</I></B></font></div>
									<div><font class="ws11" face="Tahoma" color="#000000"><B><I><BR>
												</I></B></font>
									</div>
								</div>
							</div>
							<div id="text6" style="Z-INDEX: 103; LEFT: 8px; OVERFLOW: hidden; WIDTH: 152px; POSITION: absolute; TOP: 160px; HEIGHT: 18px">
								<div class="wpmd">
									<div>
										<div align="center"><font class="ws9" color="#666699"><STRONG>มีอะไรใหม่ ?</STRONG><BR>
											</font>
										</div>
									</div>
									<div><font class="ws9" color="#666699"><BR>
										</font>
									</div>
								</div>
							</div>
							<DIV id="text8" style="Z-INDEX: 300; LEFT: 280px; OVERFLOW: hidden; WIDTH: 474px; POSITION: absolute; TOP: 160px; HEIGHT: 20px">
								<div class="wpmd">
									<div><font face="Tahoma"><B>
												<DIV id="Div1" style="OVERFLOW: hidden; WIDTH: 474px; HEIGHT: 20px">
													<DIV class="wpmd">
														<DIV><FONT face="Tahoma"><B><A class="style1" href="index.aspx">หน้าหลัก</A></B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<A class="style1" href="WebForm1.aspx">ค้นหาจากคำ</A>&nbsp;&nbsp;&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;<A class="style1" href="WebForm2.aspx">ค้นหาจากชื่อ</A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B class="style1"><FONT color="#800080">
																		<A class="style1" href="WebQuset.aspx"><FONT color="purple">ถาม-ตอบ</FONT></A></FONT><FONT color="#333333">
																	</FONT></B></FONT>
														</DIV>
													</DIV>
												</DIV>
											</B></font>
									</div>
								</div>
							</DIV>
							<IMG alt="" src="/WApplication/image/users_feedback_s.gif"><IMG alt="" src="/WApplication/image/topmenu_img1.gif"><IMG height="47" alt="" src="/WApplication/image/products_b.gif" width="537">
						</TD>
					</TR>
					<TR>
						<TD style="HEIGHT: 251px" width="204">
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="187" align="center" border="0">
								<TR>
									<TD align="left"><asp:datalist id="DataList_News" runat="server" HorizontalAlign="Left" ShowFooter="False" Width="144px"
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
												<DIV align="center"><FONT class="ws9" color="#666699">มหาวิทยาลัยB</FONT></DIV>
												<DIV align="center"><FONT class="ws9" color="#666699"><FONT class="ws9" color="#666699">มหาวิทยาลัยC</FONT></FONT></DIV>
												<DIV><FONT class="ws9" color="#666699"><BR>
													</FONT>
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
						</TD>
						<td style="HEIGHT: 219px" width="75%">
							<P align="justify">
								<TABLE id="Table1" style="WIDTH: 411px; HEIGHT: 163px" cellSpacing="1" cellPadding="1"
									width="411" align="center" border="0">
									<tr>
										<td></td>
									</tr>
									<TR>
										<TD align="center">
											<P>&nbsp;&nbsp;<A class="style1" href="WebForm1.aspx"><FONT color="#cc0066">ค้นหาจากคำ</FONT></A>&nbsp;&nbsp;<BR>
												<asp:label id="Label1" runat="server" Font-Size="14pt" ForeColor="CadetBlue">เลือกค้นหาจากหัวข้อเรื่อง หรือ ค้นหาจากคำสำคัญ</asp:label></P>
										</TD>
									</TR>
									<TR>
										<TD align="center"><A class="style1" href="WebForm2.aspx"><FONT color="#cc0066">ค้นหาจากชื่อ</FONT></A><BR>
											<asp:label id="Label2" runat="server" Font-Size="14pt" ForeColor="CadetBlue">เลือกค้นหาจากชื่อผู้แต่ง หรือ ชื่ออาจารย์ที่ปรึกษา</asp:label></TD>
									</TR>
									<tr>
										<td></td>
									</tr>
								</TABLE>
							</P>
							<TABLE id="Table2" style="WIDTH: 440px; HEIGHT: 94px" cellSpacing="1" cellPadding="1" width="440"
								align="center" border="0">
								<TR>
									<TD style="FONT-SIZE: 12pt" align="center">เว็บนี้สร้างขึ้นเพื่อเป็นแหล่งรวบรวมปริญญานิพนธ์ 
										วิทยานิพนธ์ 
										และเอกสารความรู้ต่างๆของแต่ละสถาบันการศึกษาระดับอุดมศักษาในประเทศไทยให้สามารถค้นหาได้ในที่เดียว
									</TD>
								</TR>
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
			</DIV>
		</FORM>
	</body>
</HTML>
