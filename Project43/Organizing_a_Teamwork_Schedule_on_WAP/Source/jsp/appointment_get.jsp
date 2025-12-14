 <jsp:useBean id="appointment_get" class="appointment.appointment_getview" scope="session"/>
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="appointment_get" property="name" value="<%=username%>"/>

<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="main" title="Get appointment">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
	<% appointment_get.select(); %>
	<%while (appointment_get.next()) {%>

	<%
		String _gname =appointment_get.getGname();
		String _oname =appointment_get.getOname();
	%>
	<a href="<%=response.encodeURL(appointment_get.getLink())%>"><%=_gname%></a> - <%=_oname%><br/>
	<% } %>
	<% appointment_get.cleanup();%>
	</p>
		</card>
</wml>
<% } %>