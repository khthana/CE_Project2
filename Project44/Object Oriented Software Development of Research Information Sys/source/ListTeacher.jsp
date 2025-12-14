<html>
<head>
<title>Teacher list page</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
body {  margin: 0px  0px; padding: 0px  0px}
a:link { color: #005CA2; text-decoration: none}
a:visited { color: #005CA2; text-decoration: none}
a:active { color: #0099FF; text-decoration: underline}
a:hover { color: #0099FF; text-decoration: underline}
-->
</style>
</head>
<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>

<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
	String facid = request.getParameter("facid");
	String acadt= request.getParameter("acadt");
	String expyear = request.getParameter("expyear");

	String tlist = "";
	String facn="";
		
	String msgout = "";
	String tname="",tsur="",tid="";

	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String q = " SELECT FAC_NAME_TH FROM FACULTY_INFO WHERE FAC_ID ="+facid;
	ResultSet  rs = statement.executeQuery(q);

	while (rs.next()){
		facn= rs.getString(1);
	};

	rs.close();
	if (expyear.equals("")) {expyear ="0";}
	if ( (!expyear.equals("")) &&(!facid.equals("")) && (!acadt.equals("")) ) {

	String q1 = " SELECT  T_ID,NAME_TH,SURNAME_TH  FROM TEACHER_INFO  WHERE DEPT_ID = "+facid+" AND YEAR_EXP >= "+expyear+" AND ACAD_POS_TH = '"+acadt+"'";

	ResultSet  rs1 = statement.executeQuery(q1);

	while (rs1.next() ) {
	tid	 = rs1.getString(1);
	tname = rs1.getString(2);
	tsur = rs1.getString(3);
	tlist = tlist + "\n                  <tr><td width=\"10%\"></td><td width=\"50%\"><a href=\"/demo/ShowInfo.jsp?tid="+tid+"\"> "+tname+"</a></td> <td width=\"40%\"> <a href=\"/demo/ShowInfo.jsp?tid="+tid+"\">"+tsur+"</td></tr>";
	};
	tlist= tlist+"          <tr>            <td width=\"10%\"></td>          <td width=\"50%\">&nbsp;</td>            <td width=\"40%\">&nbsp;</td>          </tr>";
	};
	if ( (!expyear.equals("")) &&(!facid.equals("")) && (acadt.equals("")) ) {
		String q1 = " SELECT  T_ID,NAME_TH,SURNAME_TH  FROM TEACHER_INFO  WHERE DEPT_ID = "+facid+" AND YEAR_EXP >= "+expyear;

	ResultSet  rs1 = statement.executeQuery(q1);

	while (rs1.next() ) {
	tid	 = rs1.getString(1);
	tname = rs1.getString(2);
	tsur = rs1.getString(3);
	tlist = tlist + "\n                  <tr><td width=\"10%\"></td><td width=\"50%\"><a href=\"/demo/ShowInfo.jsp?tid="+tid+"\"> "+tname+"</a></td> <td width=\"40%\"> <a href=\"/demo/ShowInfo.jsp?tid="+tid+"\">"+tsur+"</td></tr>";
	};
	tlist= tlist+"          <tr>            <td width=\"10%\"></td>          <td width=\"50%\">&nbsp;</td>            <td width=\"40%\">&nbsp;</td>          </tr>";
	};
	if ( (expyear.equals("")) &&(!facid.equals("")) && (acadt.equals("")) ) {
		String q1 = " SELECT  T_ID,NAME_TH,SURNAME_TH  FROM TEACHER_INFO  WHERE DEPT_ID = "+facid;

	ResultSet  rs1 = statement.executeQuery(q1);

	while (rs1.next() ) {
	tid	 = rs1.getString(1);
	tname = rs1.getString(2);
	tsur = rs1.getString(3);
	tlist = tlist + "\n                  <tr><td width=\"10%\"></td><td width=\"50%\"><a href=\"/demo/ShowInfo.jsp?tid="+tid+"\"> "+tname+"</a></td> <td width=\"40%\"> <a href=\"/demo/ShowInfo.jsp?tid="+tid+"\">"+tsur+"</td></tr>";
	};
	tlist= tlist+"          <tr>            <td width=\"10%\"></td>          <td width=\"50%\">&nbsp;</td>            <td width=\"40%\">&nbsp;</td>          </tr>";
	};


	
	
// out.print(" </table>");

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
<body bgcolor="#FFFFef">
<div id="Layer1" style="position:absolute; left:50px; top:100px; width:680px; z-index:1"> 
  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#3399FF" height="67" bgcolor="#FFFFCC">
    <tr>
      <td height="25" bgcolor="#FFCC66"> 
        <div align="center"><font size="4"><b><font color="#0000FF">รายชื่ออาจารย์<%=facn%></font></b></font></div>
      </td>
    </tr>
    <tr> 
    </tr>
    <tr> 
      <td height="27"> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="10%" height="13"></td>
            <td width="50%" height="13"></td>
            <td width="40%" height="13">&nbsp;</td>
          </tr>
          <tr> 
            <td width="10%"></td>
            <td width="50%"> 
              <p><font color="#0000FF" face="Cordia New, CordiaUPC" size="4">ชื่อ</font></p>
            </td>
            <td width="40%"> 
              <p><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">นามสกุล</font></p>
            </td>
          </tr>
          <font color="#0000FF" face="Cordia New, CordiaUPC" size="4"><%=tlist%></font> 
        </table>
      </td>
    </tr>
  </table>
</div>
</body>
</html>
