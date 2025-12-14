<jsp:useBean id="appointment_viewde" class="appointment.appointment_viewde" scope="session"/>
<jsp:setProperty name="appointment_viewde" property="appointment_htime" param="htime" />
<jsp:setProperty name="appointment_viewde" property="appointment_mtime" param="mtime" />
<jsp:setProperty name="appointment_viewde" property="appointment_hto" param="hto" />
<jsp:setProperty name="appointment_viewde" property="appointment_mto" param="mto" />
<jsp:setProperty name="appointment_viewde" property="appointment_date" param="date" />
<jsp:setProperty name="appointment_viewde" property="appointment_month" param="month" />
<jsp:setProperty name="appointment_viewde" property="appointment_year" param="year" />
<jsp:setProperty name="appointment_viewde" property="gid" param="gid" />
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="appointment_viewde" property="name" value="<%=username%>"/>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="main" title="Detail">
		<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
		<p align="center">
			User <%= session.getValue("userid") %><br/>
		</p>

	</card>
</wml>
<% appointment_viewde.cleanup();%>
<% } %>