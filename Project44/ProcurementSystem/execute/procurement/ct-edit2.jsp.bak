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
//	int  ct=Integer.parseInt(request.getParameter("ct"));
	String  cat=MS874ToUnicode(new String(request.getParameter("cat")));
//	String tb_name=MS874ToUnicode(new String(request.getParameter("tb_name")));
	String  wf_name=MS874ToUnicode(new String(request.getParameter("wf_name")));

		boolean checkDB=false;
	
try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
         Statement stmt = con.createStatement();

		String query="UPDATE CATEGORY SET  WF_TYPE='"+wf_name+"' WHERE CAT#='"+cat+"'" ;
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
