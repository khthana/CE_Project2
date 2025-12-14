<jsp:useBean id="appointment_newe" class="appointment.appointment_newe" scope="session"/>
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="appointment_newe" property="name" value="<%=username%>"/>
<jsp:setProperty name="appointment_newe" property="gname" param="gname"/>
<jsp:setProperty name="appointment_newe" property="appointment_date" param="appointment_date"  />
<jsp:setProperty name="appointment_newe" property="appointment_month" param="appointment_month"  />
<jsp:setProperty name="appointment_newe" property="appointment_year" param="appointment_year"  />
<jsp:setProperty name="appointment_newe" property="appointment_hour_time" param="appointment_hour_time"  />
<jsp:setProperty name="appointment_newe" property="appointment_minute_time" param="appointment_minute_time"  />
<jsp:setProperty name="appointment_newe" property="appointment_hour_to" param="appointment_hour_to"  />
<jsp:setProperty name="appointment_newe" property="appointment_minute_to" param="appointment_minute_to"  />
<jsp:setProperty name="appointment_newe" property="appointment_ahour" param="appointment_ahour"  />
<jsp:setProperty name="appointment_newe" property="appointment_aminute" param="appointment_aminute"  />
<jsp:setProperty name="appointment_newe" property="appointment_title" param="appointment_title"  />
<jsp:setProperty name="appointment_newe" property="appointment_detail" param="appointment_detail"  />

<% session.putValue("appointment_year",request.getParameter("appointment_year")); %>
<% session.putValue("appointment_month",request.getParameter("appointment_month")); %>
<% session.putValue("appointment_date",request.getParameter("appointment_date")); %>
<% session.putValue("appointment_hour_time",request.getParameter("appointment_hour_time")); %>
<% session.putValue("appointment_minute_time",request.getParameter("appointment_minute_time")); %>
<% session.putValue("appointment_hour_to",request.getParameter("appointment_hour_to")); %>
<% session.putValue("appointment_minute_to",request.getParameter("appointment_minute_to")); %>
<% session.putValue("appointment_ahour",request.getParameter("appointment_ahour")); %>
<% session.putValue("appointment_aminute",request.getParameter("appointment_aminute")); %>
<% session.putValue("appointment_title",request.getParameter("appointment_title")); %>
<% session.putValue("appointment_detail",request.getParameter("appointment_detail")); %>

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
	<% if (appointment_newe.isValid()) { %>
		<%if ( appointment_newe.foundtime()) {%>
			<% for (int i = 0; i <appointment_newe.size() ; i++) {%>
					<%
						String _getLink = appointment_newe.getLink(i);
						String _showLink = appointment_newe.showLink(i);
					%>
				<a href ="<%=response.encodeURL(_getLink)%>"> <%=_showLink%></a><br/>
			<% } %>

		<% } else { %>
		Not found time.<br/>
		
		<a href ="<%=response.encodeURL("appointment_some.jsp")%>">[Request to one]</a><br/>
		<a href ="<%=response.encodeURL("appointment_force.jsp")%>">[Force to all]</a><br/>


		<% } %>
	<% } else { %>
	error in <%= appointment_newe.getError() %>
	<% } %>
	</p>
	<% appointment_newe.cleanup();%>
		</card>
</wml>
<% } %>