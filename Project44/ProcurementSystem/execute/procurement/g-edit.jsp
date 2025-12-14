
<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>

<HTML>
<HEAD>
<TITLE>แก้ไขข้อมูลสินค้าประเภทอุปกรณ์การบรรจุ</TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="Siriporn J.">
<LINK REL="stylesheet" HREF="procurement.css" TYPE="text/css">
</HEAD>
<BODY>
<% 
String  code=new String(request.getParameter("code"));   //ง จริงๆต้องเอามาจาก sessionง นะ
try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
         Statement stmt = con.createStatement();
		 String query="SELECT * FROM PACKING_PRODUCTS WHERE CODE='"+code+"'";
         ResultSet rs=stmt.executeQuery(query);
         rs.next();
	     
        
         String color=rs.getString("COLOR");
		 String cat=rs.getString("CAT#");
		 String type=rs.getString("TYPE");
		 String brand=rs.getString("BRAND");
		  String thick=rs.getString("THICK");
		 String ring=rs.getString("RING");
		 String tape_size=rs.getString("TAPE_SIZE");  //"ไม่รู้มีป่าวเนี่ย get float
		 String detail=rs.getString("DETAIL");		 
		 
%>
<FORM method="post" action="g-edit3.jsp?code=<%=code%>">
<TABLE cellpadding="3" bordercolor="#DF5F2D" border="1" frame="above" rules="rhs" width="300" cellspacing="0">
<TR bgcolor="#DF572D" height="24">
	<TD colspan="2" align="left"><FONT COLOR="#FFF0E1"><B>แก้ไขข้อมูลสินค้าประเภทอุปกรณ์การบรรจุ</B></FONT></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="80">รหัสสินค้า :</TD>
	<TD bgcolor="#FFF0E1" ><%=code%></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="80">ชนิด :</TD>
	<TD bgcolor="#FFF0E1" ><SELECT NAME="type">
			
	<OPTION VALUE="กาวแท่ง">กาวแท่ง
			  <OPTION VALUE="กาวน้ำ" <%if(type.equals("กาวน้ำ")){out.print("SELECTED");}%>>กาวน้ำ
			    <OPTION VALUE="กาวลาเท็กซ์" <%if(type.equals("กาวลาเท็กซ์")){out.print("SELECTED");}%>>กาวลาเท็กซ์
			  <OPTION VALUE="กาวซูเปอร์กลู" <%if(type.equals("กาวซูเปอร์กลู")){out.print("SELECTED");}%>>กาวซูเปอร์กลู
			  <OPTION VALUE="กาวสารพัดประโยชน์" <%if(type.equals("กาวสารพัดประโยชน์")){out.print("SELECTED");}%>>กาวสารพัดประโยชน์
			  <OPTION VALUE="กาวสเปรย์" <%if(type.equals("กาวสเปรย์")){out.print("SELECTED");}%>>กาวสเปรย์
			  <OPTION VALUE="กาวดินน้ำมัน" <%if(type.equals("กาวดินน้ำมัน")){out.print("SELECTED");}%>>กาวดินน้ำมัน
			  <OPTION VALUE="กาวอุตสาหกรรม" <%if(type.equals("กาวอุตสาหกรรม")){out.print("SELECTED");}%>>กาวอุตสาหกรรม
			  <OPTION VALUE="เทปขุ่น" <%if(type.equals("เทปขุ่น")){out.print("SELECTED");}%>>เทปขุ่น
			  <OPTION VALUE="เทปใส" <%if(type.equals("เทปใส")){out.print("SELECTED");}%>>เทปใส
			  <OPTION VALUE="แท่นตัดเทป" <%if(type.equals("แท่นตัดเทป")){out.print("SELECTED");}%>>แท่นตัดเทป
			  <OPTION VALUE="เทปเยื่อกาวสองหน้า" <%if(type.equals("เทปเยื่อกาวสองหน้า")){out.print("SELECTED");}%>>เทปเยื่อกาวสองหน้า
			  <OPTION VALUE="เทปโฟม" <%if(type.equals("เทปโฟม")){out.print("SELECTED");}%>>เทปโฟม
			  <OPTION VALUE="เทปกระดาษกาวย่น" <%if(type.equals("เทปกระดาษกาวย่น")){out.print("SELECTED");}%>>เทปกระดาษกาวย่น
			  <OPTION VALUE="เทปโอพีพี" <%if(type.equals("เทปโอพีพี")){out.print("SELECTED");}%>>เทปโอพีพี
			  <OPTION VALUE="เทปผ้า" <%if(type.equals("เทปผ้า")){out.print("SELECTED");}%>>เทปผ้า
			  <OPTION VALUE="เทปพลาสติกไวนิล" <%if(type.equals("เทปพลาสติกไวนิล")){out.print("SELECTED");}%>>เทปพลาสติกไวนิล
	          </SELECT>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ยี่ห้อ :</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="brand" size="20" VALUE="<%=brand%>"></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">สี :</TD>
	<TD bgcolor="#FFF0E1" >
		 <SELECT NAME="color">
		<OPTION VALUE="ไม่ระบุสี" <%if(color.equals("ไม่ระบุสี")){out.print("SELECTED");}%>>ไม่ระบุสี
		<OPTION VALUE="ใส" <%if(color.equals("ใส")){out.print("SELECTED");}%>>ใส
		<OPTION VALUE="กากี" <%if(color.equals("กากี")){out.print("SELECTED");}%>>กากี
		<OPTION VALUE="ดำ" <%if(color.equals("ดำ")){out.print("SELECTED");}%>>ดำ
		<OPTION VALUE="แดง" <%if(color.equals("แดง")){out.print("SELECTED");}%>>แดง
		<OPTION VALUE="น้ำเงิน" <%if(color.equals("น้ำเงิน")){out.print("SELECTED");}%>>น้ำเงิน
		<OPTION VALUE="ม่วง" <%if(color.equals("ม่วง")){out.print("SELECTED");}%>>ม่วง
		<OPTION VALUE="เขียว" <%if(color.equals("เขียว")){out.print("SELECTED");}%>>เขียว
		<OPTION VALUE="ชมพู" <%if(color.equals("ชมพู")){out.print("SELECTED");}%>>ชมพู
		<OPTION VALUE="ฟ้า" <%if(color.equals("ฟ้า")){out.print("SELECTED");}%>>ฟ้า
		<OPTION VALUE="น้ำตาล" <%if(color.equals("น้ำตาล")){out.print("SELECTED");}%>>น้ำตาล
		<OPTION VALUE="ส้ม" <%if(color.equals("ส้ม")){out.print("SELECTED");}%>>ส้ม
		<OPTION VALUE="เหลือง" <%if(color.equals("เหลือง")){out.print("SELECTED");}%>>เหลือง
		</SELECT></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ขนาดกาว/เทป:</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="tape_size" size="5" VALUE="<%=tape_size%>"></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">แกน:</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="ring" size="5" VALUE="<%=ring%>"></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ความหนา:</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="thick" size="5" VALUE="<%=thick%>"></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">รายละเอียดอื่นๆ :</TD>
	<TD bgcolor="#FFF0E1" ><TEXTAREA NAME="detail" ROWS="7" COLS="40"><%=detail%></TEXTAREA></TD>
</TR>
<TR bgcolor="#FFF0E1" valign="center" align="center">
	<TD colspan="2">
	<pre> <INPUT TYPE="submit" value="แก้ไข"><INPUT TYPE="reset" value="ข้อมูลก่อนการแก้ไข"></pre>
 	</TD>
</TR>
</TABLE>
</FORM>
	 <%
		 rs.close();
		 stmt.close();
		 con.close();

	 } catch(SQLException e) 
      {
	      while (e != null) 
         {
            out.println("SQLException:<br>");
  		      out.println("Message:   " + e.getMessage() + "<br>");
		      out.println("SQLState:  " + e.getSQLState() + "<br>");
		      out.println("ErrorCode: " + e.getErrorCode() + "<br>");
		      e = e.getNextException();
         }
	   }
%>
</BODY>
</HTML>
