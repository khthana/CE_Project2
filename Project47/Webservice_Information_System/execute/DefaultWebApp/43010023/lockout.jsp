<%@ page session="true" %>
<%
if(session.isNew())
{
session.setAttribute("username","Guest");
session.setAttribute("type","Guest");
}
session.invalidate();
response.sendRedirect("index.jsp");
%>