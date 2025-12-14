<%@  page session="true"  %>
<%@  include file ="checksessionT.inc" %>
<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
		String tid = request.getParameter("tid");

		String add= request.getParameter("add");
		String state = request.getParameter("state");
		String country= request.getParameter("country");
		String tel=request.getParameter("tel");
		String email= request.getParameter("email");
		String zip= request.getParameter("zip");
		String fax= request.getParameter("fax");
		String url =request.getParameter("url");

		String oldadd= request.getParameter("oldadd");
		String oldstate = request.getParameter("oldstate");
		String oldcountry= request.getParameter("oldcountry");
		String oldtel=request.getParameter("oldtel");
		String oldemail= request.getParameter("oldemail");
		String oldzip= request.getParameter("oldzip");
		String oldfax= request.getParameter("oldfax");
		String oldurl =request.getParameter("oldurl");
		String msgout = "";
try
      {        

	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	

	if (add.equals("") ) {add= oldadd;}out.print("OK222");
	if (add.equals("")) {state = oldstate;}out.print("OK3");
	if (country.equals("")) {country= oldcountry;}out.print("OK4");
	if (tel.equals("")) {tel=oldtel;}out.print("OK5");
	if (email.equals("")){ email=oldemail;}out.print("OK6");
	if (zip.equals("")) {zip=oldzip;}out.print("OK7");
	if (fax.equals("")) {fax=oldfax;}out.print("OK8");
	if (url.equals("")) {url=oldurl;}out.print("OK9");

	String qt = "UPDATE TEACHER_INFO SET(ADDRESS,STATE,COUNTRY,ZIP,TEL_NUMBER,FAX,EMAIL,URL) =('"+add+"','"+state+"','"+country+"','"+zip+"', '"+tel+"','"+fax+"','"+email+"','"+url+"') WHERE T_ID = "+tid;
	ResultSet rt = statement.executeQuery(qt);

	response.sendRedirect("passT.jsp");
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
		

%>
