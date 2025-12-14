<%@ page session="true" %>
<%
if(session.isNew())
{
	session.setAttribute("username","Guest");
	session.setAttribute("type","Guest");
	session.setAttribute("UID","0");
}
%>