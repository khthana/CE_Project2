<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>
<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
		String tid= request.getParameter("tid");
		String acadt= request.getParameter("acadt");
		String acade= request.getParameter("acade");

		String stat10=request.getParameter("STAT1");
		String stat20=request.getParameter("STAT2");

		String stat30=request.getParameter("STAT3");

		String stat40=request.getParameter("STAT4");
		String admin= request.getParameter("admin");
		String oldadmin= request.getParameter("oldadmin");

		
	String msgout = "";

	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	if (admin.equals("")) {admin=oldadmin;};

	String q = " UPDATE TEACHER_INFO SET(ACAD_POS_TH,ACAD_POS_EN, FAC_MEMBER_STATUS,TEACH_LEVEL,TEACH_CON_LEV,TEST_LEVEL,ACAD_ADMIN_POS) = ('"+acadt+"','"+acade+"','"+stat10+"','"+stat20+"','"+stat30+"','"+stat40+"','"+admin+"')  WHERE T_ID ="+tid;
	ResultSet  rs = statement.executeQuery(q);

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