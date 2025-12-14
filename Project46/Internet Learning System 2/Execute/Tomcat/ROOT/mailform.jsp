<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*" %>
<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
<%
		String forget=request.getParameter("forget");
		if(forget!=null)
		{
			
			String email = request.getParameter("email");
			if(email.equals("") || email.indexOf('@')==-1 || email.indexOf('.')==-1)
			{
				out.println("<center><font color=red size=2>ตรวจสอบอีเมล์แอ86Iรสให้ถูกต้อง</font></center>");
			}
			Properties props = new Properties();
			props.put("mail.smtp.host","161.246.4.3");
			Session s = Session.getInstance(props);
			Message message = new MimeMessage(s);

			InternetAddress from = new InternetAddress ("akrs33@hotmail.com");
			InternetAddress to = new InternetAddress(email);
			
			message.setFrom(from);
			message.setRecipient(Message.RecipientType.TO, to);
				
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
			Statement stmt = mycon.createStatement();
			String sql = "SELECT username,password FROM info WHERE email='"+email+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				message.setSubject("Your username and password");
				message.setText("login :"+rs.getString("username")+",Password :"+rs.getString("password"));
				Transport.send(message);
			out.println("<a href='main.jsp'><center><b>ข้อมูลได้ถูกส่งไปแล้ว</b><center></a>");
			}
			rs.close();
			stmt.close();
			mycon.close();
		}
		if(forget==null)
		{
%>
<html>
<body>
			<center><b>โปรดใส่อีเมลของคุณเพื่อทางเราจะแจ้งรหัสกลับไป</b><br>
			<table width="100%"  border="0" cellpadding="0" cellspacing="0"  border="1">
			<form name="forget" method="post" action="mailform.jsp">
			 <tr>
			 <td align="center">E-mail:<input type="text" name="email"> </td>
			 </tr>
			 </table>
			 <input name="forget" type="submit"   value="ถูกต้อง" border="0">
			</form>
			</center>
	<%
		}
	%>
</body>
</html>