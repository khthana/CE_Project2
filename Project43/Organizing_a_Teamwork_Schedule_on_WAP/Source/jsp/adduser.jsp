<%@ page session="true" %>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %> 
<wml>
	<card id="adduser">
	<do type="accept" label="Add">
		<go href="addusere.jsp" method="get">
			<postfield name="username" value="$username"/>
		</go>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>
		<p>
			Username :<input name="username" maxlength="20"/><br/>
		</p>
	</card>
</wml>
<% } %>