<jsp:useBean id="massagedre" class="massage.delete" scope="session"/>
<jsp:setProperty name="massagedre" property="massid" param="id" />
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="massagedre" property="name" value="<%=username%>"/>
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
	<% if (massagedre.ismassage()) { %>
		<% massagedre.delete(); %>
		<p>	
			delete complete!
		</p>
	<% } else { %>
		<p>
			improper delete!
		</p>
	<% } %>
	</card>
</wml>
<% massagedre.cleanup();%>
<% } %>