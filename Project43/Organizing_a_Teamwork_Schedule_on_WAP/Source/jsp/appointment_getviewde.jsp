<jsp:useBean id="appointment_getviewde" class="appointment.appointment_getviewde" scope="session"/>
<jsp:setProperty name="appointment_getviewde" property="appointment_tschedule" param="tschedule" />
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="appointment_getviewde" property="name" value="<%=username%>"/>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="main" title="Detail">
	<do type="Accepts" label="Tranfer to schedule">
		<go href="<%=response.encodeURL("appointment_tranfer.jsp") %>"/>
	</do>
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
			<prev/>
	</do>
		<% if ( appointment_getviewde.Valid() ) { %>
				<% appointment_getviewde.select(); %>
		<p >
		<% 
			String date= appointment_getviewde.getDate();
			String month = appointment_getviewde.getMonth();
			String year = appointment_getviewde.getYear();
			String hour_time = appointment_getviewde.getHour_time();
			String minute_time = appointment_getviewde.getMinute_time();
			String hour_to = appointment_getviewde.getHour_to();
			String minute_to = appointment_getviewde.getMinute_to();
			String title = appointment_getviewde.getTitle();
			String detail = appointment_getviewde.getDetail();
		%>
			<%=date%>-<%=month%>-<%=year%><br/>
			<%=hour_time%>:<%=minute_time%>-<%=hour_to%>:<%=minute_to%><br/>
			-------------title-------------<br/>
			<%=title%><br/>
			------------detail-----------<br/>
			<%=detail%>
		</p>
		<% session.putValue("tdate",date); %>
		<% session.putValue("tmonth",month); %>
		<% session.putValue("tyear",year); %>
		<% session.putValue("thour_time",hour_time); %>
		<% session.putValue("tminute_time",minute_time); %>
		<% session.putValue("thour_to",hour_to); %>
		<% session.putValue("tminute_to",minute_to); %>
		<% session.putValue("ttitle",title); %>
		<% session.putValue("tdetail",detail); %>

		<% } else { %>
		<p>	 
				Invalid
		</p>
		<% } %>
	</card>
</wml>
<% appointment_getviewde.cleanup();%>
<% } %>