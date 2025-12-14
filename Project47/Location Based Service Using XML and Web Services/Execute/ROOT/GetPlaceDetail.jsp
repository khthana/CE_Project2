<%@ page contentType="text/html; charset=TIS-620" %>
<%@ page import = "org.apache.axis.client.Call" %>
<%@ page import = "org.apache.axis.client.Service" %>
<%@ page import = "javax.xml.namespace.QName" %>
<%@ page import = "java.io.*" %>
<html>
<body>
<%
	String result[];
	try {
		String endpoint = "http://161.246.5.68/axis/services/MapServices";
		Service service = new Service();
		Call call = (Call) service.createCall();

		java.lang.Integer timeo = call.getTimeout();
		//out.println(timeo + "<br>");
		//-------- time out = 1000000(16min) --------//
		//-------- time out = ms --------------------//
		call.setTimeout(new java.lang.Integer(1000000));
		timeo = call.getTimeout();
		out.println("time out = " + timeo + "<br>");

		call.setTargetEndpointAddress(new java.net.URL(endpoint));
		call.setOperationName(new QName("http://161.246.5.68/axis/services/MapServices", "getPlaceDetail"));
		result = (String[]) call.invoke(new Object[] {new String("knot"),new String("knot"),new String("88892"),new String("newrestaurant"),new String("Restaurant")});
		out.println("Get List .... OK<br><br>");
		out.println("Place List<br>");
		out.println("----------<br>");
		out.println(result[0] + "<br>");

	} catch (Exception e) {
		out.println(e.toString());
	}
%>
<br>
------------------ <br>
</body>
</html>