<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>
<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
		String stdid = request.getParameter("stdid");
		String Ttopic = request.getParameter("Ttopic");
		String Etopic = request.getParameter("Etopic");
		String acadyear = request.getParameter("acadyear");
		String tname = request.getParameter("TName");
		String tsur = request.getParameter("TSur");
		String msgout = "";
		String tid = "";
		try
      {        

	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String q1 = " SELECT NAME_TH,SURNAME_TH FROM STUDENT_INFO "+	" WHERE STD_ID =  '"+stdid+"'";

	ResultSet  rs = statement.executeQuery(q1);

	if (rs == null ) response.sendRedirect("error.jsp");

	rs.close();

	String q6 = " SELECT THESIS_ID  FROM THESIS_INFO  WHERE STD_ID =  '"+stdid+"'";

	ResultSet  rs6 = statement.executeQuery(q6);
	String cthid="";

	while(rs6.next()) {
		cthid=rs6.getString(1);
	};
	rs6.close();
	out.print("check thid complete");

	if (!cthid.equals("")) out.print("This student already have thesis");

	String q2 = " SELECT T_ID FROM TEACHER_INFO  WHERE NAME_TH =  '"+tname+"' AND SURNAME_TH = '"+tsur+"'";

	ResultSet  rs2 = statement.executeQuery(q2);
	

	while (rs2.next()){
		tid = rs2.getString(1);
	}
	rs2.close();
	out.print(tid+"<br>");

	if  ( (!Ttopic.equals("")) && (!Etopic.equals("")) && (!tid.equals("") ) ){ 
		
			String q3 = " INSERT INTO THESIS_INFO (TOPIC_TH,TOPIC_EN, STD_ID,ACADYEAR) VALUES ('"+Ttopic+"','"+Etopic+"','"+stdid+"','"+acadyear+"')";
			ResultSet  rs3 = statement.executeQuery(q3);
	out.print(q3);
	rs3.close();

	String q4 = " SELECT THESIS_ID FROM THESIS_INFO WHERE STD_ID = '"+stdid+"'";
	ResultSet  rs4 = statement.executeQuery(q4);
	String thid = "";
	while (rs4.next()){
		thid = rs4.getString(1);
	};
	out.print(q4);

	rs4.close();
	String q5 = " INSERT INTO TEACHER_CTRL_THESIS (T_ID,THESIS_ID,STATUS) VALUES ("+tid+","+thid+",'S')";

	ResultSet  rs5 = statement.executeQuery(q5);
	out.print(q5);

	response.sendRedirect("pass.jsp");

 	} else 	response.sendRedirect("error.jsp");
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
