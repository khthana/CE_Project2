<%@ Page language="c#" Codebehind="winner.aspx.cs" AutoEventWireup="false" Inherits="project.manage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>manage</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="manage" method="post" runat="server">
			<TABLE id="Table3" style="Z-INDEX: 104; LEFT: 161px; WIDTH: 607px; POSITION: absolute; TOP: 182px; HEIGHT: 643px" cellSpacing="1" cellPadding="1" width="607" border="0">
				<TR>
					<TD><FONT face="Tahoma"></FONT>
						<TABLE id="Table2" style="WIDTH: 523px; HEIGHT: 483px" cellSpacing="1" cellPadding="1" width="523" border="0">
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label1" runat="server">ชื้อครุภัณฑ์</asp:label></TD>
								<TD><asp:label id="Label9" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label16" runat="server">เอกสารสอบราคาซื้อเลขที่</asp:label></TD>
								<TD><asp:label id="Label12" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD><FONT face="Tahoma"></FONT></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label60" runat="server">จำนวน</asp:label></TD>
								<TD><asp:label id="Label17" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD><asp:label id="Label61" runat="server">ชุด</asp:label></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label5" runat="server" Width="97px">ประจำปี</asp:label></TD>
								<TD><asp:label id="Label29" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD><FONT face="Tahoma"></FONT></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label10" runat="server" Width="181px">สมัครเข้าประกวดตั้งแต่วันที่</asp:label></TD>
								<TD><asp:label id="Label31" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD><FONT face="Tahoma"></FONT></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label11" runat="server">ถึงวันที่</asp:label></TD>
								<TD><asp:label id="Label33" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label6" runat="server">กำหนดยื่นหลักฐานต่างๆ ในวันที่</asp:label></TD>
								<TD><asp:label id="Label34" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label7" runat="server">ถึงวันที่</asp:label></TD>
								<TD><asp:label id="Label41" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label28" runat="server">กำหนดการนำเสนอ(present)</asp:label></TD>
								<TD><asp:label id="Label45" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><FONT face="Tahoma"><asp:label id="Label30" runat="server">สถานที่</asp:label></FONT></TD>
								<TD><asp:label id="Label46" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD><FONT face="Tahoma"></FONT></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label8" runat="server">กำหนดตัดสินผู้ชนะ</asp:label></TD>
								<TD><asp:label id="Label47" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label32" runat="server">กำหนดการประกาศผลวันที่</asp:label></TD>
								<TD><asp:label id="Label48" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label63" runat="server">รายละเอียดในการนำเสนอ</asp:label></TD>
								<TD><asp:label id="Label49" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label62" runat="server">เกณฑ์ที่ใช้ในการพิจารณา</asp:label></TD>
								<TD><asp:label id="Label57" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label27" runat="server">หลักฐานต่างๆที่ต้องใช้</asp:label></TD>
								<TD><asp:label id="Label59" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label18" runat="server">ผู้เสนอต้องกำหนดส่งมอบพัสดุไม่เกิน</asp:label></TD>
								<TD><asp:label id="Label64" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD><asp:label id="Label19" runat="server" DESIGNTIMEDRAGDROP="148">วันหลังจากลงนามในสัญญา</asp:label></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label20" runat="server">ผู้เสนอราคาจะต้องส่งตัวอย่างของพัสดุที่เสนอ จำนวน</asp:label></TD>
								<TD><asp:label id="Label65" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD><asp:label id="Label21" runat="server">ชุด เพื่อใช้ในการตรวจทดลองหรือประกอบการพิจารณา</asp:label></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label22" runat="server">มอบพัสดุให้ ณ </asp:label></TD>
								<TD><asp:label id="Label66" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD><FONT face="Tahoma"></FONT></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label23" runat="server">ผู้เสนอราคาต้องส่งรายละเอียด(แคตตาลอก)ของครุภัณฑ์รายการจำนวน</asp:label></TD>
								<TD><asp:label id="Label67" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD><asp:label id="Label25" runat="server">ชุด</asp:label></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label26" runat="server">ถ้าแคตตาลอกเป็นสำเนาแล้วคณะกรรมการต้องการดูตัวจริงผู้เสนอราคาต้องนำมาให้คณะกรรมการภายใน</asp:label></TD>
								<TD><asp:label id="Label68" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD><asp:label id="Label24" runat="server">วัน</asp:label></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label35" runat="server">ผู้ชนะการประกวดราคาต้องทำสัญญากับสถาบันภายใน</asp:label></TD>
								<TD><FONT face="Tahoma"><asp:label id="Label69" runat="server" ForeColor="Red">Label</asp:label></FONT></TD>
								<TD><asp:label id="Label36" runat="server">วันนับจากวันที่ได้รับแจ้ง</asp:label></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label37" runat="server">ต้องวางหลักประกันสัญญาเป็นจำนวนเงินเท่ากับร้อยละ</asp:label></TD>
								<TD><asp:label id="Label70" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD><asp:label id="Label38" runat="server">ของราคาสิ่งของ</asp:label></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label39" runat="server">หลักประกันที่เป็นเช็คสั่งจ่ายให้แก่</asp:label></TD>
								<TD><asp:label id="Label71" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label40" runat="server">หลักประกันนี้จะคืนให้โดยไม่มีดอกเบี้ยภายใน</asp:label></TD>
								<TD><asp:label id="Label72" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD><asp:label id="Label42" runat="server">วัน นับจากวันที่ผู้ขายพ้นจากข้อผู้พันตามสัญญาซื้อขาย</asp:label></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label43" runat="server">เมื่อครบกำหนดส่งมอบแล้วผู้ขายไม่มอบสิ่งที่ตกลงขายให้แก่ผู้ซื้อผู้ขายต้องชำระค่าปรับให้ผู้ซื้อเป็นรายวันในอัตราร้อยละ</asp:label></TD>
								<TD><asp:label id="Label73" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD><asp:label id="Label44" runat="server">ของราคาสิ่งของที่ค้างอยู่</asp:label></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label50" runat="server">ผู้ขายจะต้องรับประกันความบกพร่องของสิ่งของภายในระยะเวลา</asp:label></TD>
								<TD><asp:label id="Label74" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD><asp:label id="Label52" runat="server">เดือน</asp:label></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label51" runat="server">โดยต้องซ่อมให้ดีดังเดิมภายใน</asp:label></TD>
								<TD><asp:label id="Label75" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD><asp:label id="Label53" runat="server">วันนับจากวันที่ได้รับแจ้ง</asp:label></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label54" runat="server">ผู้เสนอมีสิทธิรับเงินล่วงหน้าได้ไม่เกินร้อยละ</asp:label></TD>
								<TD><FONT face="Tahoma"><asp:label id="Label76" runat="server" ForeColor="Red">Label</asp:label></FONT></TD>
								<TD><asp:label id="Label55" runat="server">ของราคาสิ่งของที่เสนอขาย (แต่ต้องมอบหลักฐานค่ำประกันไว้)</asp:label></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label56" runat="server">เงินค่าพัสดุครั้งนี้ได้รับมาจาก</asp:label></TD>
								<TD><asp:label id="Label77" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label58" runat="server">การลงนามในสัญญาจะกระทำได้ต่อเมื่อ ได้รับอนุมัติค่าพัสดุจาก</asp:label></TD>
								<TD><asp:label id="Label78" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label13" runat="server">ประกาศวันที่</asp:label></TD>
								<TD><asp:label id="Label79" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label14" runat="server">ลงชื่อ นาย</asp:label></TD>
								<TD><FONT face="Tahoma"><asp:label id="Label80" runat="server" ForeColor="Red">Label</asp:label></FONT></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"><asp:label id="Label15" runat="server">ตำแหน่ง</asp:label></TD>
								<TD><asp:label id="Label81" runat="server" ForeColor="Red">Label</asp:label></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 242px"></TD>
								<TD></TD>
								<TD></TD>
							</TR>
						</TABLE>
						<P>&nbsp;</P>
						<P><FONT face="Tahoma"></FONT>&nbsp;</P>
						<P><FONT face="Tahoma"></FONT>&nbsp;</P>
						<FONT face="Tahoma"></FONT><FONT face="Tahoma"></FONT><FONT face="Tahoma"></FONT>
						<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="300" border="0">
							<TR>
								<TD><asp:label id="Label84" runat="server" ForeColor="Red">ข้อความที่เป็นความลับของราชการ</asp:label></TD>
								<TD><FONT face="Tahoma"></FONT></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD><asp:label id="Label4" runat="server">วัตถุประสงค์</asp:label></TD>
								<TD><FONT face="Tahoma"><asp:label id="Label85" runat="server">Label</asp:label></FONT></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD><asp:label id="Label2" runat="server">กลุ่มเป้าหมาย</asp:label></TD>
								<TD><FONT face="Tahoma"><asp:label id="Label86" runat="server">Label</asp:label></FONT></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD><asp:label id="Label3" runat="server">งบประมาณ(ตัวเลข)</asp:label></TD>
								<TD><asp:label id="Label87" runat="server">Label</asp:label></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD><asp:label id="Label82" runat="server">ลักษณะกิจกรรม</asp:label></TD>
								<TD><FONT face="Tahoma"><asp:label id="Label88" runat="server">Label</asp:label></FONT></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD><asp:label id="Label83" runat="server">หมายเหตุ</asp:label></TD>
								<TD><asp:label id="Label89" runat="server">Label</asp:label></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD></TD>
								<TD></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD></TD>
								<TD></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD><asp:button id="Button1" runat="server" Text="ยกเลิกการประกวด"></asp:button></TD>
								<TD></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD></TD>
								<TD></TD>
								<TD><FONT face="Tahoma"></FONT></TD>
							</TR>
							<TR>
								<TD></TD>
								<TD></TD>
								<TD></TD>
							</TR>
						</TABLE>
						<P><FONT face="Tahoma">
								<asp:Label id="Label90" runat="server" ForeColor="Blue" Visible="False">ยังไม่สามารถดูผู้ประกอบการที่เสนอได้เนื่องจากยังไม่หมดเวลาการประกวด</asp:Label></FONT></P>
						<P><asp:datagrid id="dgshow" runat="server" AutoGenerateColumns="False" Visible="False">
								<Columns>
									<asp:BoundColumn DataField="companyname" HeaderText="บริษัทผู้เข้าประกวดทั้งหมด"></asp:BoundColumn>
									<asp:BoundColumn DataField="passspecs" HeaderText="บริษัทผ่าน spect ทั้งหมด"></asp:BoundColumn>
									<asp:BoundColumn DataField="totalspecs" HeaderText="จาก spect ทั้งหมด"></asp:BoundColumn>
									<asp:BoundColumn DataField="totalprice" HeaderText="ราคาที่เสนอ"></asp:BoundColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											ผ่าน สเปคการประกวด
										</HeaderTemplate>
										<ItemTemplate>
											yes
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											เปรียบเทียบ spect
										</HeaderTemplate>
										<ItemTemplate>
											<a href='bid_product.aspx?idcompany=<%# DataBinder.Eval(Container.DataItem,"IDCompany") %>'>
												link</a>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											ดูรายละเอียดบริษัทเอกชน
										</HeaderTemplate>
										<ItemTemplate>
											<A href='detail_person.aspx?idcompany=<%# DataBinder.Eval(Container.DataItem,"IDCompany") %>' >
												link</A>
										</ItemTemplate>
									</asp:TemplateColumn>
								</Columns>
							</asp:datagrid></P>
						<P><FONT face="Tahoma"></FONT></P>
						<P><FONT face="Tahoma">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<asp:DataGrid id="dgCancle" runat="server" AutoGenerateColumns="False" Visible="False">
									<Columns>
										<asp:BoundColumn DataField="Name" HeaderText="บริษัทผู้เข้าประกวดทั้งหมด"></asp:BoundColumn>
										<asp:TemplateColumn>
											<HeaderTemplate>
												ดูรายละเอียดบริษัทเอกชน
											</HeaderTemplate>
											<ItemTemplate>
												<A href='detail_person.aspx?idcompany=<%# DataBinder.Eval(Container.DataItem,"IDCompany") %>' >
													link</A>
											</ItemTemplate>
										</asp:TemplateColumn>
									</Columns>
								</asp:DataGrid>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
							<asp:linkbutton id="LinkButton1" runat="server">ไปหน้าหลัก</asp:linkbutton></P>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
