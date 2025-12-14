<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>
<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%

String schname	 		= request.getParameter("schname");
String kind			 		= request.getParameter("kind");
String type			 		= request.getParameter("type");
String day			 		= request.getParameter("day");
String mon			 		= request.getParameter("mon");
String year			 		= request.getParameter("year");

String money		 		= request.getParameter("money");
String howmany	 		= request.getParameter("howmany");
String ok						=request.getParameter("ok");

String msgout = "";
	try
      {        
	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	if (ok.equals("cancel") ) { 	response.sendRedirect("/demo/AddData.jsp");}
	if (day.equals("")) {day="00";}
	if (mon.equals("")) {mon="00";}
	if (year.equals("")) {year="0000";};
	if (money.equals("")) {money ="0";}
	if (howmany.equals("")) {howmany = "1";}

	String expdate				= year+"-"+mon+"-"+day;

	if ( !schname.equals("") ) {
	String q1 = " INSERT INTO  SCHOLARSHIP_INFO (NAME,KIND,TYPE,EXPIRE_DATE, MONEY,HOWMANY)  VALUES ('"+schname+"','"+kind+"','"+type+"','"+expdate+"',"+money+","+howmany+")";

	ResultSet  rs1 = statement.executeQuery(q1);

	response.sendRedirect("/demo/pass.jsp");

	} else out.print(" Please type scholarship name<br>");
//	out.print(ok);

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