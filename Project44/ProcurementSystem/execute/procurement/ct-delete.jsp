<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>ลบข้อมูลเสร็จสิ้น</title>
<LINK REL="stylesheet" HREF="procurement.css" TYPE="text/css">
<%@page contentType="text/html"%> 
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%>
<%@include file = "th-db.jsp"%>
<%
    int  ct=Integer.parseInt(request.getParameter("ct"));	
	boolean checkDB=false;
     //รับเวลาส่งจาก server 
	long DateTime=new java.util.Date().getTime();
	java.sql.Date date=new java.sql.Date(DateTime);
	java.sql.Time  time=new java.sql.Time(DateTime);
	   
     // ส่วนจัดการ DB ของ Oracle
		 try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
                Statement stmt = con.createStatement();
				
				String query="DELETE CT_WF WHERE CT#='"+ct+"'";
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
	/*name=UnicodeToMS874(name);
	sname=UnicodeToMS874(sname);*/
	%>
       <CENTER>ลบข้อมุลเสร็จสิ้น <A HREF="new-ct.jsp">เพิ่มเติมข้อมูล</A> หรือ <A HREF="show-ct-db.jsp">ดูข้อมูลในฐานข้อมูล</A> </CENTER>
 
 <%
}	
%>
</td>
  </tr>
</table>
</div>
</body>
</html>

