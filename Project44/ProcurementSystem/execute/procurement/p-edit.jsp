 
<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>

<HTML>
<HEAD>
<TITLE>แก้ไขข้อมูลสินค้าประเภทอุปกรณ์การเขียนและลบคำผิด</TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="Siriporn J.">

</HEAD>
<BODY>
<% 
String  code=new String(request.getParameter("code"));   //ง จริงๆต้องเอามาจาก sessionง นะ
try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
         Statement stmt = con.createStatement();
		 String query="SELECT * FROM WRITING_PRODUCTS WHERE CODE='"+code+"'";
         ResultSet rs=stmt.executeQuery(query);
         rs.next();
	     
	     String cat=rs.getString("CAT#");
         String color=rs.getString("COLOR");
		 String type=rs.getString("TYPE");
		 String brand=rs.getString("BRAND");
		 String head_size=rs.getString("HEAD_SIZE");  
		 String detail=rs.getString("DETAIL");
		 
%>
<FORM method="post" action="p-edit2.jsp?code=<%=code%>&color=<%=color%>&type=<%=type%>&brand=<%=brand%>&head_side=<%=head_size%>&detail=<%=detail%>&cat=<%=cat%>">
<TABLE cellpadding="3" bordercolor="#DF5F2D" border="1" frame="above" rules="rhs" width="300" cellspacing="0">
<TR bgcolor="#DF572D" height="24">
	<TD colspan="2" align="left"><FONT COLOR="#FFF0E1"><B>แก้ไขข้อมูลสินค้าประเภทอุปกรณ์การเขียนและลบคำผิด</B></FONT></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="80">รหัสสินค้า :</TD>
	<TD bgcolor="#FFF0E1" ><%=code%></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="80">ชนิด :</TD>
	<TD bgcolor="#FFF0E1" ><SELECT NAME="type">
			
			  <OPTION VALUE="ปากกาลูกลื่น"  <%if (type.equals("ปากกาลูกลื่น")){out.print("SELECTED");}%>>ปากกาลูกลื่น
			  <OPTION VALUE="ปากกาโรลเลอร์บอล" <%if (type.equals("ปากกาโรลเลอร์บอล/หมึกเจล")){out.print("SELECTED");}%>>ปากกาโรลเลอร์บอล
		      <OPTION VALUE="ปากกาหมึกเจล" <%if (type.equals("ปากกาหมึกเจล")){out.print("SELECTED");}%>>ปากกาหมึกเจล	 
			  <OPTION VALUE="ปากกาหัวเข็ม" <%if (type.equals("ปากกาหัวเข็ม")){out.print("SELECTED");}%>>ปากกาหัวเข็ม
			  <OPTION VALUE="ปากกาเน้นข้อความ" <%if (type.equals("ปากกาเน้นข้อความ")){out.print("SELECTED");}%>>ปากกาเน้นข้อความ
			  <OPTION VALUE="ปากกามาร์คเกอร์" <%if (type.equals("ปากกามาร์คเกอร์")){out.print("SELECTED");}%>>ปากกามาร์คเกอร์
			  <OPTION VALUE="ปากกาไวท์บอร์ด" <%if (type.equals("ปากกาไวท์บอร์ด")){out.print("SELECTED");}%>>ปากกาไวท์บอร์ด
			  <OPTION VALUE="ปากกาเขียนแผ่นใส" <%if (type.equals("ปากกาเขียนแผ่นใส")){out.print("SELECTED");}%>>ปากกาเขียนแผ่นใส
			  <OPTION VALUE="ปากกาเพ้นท์" <%if (type.equals("ปากกาเพ้นท์")){out.print("SELECTED");}%>>ปากกาเพ้นท์
			  <OPTION VALUE="น้ำยาลบคำผิด" <%if (type.equals("น้ำยาลบคำผิด")){out.print("SELECTED");}%>>น้ำยาลบคำผิด
  			  <OPTION VALUE="เทปลบคำผิด" <%if (type.equals("เทปลบคำผิด")){out.print("SELECTED");}%>>เทปลบคำผิด
			  <OPTION VALUE="ดินสอกด" <%if (type.equals("ดินสอกด")){out.print("SELECTED");}%>>ดินสอกด
			  <OPTION VALUE="ไส้ดินสอ" <%if (type.equals("ไส้ดินสอ")){out.print("SELECTED");}%>>ไส้ดินสอ
			  <OPTION VALUE="ยางลบ" <%if (type.equals("ยางลบ")){out.print("SELECTED");}%>>ยางลบ
			  <OPTION VALUE="เครื่องเหลาดินสอ" <%if (type.equals("เครื่องเหลาดินสอ")){out.print("SELECTED");}%>>เครื่องเหลาดินสอ
	          </SELECT>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ยี่ห้อ :</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="brand" size="20" VALUE="<%=brand%>"></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ประเภท :</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="sub" size="10" VALUE="<%=cat%>"></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">สี :</TD>
	<TD bgcolor="#FFF0E1" ><B></B>
		 <SELECT NAME="color">
		<OPTION VALUE="ไม่ระบุสี"  <%if (color.equals("0")){out.print("SELECTED");}%>>ไม่ระบุสี
		<OPTION VALUE="ดำ"  <%if (color.equals("ดำ")){out.print("SELECTED");}%>>ดำ
		<OPTION VALUE="แดง" <%if (color.equals("แดง")){out.print("SELECTED");}%>>แดง
		<OPTION VALUE="น้ำเงิน" <%if (color.equals("น้ำเงิน")){out.print("SELECTED");}%>>น้ำเงิน
		<OPTION VALUE="ม่วง" <%if (color.equals("ม่วง")){out.print("SELECTED");}%>>ม่วง
		<OPTION VALUE="เขียว" <%if (color.equals("เขียว")){out.print("SELECTED");}%>>เขียว
		<OPTION VALUE="ชมพู" <%if (color.equals("ชมพู")){out.print("SELECTED");}%>>ชมพู
		<OPTION VALUE="ฟ้า" <%if (color.equals("ฟ้า")){out.print("SELECTED");}%>>ฟ้า
		<OPTION VALUE="น้ำตาล" <%if (color.equals("น้ำตาล")){out.print("SELECTED");}%>>น้ำตาล
		<OPTION VALUE="ส้ม" <%if (color.equals("ส้ม")){out.print("SELECTED");}%>>ส้ม
		<OPTION VALUE="เหลือง" <%if (color.equals("เหลือง")){out.print("SELECTED");}%>>เหลือง
		</SELECT></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ขนาดหัวปากกา:</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="head_size" size="10" VALUE="<%=head_size%>">&nbsp;มม.</TD>
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
