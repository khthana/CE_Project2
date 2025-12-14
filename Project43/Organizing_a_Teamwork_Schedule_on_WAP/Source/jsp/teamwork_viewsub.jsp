<jsp:useBean id="teamworkvs" class="teamwork.viewsub" scope="session"/>
<% String username=(String)session.getValue("userid");%>
<jsp:setProperty name="teamworkvs" property="name" value="<%=username%>"/>

<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="view" title="Subscribe Group ">
		<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
	<% teamworkvs.select(); %>
	<%while (teamworkvs.next()) {%>

	<%
		 String _gname = teamworkvs.getGname();
		 String _oname = teamworkvs.getOname();
	%>
	<%=_gname %> - <%=_oname%> 
	
	<br/>
	<% } %>
	<% teamworkvs.cleanup();%>
	</p>
		</card>
</wml>
<% } %>