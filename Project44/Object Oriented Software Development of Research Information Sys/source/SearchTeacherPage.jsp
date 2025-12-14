<html>
<head>
<title>SearchTeacher</title>
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

<body bgcolor="#FFFFCC">
<div id="Layer1" style="position:absolute; left:50px; top:50px; width:680px; z-index:1">
<form name="SearchTheacher" action="ListTeacher.jsp">
  <div align="center">
    <p><font face="Cordia New, CordiaUPC" size="5"><b><font size="6" color="#3333CC">ค้นหาข้อมูลอาจารย์</font></b></font></p>
    <p><img src="line.jpg" width="503" height="2"></p>
    <p>&nbsp;</p>
      <table width="60%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="41%"> 
            <div align="right"><font face="Cordia New, CordiaUPC" size="4" color="#3333CC">คณะ</font></div>
          </td>
          <td width="6%"><font face="Cordia New, CordiaUPC" size="4"></font> </td>
          <td width="53%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
            <select name="facid">
              <%=data%> 
            </select>
            </font></td>
        </tr>
        <tr> 
          <td width="41%"> 
            <div align="right"><font face="Cordia New, CordiaUPC" size="4" color="#3333CC">ตำแหน่งทางวิชาการ</font></div>
          </td>
          <td width="6%"><font face="Cordia New, CordiaUPC" size="4"></font> </td>
          <td width="53%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
            <select name="acadt">
              <option value="อาจารย์">อาจารย์</option>
              <option value="ผศ.">ผศ.</option>
              <option value="ผศ.ดร.">ผศ.ดร.</option>
              <option value="รศ.">รศ.</option>
              <option value="รศ.ดร.">รศ.ดร</option>
              <option value="ศ.">ศ.</option>
              <option value="ศ.ดร.">ศ.ดร.</option>
              <option value="ดร.">ดร.</option>
              <option selected value="">Select</option>
            </select>
            </font></td>
        </tr>
        <tr> 
          <td width="41%"> 
            <div align="right"><font face="Cordia New, CordiaUPC" size="4" color="#3333CC">ประสบการณ์</font></div>
          </td>
          <td width="6%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
          <td width="53%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
            <input type="text" name="expyear" size="2">
            &nbsp;&nbsp; <font color="#3333CC">ปี</font></font></td>
        </tr>
        <tr> 
          <td colspan="3"> 
            <div align="center"> <font face="Cordia New, CordiaUPC" size="4"> 
              <input type="submit" name="ok" value="ตกลง">
              </font></div>
          </td>
        </tr>
      </table>
    <p>&nbsp;</p>
    <p><img src="line.jpg" width="503" height="2"></p>
  </div>
  </form >
</div>
</body>
</html>
