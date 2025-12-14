<%@ page session="true" %>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="schdule" title="Message">
		<do type="prev" label="Back">
			<prev/>
		</do>
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
		<p>
			<a href="<%=response.encodeURL("massage_viewm.jsp")%>">View</a><br/>
			<a href="<%=response.encodeURL("massage_sendm.jsp")%>">Send</a><br/>
			<a href="<%=response.encodeURL("massage_deletem.jsp")%>">Delete</a><br/>
		</p>
	</card>
</wml>
<% } %>
