<jsp:useBean id="appointment_requestedde" class="appointment.appointment_requestedde" scope="session"/>
<jsp:setProperty name="appointment_requestedde" property="appointment_reschedule" param="reschedule_id" />
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="appointment_requestedde" property="name" value="<%=username%>"/>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="main" title="Detail">
	<do type="accept" label="Accept Request">
		<go href="<%=response.encodeURL("appointment_accept.jsp")%>" method="post">
			<postfield name="request_hour_time" value="$request_hour_time"/>
			<postfield name="request_hour_to" value="$request_hour_to"/>
			<postfield name="reschedule_id" value="<%=request.getParameter("reschedule_id")%>"/>

		</go>
	</do>	
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
			<prev/>
	</do>
		<% if ( appointment_requestedde.Valid() ) { %>
				<% appointment_requestedde.select(); %>
		
		<%
			String date= appointment_requestedde.getDate();
			String month=appointment_requestedde.getMonth();
			String year=appointment_requestedde.getYear();
			String hour_time=appointment_requestedde.getHour_time();
			String minute_time=appointment_requestedde.getMinute_time();
			String hour_to=appointment_requestedde.getHour_to();
			String minute_to=appointment_requestedde.getMinute_to();
			String ahour=appointment_requestedde.getAhour();
			String aminute=appointment_requestedde.getAminute();
			String title=appointment_requestedde.getTitle();
			String detail=appointment_requestedde.getDetail();
		%>
			
		<p>
		In <%=date%>-<%=month%>-<%=year%><br/>	
		have group schedule but your schedule is conflict.<br/>
		Please select time from <%=hour_time%>:<%=minute_time%> to <%=hour_to%>:<%=minute_to%><br/>
		for <%=ahour%>:<%=aminute%>.<br/>
		----------------------------<br/>
		</p>
		<p>
		Select start time<br/>
			hour:<input name="request_hour_time"  format="*N" maxlength="2"/> 
			minute:
			<select name="request_minute_time" value="0">
				<option value="0">0</option>
				<option value="15">15</option>
				<option value="30">30</option>
				<option value="45">45</option>
			</select>	<br/>
		</p>

		<% } else { %>
		<p>	 
				Invalid
		</p>
		<% } %>
	</card>
</wml>
<% appointment_requestedde.cleanup();%>
<% } %>