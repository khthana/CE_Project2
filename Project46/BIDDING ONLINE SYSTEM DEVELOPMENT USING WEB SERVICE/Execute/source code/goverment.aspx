<%@ Page language="c#" Codebehind="goverment.aspx.cs" AutoEventWireup="false" Inherits="project.WebForm1" Culture="en-US" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>WebForm1</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table3" style="Z-INDEX: 104; LEFT: 20px; WIDTH: 820px; POSITION: absolute; TOP: 106px; HEIGHT: 2856px" cellSpacing="1" cellPadding="1" width="820" border="0">
				<TR>
					<TD style="WIDTH: 189px"><asp:label id="Label2" runat="server" Width="199px">มีความประสงค์สอบราคาซื้อ</asp:label></TD>
					<TD style="WIDTH: 176px"><asp:textbox id="txtProduct" runat="server"></asp:textbox></TD>
					<TD style="WIDTH: 63px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 168px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 164px">
						<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="กรุณาใส่ชื่อการประกวด" ControlToValidate="txtProduct"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><asp:label id="Label16" runat="server">เอกสารสอบราคาซื้อเลขที่</asp:label></TD>
					<TD style="WIDTH: 176px"><asp:textbox id="txtBidID" runat="server"></asp:textbox></TD>
					<TD style="WIDTH: 63px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 168px"></TD>
					<TD style="WIDTH: 164px"></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px; HEIGHT: 33px"><asp:label id="Label1" runat="server">ชื่อผลิตภัณฑ์</asp:label></TD>
					<TD style="WIDTH: 176px; HEIGHT: 33px"><asp:textbox id="TextBox1" runat="server"></asp:textbox></TD>
					<TD style="WIDTH: 63px; HEIGHT: 33px"></TD>
					<TD style="WIDTH: 168px; HEIGHT: 33px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 164px; HEIGHT: 33px">
						<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="กรุณาใส่ชื่อผลิตภัณฑ์" ControlToValidate="TextBox1"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px; HEIGHT: 52px"><FONT face="Tahoma"><asp:label id="Label60" runat="server">จำนวน</asp:label></FONT></TD>
					<TD style="WIDTH: 176px; HEIGHT: 52px"><asp:textbox id="txtnum" runat="server"></asp:textbox></TD>
					<TD style="WIDTH: 63px; HEIGHT: 52px"><FONT face="Tahoma"><asp:label id="Label61" runat="server">ชุด</asp:label></FONT></TD>
					<TD style="WIDTH: 168px; HEIGHT: 52px"><FONT face="Tahoma">
							<P><FONT face="Tahoma">&nbsp;</P>
						</FONT></FONT></TD>
					<TD style="WIDTH: 164px; HEIGHT: 52px">
						<P><FONT face="Tahoma">
								<asp:RangeValidator id="RangeValidator1" runat="server" ErrorMessage="จำนวนเต็มตั้งแต่ 1 ขึ้นไป" Type="Integer" MinimumValue="1" MaximumValue="99999" ControlToValidate="txtnum"></asp:RangeValidator></P>
						<P><FONT face="Tahoma">
								<asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" ErrorMessage="กรุณาใส่จำนวนชุด" ControlToValidate="txtnum"></asp:RequiredFieldValidator></P>
						</FONT></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><asp:label id="Label3" runat="server" Width="97px">ประจำปี</asp:label></TD>
					<TD style="WIDTH: 176px"><asp:dropdownlist id="ddlAtYear" runat="server">
							<asp:ListItem Value="2547">2547</asp:ListItem>
							<asp:ListItem Value="2548">2548</asp:ListItem>
							<asp:ListItem Value="2549">2549</asp:ListItem>
							<asp:ListItem Value="2550">2550</asp:ListItem>
							<asp:ListItem Value="2551">2551</asp:ListItem>
						</asp:dropdownlist></TD>
					<TD style="WIDTH: 63px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 168px"></TD>
					<TD style="WIDTH: 164px"><FONT face="Tahoma"></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px; HEIGHT: 29px"><FONT face="Tahoma"><asp:label id="Label10" runat="server" Width="181px">สมัครเข้าประกวดตั้งแต่วันที่</asp:label></FONT></TD>
					<TD style="WIDTH: 176px; HEIGHT: 29px"><asp:calendar id="Calendar1" runat="server"></asp:calendar></TD>
					<TD style="WIDTH: 63px; HEIGHT: 29px"><asp:label id="Label11" runat="server">ถึงวันที่</asp:label></TD>
					<TD style="WIDTH: 168px; HEIGHT: 29px"><asp:calendar id="Calendar2" runat="server"></asp:calendar></TD>
					<TD style="WIDTH: 164px; HEIGHT: 29px"><FONT face="Tahoma"></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><FONT face="Tahoma"><asp:label id="Label4" runat="server">กำหนดยื่นหลักฐานต่างๆ ในวันที่</asp:label></FONT></TD>
					<TD style="WIDTH: 176px"><asp:calendar id="Calendar3" runat="server" Width="180px" Height="192px"></asp:calendar></TD>
					<TD style="WIDTH: 63px"><asp:label id="Label5" runat="server">ถึงวันที่</asp:label></TD>
					<TD style="WIDTH: 168px"><asp:calendar id="Calendar4" runat="server"></asp:calendar></TD>
					<TD style="WIDTH: 164px"></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><asp:label id="Label28" runat="server">กำหนดการนำเสนอ(present)</asp:label></TD>
					<TD style="WIDTH: 176px"><FONT face="Tahoma"><asp:calendar id="Calendar5" runat="server"></asp:calendar></FONT></TD>
					<TD style="WIDTH: 63px"><FONT face="Tahoma"><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman'; mso-fareast-font-family: 'Times New Roman'; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: TH; mso-bidi-font-size: 14.0pt; mso-bidi-font-family: 'Angsana New'"><asp:label id="Label30" runat="server">สถานที่</asp:label></SPAN></FONT></TD>
					<TD style="WIDTH: 168px"><FONT face="Tahoma"><asp:textbox id="txtPresentPlace" runat="server"></asp:textbox></FONT></TD>
					<TD style="WIDTH: 164px">
						<asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" ErrorMessage="กรุณาใส่สถานที่" ControlToValidate="txtPresentPlace"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><FONT face="Tahoma"><asp:label id="Label8" runat="server">กำหนดตัดสินผู้ชนะ</asp:label></FONT></TD>
					<TD style="WIDTH: 176px"><FONT face="Tahoma"><asp:calendar id="Calendar6" runat="server"></asp:calendar></FONT></TD>
					<TD style="WIDTH: 63px"></TD>
					<TD style="WIDTH: 168px"></TD>
					<TD style="WIDTH: 164px"></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><FONT face="Tahoma"><SPAN lang="TH" style="FONT-SIZE: 14pt; FONT-FAMILY: 'Angsana New'; mso-fareast-font-family: 'Times New Roman'; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: TH; mso-ansi-font-size: 12.0pt; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"><asp:label id="Label32" runat="server">กำหนดการประกาศผลวันที่</asp:label></SPAN></FONT></TD>
					<TD style="WIDTH: 176px"><asp:calendar id="Calendar7" runat="server"></asp:calendar></TD>
					<TD style="WIDTH: 63px"><FONT face="Tahoma"><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman'; mso-fareast-font-family: 'Times New Roman'; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: TH; mso-bidi-font-size: 14.0pt; mso-bidi-font-family: 'Angsana New'"></SPAN></FONT></TD>
					<TD style="WIDTH: 168px"></TD>
					<TD style="WIDTH: 164px"></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman'; mso-fareast-font-family: 'Times New Roman'; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: TH; mso-bidi-font-size: 14.0pt; mso-bidi-font-family: 'Angsana New'"><asp:label id="Label63" runat="server">รายละเอียดในการนำเสนอ</asp:label></SPAN></TD>
					<TD style="WIDTH: 176px"><FONT face="Tahoma">
							<asp:TextBox id="areaDetailPresent" runat="server"></asp:TextBox></FONT></TD>
					<TD style="WIDTH: 63px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 168px"></TD>
					<TD style="WIDTH: 164px"></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><FONT face="Tahoma"><asp:label id="Label62" runat="server">เกณฑ์ที่ใช้ในการพิจารณา</asp:label></FONT></TD>
					<TD style="WIDTH: 176px">
						<asp:TextBox id="areaDetermind" runat="server"></asp:TextBox></TD>
					<TD style="WIDTH: 63px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 168px"></TD>
					<TD style="WIDTH: 164px"></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><FONT face="Tahoma"><asp:label id="Label27" runat="server">หลักฐานต่างๆที่ต้องใช้</asp:label></FONT></TD>
					<TD style="WIDTH: 176px">
						<asp:TextBox id="areaAuthority" runat="server"></asp:TextBox></TD>
					<TD style="WIDTH: 63px"></TD>
					<TD style="WIDTH: 168px"></TD>
					<TD style="WIDTH: 164px"></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><SPAN lang="TH" style="FONT-SIZE: 14pt; FONT-FAMILY: 'Angsana New'; mso-fareast-font-family: 'Times New Roman'; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: TH; mso-ansi-font-size: 12.0pt; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"><asp:label id="Label18" runat="server">ผู้เสนอราคาต้องกำหนดส่งมอบพัสดุไม่เกิน</asp:label></SPAN></TD>
					<TD style="WIDTH: 176px"><FONT face="Tahoma"><asp:textbox id="txtDeliver" runat="server"></asp:textbox></FONT></TD>
					<TD style="WIDTH: 63px"><FONT face="Tahoma"><asp:label id="Label19" runat="server" DESIGNTIMEDRAGDROP="148">วันหลังจากลงนามในสัญญา</asp:label></FONT></TD>
					<TD style="WIDTH: 168px"></TD>
					<TD style="WIDTH: 164px">
						<asp:RequiredFieldValidator id="RequiredFieldValidator19" runat="server" ErrorMessage="กรุณาใส่ตัวเลข" ControlToValidate="txtDeliver"></asp:RequiredFieldValidator>
						<asp:RangeValidator id="RangeValidator12" runat="server" ErrorMessage="จำนวนเต็มตั้งแต่ 1 ขึ้นไป" Type="Integer" MinimumValue="1" MaximumValue="99999" ControlToValidate="txtDeliver"></asp:RangeValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><asp:label id="Label20" runat="server">ผู้เสนอราคาจะต้องส่งตัวอย่างของพัสดุที่เสนอ จำนวน</asp:label></TD>
					<TD style="WIDTH: 176px"><asp:textbox id="txtExample" runat="server"></asp:textbox></TD>
					<TD style="WIDTH: 63px"><FONT face="Tahoma"><asp:label id="Label21" runat="server">ชุด เพื่อใช้ในการตรวจทดลองหรือประกอบการพิจารณา</asp:label></FONT></TD>
					<TD style="WIDTH: 168px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 164px"><FONT face="Tahoma">
							<asp:RequiredFieldValidator id="RequiredFieldValidator18" runat="server" ErrorMessage="กรุณาใส่ตัวเลข" ControlToValidate="txtExample"></asp:RequiredFieldValidator>
							<asp:RangeValidator id="RangeValidator11" runat="server" ErrorMessage="จำนวนเต็มตั้งแต่ 0 ขึ้นไป" Type="Integer" MinimumValue="0" MaximumValue="99999" ControlToValidate="txtExample"></asp:RangeValidator></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><asp:label id="Label22" runat="server">มอบพัสดุให้ ณ </asp:label></TD>
					<TD style="WIDTH: 176px"><FONT face="Tahoma"><asp:textbox id="txtDeliverPlace" runat="server"></asp:textbox></FONT></TD>
					<TD style="WIDTH: 63px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 168px"></TD>
					<TD style="WIDTH: 164px">
						<asp:RequiredFieldValidator id="RequiredFieldValidator17" runat="server" ErrorMessage="กรุณาใส่สถานที่" ControlToValidate="txtDeliverPlace"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px; HEIGHT: 4px"><FONT face="Tahoma"><asp:label id="Label23" runat="server">ผู้เสนอราคาต้องส่งรายละเอียด(แคตตาลอก)ของครุภัณฑ์รายการจำนวน</asp:label></FONT></TD>
					<TD style="WIDTH: 176px; HEIGHT: 4px"><asp:textbox id="txtCatalog" runat="server"></asp:textbox></TD>
					<TD style="WIDTH: 63px; HEIGHT: 4px"><FONT face="Tahoma"><asp:label id="Label25" runat="server">ชุด</asp:label></FONT></TD>
					<TD style="WIDTH: 168px; HEIGHT: 4px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 164px; HEIGHT: 4px">
						<asp:RequiredFieldValidator id="RequiredFieldValidator16" runat="server" ErrorMessage="กรุณาใส่ตัวเลข" ControlToValidate="txtCatalog"></asp:RequiredFieldValidator>
						<asp:RangeValidator id="RangeValidator10" runat="server" ErrorMessage="จำนวนเต็มตั้งแต่ 0 ขึ้นไป" Type="Integer" MinimumValue="0" MaximumValue="9999" ControlToValidate="txtCatalog"></asp:RangeValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"></TD>
					<TD style="WIDTH: 176px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 63px"></TD>
					<TD style="WIDTH: 168px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 164px"><FONT face="Tahoma"></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><FONT face="Tahoma"><SPAN lang="TH" style="FONT-SIZE: 14pt; FONT-FAMILY: 'Angsana New'; mso-fareast-font-family: 'Times New Roman'; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: TH; mso-ansi-font-size: 12.0pt; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"><asp:label id="Label26" runat="server">ถ้าแคตตาลอกเป็นสำเนาแล้วคณะกรรมการต้องการดูตัวจริงผู้เสนอราคาต้องนำมาให้คณะกรรมการภายใน</asp:label></SPAN></FONT></TD>
					<TD style="WIDTH: 176px"><asp:textbox id="txtRealCatalog" runat="server"></asp:textbox></TD>
					<TD style="WIDTH: 63px"><asp:label id="Label24" runat="server">วัน</asp:label></TD>
					<TD style="WIDTH: 168px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 164px">
						<asp:RequiredFieldValidator id="RequiredFieldValidator15" runat="server" ErrorMessage="กรุณาใส่ตัวเลข" ControlToValidate="txtRealCatalog"></asp:RequiredFieldValidator>
						<asp:RangeValidator id="RangeValidator9" runat="server" ErrorMessage="จำนวนเต็มตั้งแต่1 ขึ้นไป" Type="Integer" MinimumValue="1" MaximumValue="99999" ControlToValidate="txtRealCatalog"></asp:RangeValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><SPAN lang="TH" style="FONT-SIZE: 14pt; FONT-FAMILY: 'Angsana New'; mso-fareast-font-family: 'Times New Roman'; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: TH; mso-ansi-font-size: 12.0pt; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"></SPAN></TD>
					<TD style="WIDTH: 176px"></TD>
					<TD style="WIDTH: 63px"></TD>
					<TD style="WIDTH: 168px"></TD>
					<TD style="WIDTH: 164px"><FONT face="Tahoma"></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><asp:label id="Label31" runat="server">การสอบราคาจะพิจารณาตัดสินด้วย</asp:label></TD>
					<TD style="WIDTH: 176px"><asp:dropdownlist id="ddldertermind" runat="server">
							<asp:ListItem Value="ราคารวม">ราคารวม</asp:ListItem>
							<asp:ListItem Value="ราคาต่อหน่วย">ราคาต่อหน่วย</asp:ListItem>
							<asp:ListItem Value="ราคาต่อรายการ">ราคาต่อรายการ</asp:ListItem>
						</asp:dropdownlist></TD>
					<TD style="WIDTH: 63px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 168px"></TD>
					<TD style="WIDTH: 164px"></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"></TD>
					<TD style="WIDTH: 176px"></TD>
					<TD style="WIDTH: 63px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 168px"></TD>
					<TD style="WIDTH: 164px"></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 176px"></TD>
					<TD style="WIDTH: 63px"></TD>
					<TD style="WIDTH: 168px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 164px"></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><asp:label id="Label35" runat="server">ผู้ชนะการประกวดราคาต้องทำสัญญากับสถาบันภายใน</asp:label></TD>
					<TD style="WIDTH: 176px"><FONT face="Tahoma"><asp:textbox id="txtContact" runat="server"></asp:textbox></FONT></TD>
					<TD style="WIDTH: 63px"><asp:label id="Label36" runat="server">วันนับจากวันที่ได้รับแจ้ง</asp:label></TD>
					<TD style="WIDTH: 168px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 164px">
						<asp:RequiredFieldValidator id="RequiredFieldValidator14" runat="server" ErrorMessage="กรุณาใส่ตัวเลข" ControlToValidate="txtContact"></asp:RequiredFieldValidator>
						<asp:RangeValidator id="RangeValidator8" runat="server" ErrorMessage="จำนวนเต็มตั้งแต่ 1 ขึ้นไป" Type="Integer" MinimumValue="1" MaximumValue="99999" ControlToValidate="txtContact"></asp:RangeValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><FONT face="Tahoma"><asp:label id="Label37" runat="server">ต้องวางหลักประกันสัญญาเป็นจำนวนเงินเท่ากับร้อยละ</asp:label></FONT></TD>
					<TD style="WIDTH: 176px"><asp:textbox id="txtGuarantee" runat="server"></asp:textbox></TD>
					<TD style="WIDTH: 63px"><asp:label id="Label38" runat="server">ของราคาสิ่งของ</asp:label></TD>
					<TD style="WIDTH: 168px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 164px">
						<P><FONT face="Tahoma"></FONT>&nbsp;</P>
						<P>
							<asp:RangeValidator id="RangeValidator7" runat="server" ErrorMessage="กรุณาใส่ตัวเลขตั้งแต่ 0-100" Type="Double" MinimumValue="0" MaximumValue="100" ControlToValidate="txtGuarantee"></asp:RangeValidator>
							<asp:RequiredFieldValidator id="RequiredFieldValidator13" runat="server" ErrorMessage="กรุณาใส่ตัวเลข" ControlToValidate="txtGuarantee"></asp:RequiredFieldValidator></P>
					</TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><asp:label id="Label39" runat="server">หลักประกันที่เป็นเช็คสั่งจ่ายให้แก่</asp:label></TD>
					<TD style="WIDTH: 176px"><asp:textbox id="txtCheck" runat="server"></asp:textbox></TD>
					<TD style="WIDTH: 63px"></TD>
					<TD style="WIDTH: 168px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 164px">
						<asp:RequiredFieldValidator id="RequiredFieldValidator12" runat="server" ErrorMessage="กรุณาใส่ชื่อบุคคลหรือนิติบุคคล" ControlToValidate="txtCheck"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><asp:label id="Label40" runat="server">หลักประกันนี้จะคืนให้โดยไม่มีดอกเบี้ยภายใน</asp:label></TD>
					<TD style="WIDTH: 176px"><asp:textbox id="txtReturn" runat="server"></asp:textbox></TD>
					<TD style="WIDTH: 63px"><asp:label id="Label42" runat="server">วัน นับจากวันที่ผู้ขายพ้นจากข้อผู้พันตามสัญญาซื้อขาย</asp:label></TD>
					<TD style="WIDTH: 168px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 164px">
						<asp:RequiredFieldValidator id="RequiredFieldValidator11" runat="server" ErrorMessage="กรุณาใส่ตัวเลข" ControlToValidate="txtReturn"></asp:RequiredFieldValidator>
						<asp:RangeValidator id="RangeValidator6" runat="server" ErrorMessage="จำนวนเต็มตั้งแต่ 1 ขึ้นไป" Type="Integer" MinimumValue="0" MaximumValue="99999" ControlToValidate="txtReturn"></asp:RangeValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><asp:label id="Label43" runat="server">เมื่อครบกำหนดส่งมอบแล้วผู้ขายไม่มอบสิ่งที่ตกลงขายให้แก่ผู้ซื้อผู้ขายต้องชำระค่าปรับให้ผู้ซื้อเป็นรายวันในอัตราร้อยละ</asp:label></TD>
					<TD style="WIDTH: 176px"><asp:textbox id="txtFine" runat="server"></asp:textbox></TD>
					<TD style="WIDTH: 63px"><asp:label id="Label44" runat="server">ของราคาสิ่งของที่ค้างอยู่</asp:label></TD>
					<TD style="WIDTH: 168px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 164px">
						<asp:RangeValidator id="RangeValidator5" runat="server" ErrorMessage="กรุณาใส่ 0-100" Type="Double" MinimumValue="0" MaximumValue="100" ControlToValidate="txtFine"></asp:RangeValidator>
						<asp:RequiredFieldValidator id="RequiredFieldValidator10" runat="server" ErrorMessage="กรุณาใส่ตัวเลข" ControlToValidate="txtFine"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px; HEIGHT: 61px"><asp:label id="Label50" runat="server">ผู้ขายจะต้องรับประกันความบกพร่องของสิ่งของภายในระยะเวลา</asp:label></TD>
					<TD style="WIDTH: 176px; HEIGHT: 61px"><asp:textbox id="txtGuaranteeMonth" runat="server"></asp:textbox></TD>
					<TD style="WIDTH: 63px; HEIGHT: 61px"><FONT face="Tahoma"><asp:label id="Label52" runat="server">เดือน</asp:label></FONT></TD>
					<TD style="WIDTH: 168px; HEIGHT: 61px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 164px; HEIGHT: 61px">
						<P>
							<asp:RequiredFieldValidator id="RequiredFieldValidator9" runat="server" ErrorMessage="กรุณาใส่ตัวเลข" ControlToValidate="txtGuaranteeMonth"></asp:RequiredFieldValidator></P>
						<P>
							<asp:RangeValidator id="RangeValidator4" runat="server" ErrorMessage="จำนวนเต็มตั้งแต่ 0 ขึ้นไป" MinimumValue="1" MaximumValue="99999" ControlToValidate="txtGuaranteeMonth"></asp:RangeValidator></P>
					</TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><asp:label id="Label51" runat="server">โดยต้องซ่อมให้ดีดังเดิมภายใน</asp:label></TD>
					<TD style="WIDTH: 176px"><asp:textbox id="txtRepair" runat="server"></asp:textbox></TD>
					<TD style="WIDTH: 63px"><FONT face="Tahoma"><asp:label id="Label53" runat="server">วันนับจากวันที่ได้รับแจ้ง</asp:label></FONT></TD>
					<TD style="WIDTH: 168px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 164px">
						<P>
							<asp:RequiredFieldValidator id="RequiredFieldValidator8" runat="server" ErrorMessage="กรุณาใส่ตัวเลข" ControlToValidate="txtRepair"></asp:RequiredFieldValidator></P>
						<P>
							<asp:RangeValidator id="RangeValidator3" runat="server" ErrorMessage="จำนวนเต็มตั้งแต่1 ขึ้นไป" Type="Integer" MinimumValue="1" MaximumValue="999999" ControlToValidate="txtRepair"></asp:RangeValidator></P>
					</TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><asp:label id="Label54" runat="server">ผู้เสนอมีสิทธิรับเงินล่วงหน้าได้ไม่เกินร้อยละ</asp:label></TD>
					<TD style="WIDTH: 176px"><FONT face="Tahoma"><asp:textbox id="txtMoneyBefore" runat="server"></asp:textbox></FONT></TD>
					<TD style="WIDTH: 63px"><asp:label id="Label55" runat="server">ของราคาสิ่งของที่เสนอขาย (แต่ต้องมอบหลักฐานค่ำประกันไว้)</asp:label></TD>
					<TD style="WIDTH: 168px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 164px">
						<asp:RangeValidator id="RangeValidator2" runat="server" ErrorMessage="กรุณาใส่ 0-100" Type="Double" MinimumValue="-100" MaximumValue="100" ControlToValidate="txtMoneyBefore"></asp:RangeValidator>
						<asp:RequiredFieldValidator id="RequiredFieldValidator7" runat="server" ErrorMessage="กรุณาใส่ตัวเลข" ControlToValidate="txtMoneyBefore"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><asp:label id="Label56" runat="server">เงินค่าพัสดุครั้งนี้ได้รับมาจาก</asp:label></TD>
					<TD style="WIDTH: 176px"><asp:dropdownlist id="ddlbudget" runat="server">
							<asp:ListItem Value="งบประมาณประจำปี">งบประมาณประจำปี</asp:ListItem>
							<asp:ListItem Value="เงินกู้">เงินกู้</asp:ListItem>
							<asp:ListItem Value="เงินรายได้">เงินรายได้</asp:ListItem>
						</asp:dropdownlist></TD>
					<TD style="WIDTH: 63px"></TD>
					<TD style="WIDTH: 168px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 164px"></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"></TD>
					<TD style="WIDTH: 176px"></TD>
					<TD style="WIDTH: 63px"></TD>
					<TD style="WIDTH: 168px"></TD>
					<TD style="WIDTH: 164px"></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><asp:label id="Label58" runat="server">การลงนามในสัญญาจะกระทำได้ต่อเมื่อ ได้รับอนุมัติค่าพัสดุจาก</asp:label></TD>
					<TD style="WIDTH: 176px"><asp:dropdownlist id="ddlAgree" runat="server">
							<asp:ListItem Value="งบประมาณประจำปี">งบประมาณประจำปี</asp:ListItem>
							<asp:ListItem Value="เงินรายได้">เงินรายได้</asp:ListItem>
							<asp:ListItem Value="เงินกู้">เงินกู้</asp:ListItem>
						</asp:dropdownlist></TD>
					<TD style="WIDTH: 63px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 168px"></TD>
					<TD style="WIDTH: 164px"></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><FONT face="Tahoma"><asp:label id="Label13" runat="server">ประกาศวันที่</asp:label></FONT></TD>
					<TD style="WIDTH: 176px"><FONT face="Tahoma"><asp:calendar id="Calendar8" runat="server"></asp:calendar></FONT></TD>
					<TD style="WIDTH: 63px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 168px">
						<asp:Calendar id="nonVisible" runat="server" Visible="False"></asp:Calendar></TD>
					<TD style="WIDTH: 164px"></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><FONT face="Tahoma"><asp:label id="Label14" runat="server">ลงชื่อ นาย</asp:label></FONT></TD>
					<TD style="WIDTH: 176px"><asp:textbox id="txtDeclareName" runat="server"></asp:textbox></TD>
					<TD style="WIDTH: 63px"></TD>
					<TD style="WIDTH: 168px"></TD>
					<TD style="WIDTH: 164px">
						<asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtDeclareName"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"><asp:label id="Label15" runat="server">ตำแหน่ง</asp:label></TD>
					<TD style="WIDTH: 176px"><asp:textbox id="txtDeclarePosition" runat="server"></asp:textbox></TD>
					<TD style="WIDTH: 63px"></TD>
					<TD style="WIDTH: 168px"></TD>
					<TD style="WIDTH: 164px">
						<asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtDeclarePosition"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"></TD>
					<TD style="WIDTH: 176px"></TD>
					<TD style="WIDTH: 63px"></TD>
					<TD style="WIDTH: 168px">
						<asp:TextBox id="TextBox2" runat="server" Visible="False"></asp:TextBox></TD>
					<TD style="WIDTH: 164px">
						<asp:RequiredFieldValidator id="RequiredFieldValidator20" runat="server" ControlToValidate="TextBox2" ErrorMessage="ท่านกำหนดวันไม่ครบ"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"></TD>
					<TD style="WIDTH: 176px"><asp:button id="Button1" runat="server" Text="submit"></asp:button></TD>
					<TD style="WIDTH: 63px"><asp:button id="Button2" runat="server" Text="reset"></asp:button></TD>
					<TD style="WIDTH: 168px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 164px"><FONT face="Tahoma"></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 189px"></TD>
					<TD style="WIDTH: 176px"><asp:linkbutton id="lnkmain" runat="server">กลับไปหน้าหลัก</asp:linkbutton></TD>
					<TD style="WIDTH: 63px"></TD>
					<TD style="WIDTH: 168px"></TD>
					<TD style="WIDTH: 164px"><FONT face="Tahoma"></FONT></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
