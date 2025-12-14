<jsp:useBean id="teamworkuns" class="teamwork.unsub" scope="session"/>
<jsp:setProperty name="teamworkuns" property="teamwork_gname" param="gname" />
<jsp:setProperty name="teamworkuns" property="teamwork_oname" param="oname" />
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="teamworkuns" property="name" value="<%=username%>"/>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="main" title="Unsubscribe">
	<do type="Accept" label="Team Work">
		<go href="<%=response.encodeURL("teamwork.jsp") %>"/>
	</do>
	<do type="prev" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<% if ( teamworkuns.isGroup() ) { %>
				<% teamworkuns.delete(); %>
		<p align="center">
			User <%= session.getValue("userid") %><br/>
		</p>

		<p>
				Unsubscribe Complete
		</p>
		<% } else { %>
		<p>	 
				Improper Delete
		</p>
		<% } %>
	</card>
</wml>
<% teamworkuns.cleanup();%>
<% } %>