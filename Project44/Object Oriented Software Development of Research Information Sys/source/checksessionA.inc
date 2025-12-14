<% 
String login = (String) session.getAttribute("ISLOGIN");
String grp = (String) session.getAttribute("GRP");

if ( (login == null) || (login.equals("false") ) && (!grp.equals("a") )  ) 
{
login = "false";
session.putValue("ISLOGIN", login);
response.sendRedirect("Login.jsp");
}
%>
