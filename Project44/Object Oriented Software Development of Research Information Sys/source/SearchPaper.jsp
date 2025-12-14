<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
		String pubyear = request.getParameter("pubyear");

		String stdid="",topicT="";
		String result ="";
		String msgout = "";
		try
      {        

	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String q1 = " SELECT STD_ID,TOPIC_TH FROM STD_PAPER  WHERE PUBYEAR =  '"+pubyear+"'";

	ResultSet  rs = statement.executeQuery(q1);
	
	while (rs.next()){
		stdid = rs.getString(1);
		topicT= rs.getString(2);
		result= result+stdid+topicT;
	};
	if (result .equals("") ) {out.print("No paper found !!");}
	else out.print(result);

	rs.close();
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
%>
