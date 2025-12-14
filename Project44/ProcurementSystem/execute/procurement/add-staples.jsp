<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<!-- Creation date: 23/10/2001 -->
<head>
<title>เพิ่มสินค้าเสร็จสิ้น</title>
<LINK REL="stylesheet" HREF="procurement.css" TYPE="text/css">
<%@page contentType="text/html"%> 
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%>
<%@include file = "th-db.jsp"%>
<%
    String  code=new String(request.getParameter("code"));
	String  type=MS874ToUnicode(new String(request.getParameter("type")));
	String  brand=MS874ToUnicode(new String(request.getParameter("brand")));
	String  sub=new String(request.getParameter("sub"));
	String  stapler_sub=MS874ToUnicode(new String(request.getParameter("stapler_sub")));
	String  thick=new String(request.getParameter("thick"));
    String  detail=MS874ToUnicode(new String(request.getParameter("detail")));
	String  ref_sub=MS874ToUnicode(new String(request.getParameter("ref_sub")));
	String  stap_size=MS874ToUnicode(new String(request.getParameter("stap_size")));
	String  cat=MS874ToUnicode(new String(request.getParameter("cat")));
	
		
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
				
				ResultSet rs=stmt.executeQuery("SELECT * FROM STAPLES WHERE CODE='"+code+"'");

                if(rs.next()) {
				/*name=UnicodeToMS874(name);
              	sname=UnicodeToMS874(sname);*/
	             %>
                    <CENTER>สินค้าชนิดนี้ เคยทำการลงทะเบียนแล้ว</CENTER>
                <%			            
				  }else{

				String query="INSERT INTO STAPLES(CODE,TYPE,BRAND,SUB,REF_SUB,STAP_SIZE,STAPLER_SUB,THICK,CAT#,DETAIL) VALUES("+code+",'"+type+"','"+brand+"','"+sub+" ',' "+ref_sub+"','"+stap_size+"','"+stapler_sub+"','"+thick+"','"+cat+"','"+detail+"')";
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
       <CENTER>เพิ่มข้อมูลเรียบร้อย ต้องการ<A HREF="add-staples.html">เพิ่มเติมข้อมูล คลิ้กที่นี่</A> หรือ <A HREF="show-staples-db.jsp">ดูข้อมูลในฐานข้อมูล คลิ้กที่นี่ค่ะ</A> </CENTER>
 
 <%
}	
%>
</td>
  </tr>
</table>
</div>
</body>
</html>

