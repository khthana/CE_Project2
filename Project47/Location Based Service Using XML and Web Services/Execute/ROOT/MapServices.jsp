<%@ page contentType="text/html; charset=TIS-620" %>
<%@ page import = "org.apache.axis.client.Call" %>
<%@ page import = "org.apache.axis.client.Service" %>
<%@ page import = "javax.xml.namespace.QName" %>
<%@ page import = "java.io.*" %>
<html>
<body>
<%
	String result = "";
	try {
		String endpoint = "http://localhost/axis/services/MapServices";
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
		/*call.setOperationName(new QName("http://localhost/axis/services/MapServices", "getMapInfo"));
		result = (String) call.invoke(new Object[] {});
		out.println("Get MapInfo .... OK<br>");
		out.println(result + "<br>");*/

		call.setOperationName(new QName("http://localhost/axis/services/MapServices", "getMap"));
		result = (String) call.invoke(new Object[] {new String("100.70"),new String("13.75"),new String("100.8"),new String("13.8"),new String("SVG")});
		//100.6,13.8,100.7,13.9
		out.println("Get Map .... OK");
		out.println(result + "<br>");//664500,1517000,674500,1522000
		/*call.setOperationName(new QName("http://localhost/axis/services/MapServices", "getDetail"));
		result = (String) call.invoke(new Object[] {new String("0"),new String("0")});
		out.println("Get Detail .... OK");
		out.println(result + "<br>");*/

	} catch (Exception e) {
		out.println(e.toString());
	}
%>
<br>
------------------ <br>
<%
	String Wline = "";
	DataInputStream input = null;
	File file2 = new File("C:\\Program Files/Apache Group/Tomcat 4.1/webapps/ROOT/map.svg");
	try {
		BufferedWriter bout = new BufferedWriter(new FileWriter(file2));
		bout.write(result);
		bout.close();
	} catch ( IOException e) {
		out.println("Write Error");
	}
%>
<embed src="map.svg" width="100%" height="100%"></embed>
</body>
</html>