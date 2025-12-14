<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebForm1.aspx.vb" Inherits="WebForm.WebForm1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>in</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<SCRIPT language="JavaScript">
function popup(urlName) {
ttux=window.open(urlName, 'a', 'scrollbars=no, width=400, height=400, toolbar=no')
ttux.focus()
}

function popup1(urlName) {
t1=window.open(urlName, 'b', 'scrollbars=1, width=620, height=500, toolbar=no, left=0, top=0, status=1')
t1.focus()
}

function popup2(urlName) {
t2=window.open(urlName, 'c', 'scrollbars=1, width=700, height=500, toolbar=no, left=0, top=0, status=1, resizable=1')
t2.focus()
}
		</SCRIPT>
		<STYLE>P {
	FONT-SIZE: 10pt; COLOR: #350846; FONT-FAMILY: tahoma
}
TD {
	FONT-SIZE: 10pt; COLOR: #350846; FONT-FAMILY: tahoma
}
LI {
	FONT-SIZE: 10pt; COLOR: #350846; FONT-FAMILY: tahoma
}
.ti {
	FONT-WEIGHT: bold; FONT-SIZE: 14pt; COLOR: #4a6236; FONT-FAMILY: tahoma
}
.ti2 {
	FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #4a6236; FONT-FAMILY: tahoma
}
.flink {
	FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR: #4a6236; FONT-FAMILY: tahoma
}
.fhome {
	FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR: white; FONT-FAMILY: tahoma
}
.counter {
	FONT-SIZE: 11px; COLOR: red; FONT-FAMILY: tahoma
}
.plink {
	FONT-WEIGHT: normal; FONT-SIZE: 13px; COLOR: midnightblue; FONT-FAMILY: tahoma; TEXT-DECORATION: none
}
A {
	FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR: #2817a9; FONT-FAMILY: tahoma; TEXT-DECORATION: none
}
A:hover {
	FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR: red; FONT-FAMILY: tahoma; TEXT-DECORATION: underline
}
A:active {
	COLOR: #ffff00; TEXT-DECORATION: none
}
		</STYLE>
	</HEAD>
	<body bgColor="#f2b189" leftMargin="0" topMargin="0" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
				<TBODY>
					<TR>
						<TD title="logout" vAlign="bottom" align="right" height="30"><asp:label id="Label1" style="Z-INDEX: 102; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server" Width="79px"></asp:label>
							<TABLE cellSpacing="0" cellPadding="2" border="0">
								<TBODY>
									<TR>
										<TD><IMG src="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18point.jpg" align="absMiddle">
											<A href="addmem1.aspx">สมัครสมาชิกใหม</A>่</TD>
										<TD vAlign="center"><IMG src="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18point.jpg" align="absMiddle">
											<A href="login.aspx">Login</A></TD>
										<TD id="TD1" style="WIDTH: 32px" vAlign="center"><IMG id="IMG1" style="WIDTH: 15px; HEIGHT: 14px" height="14" src="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18point.jpg" width="15" align="absMiddle"><A href="Logout.aspx">Logout</A></TD>
										<TD style="WIDTH: 100px" vAlign="center"><IMG src="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18point.jpg" align="absMiddle"><A href="view.aspx">สินค้าในตะกร้า</A></TD>
										<TD style="WIDTH: 168px" vAlign="center"><IMG src="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18point.jpg" align="absMiddle">&nbsp;
											<A href="ComBook.aspx">ค้นหาหนังสือคอมพิวเตอร์</A>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" background="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18bg.gif" border="0">
				<TBODY>
					<TR>
						<TD><IMG src="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18bar1.jpg"></TD>
					</TR>
				</TBODY>
			</TABLE>
			<TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
				<TBODY>
					<TR bgColor="#f2b189">
						<TD><IMG src="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18left1.jpg"></TD>
						<TD vAlign="center" align="right" width="100%" bgColor="#f2b189">
							<div align="center"><font color="#ffff00">
									<marquee></marquee>
								</font><font color="#ffff00" size="+3"><var>
										<marquee>บริการตำบลไทย</marquee>
									</var></font>
							</div>
						</TD>
					<TR bgColor="#f2b189">
						<TD vAlign="top" background="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18leftbg.jpg"><IMG src="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18left2.jpg"></TD>
						<TD vAlign="top" background="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18bg.jpg">
							<TABLE cellSpacing="0" cellPadding="2" width="420" align="center" border="0">
								<TBODY>
									<TR>
										<FORM action="WebFormSearch.aspx" method="post">
											<TD style="WIDTH: 410px" vAlign="bottom" align="middle" width="410">
												<H4>ค้นหาสินค้า <INPUT id="txtSearchNames" name="txt_mail" runat="server"> <INPUT id="Submit1" type="submit" value="ตกลง" name="Submit" runat="server">
												</H4>
											</TD>
											<TD vAlign="bottom" align="left" width="56">&nbsp;
												<H4>&nbsp;</H4>
											</TD>
											<TD vAlign="bottom" align="left" width="56"></TD>
										</FORM>
									</TR>
								</TBODY>
							</TABLE>
							<TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
								<TBODY>
									<TR>
										<TD vAlign="top"><BR>
											<BR>
											<IMG src="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18pic01.jpg"></TD>
										<TD vAlign="top"><BR>
											<BR>
											<IMG src="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18ti_pro.gif">
											<TABLE cellSpacing="0" cellPadding="3" width="100%" align="center" border="0">
												<TBODY>
													<TR>
														<TD width="10" rowSpan="20"></TD>
													<TR>
														<TD><IMG src="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18butpro.gif" align="absMiddle">
															<A href="in_wood.aspx"><font color="#452a29">ผลิตภัณจากไม้</font></A></TD>
													<TR>
														<TD><IMG src="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18butpro.gif" align="absMiddle">
															<A href="in_candle.aspx"><font color="#452a29">เทียนหอม</font></A></TD>
													<TR>
														<TD><IMG src="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18butpro.gif" align="absMiddle">
															<A href="http://www.amberthai.com/a18procate.php?cate_id=5&amp;folder_namefile=product">
																<font color="#452a29">โอ่ง</font></A></TD>
													<TR>
														<TD><IMG src="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18butpro.gif" align="absMiddle">
															<A href="http://www.amberthai.com/a18procate.php?cate_id=4&amp;folder_namefile=product">
																<font color="#452a29">เครื่องจักรสาร</font></A></TD>
													<TR>
														<TD><IMG src="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18butpro.gif" align="absMiddle">
															<A href="http://www.amberthai.com/a18procate.php?cate_id=3&amp;folder_namefile=product">
																<FONT color="#452a29">ผลิตภัณฑ์จากแก้ว</FONT></A></TD>
													<TR>
														<TD><IMG src="Wood-Turned  The art that represents the relationship between nature and the human soul_files/a18butpro.gif" align="absMiddle">
															<A href="http://www.amberthai.com/a18procate.php?cate_id=1&amp;folder_namefile=product">
																<FONT color="#452a29">ผ้าไหม</FONT></A></TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
							<BR>
							<HR width="98%" color="#e0e0e0" SIZE="1">
							<TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
								<TBODY>
									<TR>
										<TD align="middle">
											<p><FONT class="f1"><FONT color="#8e8e8e">copyright ? Nik &amp; Off Co.,Ltd. ,
														<BR>
														56/71, M.5, Ramkhamhang Rd., Kwang Sapansoong, Khet Sapansoong, Bangkok 10240,<BR>
														Thailand Tel. : 02-3212082 Mobile: 01-5783443<font color="#452a29"> </font></FONT>
												</FONT><FONT class="f1"><FONT color="#8e8e8e"><A href="mailto:kamolwan@amberthai.com"><FONT style="FONT-WEIGHT: normal" color="#452a29">
																email : off_42010139@hotmaili.com</FONT></A> </FONT></FONT>
											</p>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<asp:textbox id="txthiden" style="Z-INDEX: 101; LEFT: 240px; POSITION: absolute; TOP: 688px" runat="server" Width="138px" Visible="False" Height="20px">0</asp:textbox>
			<table>
				<td>
				<tr>หวัดดี</tr>
				</TD>
			</table>
		</form>
	</body>
</HTML>
