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
marginwidth="0"  height="100%"><FONT color=#000000></FONT>
<TABLE border=0 cellPadding=0 cellSpacing=0 width=760 bgcolor="#FFFFFF" align="center">
  <TBODY> 
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
            <p><%@include file="directory.html"%></p>
            <p><%@include file="shopping.html"%></p> 
			<P><P><BR><BR>
          </TD>
		  <TD bgColor="#ffffff" width="73%"> 
            <CENTER>
			<P><P><BR>

			<% 
boolean send_mail_ok=false;
String  email_in=new String(request.getParameter("email"));   
String  suggestion=MS874ToUnicode(new String(request.getParameter("suggestion")));
//send email
		Properties props = new Properties();
		props.put("mail.smtp.host", "chaokhun.kmitl.ac.th");
		Session s = Session.getInstance(props,null);

		MimeMessage message = new MimeMessage(s);

		InternetAddress from = new InternetAddress(email_in);
		message.setFrom(from);
		String toAddresses = "pinkladyling@yahoo.com";
		message.addRecipients(Message.RecipientType.TO, toAddresses);
 		message.setSubject("คำถามและข้อคิดเห็น");
		message.setText(suggestion);

		Transport.send(message);
     
	     send_mail_ok=true;
 if(send_mail_ok){
%><P><P>
ข้อคิดเห็นของคุณถูกส่งไปยังผู้ดูและระบบเรียบร้อยแล้ว
<BR> <A HREF="index.jsp">กลับไปหน้าแรก</A>
<% 
	}else{
%>
<P><P>
ไม่สามารถส่งข้อคิดเห็นและข้อแนะนำได้ <BR>&nbsp;&nbsp; <A HREF="index.jsp">กลับไปหน้าแรก</A>
	<%
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
