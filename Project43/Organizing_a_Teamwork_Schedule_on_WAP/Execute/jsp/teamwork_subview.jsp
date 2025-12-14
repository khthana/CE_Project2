<jsp:useBean id="teamworksv" class="teamwork.subview" scope="session"/>
<jsp:setProperty name="teamworksv" property="sub_name" param="sub_name" />
<% String username=(String)session.getValue("userid");%>
<jsp:setProperty name="teamworksv" property="name" value="<%=username%>"/>

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

	<% teamworksv.select(); %>
	<%while (teamworksv.next()) {%>

	<%
		 String link = teamworksv.getGname();
	%>
 	<a href="<%=response.encodeURL(teamworksv.getLink())%>" title="Subscribe" ><%=link %> 
	
	</a><br/>
	<% } %>
	<% teamworksv.cleanup();%>
	</p>
		</card>
</wml>
<% } %>