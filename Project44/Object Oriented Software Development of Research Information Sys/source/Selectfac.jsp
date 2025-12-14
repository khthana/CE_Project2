<html>
<head>
<title>ใส่รหัสนักศึกษาที่ต้องการ</title>
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
<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>
<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
		String msgout = "";
		String data="";
	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
	String facid=null,facn=null;
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String q1 = " SELECT FAC_ID,FAC_NAME_TH FROM FACULTY_INFO";

	ResultSet  rs = statement.executeQuery(q1);

	while (rs.next()) {
		facid = rs.getString(1);
		facn = rs.getString(2);
		data = data+"			<option value=\""+facid+"\" >"+facn+"</option>\n";
	}

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
</head>
<body bgcolor="#FFFFFF">
<div id="Layer1" style="position:absolute; left:200px; top:150px; width:380px; z-index:1"> 
  <form name="ListTeacher"  action = "ListTeacher.jsp" >
    <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0066FF" height="100%">
      <tr> 
        <td height="27" bgcolor="#FFFFCC"> 
          <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="136" bgcolor="#FFFFCC">
            <tr> 
              <td width="8%" height="52">&nbsp;</td>
              <td colspan="2" height="52"> 
                <div align="center"> </div>
              </td>
              <td width="9%" height="52">&nbsp;</td>
            </tr>
            <tr> 
              <td width="8%">&nbsp;</td>
              <td width="26%"> 
                <div align="center"><font color="#0000FF">เลือกคณะ</font></div>
              </td>
              <td width="57%"> 
                <select name="DEPARTMENT">
                  <%=data%> 
                </select>
              </td>
              <td width="9%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="8%">&nbsp;</td>
              <td width="26%">&nbsp; </td>
              <td width="57%">&nbsp;</td>
              <td width="9%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="8%">&nbsp;</td>
              <td colspan="2"> 
                <div align="center"> 
                  <input type="submit" name="Submit" value="ตกลง">
                </div>
              </td>
              <td width="9%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="8%">&nbsp;</td>
              <td colspan="2">&nbsp;</td>
              <td width="9%">&nbsp;</td>
            </tr>
          </table>
    </table>
  </form>
</div>
</body>
</html>
