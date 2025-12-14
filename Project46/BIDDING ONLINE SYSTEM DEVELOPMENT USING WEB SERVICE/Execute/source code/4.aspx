<%@ Page language="c#" Codebehind="4.aspx.cs" AutoEventWireup="false" Inherits="project._4" Culture="en-US"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>4</title>
</HEAD>
<BODY>
<meta content="Microsoft Visual Studio .NET 7.1" name=GENERATOR>
<meta content=C# name=CODE_LANGUAGE>
<meta content=JavaScript name=vs_defaultClientScript>
<meta content=http://schemas.microsoft.com/intellisense/ie5 name=vs_targetSchema>
<form id=Form1 method=post runat="server">
<CENTER></CENTER>
<CENTER>
<table width=550>
  <P><FONT face=Tahoma></FONT><br 
  ><br><br 
  >
  <P><FONT face=Tahoma 
  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT></P><br 
  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  1.ข้าพเจ้า&nbsp;&nbsp; <asp:label id=txtName runat="server" ForeColor="Red">Label</asp:label>&nbsp;&nbsp; 

  <P></P>
  <P><FONT face=Tahoma 
  ></FONT>&nbsp;</P><FONT face=Tahoma>
  <P>&nbsp;&nbsp;&nbsp;&nbsp;ที่อยู่&nbsp; <asp:label id=txtAddress runat="server" ForeColor="Red">Label</asp:label></P>
  <P>
<asp:button id=Button1 onclick=DataGrid_AddNewRow runat="server" Text="เพิ่มหลักฐานต่างๆ"></asp:button></P>
  <P>&nbsp;</P>
  <P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:datagrid id=dg runat="server" AutoGenerateColumns="False" DataKeyField="IDAuthority" OnDeleteCommand="DataGrid_Delete" OnUpdateCommand="DataGrid_Update" OnCancelCommand="DataGrid_Cancel" OnEditCommand="DataGrid_Edit" OnSortCommand="DataGrid_Sort" OnPageIndexChanged="DataGrid_Page" AllowPaging="True" PageSize="4">
	<Columns> 
		<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="Update" HeaderText="Edit" CancelText="Cancle" EditText="Edit"></asp:EditCommandColumn>
		<asp:BoundColumn DataField="NameDocument" HeaderText="กรุณาใส่ชื่อเอกสารที่เป็นหลักฐาน"></asp:BoundColumn>
		<asp:BoundColumn DataField="IDDocument" HeaderText="กรุณาใส่รหัสเอกสาร"></asp:BoundColumn>
		<asp:ButtonColumn Text="Delete" HeaderText="Delete" CommandName="Delete"></asp:ButtonColumn>
	</Columns>
	<PagerStyle HorizontalAlign="Left" Mode="NumericPages"></PagerStyle>
</asp:datagrid></P>
  <P>&nbsp;</P>
  <P>&nbsp;&nbsp;&nbsp;</P>
  <P></FONT>โทรศัพท์&nbsp; <asp:label id=txtTelephone runat="server" ForeColor="Red">Label</asp:label>&nbsp; 
  ผู้ลงนามข้างท้ายนี้ ได้พิจารณาเงื่อนไขต่างๆ ในเอกสารสอบราคาซื้อเลขที่ <asp:label id=Label16 runat="server" ForeColor="Red">Label</asp:label>โดยตลอดและยอมรับข้อกำหนดและเงื่อนไขนั้นแล้ว 
  รวมทั้งรับรองว่า ข้าพเจ้าเป็นผู้มีคุณสมบัติครบถ้วนตามที่กำหนด 
  และไม่เป็นผู้ทิ้งงานของทางราชการ <br 
  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  2. ข้าพเจ้าขอเสนอรายการพัสดุ รวมทั้งบริการ ซึ่งกำหนดไว้ในเอกสารสอบราคาตามราคา 
  และ กำหนดเวลาส่งมอบ ดังต่อไปนี้ <br></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P><FONT face=Tahoma></FONT></P></P></table></CENTER>
<CENTER><STRONG></STRONG>&nbsp;</CENTER>
<CENTER><asp:datagrid id=dg3 runat="server" DataKeyField="IDBidding" AutoGenerateColumns="False">
<Columns>
<asp:BoundColumn DataField="Detail" HeaderText="รายละเอียด"></asp:BoundColumn>
<asp:BoundColumn DataField="Number" HeaderText="จำนวนที่ต้องการ"></asp:BoundColumn>
<asp:BoundColumn DataField="Unit" HeaderText="หน่วย"></asp:BoundColumn>
<asp:TemplateColumn>
<HeaderTemplate>
กรุณาใส่ spect ที่เสนอขายต้องมากกว่าที่กำหนด 
</HeaderTemplate>

<ItemTemplate>
<asp:TextBox id="Gather" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ControlToValidate="Gather" ErrorMessage="กรุณากรอกช่องนี้" Runat="server"></asp:RequiredFieldValidator>
<asp:RangeValidator ControlToValidate="Gather" ErrorMessage="กรุณาใส่เป็นตัวเลข" Type="Double" MinimumValue="-99999" MaximumValue="9999999999" Runat="server"></asp:RangeValidator>
</ItemTemplate>
</asp:TemplateColumn>
</Columns>
</asp:datagrid></CENTER>
<CENTER><FONT face=Tahoma></FONT>&nbsp;</CENTER>
<CENTER><asp:datagrid id=dg1 runat="server" AutoGenerateColumns="False">
	<Columns>
		<asp:BoundColumn DataField="Detail" HeaderText="รายละเอียด"></asp:BoundColumn>
		<asp:BoundColumn DataField="Number" HeaderText="จำนวนที่ต้องการ"></asp:BoundColumn>
		<asp:BoundColumn DataField ="Unit" HeaderText="หน่วย"></asp:BoundColumn>
		<asp:TemplateColumn>
			<HeaderTemplate>
				กรุณาใส่รายละเอียดน้อยกว่าที่กำหนด
			</HeaderTemplate>
			<ItemTemplate>
				<asp:TextBox id="Minus" Runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator ControlToValidate="Minus" ErrorMessage="กรุณากรอกช่องนี้" Runat="server"></asp:RequiredFieldValidator>
<asp:RangeValidator ControlToValidate="Minus" ErrorMessage="กรุณาใส่เป็นตัวเลข" Type="Double" MinimumValue="-99999" MaximumValue="9999999999" Runat="server"></asp:RangeValidator>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>	
</asp:datagrid></CENTER>
<CENTER><FONT face=Tahoma></FONT>&nbsp;</CENTER>
<CENTER>&nbsp;</CENTER>
<CENTER><STRONG><asp:datagrid id=dg2 runat="server" AutoGenerateColumns="False">
	<Columns>
		<asp:BoundColumn DataField="Detail" HeaderText="สเปคที่ต้องมี"></asp:BoundColumn>
		<asp:TemplateColumn>
			<HeaderTemplate>
				กรุณาเลือกสเปคตามที่กำหนด
			</HeaderTemplate>
			<ItemTemplate>
				<asp:CheckBox ID="Equal" Runat="server"></asp:CheckBox>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
</asp:datagrid></STRONG></CENTER>
<CENTER>
<TABLE id=Table1 style="WIDTH: 522px; HEIGHT: 608px" cellSpacing=1 cellPadding=1 
width=522 border=1>
  <TR>
    <TD style="WIDTH: 197px; HEIGHT: 28px">รายการ</TD>
    <TD style="WIDTH: 149px; HEIGHT: 28px">ราคาต่อหน่วย</TD>
    <TD style="HEIGHT: 28px">จำนวน</TD>
    <TD style="WIDTH: 93px; HEIGHT: 28px">รวมเป็นเงิน</TD>
    <TD style="HEIGHT: 28px">กำหนดส่งมอบ</TD>
    <TD style="HEIGHT: 28px"><FONT face=Tahoma 
      ></FONT></TD></TR>
  <TR>
    <TD style="WIDTH: 197px"><FONT face=Tahoma 
      >
      <P><asp:label id=Label1 runat="server" ForeColor="Red">Label</asp:label><br 
      >ประกอบด้วย </P>
      <P><asp:label id=Label17 runat="server" ForeColor="Red">Label</asp:label><asp:label id=Label18 runat="server" ForeColor="Red">Label</asp:label>ชุด</P>
      <P>&nbsp;</P>
      <P>&nbsp;</P>
      <P>&nbsp;</P>
      <P>&nbsp;</P>
      <P>&nbsp;</P>
      <P>&nbsp;</P>
      <P>&nbsp;</P>
      <P>&nbsp;</P>
      <P>&nbsp;</P>
      <P>&nbsp;</P></FONT></TD>
    <TD style="WIDTH: 149px">
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><FONT face=Tahoma>&nbsp;</P>
      <P><asp:textbox id=TextBox3 runat="server" Width="80px"></asp:textbox></P></FONT></TD>
    <TD><FONT face=Tahoma></FONT>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><asp:textbox id=TextBox5 runat="server" Width="80px"></asp:textbox></P></TD>
    <TD style="WIDTH: 93px">
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P>&nbsp;</P>
      <P>&nbsp;</P>
      <P>&nbsp;</P>
      <P>&nbsp;</P>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><asp:textbox id=TextBox9 runat="server" Width="140px"></asp:textbox>
<asp:RequiredFieldValidator id=RequiredFieldValidator1 runat="server" ErrorMessage="กรุณาใส่จำนวนเงิน(บาท)" ControlToValidate="TextBox9"></asp:RequiredFieldValidator>
<asp:RangeValidator id=RangeValidator1 runat="server" ErrorMessage="กรุณาใส่จำนวนเงิน(ต้องมากกว่า0)" ControlToValidate="TextBox9" MaximumValue="99999999999" MinimumValue="0" Type="Double"></asp:RangeValidator></P></TD>
    <TD>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P>&nbsp;</P>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P>&nbsp;</P>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><FONT face=Tahoma><asp:calendar id=Calendar1 runat="server" Width="108px" Height="153px"></asp:calendar>
<asp:Label id=Label22 runat="server" ForeColor="Red" Visible="False">กรุณากำหนดจำนวนวัน</asp:Label></FONT></P></TD>
    <TD><FONT face=Tahoma>
      <P><asp:label id=Label2 runat="server">ยี่ห้อ</asp:label><asp:textbox id=TextBox15 runat="server"></asp:textbox></P></FONT>
      <P><FONT face=Tahoma><asp:label id=Label3 runat="server">แบบ</asp:label></FONT></P><FONT 
      face=Tahoma>
      <P><asp:textbox id=TextBox16 runat="server" DESIGNTIMEDRAGDROP="61"></asp:textbox></P>
      <P>&nbsp;</P>
      <P><asp:label id=Label19 runat="server">ผู้ผลิต</asp:label></P>
      <P><asp:textbox id=TextBox17 runat="server"></asp:textbox></P>
      <P>&nbsp;</P>
      <P><asp:label id=Label20 runat="server">ประเทศผู้ผลิต</asp:label></P>
      <P><asp:textbox id=TextBox18 runat="server"></asp:textbox></P>
      <P>&nbsp;</P></FONT></TD></TR>
  <TR>
    <TD style="WIDTH: 197px">
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P>
      <P><FONT face=Tahoma 
      ></FONT>&nbsp;</P></TD>
    <TD style="WIDTH: 149px"><FONT face=Tahoma 
      ></FONT></TD>
    <TD><FONT face=Tahoma></FONT></TD>
    <TD style="WIDTH: 93px"></TD>
    <TD><FONT face=Tahoma>
<asp:Calendar id=nonVisible runat="server" Visible="False"></asp:Calendar></FONT></TD>
    <TD><FONT face=Tahoma 
  ></FONT></TD></TR></TABLE></CENTER>
<CENTER>
<TABLE id=Table2 width=550>
  <P><FONT face=Tahoma></FONT><FONT 
  face=Tahoma></FONT>
  <P><FONT face=Tahoma></FONT><br 
  >&nbsp;&nbsp;&nbsp;&nbsp; 
  ราคารวมทั้งสิ้น (ใส่เป็นตัวอักษร) 
<asp:RequiredFieldValidator id=RequiredFieldValidator2 runat="server" ErrorMessage="กรุณาใส่จำนวนเงินเป็นตัวอักษร" ControlToValidate="TextBox13"></asp:RequiredFieldValidator>  
   <br>( <asp:textbox id=TextBox13 runat="server" Width="296px"></asp:textbox>)ซึ่งเป็นราคาที่รวมภาษีมูลค่าเพิ่ม 
  รวมทั้งภาษีอากรอื่นและค่าใช้จ่ายทั้งปวงไว้ด้วยแล้ว&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <P></P>
  <P><FONT face=Tahoma>
<asp:Label id=Label21 runat="server" ForeColor="Red">กรณีที่ตัวเลขกับตัวอักษรไม่ตรงกันจะถือตัวอักษรเป็นหลัก</asp:Label></FONT></P>
  <P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  3.ในกรณีที่ข้าพเจ้าได้รับการพิจารณาให้เป็นผู้ชนะการสอบราคา 
  ข้าพเจ้ารับรองที่จะ&nbsp; <br 
  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  3.1 ทำสัญญาตามแบบสัญญาซื้อขาย/ข้อตกลงแนบท้ายเอกสารสอบราคากับ <asp:label id=Label15 runat="server" ForeColor="Red">Label</asp:label>ภายใน 
<asp:label id=Label14 runat="server" ForeColor="Red">Label</asp:label>วันทำการ 
  นับถัดจากวันที่ได้รับหนังสือแจ้งให้ไปทำสัญญา/ข้อตกลง&nbsp; <br 
  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  3.2 มอบหลักประกันการปฏิบัติตามสัญญา ตามที่ระบุไว้ในข้อ 6. 
  ของเอกสารสอบราคาให้แก่ <asp:label id=Label13 runat="server" ForeColor="Red">Label</asp:label>ก่อนหรือในขณะที่ได้ลงนามในสัญญาเป็นจำนวนร้อยละ 
<asp:label id=Label12 runat="server" ForeColor="Red">Label</asp:label>ของราคาตามสัญญาที่ได้ระบุไว้ในใบเสนอราคานี้ 
  เพื่อเป็นหลักประกันการปฏิบัติตามสัญญาโดยถูกต้องและครบถ้วน <br 
  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  หากข้าพเจ้าไม่ปฏิบัติให้ครบถ้วนตามที่ระบุไว้ข้างต้น 
  ข้าพเจ้ายินดีชดใช้ค่าเสียหายใดๆ ที่อาจมีแก่ <asp:label id=Label9 runat="server" ForeColor="Red">Label</asp:label>และ 
<asp:label id=Label10 runat="server" ForeColor="Red">Label</asp:label>มีสิทธิจะให้ผู้เสนอราคารายอื่นเป็นผู้สอบราคาได้หรือ 
<asp:label id=Label11 runat="server">Label</asp:label>อาจเรียกสอบราคาใหม่ก็ได้&nbsp; 
  <br 
  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  4.ข้าพเจ้ายอมรับว่า <asp:label id=Label8 runat="server" ForeColor="Red">Label</asp:label>ไม่มีความผูกพันที่จะรับคำเสนอนี้ 
  หรือใบเสนอราคาใดๆ รวมทั้งไม่ต้องรับผิดชอบในค่าใช้จ่ายใดๆ 
  อันอาจเกิดขึ้นในการที่ข้าพเจ้าได้เข้าเสนอราคา&nbsp; <br 
  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  5.บรรดาหลักฐานประกอบการพิจารณา เช่นตัวอย่าง (SAMPLE) 
  แคตตาล็อกแบบรูปรายการละเอียด คุณลักษณะเฉพาะ (SPECIFICATIONS) 
  ซึ่งข้าพเจ้าได้ส่งให้แก่ <asp:label id=Label7 runat="server" ForeColor="Red">Label</asp:label>พร้อมใบเสนอราคา 
  ข้าพเจ้ายิยอมมอบให้แก่ <asp:label id=Label6 runat="server" ForeColor="Red">Label</asp:label>ไว้เป็นเอกสารและทรัพย์สินของทางราชการ 
  <br 
  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  สำหรับตัวอย่างที่เหลือหรือไม่ใช้แล้ว ซึ่ง <asp:label id=Label5 runat="server" ForeColor="Red">Label</asp:label>คืนให้ 
  ข้าพเจ้าจะไม่รียกร้องค่าเสียหายใดๆที่เกิดขึ้นกับตัวอย่างนั้น&nbsp; <br 
  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  6.ข้าพเจ้าได้ตรวจทานตัวเลขและตรวจสอบเอกสรต่างๆที่ได้ยื่นพร้อมใบเสนอราคานี้โดยละเอียดแล้ว 
  และเข้าใจดีว่า <asp:label id=Label4 runat="server" ForeColor="Red">Label</asp:label>ไม่ต้องรับผิดชอบใดๆ 
  ในความผิดพลาดหรือตกหล่น&nbsp; <br 
  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  7. ใบเสนอราคานี้ได้ยื่นเสนอโดยบริสุทธิ์ยุติธรรม 
  และปราศจากกลฉ้อฉลหรือการสมรู้ร่วมคิดกันโยไม่ชอบด้วยกฎหมายกับบุคคลหนึ่ง 
  หรือหลายบุคคล หรือกับห้างหุ้นส่วนบริษัทใดๆ 
  ที่ได้ยื่นเสนอราคาในครางเดียวกัน&nbsp;</P>
  <P><FONT face=Tahoma></FONT>&nbsp;</P><FONT face=Tahoma>
  <P>&nbsp;</P>
  <P>&nbsp;</P>
  <P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> 
    
   
    
  <br><BR 
  ><br 
  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br 
  ><br><br 
  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  ลงชื่อ <asp:textbox id=TextBox12 runat="server"></asp:textbox>
<asp:RequiredFieldValidator id=RequiredFieldValidator3 runat="server" ErrorMessage="*" ControlToValidate="TextBox12"></asp:RequiredFieldValidator><br 
  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br 
  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  ตำแหน่ง <asp:textbox id=TextBox10 runat="server"></asp:textbox>
<asp:RequiredFieldValidator id=RequiredFieldValidator4 runat="server" ErrorMessage="*" ControlToValidate="TextBox10"></asp:RequiredFieldValidator></P>
  <P></P>
  <P>&nbsp;</P>
  <P><FONT face=Tahoma 
  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  </FONT><asp:linkbutton id=lnkhome runat="server">กลับไปหน้าแรก</asp:linkbutton><FONT 
  face=Tahoma 
  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  </FONT><asp:linkbutton id=lnkcontact runat="server">ยื่นข้อเสนอ</asp:linkbutton></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P>
  <P></P></P></TABLE></CENTER></form>
	</BODY>
</HTML>
