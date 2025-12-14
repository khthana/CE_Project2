<%@ page contentType="text/html; charset=windows-874" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*" %>
<%
	 /* String form = request.getParameter("form");
	  String to = request.getParameter("to");
	  String subject = request.getParameter("subject");
	  String detail = request.getParameter("detail");
	*/	
		Properties props = new Properties();
		props.put("mail.smtp.host","161.246.4.3");
		Session s = Session.getInstance(props);
		Message message = new MimeMessage(s);

		InternetAddress frommail = new InternetAddress (request.getParameter("from"));
		InternetAddress tomail = new InternetAddress(request.getParameter("to"));

		message.setFrom(frommail);
		message.setRecipient(Message.RecipientType.TO, tomail);
		message.setSubject(request.getParameter("subject"));
		message.setText(request.getParameter("detail"));
		Transport.send(message);
%>
<html>
<body background="images/bg.gif">
			<center><b>ส่งเมล์เรียบร้อยแล้ว</b><br>
			<a href="mailform.html">Send new message</a>&nbsp;&nbsp;&nbsp;<a href="membersection.jsp">กลับไปหน้าหลัก</a></center>

</body>
</html>