<html>
<head>
<title>Check authen</title>

<%
	String pass_authen= new String(); 
	if(session.getValue("pass_authen")!=null){
		pass_authen=(String)session.getValue("pass_authen");
	}
	if (!(pass_authen.equals("yes"))){
		response.sendRedirect("librarian.html");
	}
%>
<%@  page import="java.sql.*"  %>
<%@ page contentType = "text/html;charset=MS874" %> 
<%

  // คลาสหลัก
   String password=request.getParameter("password");
   String login=request.getParameter("login");
  Connection dbconn;
   String msgout = "";
      // Set up database connection
      try 
      {     // ส่วนติดต่อกับฐาานข้อมูล โดยการใช้ JDBC-ODBC
	   String url = "jdbc:odbc:FUZZYIR";
	   Class.forName( "sun.jdbc.odbc.JdbcOdbcDriver" );
	    dbconn = DriverManager.getConnection(url,"Administrator","fuzzyir");
	    Statement statement = dbconn.createStatement();

	    String query = "SELECT * FROM LIBRARIAN";
	    ResultSet  resultset = statement.executeQuery(query);	
		int boo=0;
		while(resultset.next()){
			 String temp_log=resultset.getString("Login");
			 //temp_log=temp_log.trim();
			 String temp_pass=resultset.getString("Password");
			 //temp_pass=temp_pass.trim();
			 if(temp_log.compareTo(login)==0 && temp_pass.compareTo(password)==0){
				boo=1;
				String sec_id=resultset.getString("ID");
				String sec_name=resultset.getString("Name");
				String sec_surname=resultset.getString("Surname");
				session.putValue("id",sec_id);
				session.putValue("name",sec_name);
				session.putValue("surname",sec_surname);
				session.putValue("pass_authen","yes");
			 }
		}
		out.println(boo);
//		msgout = "Connection successful" ;
	dbconn.close();
	if(boo==0){
		session.putValue("pass_authen","no");
		response.sendRedirect("authen.jsp");
	}else{
		response.sendRedirect("menu.jsp");
	}
      }
      catch ( ClassNotFoundException cnfex ) 
      {
            // ดักจับกรณีไม่สามารถเรียกใช้งานคลาสสำหรับติดต่อฐานข้อมูลได้
            cnfex.printStackTrace();
            msgout =  "Connection unsuccessful\n" + cnfex.toString() ;		
      }
      catch ( SQLException sqlex ) 
      {    // ดักจับกรณ๊คำสั่ง SQL ผิดพลาด
            sqlex.printStackTrace();
            msgout = "Connection unsuccessful\n" + sqlex.toString() ;
		   out.println(sqlex);
      }
      catch ( Exception excp ) 
      {    // ดักจับกรณ๊ทั่วไป
            excp.printStackTrace();
            msgout = excp.toString() ;
      }
out.println(msgout);
%>

</head>
<body bgcolor="#FFFFFF">


</body>
</html>
