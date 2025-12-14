<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>

<HEAD>
<TITLE> กำหนดและแก้ไข Workflow ให้สินค้าแต่ละประเภท</TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="ศิริพร จังสมบัติศิริ">
<LINK href="picture/cssomo1.css" rel=stylesheet type="text/css">

</HEAD>

<BODY>


<%
	String  wf_name=MS874ToUnicode(new String(request.getParameter("wf_name")));
//	String  cat=MS874ToUnicode(new String(request.getParameter("cat")));
	String  app1=MS874ToUnicode(new String(request.getParameter("app1")));
	String  viewer=MS874ToUnicode(new String(request.getParameter("viewer")));
	String  detail=MS874ToUnicode(new String(request.getParameter("detail")));
	String  app2=MS874ToUnicode(new String(request.getParameter("app2")));
//	String  adhoc=MS874ToUnicode(new String(request.getParameter("adhoc")));
String adhoc= new String();
try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
         Statement stmt = con.createStatement();

		String query="INSERT INTO WF_TABLE VALUES('"+wf_name+"','"+viewer+"','"+app1+"','"+app2+"','"+adhoc+"','"detail"')";
		stmt.executeUpdate(query);
		 stmt.close();
		 con.close();

	 } catch(SQLException e) 
      {
	      while (e != null) 
         {
            out.println("SQLException:<br>");
  		      out.println("Message:   " + e.getMessage() + "<br>");
		      out.println("SQLState:  " + e.getSQLState() + "<br>");
		      out.println("ErrorCode: " + e.getErrorCode() + "<br>");
		      e = e.getNextException();
         }
	   }


%>
</BODY>
</HTML>
