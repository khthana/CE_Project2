<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>

<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
String sid				= request.getParameter("stdid");
String thid			= request.getParameter("thid");
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

String Ncom1		= request.getParameter("Ncom1");
String Ncom2		= request.getParameter("Ncom2");
String Ncom3		= request.getParameter("Ncom3");
String Ncom4		= request.getParameter("Ncom4");
String Ncom5		= request.getParameter("Ncom5");


String Scom1		= request.getParameter("Scom1");
String Scom2		= request.getParameter("Scom2");
String Scom3		= request.getParameter("Scom3");
String Scom4		= request.getParameter("Scom4");
String Scom5		= request.getParameter("Scom5");



String msgout = "";
String tid1 ="",tid2="",tid3="",tid4="",tid5="";
String testid ="";
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

//		String q = " 
		String q1 = " INSERT INTO  TEST_SCHEDULE (STD_ID,TEST_TYPE, TEST_DATE,START_TEST_TIME,END_TEST_TIME,YEAR,SEM, ROOM,RESULT)  VALUES ('"+sid+"','T','"+date+"','"+stime+"','"+etime+"',"+acadyear+",'"+sem+"','"+room+"','No information')";

		ResultSet  rs1 = statement.executeQuery(q1);

		rs1.close();

		String q2 = " SELECT TEST_ID FROM TEST_SCHEDULE WHERE STD_ID = '"+sid+"' AND TEST_TYPE = 'T' AND TEST_DATE= '"+date+"' AND START_TEST_TIME = '"+stime+"' AND END_TEST_TIME ='"+etime+"' AND YEAR = "+acadyear+" AND SEM = '"+sem+"'";

		ResultSet  rs2 = statement.executeQuery(q2);
		while (rs2.next()) {
		testid = rs2.getString(1);
		};
		rs2.close();

		if ( (!Ncom1.equals("")) && (!Scom1.equals("")) ) {

				String q3 = " SELECT T_ID FROM TEACHER_INFO WHERE NAME_TH = '"+Ncom1+"' AND SURNAME_TH = '"+Scom1+"'";

				ResultSet  rs3 = statement.executeQuery(q3);

				while (rs3.next())
				{ tid1 = rs3.getString(1);
				};
				rs3.close();
				out.print("ok1 <br>");
				if (tid1.equals("")) {response.sendRedirect("/demo/error.jsp");};


				String q4 = " INSERT INTO THESIS_TEST_COM (TEST_ID,T_ID,THESIS_ID,STATUS) VALUES ("+testid+","+tid1+","+thid+",'P')";

				ResultSet  rs4 = statement.executeQuery(q4);
				rs4.close();

				out.print("ok2");

		if ( (!Ncom2.equals("")) && (!Scom2.equals("")) ) {
				String q5 = " SELECT T_ID FROM TEACHER_INFO WHERE NAME_TH = '"+Ncom2+"' AND SURNAME_TH = '"+Scom2+"'";

				ResultSet  rs5 = statement.executeQuery(q5);

				while (rs5.next())
				{ tid2 = rs5.getString(1);
				};
				rs5.close();
				if (!tid2.equals("")) {


				String q6 = " INSERT INTO THESIS_TEST_COM (TEST_ID,T_ID,THESIS_ID,STATUS) VALUES ("+testid+","+tid2+","+thid+",'C')";

				ResultSet  rs6 = statement.executeQuery(q6);
				rs6.close();
				}
		};

		if ( (!Ncom3.equals("")) && (!Scom3.equals("")) ) {
			String q5 = " SELECT T_ID FROM TEACHER_INFO WHERE NAME_TH = '"+Ncom3+"' AND SURNAME_TH = '"+Scom3+"'";

			ResultSet  rs5 = statement.executeQuery(q5);

			while (rs5.next())
			{ tid3 = rs5.getString(1);
			};
			rs5.close();
			if (!tid3.equals("")) {
				String q6 = " INSERT INTO THESIS_TEST_COM (TEST_ID,T_ID,THESIS_ID,STATUS) VALUES ("+testid+","+tid3+","+thid+",'C')";

				ResultSet  rs6 = statement.executeQuery(q6);
				rs6.close();
			}
		};

		if ( (!Ncom4.equals("")) && (!Scom4.equals("")) ) {
			String q5 = " SELECT T_ID FROM TEACHER_INFO WHERE NAME_TH = '"+Ncom4+"'  AND SURNAME_TH = '"+Scom4+"'";

			ResultSet  rs5 = statement.executeQuery(q5);

			while (rs5.next())
			{ tid4 = rs5.getString(1);
			};
			rs3.close();
			if (!tid4.equals("")) {
				String q6 = " INSERT INTO THESIS_TEST_COM (TEST_ID,T_ID,THESIS_ID,STATUS) VALUES ("+testid+","+tid4+","+thid+",'C')";

				ResultSet  rs6 = statement.executeQuery(q6);
				rs6.close();
				}

		};
		if ( (!Ncom5.equals("")) && (!Scom5.equals("")) ) {

			String q5 = " SELECT T_ID FROM TEACHER_INFO WHERE NAME_TH = '"+Ncom5+"'  AND SURNAME_TH = '"+Scom5+"'";

			ResultSet  rs5 = statement.executeQuery(q5);

			while (rs5.next())
			{ tid5 = rs5.getString(1);
			};
			rs5.close();

			if (!tid5.equals("")) {
				String q6 = " INSERT INTO THESIS_TEST_COM (TEST_ID,T_ID,THESIS_ID,STATUS) VALUES ("+testid+","+tid5+","+thid+",'C')";

				ResultSet  rs6 = statement.executeQuery(q6);
				rs5.close();
				}

		};
		response.sendRedirect("/demo/pass.jsp");
	} else out.print(" Please fill present of tesing");
	} else out.print(" Please fill all informations... <br> ");
	
	} else 	response.sendRedirect("/demo/error.jsp");

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

