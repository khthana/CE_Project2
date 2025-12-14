<%@ Page language="c#" Codebehind="WebForm4.aspx.cs" AutoEventWireup="false" Inherits="WApplication.WebForm4" %>
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
	TD { FONT-SIZE: 16px }
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
			<DIV id="container" style="WIDTH: 757px; HEIGHT: 558px"><!--------------------------------------------------------------------------------->
				<TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" border="1">
					<TBODY>
						<TR>
							<TD colSpan="2"><IMG alt="left" src="/WApplication/image/main_left.jpg" DESIGNTIMEDRAGDROP="7557"><IMG height="141" alt="left" src="/WApplication/image/b001main_right.jpg" width="346"></TD>
						</TR>
						<TR height="47">
							<TD colSpan="2">
								<DIV id="text9" style="Z-INDEX: 104; LEFT: 560px; WIDTH: 192px; POSITION: absolute; TOP: 104px; HEIGHT: 40px">
									<DIV class="wpmd">
										<DIV align="right"><FONT class="ws11" face="Tahoma" color="#ffffff"><B><I>The Unity of Thesis 
														in Thailand Universities</I></B></FONT></DIV>
										<DIV><FONT class="ws11" face="Tahoma" color="#000000"><B><I><BR>
													</I></B></FONT>
										</DIV>
									</DIV>
								</DIV>
								<DIV id="text6" style="Z-INDEX: 103; LEFT: 11px; OVERFLOW: hidden; WIDTH: 152px; POSITION: absolute; TOP: 160px; HEIGHT: 18px">
									<DIV class="wpmd">
										<DIV>
											<DIV align="center"><FONT class="ws9" color="#666699"><B>What's NEW?</B></FONT><FONT class="ws9" color="#666699"><BR>
												</FONT>
											</DIV>
										</DIV>
										<DIV><FONT class="ws9" color="#666699"><BR>
											</FONT>
										</DIV>
									</DIV>
								</DIV>
								<DIV id="text8" style="Z-INDEX: 105; LEFT: 280px; OVERFLOW: hidden; WIDTH: 474px; POSITION: absolute; TOP: 160px; HEIGHT: 20px">
									<DIV class="wpmd">
										<DIV><FONT face="Tahoma"><B>
													<DIV id="Div1" style="OVERFLOW: hidden; WIDTH: 474px; HEIGHT: 20px">
														<DIV class="wpmd">
															<DIV><FONT face="Tahoma"><B>
																		<DIV id="Div2" style="OVERFLOW: hidden; WIDTH: 474px; HEIGHT: 20px">
																			<DIV class="wpmd">
																				<DIV><FONT face="Tahoma"><B><A class="style1" href="index.aspx">หน้าหลัก</A></B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
																							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<A class="style1" href="WebForm1.aspx">ค้นหาจากคำ</A>&nbsp;&nbsp;&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																						</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;<A class="style1" href="WebForm2.aspx">ค้นหาจากชื่อ</A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B>&nbsp;&nbsp;</B></FONT><FONT face="Tahoma" color="#333333"><B class="style1"><FONT color="#800080"><FONT color="purple"><FONT face="Tahoma" color="#333333"><B class="style1"><FONT color="#800080"><A class="style1" href="WebQuset.aspx"><FONT color="purple">ถาม-ตอบ</FONT></A></FONT></B></FONT></FONT></FONT>
																						</B></FONT>
																				</DIV>
																			</DIV>
																		</DIV>
																	</B></FONT>
															</DIV>
														</DIV>
													</DIV>
												</B></FONT>
										</DIV>
									</DIV>
								</DIV>
								<P><IMG height="47" alt="" src="/WApplication/image/users_feedback_s.gif"><IMG height="47" alt="" src="/WApplication/image/topmenu_img1.gif"><IMG height="47" alt="" src="/WApplication/image/products_b.gif" width="537"></P>
							</TD>
						</TR>
						<TR>
							<TD style="HEIGHT: 251px" width="204">
								<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="187" align="center" border="0">
									<TBODY>
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
														<DIV align="center">
															<DIV align="center"><FONT class="ws9" color="#666699"></FONT></DIV>
															<FONT class="ws9" color="#666699">
																<DIV align="center"><FONT class="ws9" color="#666699">มหาวิทยาลัยB</FONT></DIV>
																<DIV align="center"><FONT class="ws9" color="#666699"><FONT class="ws9" color="#666699">มหาวิทยาลัยC</FONT></FONT><BR>
															</FONT>
														</DIV>
													</DIV>
													<DIV><FONT class="ws9" color="#666699"><B><BR>
															</B></FONT>
													</DIV>
			</DIV>
			</MARQUEE></TD></TR>
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
			</TBODY></TABLE></TD>
			<TD width="75%">
				<P>
					<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
						<TR>
							<TD style="HEIGHT: 81px" width="5"></TD>
							<TD style="HEIGHT: 81px">
								<P align="center"><asp:label id="Label1" runat="server" Font-Size="16pt" ForeColor="Blue">Label</asp:label>&nbsp;<BR>
									<asp:Label id="Label2" runat="server" Font-Size="14pt" ForeColor="Teal" Visible="False">Label</asp:Label>&nbsp;
									<asp:Label id="Label3" runat="server" Font-Size="14pt" ForeColor="Teal" Visible="False">Label</asp:Label><BR>
									&nbsp;
									<asp:Label id="Label4" runat="server" Font-Size="14pt" ForeColor="Teal" Visible="False">Label</asp:Label></P>
							</TD>
							<TD style="HEIGHT: 81px" width="5"></TD>
						</TR>
						<TR>
							<TD colSpan="3">
								<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="100%" border="1">
									<TR>
										<TD align="center"><asp:datagrid id="DataGrid1" runat="server" ShowFooter="True" Width="504px" Font-Size="Smaller"
												AllowPaging="True" CellPadding="0">
												<PagerStyle PageButtonCount="7" Mode="NumericPages"></PagerStyle>
											</asp:datagrid></TD>
									</TR>
								</TABLE>
							</TD>
						</TR>
					</TABLE>
				</P>
				<P>&nbsp;</P>
			</TD>
			</TR>
			<TR>
				<TD colSpan="2">
					<P><IMG alt="" src="/WApplication/image/bot1.gif"><IMG height="47" src="/WApplication/image/bot2.gif" width="28"><IMG height="47" src="/WApplication/image/botmenu_bg.gif" width="539"></P>
				</TD>
			</TR>
			<TR bgColor="#94a8b4">
				<TD colSpan="5" height="15">
					<DIV align="left">&nbsp;</DIV>
				</TD>
			</TR>
			</TBODY></TABLE></DIV>
		</FORM>
	</body>
</HTML>
