<%@ page session="true" %>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="addgroup" title="Add Group">
	<do type="accept" label="Add">
		<go href="<%=response.encodeURL("teamwork_add_e.jsp")%>" method="post">
			<postfield name="teamwork_gname" value="$teamwork_gname"/>
		</go>
	</do>
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>
		<p>
			Group Name:<input name="teamwork_gname" maxlength="15"/><br/>						
		</p>
	</card>
</wml>
<% } %>