<%@ page import="org.apache.axis.client.*" %>
<%@ page import="javax.xml.namespace.QName" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=TIS-620" %>

<%
	if ((String)session.getAttribute("user") == null) {
		response.sendRedirect("signup.jsp");
	}

	String user = request.getParameter("user");
	String password = request.getParameter("password");
	String password2 = request.getParameter("password2");
	
	String resultMap = null;
	String resultYellow = null;

	if (! password.equals(password2)) response.sendRedirect("signup.jsp");

	try {
		Service service = new Service();
		Call call = (Call) service.createCall();
		//call.setTimeout(new java.lang.Integer(1000000));
		String endpoint = "http://161.246.5.68/axis/services/MapServices";
		call.setTargetEndpointAddress(new java.net.URL(endpoint));
		call.setOperationName(new QName("http://161.246.5.68/axis/services/MapServices", "setUser"));
		resultMap = (String)call.invoke(new Object[] {user, password});

		endpoint = "http://161.246.5.68/axis/services/YellowPageServices";
		call.setTargetEndpointAddress(new java.net.URL(endpoint));
		call.setOperationName(new QName("http://161.246.5.68/axis/services/YellowPageServices", "setUser"));
		resultYellow = (String)call.invoke(new Object[] {user, password});

		response.sendRedirect("main.jsp");
	} 
	catch (Exception e) {}
%>