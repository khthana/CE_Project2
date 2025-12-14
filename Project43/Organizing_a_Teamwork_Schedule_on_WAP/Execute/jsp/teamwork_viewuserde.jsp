<jsp:useBean id="teamwork_vude" class="teamwork.teamwork_vude" scope="session"/>
<jsp:setProperty name="teamwork_vude" property="member" param="mem" />
<% String username = (String)session.getValue("userid");%>
<% String gname = (String)session.getValue("tegname");%>
<jsp:setProperty name="teamwork_vude" property="name" value="<%=username%>"/>
<jsp:setProperty name="teamwork_vude" property="gname" value="<%=gname%>"/>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="main" title="Detail ">
		<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
	<%if ( teamwork_vude.Valid()) { %>
		<% teamwork_vude.select() ; %>
		<% 
				String user_name=teamwork_vude.getUser_name();
				String nicname=teamwork_vude.getNicname();
				String uname=teamwork_vude.getUname();
				String surname=teamwork_vude.getSurname();
				String telephone=teamwork_vude.getTelephone();
		%>
			User name : <%=user_name%><br/>
			Nicname : <%=nicname%><br/>
			Name : <%=uname%><br/>
			Surname : <%=surname%><br/>
			Telephone : <%=telephone%><br/>

			
	<% } else{%>	
	Invalid.
	<% } %>
	<% teamwork_vude.cleanup();%>
	</p>
		</card>
</wml>
<% } %>