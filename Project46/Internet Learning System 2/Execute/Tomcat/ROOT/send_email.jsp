<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*" %>

<html>
<head>
<title>Send an email with jsp page</title>
</head>
<body bgcolor="#C0C0C0" text="#CC0000" >

<%


if(request.getMethod().equals("POST")  )
{
  boolean status = true;


  // enter here the smtp mail server address
  // ask your ISP to get the proper name
  
  String mailServer = "xxxx.yyy.com";


  String fromEmail    = request.getParameter("from");
  String toEmail      = request.getParameter("to");
  String messageEnter = request.getParameter("message");

  if(toEmail.equals("") )
       toEmail = "unknown";
 
  try
  {

    Properties props = new Properties();



    props.put("mail.smtp.host", mailServer);
    Session s = Session.getInstance(props,null);
    MimeMessage message = new MimeMessage(s);
    InternetAddress from = new InternetAddress(fromEmail);
    message.setFrom(from);
    InternetAddress to = new InternetAddress(toEmail);
    message.addRecipient(Message.RecipientType.TO, to);
    message.setSubject("Send Email with jsp");
    message.setText(messageEnter);
    Transport.send(message);
  }
  catch(NullPointerException n)
  {
     System.out.println(n.getMessage() );
     out.println("ERROR, you need to enter a message");
     status = false;

  }
  catch (Exception e)
  {
     System.out.println(e.getMessage() );
     out.println("ERROR, your message to " + toEmail + " failed, reason is: " + e);
     status = false;

  }

  if (status == true)
  {
     out.println("Your message to " + toEmail + " was sent successfully!");
  }
}
else
{
%>

<h1>Send Email with jsp</h1>
<form method="post" name="mail" action="mail.jsp">
<table BORDER="0">
<tr>
    <td>To :</td>
    <td><input type="text" name="to" size=24></td>
</tr>

<p>

<tr>
    <td>From :</td>
    <td><input type="text" name="from" size=24></td>
</tr>

<p>

<tr>
    <td>Message :</td>
    <td><TEXTAREA name="message" ROWS = "5" COLS="65"></TEXTAREA></td>
</tr>

</table>
<p>

<font face="Helvetica"><input type="submit"
  value="Submit" name="Command">
</font>

</form>

<%
}
%>

</body>
</html>
