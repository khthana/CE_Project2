<%@ page contentType="text/html; charset=windows-874" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*" %>
<%
		Properties props = new Properties();
		props.put("mail.smtp.host","161.246.4.3");
		Session s = Session.getInstance(props);
		Message message = new MimeMessage(s);

		InternetAddress from = new InternetAddress (request.getParameter("from_email"));
		InternetAddress to = new InternetAddress("yajok_su@hotmail.com");

		message.setFrom(from);
		message.setRecipient(Message.RecipientType.TO, to);
		message.setSubject(request.getParameter("name"));
		message.setText(request.getParameter("message"));
		Transport.send(message);
%>
<html>
<body>
			<center><b>ส่งเมล์เรียบร้อยแล้ว</b><br>	
			<a href="main.jsp">กลับหน้าหลัก</a></center>
</body>
</html>