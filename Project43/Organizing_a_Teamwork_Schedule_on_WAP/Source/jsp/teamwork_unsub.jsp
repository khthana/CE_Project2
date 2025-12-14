 <jsp:useBean id="teamworkun" class="teamwork.viewunsub" scope="session"/>
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="teamworkun" property="name" value="<%=username%>"/>

<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="delete" title="View Unsubscribe">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
	<% teamworkun.select(); %>
	<%while (teamworkun.next()) {%>

	<%
		String _gname =teamworkun.getGname();
		String _oname =teamworkun.getOname();
	%>
	<a href="<%=response.encodeURL(teamworkun.getLink())%>"><%=_gname%></a> - <%=_oname%><br/>
	<% } %>
	<% teamworkun.cleanup();%>
	</p>
		</card>
</wml>
<% } %>