<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date,java.util.*"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>
<HTML><HEAD><TITLE>:: Online e-Procurement ::</TITLE>
<LINK href="picture/cssomo1.css" rel=stylesheet type="text/css">
<META content="text/html; charset=windows-874" http-equiv=Content-Type>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="Sirirporn J.">
<META NAME="Description" CONTENT="First page for e-Procurement system">
</HEAD>
<BODY  leftMargin=0 topMargin=0 vLink=#0077ff marginheight="0" 
marginwidth="0"><FONT color=#000000></FONT>
<TABLE border=0 cellPadding=0 cellSpacing=0 width=760 bgcolor="#FFFFFF" align="center">
  <TBODY > 
  <TR>
    <TD align=left height=75 vAlign=bottom>
      <%@include file="topmenu.html"%></TD></TR>
  
  <TR>
    <TD height=10 bgcolor="#B6B6B6"> 
    </TD>

  </TR>
    <TR>
    <TD height=30 bgcolor="white"> 
   <div align="right">  
   <FONT  COLOR="#658dc1"><B>
   <%@include file="date.txt"%></B></FONT></div>
    </TD>
  </TR>
   <TR>
    <TD height=1 bgcolor="#B6B6B6"> 
    </TD>
  </TR>
  <TR colspan="2">
    <TD bgColor=#bfbfbf height=1 width=760></TD>
	</TR></TBODY></TABLE>
<TABLE border=0 cellPadding=0 cellSpacing=0 width=760 align="center">
  <TBODY> 
  <TR> 
    <TD align=middle vAlign=top> 
      <TABLE width="100%" cellpadding="3" cellspacing="0" border="0">
        <TR>
		  <TD bgColor="#bfbfbf" width="27%" align="center" valign="top">

            <%@include file="directory.html"%>
             <%@include file="shopping.html"%><P><P><BR><BR>

			
          </TD>
		  <TD bgColor="#ffffff" width="73%" align="center" valign="top"> 

<%   
	  String id=(String)session.getAttribute("emp");
	  String name=(String)session.getAttribute("name");
	  String sname=(String)session.getAttribute("sname");
	  String dept=(String)session.getAttribute("dept");
	  String passwd=(String)session.getAttribute("passwd");

	  String code = (String)session.getAttribute("favcode");
	  String tablename = (String)session.getAttribute("favtablename");  
    boolean checkDB=false;
	  if((code==null)&&(tablename==null)){
	 code=request.getParameter("code");  // สินค้าที่จะเพิ่ม
	 tablename=request.getParameter("tablename");  // สินค้าที่จะเพิ่ม
	  }

      if((id==null)&&(passwd==null)){ 
		  
		    session.setAttribute("favcode",code);
			session.setAttribute("favtablename",tablename);
			
		  %>
<!-- <P>&nbsp;<P>&nbsp;<form action="favlogin.jsp" method="post">		    
<TABLE align="CENTER" cellpadding="3" bordercolor="#66669A" border="1" width="250" cellspacing="0">
    <TR bgcolor="#66669A" height="24">
	<TD colspan="2" align="left"><FONT COLOR="#F1F0FF"><B>Login เข้าสู่ระบบ</B></FONT></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="100"> รหัสสมาชิก</TD>
	<TD bgcolor="#F1F0FF" ><input type="text" name="username" size="15" maxlength="20"></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="100">รหัสผ่าน</TD>
	<TD bgcolor="#F1F0FF" ><input type="password" name="passwd" size="15" maxlength="15"></TD>
</TR>
<TR>
<TD colspan="2" bgcolor="#F1F0FF" height="35" >
	<CENTER><INPUT TYPE="submit" value="ตกลง">&nbsp;&nbsp; <INPUT TYPE="reset" value="เริ่มใหม่"></CENTER>	
 </TD>
 </TR>	
</table>
<CENTER><a href="forgetpw.jsp">ลืมรหัสผ่าน</a> |  <a href="register.jsp">ลงทะเบียน</a></CENTER>
</form> -->
			 <P>&nbsp;<P>&nbsp;<CENTER><B>ยังไม่ได้ Login กรุณา  Login ก่อนเข้าระบบ</B></CENTER>
	  <%}else{
	  
	          		 try {
				
                Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
                Statement stmt = con.createStatement();
				
				ResultSet rs=stmt.executeQuery("SELECT * FROM FAVORITE WHERE CODE='"+code+"' AND EMP#='"+id+"'");

                if(rs.next()) {
				
	             %>
                    <P>&nbsp;<P>&nbsp;<CENTER><B>สินค้าชนิดนี้ เคยทำการลงทะเบียนแล้ว</B><BR>
                <%			
					  out.println("<A HREF=\"favorite.jsp\">กลับไปยัง Favorite Items</A>&nbsp;|&nbsp; <A HREF=\"shoppingcart.jsp\">กลับไปยัง Shopping Cart</A></CENTER></B>");
				  }else{

				String query="INSERT INTO FAVORITE VALUES('"+id+"','"+code+"','"+tablename+"')";
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
	session.removeAttribute("favcode");
 	session.removeAttribute("favtablename");
 	
       // response.sendRedirect("favorite.jsp");
	   out.println("<P>&nbsp;<P><B><CENTER>เพิ่มเข้าไปใน Favorite Items เรียบร้อยแล้ว<BR>");
	   out.println("<A HREF=\"favorite.jsp\">กลับไปยัง Favorite Items</A>&nbsp;|&nbsp; <A HREF=\"shoppingcart.jsp\">กลับไปยัง Shopping Cart</A></CENTER></B>");
		
}	
}

%>
           </TD>
	</TR>
	</TABLE>
    </TD>
  </TR>
  <TR>
                <%@include file="bottommenu.html"%>
                    </TR>

  </TBODY> 
</TABLE>
</BODY></HTML>
