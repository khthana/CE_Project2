<%@  page session="true"  %>
<%@  include file ="checksessionA.inc" %>

<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
String kind			= request.getParameter("kind");
String name			= request.getParameter("name");
String sur					= request.getParameter("sur");
String loginname		= request.getParameter("loginname");
String pass			=request.getParameter("pass");
String verpass		=request.getParameter("verpass");
String dlogin="";

String effid ="";
String msgout = "";
	try
      {        
	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	
	String q6 = " SELECT LOGIN_NAME FROM ACCOUNT  WHERE LOGIN_NAME = '"+loginname+"'";

	ResultSet  rs6 = statement.executeQuery(q6);

	while (rs6.next()) {
			dlogin = rs6.getString(1);
	};
	rs6.close();

	if (dlogin.equals(""))  {

	if ( (pass.equals(verpass) ) && ( pass.length() >= 4) && (loginname.length() >= 4 )){

	if(  (!loginname.equals("") ) && (!name.equals("")) && (!sur.equals("") ) ){

		if (kind.equals("t")) {

		String q1 = " SELECT T_ID FROM TEACHER_INFO  WHERE NAME_TH = '"+name+"'  AND SURNAME_TH = '"+sur+"'";

		ResultSet  rs = statement.executeQuery(q1);

		while (rs.next()) {
			effid = rs.getString(1);
			};

		}

		if (kind.equals("o")) {
				String q2 = " INSERT INTO OFFICER_INFO (NAME_TH)  VALUES ('"+name+" "+sur+"')";
				ResultSet  rs1 = statement.executeQuery(q2);


				String q3 = "Select OFF_ID FROM OFFICER_INFO WHERE NAME_TH= '"+name+" "+sur+"'";
				ResultSet  rs3 = statement.executeQuery(q3);

				while (rs3.next()){
					effid= rs3.getString(1);
				};

		}

	}

	if ( (kind.equals("")) || (loginname.equals("")) ){	response.sendRedirect("/demo/error.jsp");}
	
	String q4 = " INSERT INTO ACCOUNT (LOGIN_NAME,PASSWORD,EFFECTED_ID, GROUP) VALUES ('"+loginname+"','"+pass+"',"+effid+",'"+kind+"')";

	ResultSet  rs4 = statement.executeQuery(q4);

	response.sendRedirect("/demo/passA.jsp");

	} else{  out.print(" Verify password mismatch OR Login or Password length less than 4 charactors !!");}

	} else out.print(" Login Duplicated try again!!");

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