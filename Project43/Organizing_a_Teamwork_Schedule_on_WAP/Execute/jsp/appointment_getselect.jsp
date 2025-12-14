 <jsp:useBean id="appointment_getselect" class="appointment.appointment_getselect" scope="session"/>
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="appointment_getselect" property="name" value="<%=username%>"/>
<jsp:setProperty name="appointment_getselect" property="gid" param="gid"/>

<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="main" title="Title">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
	<% appointment_getselect.select(); %>
	<%while (appointment_getselect.next()) {%>

	<%
		String _title =appointment_getselect.getTitle();
	%>
	<a href="<%=response.encodeURL(appointment_getselect.getLink())%>"><%=_title%></a><br/>
	<% } %>
	<% appointment_getselect.cleanup();%>
	</p>
		</card>
</wml>
<% } %>