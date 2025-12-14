<%@ page session="true" %>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<% session.invalidate(); %>
<wml>
	<card id="logout">
	<p>Logout complete!</p>
	<p><a href="login.jsp">Login</a><br/></p>
	</card>
</wml>
<% } %>