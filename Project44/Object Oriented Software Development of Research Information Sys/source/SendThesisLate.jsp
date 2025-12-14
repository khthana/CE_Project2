<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>
<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
		String thid = request.getParameter("thid");
		String eday = request.getParameter("eday");
		String emon = request.getParameter("emon");
		String eyear = request.getParameter("eyear");
		String date = eyear+"-"+emon+"-"+eday;

		String msgout = "";
	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String q1 = " UPDATE THESIS_INFO SET (DAT_FIN)=('"+date+"') WHERE THESIS_ID =  "+thid;

	ResultSet  rs = statement.executeQuery(q1);

	dbconn.close();
	response.sendRedirect("pass.jsp");
    }
     
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

