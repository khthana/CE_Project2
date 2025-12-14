<%@ page session="true" %>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="schdule" title="teamwork">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
		<do type="prev" label="Back">
			<prev/>
		</do>
		<p>
			<a href="<%=response.encodeURL("teamwork_view.jsp")%>">View Group</a><br/>
			<a href="<%=response.encodeURL("teamwork_add.jsp")%>">Add Group</a><br/>
			<a href="<%=response.encodeURL("teamwork_delete.jsp")%>">Delete Group</a><br/>
			<a href="<%=response.encodeURL("teamwork_sub.jsp")%>">Subscribe Group</a><br/>
			<a href="<%=response.encodeURL("teamwork_unsub.jsp")%>">Unsubscribe Group</a><br/>
			<a href="<%=response.encodeURL("teamwork_viewsub.jsp")%>">View Subscribe Group</a><br/>
		</p>
	</card>
</wml>
<% } %>
