<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date,java.util.*"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>
<HTML><HEAD><TITLE>:: Online e-Procurement ::</TITLE>
<LINK href="picture/cssomo1.css" rel=stylesheet type=text/css>
<META content="text/html; charset=windows-874" http-equiv=Content-Type>
<LINK href="picture/cssomo1.css" rel=stylesheet type=text/css>
<META content="MSHTML 5.00.2920.0" name=GENERATOR>
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
   <div align="right">  <FONT  COLOR="#658dc1"><B><%@include file="date.txt"%></B></FONT></div>
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
      <TABLE width="100%" cellpadding="0" cellspacing="0" border="0">
        <TR>
		  <TD bgColor="#bfbfbf" width="27%">
            <%@include file="directory.html"%>
             <%@include file="shopping.html"%><P>&nbsp;<P>&nbsp;
          </TD>
		  <TD bgColor="#ffffff" width="73%" vAlign=top> 
            <CENTER><%
    String  id=new String(request.getParameter("id"));
	String name=MS874ToUnicode(new String(request.getParameter("name")));
	String sname=MS874ToUnicode(new String(request.getParameter("sname")));
	String email=new String(request.getParameter("email"));
	String passwd=new String(request.getParameter("passwd"));
    String dept=MS874ToUnicode(new String(request.getParameter("dept")));
//	String  level=new String(request.getParameter("level"));
	String position=MS874ToUnicode(new String(request.getParameter("position")));
	
	boolean checkDB=false;

     // ส่วนจัดการ DB ของ Oracle
		 try {


			    String level= new String();
					if(position.equals("ผู้จัดการฝ่าย")){
						 level="2";
						}
					if(position.equals("ลูกจ้างทั่วไป")){
						level="1";
					   }
                Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
                Statement stmt = con.createStatement();
				String query="UPDATE EMPLOYEE SET LEVEL#='"+level+"',POSITION='"+position+"',PASSWD='"+passwd+"',NAME='"+name+"',SNAME='"+sname+"',EMAIL='"+email+"',DEPT='"+dept+"' WHERE EMP#='"+id+"'" ;
				stmt.executeUpdate(query);
				
				 checkDB=true;
	session.setAttribute("emp",id);
	session.setAttribute("passwd",passwd);
	session.setAttribute("name",name);
	session.setAttribute("sname",sname);
	session.setAttribute("dept",dept);
	session.setAttribute("level",level);
	
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
/*	name=UnicodeToMS874(name);
	sname=UnicodeToMS874(sname);*/
	%>
		<P>&nbsp;<P>&nbsp;<BR>&nbsp<BR>
                    <CENTER>ระบบทำการแก้ไขข้อมูลของ คุณ <B><%=name%> &nbsp; <%=sname%> &nbsp;&nbsp;</B>เรียบร้อยแล้ว<P><A HREF="index.jsp">กลับไปหน้าแรก</A></CENTER>
         
 <%
	 //   response.sendRedirect("index.jsp");
}	
%>
</CENTER></TD>
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
