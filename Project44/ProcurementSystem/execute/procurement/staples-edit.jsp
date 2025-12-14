   
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>

<HTML>
<HEAD>
<TITLE>แก้ไขข้อมูลสินค้าประเภทลวดเย็บกระดาษ</TITLE>
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
		 String query="SELECT * FROM STAPLES WHERE CODE='"+code+"'";
         ResultSet rs=stmt.executeQuery(query);
         rs.next();
	     
	
		 String type=rs.getString("TYPE");
		 String brand=rs.getString("BRAND");
	 	 String ref_sub=rs.getString("REF_SUB");
		 String stap_size=rs.getString("STAP_SIZE");
		 String  sub=rs.getString("SUB");
		 String  stapler_sub=rs.getString("STAPLER_SUB");
		 String  cat=rs.getString("CAT#");
		 String thick=rs.getString("THICK");  
		 String detail=rs.getString("DETAIL");
	 	 
		 
%>
<FORM method="post" action="staples-edit3.jsp?code=<%=code%>&cat=<%=cat%>">
<TABLE cellpadding="3" bordercolor="#DF5F2D" border="1" frame="above" rules="rhs" width="300" cellspacing="0">
<TR bgcolor="#DF572D" height="24">
	<TD colspan="2" align="left"><FONT COLOR="#FFF0E1"><B>แก้ไขสินค้าประเภทลวดเย็บกระดาษ</B></FONT></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="80">รหัสสินค้า :</TD>
	<TD bgcolor="#FFF0E1" ><FONT COLOR="#DF572D"><B><%=code%></B></FONT></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="80">ชนิด :</TD>
	<TD bgcolor="#FFF0E1" ><SELECT NAME="type">
			  <OPTION VALUE="ลวดเย็บกระดาษ" <%if(type.equals("ลวดเย็บกระดาษ")){out.print("SELECTED");}%>>ลวดเย็บกระดาษ
			  <OPTION VALUE="ลวดยิงบอร์ด" <%if(type.equals("ลวดยิงบอร์ด")){out.print("SELECTED");}%>>ลวดยิงบอร์ด
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
	<TD bgcolor="#FFFFFF">รุ่นเทียบเท่า:</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="ref_sub" size="5" VALUE="<%=ref_sub%>"></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ขนาด:</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="stap_size" size="5" VALUE="<%=stap_size%>">มม.</TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ใช้กับเครื่องเย็บรุ่น :</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="stapler_sub" size="30" VALUE="<%=stapler_sub%>"></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">เย็บกระดาษหนา:</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="thick" size="5" VALUE="<%=thick%>">แผ่น</TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">รายละเอียดอื่นๆ :</TD>
	<TD bgcolor="#FFF0E1" ><TEXTAREA NAME="detail" ROWS="7" COLS="40"><%=detail%></TEXTAREA></TD>
</TR>
<TR bgcolor="#FFF0E1" valign="center" align="center">
	<TD colspan="2">
	<pre> <INPUT TYPE="submit" value="เพิ่มเติม"><INPUT TYPE="reset" value="บันทึกข้อมูลเดิม"></pre>
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
