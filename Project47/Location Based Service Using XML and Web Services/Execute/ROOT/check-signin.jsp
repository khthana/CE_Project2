<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=TIS-620" %>
<html>
<body>
<%
	String user = request.getParameter("user");
	String password = request.getParameter("password");

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/spatial1?user=spatial1&password=spatial1");
	Statement stmt = conn.createStatement();
	ResultSet result = stmt.executeQuery("SELECT COUNT(*) FROM user WHERE User_Name = '" + user + "' AND User_Password = '" + password + "'");
	if (result.next())
		if (result.getObject(1).toString().equals("1")) {
			session.setAttribute("user", user);
			session.setAttribute("password", password);

			response.sendRedirect("main2.jsp");
		}
		else {
			response.sendRedirect("signup.jsp");
		}
	else {
		out.println("no database");
	}
%>
</body>
</html>