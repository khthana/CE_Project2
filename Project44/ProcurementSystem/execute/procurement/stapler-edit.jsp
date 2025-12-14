<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>

<HTML>
<HEAD>
<TITLE>แก้ไขข้อมูลสินค้าประเภทเครื่องเย็บกระดาษ</TITLE>
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
		 String query="SELECT * FROM STAPLER WHERE CODE='"+code+"'";
         ResultSet rs=stmt.executeQuery(query);
         rs.next();
	     
	     String cat=rs.getString("CAT#");
		 String type=rs.getString("TYPE");
		 String brand=rs.getString("BRAND");
		 String  sub=rs.getString("SUB");
		 String  thick=rs.getString("THICK");
		 String staples_sub=rs.getString("STAPLES_SUB");  
		 String detail=rs.getString("DETAIL");
		 
		 
%>
<FORM method="post" action="stapler-edit3.jsp?code=<%=code%>&cat=<%=cat%>">
<TABLE cellpadding="3" bordercolor="#DF5F2D" border="1" frame="above" rules="rhs" width="300" cellspacing="0">
<TR bgcolor="#DF572D" height="24">
	<TD colspan="2" align="left"><FONT COLOR="#FFF0E1"><B>แก้ไขสินค้าประเภทเครื่องเย็บกระดาษ</B></FONT></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="80">รหัสสินค้า :</TD>
	<TD bgcolor="#FFF0E1" ><FONT COLOR="#DF572D"><B><%=code%></B></FONT></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="80">ชนิด :</TD>
	<TD bgcolor="#FFF0E1" ><SELECT NAME="type">
			  <OPTION VALUE="เครื่องเย็บกระดาษ" <%if (type.equals("เครื่องเย็บกระดาษ")){out.print("SELECTED");}%>>เครื่องเย็บกระดาษ
			  <OPTION VALUE="เครื่องเย็บกระดาษไฟฟ้า" <%if (type.equals("เครื่องเย็บกระดาษไฟฟ้า")){out.print("SELECTED");}%>>เครื่องเย็บกระดาษไฟฟ้า
			  <OPTION VALUE="เครื่องยิงบอร์ด" <%if (type.equals("เครื่องยิงบอร์ด")){out.print("SELECTED");}%>>เครื่องยิงบอร์ด
			  <OPTION VALUE="ที่ถอนลวด" <%if (type.equals("ที่ถอนลวด")){out.print("SELECTED");}%>>ที่ถอนลวด
			  </SELECT></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ยี่ห้อ :</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="brand" size="20" VALUE="<%=brand%>"></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">รุ่น :</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="sub" size="10" VALUE="<%=sub%>"></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ใช้กับลวดเบอร์ :</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="staples_sub" size="30" VALUE="<%=staples_sub%>"></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">เย็บกระดาษหนา:</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="thick" size="5" VALUE="<%=thick%>">&nbsp;แผ่น</TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">รายละเอียดอื่นๆ :</TD>
	<TD bgcolor="#FFF0E1" ><TEXTAREA NAME="detail" ROWS="7" COLS="40"><%=detail%></TEXTAREA></TD>
</TR>
<TR bgcolor="#FFF0E1" valign="center" align="center">
	<TD colspan="2">
	<pre> <INPUT TYPE="submit" value="เพิ่มเติม"><INPUT TYPE="reset" value="ข้อมูลก่อนการแก้ไข"></pre>
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
