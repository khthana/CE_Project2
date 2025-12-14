<jsp:useBean id="massagede" class="massage.detail" scope="session"/>
<jsp:setProperty name="massagede" property="massage_id" param="id" />
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="massagede" property="name" value="<%=username%>"/>
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
		<p>
	<% if (massagede.isMassid) { %>
	<% } %>
	</card>
</wml>
<% massagede.cleanup();%>
<% } %>