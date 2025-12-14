<%@ page session="true" %>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="subgroup" title="Subscripbe Group">
	<do type="accept" label="Select Group">
		<go href="<%=response.encodeURL("teamwork_subview.jsp")%>" method="post">
			<postfield name="sub_name" value="$sub_name"/>
		</go>
	</do>
		<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>
		<p>
			User Name of own group:<input name="sub_name"  maxlength="15"/><br/>
						
		</p>
	</card>
</wml>
<% } %>