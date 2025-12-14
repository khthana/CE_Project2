<%@ page contentType="text/html; charset=TIS-620" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*" %>
<%
		Properties props = new Properties();
		props.put("mail.smtp.host","161.246.4.3");
		Session s = Session.getInstance(props);
		Message message = new MimeMessage(s);

		InternetAddress from = new InternetAddress ("akrs33@hotmail.com");
		StringTokenizer st = new StringTokenizer(request.getParameter("to"),",");
		int num = st.countTokens();
		InternetAddress[] to = new InternetAddress[num];
		for(int i=0;i<num;i++)
		{
			to[i] = new InternetAddress(st.nextToken());
		}
		message.setFrom(from);
		message.setRecipients(Message.RecipientType.TO, to);
		message.setSubject(request.getParameter("Subject"));
		message.setText(request.getParameter("detail"));
		Transport.send(message);
%>
<html>
<body>
			<center><b>ส่งเมล์เรียบร้อยแล้ว</b><br>
			<a href="mailform.html">Send new message</a></center>
</body>
</html>