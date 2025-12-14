<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date,java.util.*"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>
<%
	String code=request.getParameter("id");
	String emp=(String) session.getAttribute("emp");;

	try{  
         Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
         Statement stmt = con.createStatement();
		 String query="DELETE FROM FAVORITE WHERE EMP#='"+emp+"' AND CODE='"+code+"'";
		 stmt.executeUpdate(query);
		  con.close();
	     stmt.close();

		 response.sendRedirect("favorite.jsp");
            }
            catch (Exception E) {
                out.println("An Error Occured:");
                out.println(E);
			
            }

%>