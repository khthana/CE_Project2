<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
        String id = request.getParameter("id");
        String domain = request.getParameter("domain");
        String password = request.getParameter("password");
        Connection dbconn;
		String msgout = "";
		String log=null,pass=null,grp=null,effID=null;
	try
      {        
	String userid = "dong";
        String passwd = "DONG353";
	String url = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
        dbconn = DriverManager.getConnection( url, userid, passwd );
	Statement statement = dbconn.createStatement();
	String query =  "SELECT LOGIN_NAME,PASSWORD,EFFECTED_ID,GROUP "+
							"FROM  ACCOUNT "+
							"WHERE LOGIN_NAME= '"+id+"'"+"AND PASSWORD = '"+password+"' "+"AND GROUP = '"+domain+"'" ;
			ResultSet  rs = statement.executeQuery(query);
			while (rs.next())
		    {
				log   = rs.getString(1);
				pass  = rs.getString(2);
				effID = rs.getString(3);
				grp   = rs.getString(4);
			};
    		dbconn.close();
			if (log==null||pass==null) 
				response.sendRedirect("../demo/LoginFail.jsp");
			else 
				{
			//	session.setAttribute("LOGIN",id );
			//	session.setAttribute("PASS", password);
			//	session.setAttribute("GRP",domain);
			//	session.setAttribute("EFFID",effID);
				session.setAttribute("ISLOGIN","true");
				if ( grp.equals("t")) {
					session.setAttribute("GRP",domain);
					session.setAttribute("EFFID",effID);
				response.sendRedirect("../demo/TeacherMainPage.jsp?tid="+effID);
				};
				if (grp.equals("o")){
					session.setAttribute("GRP",domain);
				response.sendRedirect("../demo/OfficerMain.jsp");
				};
				if (grp.equals("a")){
					session.setAttribute("GRP",domain);
					response.sendRedirect("../demo/Admin.jsp");
				};
				out.println(" Group Incorect !!");
			};
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
		   out.println(sqlex);
      }
      catch ( Exception excp )
      {    
            excp.printStackTrace();
            msgout = excp.toString();
      }
	out.println(msgout);
%>