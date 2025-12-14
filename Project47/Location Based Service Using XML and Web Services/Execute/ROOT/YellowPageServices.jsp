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
		String endpoint = "http://161.246.5.68/axis/services/YellowPageServices";
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
		/*call.setOperationName(new QName("http://localhost/axis/services/YellowPageServices", "getPersonDetailInfo"));
		result = (String) call.invoke(new Object[] {});
		out.println("Get DetailInfo .... OK<br>");
		out.println(result + "<br>");*/

		/*call.setOperationName(new QName("http://localhost/axis/services/YellowPageServices", "getPMap"));
		result = (String) call.invoke(new Object[] {new String("0"),new String("Name")});
		out.println("Get PMap .... OK");
		out.println(result + "<br>");*/

		call.setOperationName(new QName("http://161.246.5.68/axis/services/YellowPageServices", "getPersonDetail"));
		result = (String[]) call.invoke(new Object[] {new String("Jaykung"),new String("jayjay"),new String("1"),new String("knot"),new String("king")});
		out.println("Get PersonDetail .... OK");
		out.println(result[0] + "<br>");

		/*call.setOperationName(new QName("http://localhost/axis/services/YellowPageServices", "searchPerson"));
		result = (String) call.invoke(new Object[] {new String("knot"),new String("knot"),new String(""),new String("")});
		String results = new String(result.getBytes("ISO8859_1"),"TIS-620");
		out.println("Get search .... OK");
		out.println(results + "<br>");*/
	} catch (Exception e) {
		out.println(e.toString());
	}
%>
<br>
------------------ <br>
<%
	/*String Wline = "";
	DataInputStream input = null;
	File file2 = new File("C:\\Program Files/Apache Group/Tomcat 4.1/webapps/ROOT/map.svg");
	try {
		BufferedWriter bout = new BufferedWriter(new FileWriter(file2));
		bout.write(result);
		bout.close();
	} catch ( IOException e) {
		out.println("Write Error");
	}*///<embed src="map.svg" width="100%" height="100%"></embed>
%>

</body>
</html>