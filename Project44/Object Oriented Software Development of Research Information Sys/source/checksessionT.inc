<% 
String login = (String) session.getAttribute("ISLOGIN");
String grp = (String) session.getAttribute("GRP");
//String effid = (String) session.getAttribute("EFFID");
if ( ( login == null) || (login.equals("false") ) && (!grp.equals("t") )  ) 
{
login = "false";
session.putValue("ISLOGIN", login);
response.sendRedirect("Login.jsp");
}
%>
