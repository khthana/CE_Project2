<jsp:useBean id="appointment_forcee" class="appointment.appointment_force" scope="session"/>
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="appointment_forcee" property="name" value="<%=username%>"/>
<jsp:setProperty name="appointment_forcee" property="gname" param="gname"/>
<jsp:setProperty name="appointment_forcee" property="appointment_date" param="appointment_date"  />
<jsp:setProperty name="appointment_forcee" property="appointment_month" param="appointment_month"  />
<jsp:setProperty name="appointment_forcee" property="appointment_year" param="appointment_year"  />
<jsp:setProperty name="appointment_forcee" property="appointment_hour_time" param="appointment_hour_time"  />
<jsp:setProperty name="appointment_forcee" property="appointment_minute_time" param="appointment_minute_time"  />
<jsp:setProperty name="appointment_forcee" property="appointment_hour_to" param="appointment_hour_to"  />
<jsp:setProperty name="appointment_forcee" property="appointment_minute_to" param="appointment_minute_to"  />
<jsp:setProperty name="appointment_forcee" property="appointment_ahour" param="appointment_ahour"  />
<jsp:setProperty name="appointment_forcee" property="appointment_aminute" param="appointment_aminute"  />
<jsp:setProperty name="appointment_forcee" property="appointment_title" param="appointment_title"  />
<jsp:setProperty name="appointment_forcee" property="appointment_detail" param="appointment_detail"  />

<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="view" title="Select Time">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
	<% if(appointment_forcee.Valid()) { %>
		<% appointment_forcee.insert(); %>
	Force to schedule sucessfull.
	<% } else { %>
	Invalid.
	<% } %>
	<% appointment_forcee.cleanup();%>
	</p>

		</card>
</wml>
<% } %>