<jsp:useBean id="teamworkde" class="teamwork.delete" scope="session"/>
<jsp:setProperty name="teamworkde" property="teamwork_gname" param="gname" />
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="teamworkde" property="name" value="<%=username%>"/>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="main" title="Group Delete">
	<do type="Accept" label="Team Work">
		<go href="<%=response.encodeURL("teamwork.jsp") %>"/>
	</do>
	<do type="prev" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
		<% if ( teamworkde.isGroup() ) { %>
				<% teamworkde.delete(); %>


		<p>
				Delete Complete
		</p>
		<% } else { %>
		<p>	 
				Improper Delete
		</p>
		<% } %>
	</card>
</wml>
<% teamworkde.cleanup();%>
<% } %>