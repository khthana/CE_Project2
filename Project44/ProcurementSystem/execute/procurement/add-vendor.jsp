<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<!-- Creation date: 23/10/2001 -->
<head>
<title>ลงทะเบียนเสร็จสิ้น</title>
<LINK REL="stylesheet" HREF="procurement.css" TYPE="text/css">
<%@page contentType="text/html"%> 
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%>
<%@include file = "th-db.jsp"%>
<%
    String  code=request.getParameter("code");
	int code1=Integer.parseInt(code);
	String  addr=MS874ToUnicode(new String(request.getParameter("addr")));
	String  tel=MS874ToUnicode(new String(request.getParameter("tel")));
	String  brand=MS874ToUnicode(new String(request.getParameter("brand")));
	String fax=new String(request.getParameter("fax"));
	//String  speed=new String(request.getParameter("speed"));
	String  name=MS874ToUnicode(new String(request.getParameter("name")));
	String  sname=MS874ToUnicode(new String(request.getParameter("sname")));
	
		
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
				
				ResultSet rs=stmt.executeQuery("SELECT * FROM VENDOR WHERE VENDOR#='"+code1+"'");

                if(rs.next()) {
				/*name=UnicodeToMS874(name);
              	sname=UnicodeToMS874(sname);*/
	             %>
                    <CENTER>เคยทำการลงทะเบียนแล้ว</CENTER>
                <%			            
				  }else{

				String query="INSERT INTO VENDOR VALUES('"+code1+"','"+brand+"','"+addr+"','"+tel+"',' "+fax+"','"+name+"','"+sname+"')";
	            stmt.executeUpdate(query);
				
				 checkDB=true;
				 rs.close();
	             stmt.close();
				 con.close();
	            }
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
       <CENTER>เพิ่มข้อมุลเสร็จสิ้น <A HREF="add-vendor.html">เพิ่มเติมข้อมูล</A> หรือ <A HREF="show-cd-db.jsp">ดูข้อมูลในฐานข้อมูล</A> </CENTER>
 
 <%
}	
%>
</td>
  </tr>
</table>
</div>
</body>
</html>

