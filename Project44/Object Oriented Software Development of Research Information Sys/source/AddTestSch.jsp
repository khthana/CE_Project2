<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>
<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
String sid				= request.getParameter("stdid");
String acadyear	= request.getParameter("acadyear");
String sem			= request.getParameter("sem");

String day	 		= request.getParameter("day");
String mon			= request.getParameter("mon");
String year	 		= request.getParameter("year");

String date	 		= year+"-"+mon+"-"+day;

String room			= request.getParameter("room");
String shour			= request.getParameter("shour");
String smin			= request.getParameter("smin");

String stime			= shour+":"+smin+":"+"00";

String ehour			= request.getParameter("ehour");
String emin			= request.getParameter("emin");
String etime			= ehour+":"+emin+":"+"00";


String msgout = "";

	try
      {        
	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	if (!sid.equals("")) { 
		if (   (!room.equals("")) && (!day.equals("")) && (!shour.equals("")) &&(!smin.equals("")) && (!ehour.equals("")) && (!emin.equals("")) ) {

	String q2 = " INSERT INTO  TEST_SCHEDULE (STD_ID,TEST_TYPE, TEST_DATE,START_TEST_TIME,END_TEST_TIME,YEAR,SEM, ROOM,RESULT)  VALUES ('"+sid+"','K','"+date+"','"+stime+"','"+etime+"',"+acadyear+",'"+sem+"','"+room+"','No information')";

	ResultSet  rs1 = statement.executeQuery(q2);

	response.sendRedirect("/demo/pass.jsp");
		} else out.print(" Please fill all informations... <br> ");
	} else out.print(" Data receive error <br>");

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

