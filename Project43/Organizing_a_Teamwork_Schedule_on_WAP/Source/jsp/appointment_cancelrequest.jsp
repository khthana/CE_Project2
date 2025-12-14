<jsp:useBean id="appointment_cancel" class="appointment.appointment_cancel" scope="session"/>
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="appointment_cancel" property="name" value="<%=username%>"/>

<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="view" title="Select Group">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
	<% appointment_cancel.select(); %>
	</p>
	<p>
	<%while (appointment_cancel.next()) {%>

	<%
		String _gname =appointment_cancel.getGname();
	%>
	<a href="<%=response.encodeURL(appointment_cancel.getLink())%>"><%=_gname%></a><br/>
	<% } %>
	<% appointment_cancel.cleanup();%>
	</p>
		</card>
</wml>
<% } %>