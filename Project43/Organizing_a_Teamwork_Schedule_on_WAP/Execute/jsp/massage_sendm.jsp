<%@ page session="true" %>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="main" title="Message">
	<do type="accept" label="Send">
		<go href="<%=response.encodeURL("massage_send.jsp")%>" method="post">
			<postfield name="massage_receiver" value="$massage_receiver"/>
			<postfield name="massage_title" value="$massage_title"/>
			<postfield name="massage_massage" value="$massage_massage"/>
		</go>
	</do>
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>
		<p>
			To User:<input name="massage_receiver" maxlength="15"/><br/>
			Title:<input name="massage_title" maxlength="15"/><br/>
			Message:<input name="massage_massage" maxlength="100"/><br/>
		</p>
	</card>
</wml>
<% } %>