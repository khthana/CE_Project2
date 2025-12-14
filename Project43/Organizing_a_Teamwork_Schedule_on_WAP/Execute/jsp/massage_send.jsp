<jsp:useBean id="massages" class="massage.send" scope="session"/>
<jsp:setProperty name="massages" property="massage_receiver" param="massage_receiver"  />
<jsp:setProperty name="massages" property="massage_title" param="massage_title"  />
<jsp:setProperty name="massages" property="massage_massage" param="massage_massage"  />
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="massages" property="name" value="<%=username%>" />
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="main" title="Send">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>
	<% if ( massages.isValid() ) { %>
		<% if ( massages.isName() ) { %>
		<%massages.insert();%>
		<p>
			Send messages Successfull.
		</p>
		<% } else { %>
		<p> Improper User Name </p>

		<% } %>
	<% } else { %>
			<p> Improper title messaeg </p>
	<% } %>
		<% massages.cleanup(); %>
		</card>
</wml>

<% } %>