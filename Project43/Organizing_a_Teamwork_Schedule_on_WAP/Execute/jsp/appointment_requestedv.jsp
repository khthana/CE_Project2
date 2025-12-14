 <jsp:useBean id="appointment_requestedv" class="appointment.appointment_requestedv" scope="session"/>
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="appointment_requestedv" property="name" value="<%=username%>"/>

<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="main" title="Title: :Group: :Leader">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
	
	<% appointment_requestedv.select(); %>
	<%while (appointment_requestedv.next()) {%>

	<%
		String _title =appointment_requestedv.getTitle();
		String _gname =appointment_requestedv.getGname();
		String _oname =appointment_requestedv.getOname();
	%>
	<a href="<%=response.encodeURL(appointment_requestedv.getLink())%>"><%=_title%>: :<%=_gname%>: :<%=_oname%></a><br/>
	<% } %>
	<% appointment_requestedv.cleanup();%>
	</p>
		</card>
</wml>
<% } %>