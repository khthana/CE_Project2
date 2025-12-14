<html>
<head>
<title>Thesis list page</title>
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
	String acadyear = request.getParameter("acadyear");

	String thelist = "";
	String stdid="";
	String thename="";
		
	String msgout = "";


	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	if  (!acadyear.equals(""))  {

	String q1 = " SELECT  STD_ID,TOPIC_TH  FROM THESIS_INFO  WHERE ACADYEAR = '"+acadyear+"'";

	ResultSet  rs1 = statement.executeQuery(q1);

	while (rs1.next() ) {
	stdid	 = rs1.getString(1);
	thename = rs1.getString(2);

	thelist = thelist + "\n <tr>   <td width=\"19%\">&nbsp;&nbsp;&nbsp;&nbsp;"+stdid+"</td>            <td width=\"79%\">               <p>"+thename+"</p> </td>            <td width=\"2%\">&nbsp;</td>  </tr>";
        

	};
//	tlist= tlist+"          <tr>            <td width=\"10%\"></td>          <td width=\"50%\">&nbsp;</td>            <td width=\"40%\">&nbsp;</td>          </tr>";
thelist=thelist+"\n <tr>   <td width=\"19%\"> </td>            <td width=\"79%\">               <p> </p> </td>            <td width=\"2%\">&nbsp;</td>  </tr>";
	};
	if (thelist.equals("") ) { out.print("No thesis found <br>");}

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
        <div align="center"><font size="4"><b><font color="#0000FF">รายชื่อวิทยานิพนธ์ที่ค้นหาได้</font></b></font></div>
      </td>
    </tr>
    <tr> 
    </tr>
    <tr> 
      <td height="27"> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="19%" height="13"></td>
            <td width="79%" height="13"></td>
            <td width="2%" height="13">&nbsp;</td>
          </tr>
          <tr> 
            <td width="19%">
              <div align="center"><font color="#0000FF" size="4" face="Cordia New, CordiaUPC">รหัสนักศึกษา</font></div>
            </td>
            <td width="79%"> 
              <p align="center"> <font color="#0000FF" face="Cordia New, CordiaUPC" size="4">ชื่อวิทยานิพนธ์</font></p>
            </td>
            <td width="2%">&nbsp;</td>
          </tr>
          <font color="#000000" size="4" face="Cordia New, CordiaUPC"><%=thelist%> </font>
        </table>
      </td>
    </tr>
  </table>
</div>
</body>
</html>
