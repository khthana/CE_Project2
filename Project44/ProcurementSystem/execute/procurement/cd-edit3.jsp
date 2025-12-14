<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>

<HTML>
<HEAD>
<TITLE>แก้ไขข้อมูล</TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="Siriporn J.">
<LINK REL="stylesheet" HREF="procurement.css" TYPE="text/css">
</HEAD>
<BODY>
<%

    String  code=new String(request.getParameter("code"));
	String  type=MS874ToUnicode(new String(request.getParameter("type")));
	String  brand=MS874ToUnicode(new String(request.getParameter("brand")));
	String speed=MS874ToUnicode(new String(request.getParameter("speed")));
	String data_size=new String(request.getParameter("data_size"));
	String  detail=MS874ToUnicode(new String(request.getParameter("detail")));
    String cat=new String(request.getParameter("cat"));
		boolean checkDB=false;
	
try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
         Statement stmt = con.createStatement();

		String query="UPDATE DATA_KEEPING_PRODUCTS SET SPEED='"+speed+"',BRAND='"+brand+"',TYPE='"+type+"',CAT#='"+cat+"',DATA_SIZE='"+data_size+"',DETAIL='"+detail+"' WHERE CODE='"+code+"'" ;
				stmt.executeUpdate(query);
				
				 checkDB=true;
			          
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
if (checkDB){  //ถ้าสามารถบันทึกข้อมูลลง DB ได้สำเร็จ
	// ส่วนแสดงผลออกที่หน้าจอ 
	%>
                    <CENTER>ระบบทำการแก้ไขข้อมูลเรียบร้อยแล้ว</CENTER>
 
 <%
}	
%>
</BODY>
</HTML>
