<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>
<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
String sid				= request.getParameter("stdid");
String schid	 		= request.getParameter("schid");

String msgout = "";
	try
      {        
	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	if (!schid.equals("")) {
	String q2 = " INSERT INTO  SCH_ASSIGNED (STD_ID,SCH_ID)  VALUES ('"+sid+"',"+schid+")";

	ResultSet  rs1 = statement.executeQuery(q2);
	dbconn.close();
	response.sendRedirect("/demo/pass.jsp");

	} else out.print(" Please select scholarship <br>");

	dbconn.close();
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