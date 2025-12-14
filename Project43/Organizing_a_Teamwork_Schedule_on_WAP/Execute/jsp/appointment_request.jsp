<jsp:useBean id="appointment_request" class="appointment.appointment_request" scope="session"/>

<%String username=(String)session.getValue("userid");%>
<%String gname=(String)session.getValue("appointment_gname");%>
<%String year=(String)session.getValue("appointment_year");%>
<%String month=(String)session.getValue("appointment_month");%>
<%String date=(String)session.getValue("appointment_date");%>
<%String hour_time=(String)session.getValue("appointment_hour_time");%>

<%String minute_time=(String)session.getValue("appointment_minute_time");%>
<%String hour_to=(String)session.getValue("appointment_hour_to");%>
<%String minute_to=(String)session.getValue("appointment_minute_to");%>
<%String ahour=(String)session.getValue("appointment_ahour");%>
<%String aminute=(String)session.getValue("appointment_aminute");%>
<%String title=(String)session.getValue("appointment_title");%>
<%String detail=(String)session.getValue("appointment_detail");%>
<%String nomem=(String)session.getValue("appointment_nomem");%>
<jsp:setProperty name="appointment_request" property="name" value="<%=username%>"/>
<jsp:setProperty name="appointment_request" property="gname" value="<%=gname%>"/>
<jsp:setProperty name="appointment_request" property="appointment_date" value="<%=date%>"  />
<jsp:setProperty name="appointment_request" property="appointment_month" value="<%=month%>"  />
<jsp:setProperty name="appointment_request" property="appointment_year" value="<%=year%>"  />
<jsp:setProperty name="appointment_request" property="appointment_hour_time" param="htime"  />
<jsp:setProperty name="appointment_request" property="appointment_minute_time" param= "mtime"  />
<jsp:setProperty name="appointment_request" property="appointment_hour_to" param="hto"  />
<jsp:setProperty name="appointment_request" property="appointment_minute_to" param="mto"  />
<jsp:setProperty name="appointment_request" property="appointment_ahour" value="<%=ahour%>"  />
<jsp:setProperty name="appointment_request" property="appointment_aminute" value="<%=aminute%>"  />
<jsp:setProperty name="appointment_request" property="appointment_title" value="<%=title%>"  />
<jsp:setProperty name="appointment_request" property="appointment_detail" value="<%=detail%>"  />
<jsp:setProperty name="appointment_request" property="nomem" value="<%=nomem%>"  />



<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="main" title="Request">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Appointment">
		<go href="<%=response.encodeURL("appointment.jsp") %>"/>
	</do>	
	<p>
	<% appointment_request.insert(); %>
	Request to <%= nomem%>
	</p>
	<% appointment_request.cleanup();%>
		</card>
</wml>
<% } %>