 <jsp:useBean id="teamworkd" class="teamwork.viewdelete" scope="session"/>
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="teamworkd" property="name" value="<%=username%>"/>

<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="delete" title="Group delete">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
	<% teamworkd.select(); %>
	<%while (teamworkd.next()) {%>

	<%
		String Gname =teamworkd.getGname();
	%>
	<a href="<%=response.encodeURL(teamworkd.getLink())%>"><%=teamworkd.getShowlink()%> 
	
	</a><br/>
	<% } %>
	<% teamworkd.cleanup();%>
	</p>
		</card>
</wml>
<% } %>