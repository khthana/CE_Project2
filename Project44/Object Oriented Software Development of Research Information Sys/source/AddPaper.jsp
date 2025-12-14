<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>

<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
String sid			= request.getParameter("stdid");
String paperT	= request.getParameter("paperT");
String paperE	= request.getParameter("paperE");
String percent	= request.getParameter("percent");
String pub		= request.getParameter("pub");
String pubyear	 = request.getParameter("pubyear");
String page		= request.getParameter("page");
String perdoing=request.getParameter("perdoing");
String person	=request.getParameter("person"):
String tname	= request.getParameter("tname");
String tsurname	= request.getParameter("tsurname");

String tid ="";
String msgout = "";
	try
      {        
	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String q1 = " SELECT T_ID FROM TEACHER_INFO"+
						"  WHERE NAME_TH = '"+tname+"'  AND SURNAME_TH = '"+tsur+"'";

	ResultSet  rs = statement.executeQuery(q1);

	while (rs.next()) {
		tid = rs.getString(1);
	}

	String q2 = " INSERT INTO STD_PAPER (STD_ID,TOPIC_TH,TOPIC_EN, PUBLISH_BY,PAGES,PER_DOING,CO_DOER,T_ID,PUBYEAR)  VALUES ("+sid+",'"+paperT+"','"+paperE+"','"+pub+"',"+page+","+perdoing+","+person+","+tid+",'"+pubyear+"')";

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