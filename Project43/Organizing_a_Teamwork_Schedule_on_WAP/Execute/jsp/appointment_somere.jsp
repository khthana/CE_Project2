<jsp:useBean id="appointment_somere" class="appointment.appointment_somere" scope="session"/>

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
<jsp:setProperty name="appointment_somere" property="name" value="<%=username%>"/>
<jsp:setProperty name="appointment_somere" property="gname" value="<%=gname%>"/>
<jsp:setProperty name="appointment_somere" property="appointment_date" value="<%=date%>"  />
<jsp:setProperty name="appointment_somere" property="appointment_month" value="<%=month%>"  />
<jsp:setProperty name="appointment_somere" property="appointment_year" value="<%=year%>"  />
<jsp:setProperty name="appointment_somere" property="appointment_hour_time" value="<%=hour_time%>"  />
<jsp:setProperty name="appointment_somere" property="appointment_minute_time" value= "<%=minute_time%>"  />
<jsp:setProperty name="appointment_somere" property="appointment_hour_to" value="<%=hour_to%>"  />
<jsp:setProperty name="appointment_somere" property="appointment_minute_to" value="<%=minute_to%>"  />
<jsp:setProperty name="appointment_somere" property="appointment_ahour" value="<%=ahour%>"  />
<jsp:setProperty name="appointment_somere" property="appointment_aminute" value="<%=aminute%>"  />

<jsp:setProperty name="appointment_somere" property="nomem" param="nomem"  />
<% session.putValue("appointment_nomem",request.getParameter("nomem")); %>
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
	<% if (appointment_somere.Valid()) { %>
		<%if ( appointment_somere.foundtime()) {%>
			<% for (int i = 0; i <appointment_somere.size() ; i++) {%>
					<%
						String _getLink = appointment_somere.getLink(i);
						String _showLink = appointment_somere.showLink(i);
					%>
				<a href ="<%=response.encodeURL(_getLink)%>"> <%=_showLink%></a><br/>
			<% } %>

		<% } else { %>
		Not found proper time to request<br/>

		<% } %>

	<% } else { %>
		error member
	<% } %>
	</p>
	<% appointment_somere.cleanup();%>
		</card>
</wml>
<% } %>