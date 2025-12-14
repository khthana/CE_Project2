<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*,java.sql.*,java.lang.*" %>

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
   <div align="right">  <FONT  COLOR="#658dc1"><B><%=new Date()%></B></FONT></div>
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
             <%@include file="shopping.html"%><P><P><BR><BR>
          </TD>
		  <TD bgColor="#ffffff" width="73%"> 
            <CENTER>
<% 
boolean send_mail_ok=false;
String  email_in=new String(request.getParameter("email"));   
try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
         Statement stmt = con.createStatement();
		 String query="SELECT * FROM EMPLOYEE WHERE EMAIL='"+email_in+"'";

         ResultSet rs=stmt.executeQuery(query);
         if(rs.next())
	{
         String id=rs.getString("EMP#"); 
		 String passwd=rs.getString("PASSWD");
		 String email=rs.getString("EMAIL");
		 
	
//send email
		Properties props = new Properties();
		props.put("mail.smtp.host", "chaokhun.kmitl.ac.th");
		Session s = Session.getInstance(props,null);

		MimeMessage message = new MimeMessage(s);

		InternetAddress from = new InternetAddress("t3official@yahoo.com");
		message.setFrom(from);
		String toAddresses = email;
		message.addRecipients(Message.RecipientType.TO, toAddresses);
       String subject="รหัสผ่าน";
		message.setSubject(subject);
		String mess="รหัสของคุณ คือ"+id+
			"รหัสผ่านของคุณ คือ "+passwd+"";
		message.setText(mess);

		Transport.send(message);
     //    out.println("ส่งเมลล์แล้ว");
	     send_mail_ok=true;
	     
	}else{//out.println("ไม่มี e-Mail Address ใน DB");
	
	     send_mail_ok=false;
	
	
	}

     	 rs.close();
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
 if(send_mail_ok){
%><P><P>
Password และ Username ของคุณถูกส่งไปยัง E-mail Address เรียบร้อยแล้ว
<BR> <A HREF="index.jsp">กลับไปหน้าแรก</A>
<% 
	}else{
%>
<P><P>
ไม่มี E-mail Addressง ของคุณในฐานข้อมูล กรุณาตรวจสอบ E-mail Address ของคุณอีกครั้ง <BR>
<A HREF="contact.jsp">ติดต่อผู้ดูแลระบบ</A>&nbsp;&nbsp; | &nbsp;&nbsp; <A HREF="index.jsp">กลับไปหน้าแรก</A>
	<%
}	
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
</BODY></HTML>
