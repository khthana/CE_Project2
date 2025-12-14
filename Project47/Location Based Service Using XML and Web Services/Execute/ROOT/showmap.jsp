<%@ page import="org.apache.axis.client.*" %>
<%@ page import = "java.io.*" %>
<%@ page import="javax.xml.namespace.QName" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=TIS-620" %>

<html>
<body>

<%
	if ((String)session.getAttribute("user") == null) {
		response.sendRedirect("signup.jsp");
	}

	String user = (String)session.getAttribute("user");
	String password = (String)session.getAttribute("password");

	double lat = Double.valueOf(request.getParameter("lat")).doubleValue();
	double lon = Double.valueOf(request.getParameter("lon")).doubleValue();
	String lat_tl = String.valueOf(lat - 0.025);
	String lat_rb = String.valueOf(lat + 0.025);
	String lon_tl = String.valueOf(lon - 0.025);
	String lon_rb = String.valueOf(lon + 0.025);
	String type = request.getParameter("outtype");

	String result = "";

	try {
		String endpoint = "http://161.246.5.68/axis/services/MapServices";

		Service service = new Service();
		Call call = (Call) service.createCall();
		call.setTimeout(new java.lang.Integer(1000000));
		call.setTargetEndpointAddress(new java.net.URL(endpoint));

		call.setOperationName(new QName("http://161.246.5.68/axis/services/MapServices", "getMap"));
		result = (String)call.invoke(new Object[] {user, password, lon_tl, lat_tl, lon_rb, lat_rb, type});

		if (type.equals("GML") | type.equals("JPEG")) {
			response.sendRedirect(result);
		}
		else if (type.equals("SVG")) {
			//DataInputStream input = null;
			//File file2 = new File("map.svg");
			//try {
				//BufferedWriter bout = new BufferedWriter(new FileWriter(file2));
				//bout.write(result);
				//bout.close();
			//} catch ( IOException e) {
				//out.println("Write Error");
			//}
			response.sendRedirect("http://161.246.5.68/axis/map.svg");
			//out.println("<embed src=\"" + result +"\" width=\"100%\" height=\"100%\"></embed>");
		}
	} catch (Exception e) {}
%>

</body>
</html>		