<jsp:useBean id="appointment_tranfer" class="appointment.appointment_tranfer" scope="session"/>
<%String username=(String)session.getValue("userid");%>
<%String date=(String)session.getValue("tdate");%>
<%String month=(String)session.getValue("tmonth");%>
<%String year=(String)session.getValue("tyear");%>
<%String hour_time=(String)session.getValue("thour_time");%>
<%String minute_time=(String)session.getValue("tminute_time");%>
<%String hour_to=(String)session.getValue("thour_to");%>
<%String minute_to=(String)session.getValue("tminute_to");%>
<%String title=(String)session.getValue("ttitle");%>
<%String detail=(String)session.getValue("tdetail");%>
<jsp:setProperty name="appointment_tranfer" property="name" value="<%=username%>"/>
<jsp:setProperty name="appointment_tranfer" property="appointment_date" value="<%=date%>"/>
<jsp:setProperty name="appointment_tranfer" property="appointment_month" value="<%=month%>"/>
<jsp:setProperty name="appointment_tranfer" property="appointment_year" value="<%=year%>"/>
<jsp:setProperty name="appointment_tranfer" property="appointment_hour_time" value="<%=hour_time%>"/>
<jsp:setProperty name="appointment_tranfer" property="appointment_minute_time" value="<%=minute_time%>"/>
<jsp:setProperty name="appointment_tranfer" property="appointment_hour_to" value="<%=hour_to%>"/>
<jsp:setProperty name="appointment_tranfer" property="appointment_minute_to" value="<%=minute_to%>"/>
<jsp:setProperty name="appointment_tranfer" property="appointment_title" value="<%=title%>"/>
<jsp:setProperty name="appointment_tranfer" property="appointment_detail" value="<%=detail%>"/>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="main" title="Tranfer">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>

	<do type="prev" label="Back">
			<prev/>
	</do>
		<% if ( appointment_tranfer.Valid() ) { %>
				<%appointment_tranfer.insert();%>
		<p >
			Tranfer sucessfull.
		</p>
		<% } else { %>
		<p>	 
			Schedule has overlap other schedule.
		</p>
		<% } %>
	</card>
</wml>
<% appointment_tranfer.cleanup();%>
<% } %>