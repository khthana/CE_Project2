<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>
<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
String stdid				= request.getParameter("stdid");
String schid	 		= request.getParameter("schid");
String pid				= request.getParameter("paper");

String day	 		= request.getParameter("day");
String mon			= request.getParameter("mon");
String year	 		= request.getParameter("year");

String date	 		= year+"-"+mon+"-"+day;
String place			= request.getParameter("place");
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
		if (!pid.equals(""))  {

	String q2 = " UPDATE STD_PAPER SET(SHOW_DATE,SHOW_PLACE) = ('"+date+"','"+place+"') WHERE PAPER_ID = "+pid;

	ResultSet  rs1 = statement.executeQuery(q2);
	String q3 = "INSERT INTO SCH_ASSIGNED (SCH_ID,STD_ID) VALUES ("+schid+",'"+stdid+"')";

	ResultSet  rs2 = statement.executeQuery(q3);
	dbconn.close();
	response.sendRedirect("/demo/pass.jsp");
		} else out.print(" Please select paper <br> ");
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