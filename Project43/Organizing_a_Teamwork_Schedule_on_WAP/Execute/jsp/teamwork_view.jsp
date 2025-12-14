 <jsp:useBean id="teamworkv" class="teamwork.view" scope="session"/>
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="teamworkv" property="name" value="<%=username%>"/>

<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="view" title="Group View">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
	<% teamworkv.select(); %>
	<%while (teamworkv.next()) {%>

	<%
		String _gname =teamworkv.getGname();
	%>
		<a href="<%=response.encodeURL(teamworkv.getLink())%>"><%=_gname%></a><br/>
	<% } %>

	<% teamworkv.cleanup();%>
	</p>
		</card>
</wml>
<% } %>