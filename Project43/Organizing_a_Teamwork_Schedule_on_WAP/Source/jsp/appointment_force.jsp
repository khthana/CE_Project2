<%@ page session="true" %>
<% String username=(String)session.getValue("userid");%>
<%String gname=(String)session.getValue("appointment_gname");%>
<%String year=(String)session.getValue("appointment_year");%>
<%String month=(String)session.getValue("appointment_month");%>
<%String date=(String)session.getValue("appointment_date");%>
<%String title=(String)session.getValue("appointment_title");%>
<%String detail=(String)session.getValue("appointment_detail");%>


<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="main" title="Force time">
		<do type="accept" label="Force">
		<go href="<%=response.encodeURL("appointment_forcee.jsp")%>" method="post">
			<postfield name="gname" value="<%= gname %>"/>
			<postfield name="appointment_date" value="$force_date"/>
			<postfield name="appointment_month" value="$force_month"/>
			<postfield name="appointment_year" value="$force_year"/>
			<postfield name="appointment_hour_time" value="$force_hour_time"/>
			<postfield name="appointment_hour_to" value="$force_hour_to"/>
			<postfield name="appointment_minute_time" value="$force_minute_time"/>
			<postfield name="appointment_minute_to" value="$force_minute_to"/>
			<postfield name="appointment_title" value="<%=title%>"/>
			<postfield name="appointment_detail" value="<%=detail%>"/>
		</go>
	</do>
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
			Date :<input name="force_date" format="*N" maxlength="2" value="<%=date%>"/><br/>
			Month :<input name="force_month" format="*N" maxlength="2 " value ="<%=month%>"/><br/>
			Year :<input name="force_year"  format="4N" value="<%=year%>"/><br/>
			-----From Time----- <br/>
			hour :<input name="force_hour_time"  format="*N" maxlength="2" /> 
			minute:
			<select name="force_minute_time" value="0">
				<option value="0">0</option>
				<option value="15">15</option>
				<option value="30">30</option>
				<option value="45">45</option>
			</select>	<br/>
			-----To Time-----<br/>
			hour :<input name="force_hour_to"  format="*N" maxlength="2"/> 
			minute:
			<select name="force_minute_to" value="0">
				<option value="0">0</option>
				<option value="15">15</option>
				<option value="30">30</option>
				<option value="45">45</option>
			</select><br/>
			title : <%=title%><br/>
			detail : <%=detail%><br/>

	</p>
		</card>
</wml>
<% } %>