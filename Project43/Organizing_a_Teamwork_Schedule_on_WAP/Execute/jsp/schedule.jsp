<%@ page session="true" %>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="main" title="Schedule">
		<do type="prev" label="Back">
			<prev/>
		</do>

		<p>
			<a href="<%=response.encodeURL("schedule_viewmanual.jsp")%>">View </a><br/>
			<a href="<%=response.encodeURL("schedule_addmanual.jsp")%>">Add</a><br/>
			<a href="<%=response.encodeURL("schedule_deletemanual.jsp")%>">Delete</a><br/>
			<!--<a href="<%=response.encodeURL("schedule_viewevery.jsp")%>">View every</a><br/>
			<a href="<%=response.encodeURL("schedule_addevery.jsp")%>">Add every</a><br/>
			<a href="<%=response.encodeURL("schedule_deleteevery.jsp")%>">Delete every</a><br/>-->
		</p>
	</card>
</wml>
<% } %>
