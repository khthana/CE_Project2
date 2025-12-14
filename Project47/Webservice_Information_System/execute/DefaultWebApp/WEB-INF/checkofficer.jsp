<%
String utype = (String)session.getAttribute("type");
if(!utype.equals("Officer"))
{
	response.sendRedirect("noauthen.jsp");
}
%>