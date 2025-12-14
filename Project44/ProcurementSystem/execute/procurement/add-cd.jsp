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
    String  code=new String(request.getParameter("code"));
	String  cat=MS874ToUnicode(new String(request.getParameter("cat")));
	String  type=MS874ToUnicode(new String(request.getParameter("type")));
	String  brand=MS874ToUnicode(new String(request.getParameter("brand")));
	String data_size=new String(request.getParameter("data_size"));
	String  speed=new String(request.getParameter("speed"));
	String  detail=MS874ToUnicode(new String(request.getParameter("detail")));
	
		
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
				
				ResultSet rs=stmt.executeQuery("SELECT * FROM DATA_KEEPING_PRODUCTS WHERE CODE='"+code+"'");

                if(rs.next()) {
				/*name=UnicodeToMS874(name);
              	sname=UnicodeToMS874(sname);*/
	             %>
                    <CENTER>สินค้าชนิดนี้ เคยทำการลงทะเบียนแล้ว</CENTER>
                <%			            
				  }else{

				String query="INSERT INTO DATA_KEEPING_PRODUCTS(CAT#,CODE,TYPE,BRAND,DATA_SIZE,SPEED,DETAIL) VALUES('"+cat+"','"+code+"','"+type+"','"+brand+"',' "+data_size+"','"+speed+"','"+detail+"')";
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
       <CENTER>เพิ่มข้อมุลเสร็จสิ้น <A HREF="add-cd.html">เพิ่มเติมข้อมูล</A> หรือ <A HREF="show-cd-db.jsp">ดูข้อมูลในฐานข้อมูล</A> </CENTER>
 
 <%
}	
%>
</td>
  </tr>
</table>
</div>
</body>
</html>

