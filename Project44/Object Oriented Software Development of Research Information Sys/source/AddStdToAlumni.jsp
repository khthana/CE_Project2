<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>
<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
		String stdid = request.getParameter("stdid");
		String job= request.getParameter("job");
		String addr = request.getParameter("addr");
		String country = request.getParameter("country");
		String tel = request.getParameter("tel");
		
		String msgout = "";

	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String q1 = " UPDATE  STUDENT_INFO SET(OCCUPATION,ADDRESS,COUNTRY, TEL_NUMBER,FIN_DATE,FIN_REASON ) = ('"+job+"','"+addr+"','"+country+"','"+tel+"', CURRENT DATE,'Normal') WHERE STD_ID ='"+stdid+"'";

	ResultSet  rs = statement.executeQuery(q1);

	response.sendRedirect("/demo/pass.jsp");
	dbconn.close();
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

//out.print(stdid);
%>
