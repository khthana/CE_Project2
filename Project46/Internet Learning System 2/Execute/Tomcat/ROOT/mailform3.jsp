<html>
<body>
<%@ page contentType="text/html; charset=TIS-620" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*" %>
<%
		try
		{
			String mto =request.getParameter("to");
			String mfrom = request.getParameter("from");
			String msubject = new  String(request.getParameter("subject").getBytes("ISO8859_1"),"TIS-620");
			String mdetail = new  String(request.getParameter("detail").getBytes("ISO8859_1"),"TIS-620");
			mail(mto,mfrom,msubject,mdetail);
			out.println("<center><b>Mail has already been sent</b></center>");
		}
			catch(AddressException e)
		{
			out.println("<center><b>รูปแบบของอีเมล์แอดเดรสไม่ถูกต้อง</b></center>");
		}
			catch(MessagingException e)
		{
			out.println("<center><b>ไม่สามารถส่งอีเมล์ได้</b></center>");
		}
%>
<%!
public void mail(String mto, String mfrom, String msubject, String mdetail)
			throws AddressException, MessagingException {
			Properties props = new Properties();
			props.put("mail.smtp.host","161.246.4.3");
			Session s = Session.getInstance(props);
			
			InternetAddress from = new InternetAddress (request.getParameter("mfrom"));
			StringTokenizer st = new StringTokenizer(request.getParameter(mto,",");
			int num = st.countTokens();
			InternetAddress[] to = new InternetAddress[num];
			for(int i=0;i<num;i++)
			{
				to[i] = new InternetAddress(st.nextToken());
			}
			
			Message message = new MimeMessage(s);
			message.setFrom(from);
			message.setRecipients(Message.RecipientType.TO, to);
			message.setSubject(msubject);
			message.setText(mdetail);
			Transport.send(message);
%>
</body>
</html>