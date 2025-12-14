<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>

<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
String stdid		= request.getParameter("Stdid");
String tname	= request.getParameter("NewTName");
String tsur		= request.getParameter("NewTSur");

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
	Statement st2 = dbconn.createStatement();

	String q1 = " SELECT T_ID FROM TEACHER_INFO"+
						"  WHERE NAME_TH = '"+tname+"'  AND SURNAME_TH = '"+tsur+"'";

	ResultSet  rs = statement.executeQuery(q1);

	while (rs.next()) {
		tid = rs.getString(1);
	}
out.print(tid+"<br>");
	if (!tid.equals("")) {


		String q2 = " UPDATE STUDENT_INFO SET (T_CON_ID) = ("+tid+")  WHERE STD_ID = '"+stdid+"'";

		ResultSet  rs1 = st2.executeQuery(q2);

		response.sendRedirect("/demo/pass.jsp");
//		out.print(" Finnish <br>");	          
	  }
	  else response.sendRedirect("/demo/error.jsp");// if (tid != null

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