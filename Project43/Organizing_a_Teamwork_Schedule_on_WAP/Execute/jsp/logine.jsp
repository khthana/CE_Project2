<jsp:useBean id="logind" class="user.login" scope="session"/>
<jsp:setProperty name="logind" property="name" param="name"  />
<jsp:setProperty name="logind" property="password" param="password" />
<%@ page language="java" contentType="text/vnd.wap.wml" %>

<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 

<wml>
	<card id="add">
	<do type="accept" label="Login">
		<go href="login.jsp" method="post"/>
	</do>
		<% if (logind.check()) { %>
		<% session.putValue("userid",request.getParameter("name")); %>
			<jsp:forward page="main.jsp"/>
		<p> Login complete </p>
		<p><a href="<%=response.encodeURL("main.jsp")%>">Main</a></p>
		<p><%= session.getId() %></p>
		<% } else { %>
		<p>
			Wrong ! Try <a href="login.jsp">Login</a> again.
		</p>
		<% } %>
	</card>
</wml>
<% logind.cleanup(); %>