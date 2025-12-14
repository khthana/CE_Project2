<jsp:useBean id="scheduled" class="schedule.detail" scope="session"/>
<jsp:setProperty name="scheduled" property="schedule_htime" param="htime" />
<jsp:setProperty name="scheduled" property="schedule_mtime" param="mtime" />
<jsp:setProperty name="scheduled" property="schedule_hto" param="hto" />
<jsp:setProperty name="scheduled" property="schedule_mto" param="mto" />
<jsp:setProperty name="scheduled" property="schedule_date" param="date" />
<jsp:setProperty name="scheduled" property="schedule_month" param="month" />
<jsp:setProperty name="scheduled" property="schedule_year" param="year" />
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="scheduled" property="name" value="<%=username%>"/>
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
		<p align="center">
			<jsp:getProperty name="scheduled" property="schedule_htime"/>:<jsp:getProperty name="scheduled" property="schedule_mtime"/> - <jsp:getProperty name="scheduled" property="schedule_hto"/>:<jsp:getProperty name="scheduled" property="schedule_mto"/> <br/>
		</p>
		<p>
			<% scheduled.select(); %>
			<% scheduled.next(); %>
			title : <jsp:getProperty name="scheduled" property="title"/><br/>
			detail :
			<jsp:getProperty name="scheduled" property="detail"/>

		</p>
	</card>
</wml>
<% scheduled.cleanup();%>
<% } %>