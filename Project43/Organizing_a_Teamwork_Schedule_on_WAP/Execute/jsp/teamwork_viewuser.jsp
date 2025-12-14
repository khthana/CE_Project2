<jsp:useBean id="teamworkvu" class="teamwork.viewuser" scope="session"/>
<jsp:setProperty name="teamworkvu" property="gname" param="gname" />
<% String username=(String)session.getValue("userid");%>
<jsp:setProperty name="teamworkvu" property="name" value="<%=username%>"/>
<% session.putValue("tegname",request.getParameter("gname")); %>

<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="view" title="View User in Group ">
		<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
	<% teamworkvu.select(); %>
	<%while (teamworkvu.next()) {%>

	<%
		 String link = teamworkvu.getMember();
	%>
 	<a href="<%=response.encodeURL(teamworkvu.getLink())%>" title="Subscribe" ><%=link %> 
	
	</a><br/>
	<% } %>	<% teamworkvu.cleanup();%>
	</p>
		</card>
</wml>
<% } %>