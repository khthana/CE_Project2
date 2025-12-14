<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>
<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%

String formno	= request.getParameter("FormNo");
String sid			= request.getParameter("Stdid");
String sub		= request.getParameter("Submit");

String msgout = "";
String stdid=null;

out.print(sid+"<br>");
//		String stdid= request.getParameter("stdid");
	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
//	String facid=null,facn=null;
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String q1 = " SELECT STD_ID  FROM  STUDENT_INFO  WHERE STD_ID =  '"+sid+"'";

	ResultSet  rs = statement.executeQuery(q1);

	if (rs == null) { 
	response.sendRedirect("error.jsp");		
	};

	while (rs.next() ) {
		stdid = rs.getString(1);
	};

	
	dbconn.close();

//out.print("  "+sid);
if ( formno.equals("2") ){
//session.putValue("Stdid",sid);
response.sendRedirect("form2.jsp?stdid="+sid);
}
else if ( formno.equals("3") ){
//session.putValue("Stdid",sid);
response.sendRedirect("form3.jsp?stdid="+sid);
}
else if ( formno.equals("4") ){
//session.putValue("Stdid",sid);
response.sendRedirect("form4.jsp?stdid="+sid);
}
else if ( formno.equals("5") ){
//session.putValue("Stdid",sid);
response.sendRedirect("form5.jsp?stdid="+sid);
}
else if ( formno.equals("6") ){
//session.putValue("Stdid",sid);
response.sendRedirect("form6.jsp?stdid="+sid);
}
else if ( formno.equals("7") ){
//session.putValue("Stdid",sid);
response.sendRedirect("form7.jsp?stdid="+sid);
}
else if ( formno.equals("8") ){
//session.putValue("Stdid",sid);
response.sendRedirect("form8.jsp?stdid="+sid);
}
else if ( formno.equals("9") ){
//session.putValue("Stdid",sid);
response.sendRedirect("form9.jsp?stdid="+sid);
}
else if ( formno.equals("10") ){
//session.putValue("Stdid",sid);
response.sendRedirect("form10.jsp?stdid="+sid);
}
else if ( formno.equals("11") ){
//session.putValue("Stdid",sid);
response.sendRedirect("form11.jsp?stdid="+sid);
}
else if ( formno.equals("12") ){
//session.putValue("Stdid",sid);
response.sendRedirect("form12.jsp?stdid="+sid);
}
else if ( formno.equals("13") ){
//session.putValue("Stdid",sid);
response.sendRedirect("form13.jsp?stdid="+sid);
}
else if ( formno.equals("14") ){
//session.putValue("Stdid",sid);
response.sendRedirect("form14.jsp?stdid="+sid);
}
else if ( formno.equals("17") ){
//session.putValue("Stdid",sid);
response.sendRedirect("form17.jsp?stdid="+sid);
}
else response.sendRedirect("error.jsp");

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