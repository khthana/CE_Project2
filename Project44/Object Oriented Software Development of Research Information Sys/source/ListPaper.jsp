<html>
<head>
<title>Paper list page</title>
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
	String pubyear = request.getParameter("pubyear");

	String plist = "";
	String stdid="";
	String pname="";
		
	String msgout = "";


	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	if  (!pubyear.equals(""))  {

	String q1 = " SELECT  STD_ID,TOPIC_TH,PAPER_ID  FROM STD_PAPER  WHERE PUBYEAR = '"+pubyear+"'";

	ResultSet  rs1 = statement.executeQuery(q1);
	String pid="";
	while (rs1.next() ) {
	stdid	 = rs1.getString(1);
	pname = rs1.getString(2);
	pid=rs1.getString(3);

	plist = plist + "\n <tr>   <td width=\"19%\"> &nbsp;&nbsp;&nbsp; "+stdid+"</td>            <td width=\"79%\">       <a href=\"ShowPaperInfo.jsp?pid="+pid+"\" >        <p>"+pname+"</p> </td>     </a>       <td width=\"2%\">&nbsp;</td>  </tr>";
        

	};

plist=plist+"\n <tr>   <td width=\"19%\"> </td>            <td width=\"79%\">               <p> </p> </td>            <td width=\"2%\">&nbsp;</td>  </tr>";
	};
//	if (plist.equals("") ) { plist= "\n <tr>   <td width=\"19%\"> </td>            <td width=\"79%\">       No Papar found !!        <p> </p> </td>            <td width=\"2%\">&nbsp;</td>  </tr>";}

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
        <div align="center"><font size="4"><b><font color="#0000FF" face="Cordia New, CordiaUPC" size="5">รายชื่อบทความวิชาการที่ค้นหาได้</font></b></font></div>
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
              <p align="center"> <font color="#0000FF" size="4" face="Cordia New, CordiaUPC">ชื่อบทความ</font></p>
            </td>
            <td width="2%">&nbsp;</td>
          </tr>
          <font color="#000000" size="4" face="Cordia New, CordiaUPC"><%=plist%></font> 
        </table>
      </td>
    </tr>
  </table>
</div>
</body>
</html>
