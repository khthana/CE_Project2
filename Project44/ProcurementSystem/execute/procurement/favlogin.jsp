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
		     <CENTER>
			
<%
	String passwd=new String(request.getParameter("passwd"));
	String username=new String(request.getParameter("username"));

	
	int zero=0;
	boolean hasExplicit=false;


     if ( username.length()==0 || passwd.length()==0 ){
	 hasExplicit=false;
	}else { hasExplicit=true;}	
	 if(!hasExplicit){
    out.println("<b><div align=\"center\">ยังกรอกข้อความไม่ครบถ้วน กรุณาย้อน<A HREF=\"favorite.jsp\">กลับไป 1 หน้า</A>เพื่อทำการแก้ไข</div></b>");
	}else{
       
     // ส่วนจัดการ DB ของ Oracle
		 try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
                Statement stmt = con.createStatement();
				String query="SELECT * FROM EMPLOYEE WHERE EMP#='"+username+"' AND PASSWD='"+passwd+"'" ;
						System.out.println(query);
		
				ResultSet tmp = stmt.executeQuery(query) ;
				if ( tmp.next() )    { // code html ของหน้าหลักกรณีพาสเวิร์ดถูกต้อง 

			//	String id=tmp.getString("EMP#");
				String name=MS874ToUnicode(new String(tmp.getString("NAME")));
				String sname=MS874ToUnicode(new String(tmp.getString("SNAME")));
				String dept=MS874ToUnicode(new String(tmp.getString("DEPT")));
				String level=tmp.getString("LEVEL#");
				
				session.setAttribute("emp",username); 
				session.setAttribute("name",name);
				session.setAttribute("sname",sname);
				session.setAttribute("dept",dept);
				session.setAttribute("passwd",passwd);
				session.setAttribute("level",level);

					String code=(String)session.getAttribute("favcode");
					     if (code == null) {  //ไม่ได้มาจากการ add จะดู  favorite
							//ส่งค่ากลับไปที่หน้า favorite.jsp
							 response.sendRedirect("favorite.jsp");
						 }	else { // login  เพราะ add favorite
						 
						      response.sendRedirect("addtofav.jsp");
						 }		

				
   // กรณีพาสเวิร์ดผิดพลาด
				}	else  {out.println("<b><div align=\"center\">รหัสผ่านผิดพลาด กรุณาย้อน<A HREF=\"favorite.jsp\">กลับไป 1 หน้า</A>เพื่อตรวจสอบรหัสผ่านใหม่ หรือ<A HREF=\"forgetpw.jsp\"> ลืมรหัสผ่าน</A></div></b>");  }
				//END IF;  

				 tmp.close();
				 stmt.close();
		         con.close();
		 }//try
      catch(SQLException e) 
      {
	      while (e != null) 
         {
            out.println("SQLException:<br>");
  		      out.println("Message:   " + e.getMessage() + "<br>");
		      out.println("SQLState:  " + e.getSQLState() + "<br>");
		      out.println("ErrorCode: " + e.getErrorCode() + "<br>");
		      e = e.getNextException();
         }//while
	   }//catch
	}  //if   
		
	%>		
			</CENTER>
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
</BODY>
</HTML>
