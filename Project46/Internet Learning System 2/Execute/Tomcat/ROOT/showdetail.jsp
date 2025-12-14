<%@ page contentType="text/html; charset=windows-874"%>
<%@page import="java.sql.*"%>
<html>
<title>Show Information Registration</title>
<body>
<%
			String key1 = request.getParameter("key1");
			String key2=request.getParameter("key2");
					
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
			Statement stmt=mycon.createStatement();
			String sqla = "SELECT * FROM info";
			ResultSet rs = stmt.executeQuery(sqla);
				while(rs.next())
			{
				if (rs.getString("username").equals(key1))	
				{
					if(rs.getString("password").equals(key2))
					{
						String sql2 = "DELETE FROM info WHERE username='"+key1+"'&& password='"+key2+"'";
						ResultSet myresult = stmt.executeQuery(sql2);
						myresult.close();
						out.println("Delete complete");
					}
					}
			}
			rs.close();
			stmt.close();
			mycon.close();
%>
</body>
</html>
