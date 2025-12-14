<jsp:useBean id="teamwork" class="teamwork.add" scope="session"/>
<jsp:setProperty name="teamwork" property="teamwork_gname" param="teamwork_gname"  />
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="teamwork" property="name" value="<%=username%>" />
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="add" title="Group Add">
	<do type="Accept" label="Team Work">
		<go href="<%=response.encodeURL("teamwork.jsp") %>"/>
	</do>
	<do type="Accepts" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>
	<% if ( teamwork.isGname() ) { %>
		<p> Group Name is alredy exit </p>
	<% } else { %>
		<% teamwork.insert(); %>
		<p>
				Add sucsessfull.
		</p>
	<% } %>
		</card>
</wml>
<% teamwork.cleanup(); %>
<% } %>