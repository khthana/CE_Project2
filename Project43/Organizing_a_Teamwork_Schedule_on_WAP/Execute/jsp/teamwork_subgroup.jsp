<jsp:useBean id="teamworksg" class="teamwork.subgroup" scope="session"/>
<jsp:setProperty name="teamworksg" property="teamwork_sname" param="sname" />
<jsp:setProperty name="teamworksg" property="teamwork_oname" param="oname" />
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="teamworksg" property="name" value="<%=username%>"/>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="main" title="Subcribe Group">
	<do type="Accept" label="Team Work">
		<go href="<%=response.encodeURL("teamwork.jsp") %>"/>
	</do>
	<do type="prev" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<% if ( teamworksg.isGroup() ) { %>
					<% if (teamworksg.isMember()) { %>
					<p>  You are already in group </p>
					<% } else { %>
						<%teamworksg.insert();%>
 						<p>	Subscribe complete!</p>
					<% } %>
		<% } else { %>
		<p>	 
				No Group
		</p>
		<% } %>
	</card>
</wml>
<% teamworksg.cleanup();%>
<% } %>