<jsp:useBean id="appointment_new_add" class="appointment.appointment_new_add" scope="session"/>
<%String username=(String)session.getValue("userid");%>
<%String gname=(String)session.getValue("appointment_gname");%>
<%String title=(String)session.getValue("appointment_title");%>
<%String detail=(String)session.getValue("appointment_detail");%>
<%String ahour=(String)session.getValue("appointment_ahour");%>
<%String aminute=(String)session.getValue("appointment_aminute");%>
<jsp:setProperty name="appointment_new_add" property="name" value="<%=username%>"/>
<jsp:setProperty name="appointment_new_add" property="gname" value="<%=gname%>"/>
<jsp:setProperty name="appointment_new_add" property="appointment_year" param="year"/>
<jsp:setProperty name="appointment_new_add" property="appointment_month" param="month"/>
<jsp:setProperty name="appointment_new_add" property="appointment_date" param="date"/>
<jsp:setProperty name="appointment_new_add" property="appointment_title" value="<%=title%>"/>
<jsp:setProperty name="appointment_new_add" property="appointment_detail" value="<%=detail%>"/>
<jsp:setProperty name="appointment_new_add" property="appointment_hour_time" param="htime"  />
<jsp:setProperty name="appointment_new_add" property="appointment_minute_time" param="mtime"  />
<jsp:setProperty name="appointment_new_add" property="appointment_hour_to" param="hto"  />
<jsp:setProperty name="appointment_new_add" property="appointment_minute_to" param="mto"  />
<jsp:setProperty name="appointment_new_add" property="appointment_ahour" value="<%=ahour%>"  />
<jsp:setProperty name="appointment_new_add" property="appointment_aminute" value="<%=aminute%>"  />
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="view" title="Select Group">
	<do type="Accept" label="Team Work">
		<go href="<%=response.encodeURL("teamwork.jsp") %>"/>
	</do>
	<do type="Accepts" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
	<% if (appointment_new_add.Valid() ) { %>

		<% appointment_new_add.insert(); %>
			Insert <%= appointment_new_add.getDay()%><br/>
			<%= appointment_new_add.getTime()%> <br/>
			<%= appointment_new_add.getTo()%> <br/>
			
	<% } else { %>
	 Invalid
	<% } %>
	</p>
	<% appointment_new_add.cleanup();%>
		</card>
</wml>
<% } %>

