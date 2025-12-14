<%
String utype = (String)session.getAttribute("type");
if(utype.equals("Customer"))
{
	String username=(String)session.getAttribute("username");
	String type=(String)session.getAttribute("type");
}
else
{
	response.sendRedirect("noauthen.jsp");
}
%>