<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>

<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
//String thid		= request.getParameter("ThesisId");
String tname	= request.getParameter("tname");
String tsur		= request.getParameter("tsur");

String msgout = "";
String tid ="";
	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
//	String facid=null,facn=null;
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();
	//Statement st2 = dbconn.createStatement();

	String q1 = " SELECT T_ID FROM TEACHER_INFO"+
						"  WHERE NAME_TH = '"+tname+"'  AND SURNAME_TH = '"+tsur+"'";

	ResultSet  rs = statement.executeQuery(q1);

	while (rs.next()) {
		tid = rs.getString(1);
	}

rs.close();
 dbconn.close();
//out.print(tid+"<br>");


	if (!tid.equals("")) {
		response.sendRedirect("ShowInfo.jsp?tid="+tid);
	  }
	  else response.sendRedirect("error.jsp");// if (tid != null

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