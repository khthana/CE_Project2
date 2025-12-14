<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>
<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
String sid				= request.getParameter("stdid");
String acadyear	= request.getParameter("acadyear");
String projname	= request.getParameter("projname");
String type			= request.getParameter("type");
String budyear		= request.getParameter("budyear");
String alone			= request.getParameter("alone");
String sci				= request.getParameter("sci");
String cat				= request.getParameter("cat");

String daystart			= request.getParameter("daystart");
String monstart		= request.getParameter("monstart");
String yearstart		= request.getParameter("yearstart");
String start				= yearstart+"-"+monstart+"-"+daystart;

String dayend			= request.getParameter("dayend");
String monend	 		= request.getParameter("monend");
String yearend	 		= request.getParameter("yearend");
String end				= yearend+"-"+monend+"-"+dayend;

String place	 			= request.getParameter("place");

String printcost		= request.getParameter("printcost");
String bookcost		= request.getParameter("bookcost");
String comcost		= request.getParameter("comcost");
String matcost	 		= request.getParameter("matcost");


//String tid ="";
String msgout = "";
	try
      {        
	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String q2 = " INSERT INTO  PROJ_MON_SUPPORT (STD_ID,PROJ_NAME,TYPE, BUDGET_YEAR,ACAD_YEAR,ALONE,WHAT_SCIENCE,CATEGORY,FROM_DATE, TO_DATE,PLACE,PRINT_COST,MAKE_BOOK_COST,COM_MAT_COST,OFF_MAT_COST)  VALUES ('"+sid+"','"+projname+"','"+type+"',"+budyear+","+acadyear+",'" +alone+"','"+sci+"','"+cat+"','"+start+"','"+end+"','"+place+"',"+printcost+","+bookcost+"," +comcost+","+matcost+")";

	ResultSet  rs1 = statement.executeQuery(q2);

	response.sendRedirect("/demo/pass.jsp");
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