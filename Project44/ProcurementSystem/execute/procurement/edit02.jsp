
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<!-- Creation date: 23/10/2001 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874"> 
<title>แก้ไขข้อมูลเรียบร้อย</title>
<LINK REL="stylesheet" HREF="toefl.css" TYPE="text/css">
<%@page contentType="text/html"%>
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%>
<%@include file = "th-db.jsp"%>
<%
    String  id=new String(request.getParameter("id"));
	String name=MS874ToUnicode(new String(request.getParameter("name")));
	String sname=MS874ToUnicode(new String(request.getParameter("sname")));
	String email=new String(request.getParameter("email"));
	String passwd=new String(request.getParameter("passwd"));
    String dept=MS874ToUnicode(new String(request.getParameter("dept")));
	String  level=new String(request.getParameter("level"));
	String position=MS874ToUnicode(new String(request.getParameter("position")));
	
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
				String query="UPDATE EMPLOYEE SET LEVEL#='"+level+"',POSITION='"+position+"',PASSWD='"+passwd+"',NAME='"+name+"',SNAME='"+sname+"',EMAIL='"+email+"',DEPT='"+dept+"' WHERE EMP#='"+id+"'" ;
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
	name=UnicodeToMS874(name);
	sname=UnicodeToMS874(sname);
	%>
                    <CENTER>ระบบทำการแก้ไขข้อมูลของ คุณ <%=name%> &nbsp;&nbsp; <%=sname%> &nbsp;&nbsp;เรียบร้อยแล้ว</CENTER>
 
 <%
}	
%>
</td>
  </tr>
</table>
</div>
</body>
</html>
