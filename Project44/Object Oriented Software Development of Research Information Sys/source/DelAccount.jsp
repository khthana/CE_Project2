<%@  page session="true"  %>
<%@  include file ="checksessionA.inc" %>

<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
String loginname		= request.getParameter("loginname");
String dlogin ="";

String msgout = "";
	try
      {        
	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String q1 = " SELECT LOGIN_NAME FROM ACCOUNT  WHERE LOGIN_NAME = '"+loginname+"'";

	ResultSet  rs = statement.executeQuery(q1);

	while (rs.next()) {
			dlogin = rs.getString(1);
	};

	if (!dlogin.equals("")) {

		String q2 = " DELETE FROM ACCOUNT  WHERE LOGIN_NAME = '"+loginname+"'";

		ResultSet  rs2 = statement.executeQuery(q2);

	out.print(" Account was delete completely");

	}else out.print (" No login name match!!");

 } // try

      catch ( ClassNotFoundException cnfex )
      {
            cnfex.printStackTrace();
            msgout =  "Connection unsuccessful\n" + cnfex.toString() ;
      }
      catch ( SQLException sqlex )
      {    
			sqlex.printStackTrace();
            msgout = "Connection unsuccessful\n" + sqlex.toString() ;
      }
      catch ( Exception excp )
      {    
            excp.printStackTrace();
            msgout = excp.toString();
      }
	out.println(msgout);

%>