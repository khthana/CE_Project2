<html>
<head>
<title>form14</title>
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
		String stdid = request.getParameter("stdid");

		String msgout = "";
		String stdname="",stdsur="",tid="",thid="";
		String topicT ="",date="";
//		String stdid= request.getParameter("stdid");
	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String q1 = " SELECT NAME_TH,SURNAME_TH FROM STUDENT_INFO "+
						" WHERE STD_ID =  '"+stdid+"'";

	ResultSet  rs = statement.executeQuery(q1);

	while (rs.next()) {
		stdname = rs.getString(1);
		stdsur = rs.getString(2);
	}
	rs.close();

	String q2 = " SELECT THESIS_ID,TOPIC_TH,DEAD_LINE  FROM THESIS_INFO   WHERE STD_ID =  '"+stdid+"'";

	ResultSet  rs2 = statement.executeQuery(q2);
	while (rs2.next()) {
				thid	= rs2.getString(1);
				topicT= rs2.getString(2);
				date= rs2.getString(3);
	}
				
//	if (date.equals("") ){date = "No information";}

	
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

	%>
<body bgcolor="#FFFFef">
<div id="Layer1" style="position:absolute; left:50px; top:100px; width:680px; height:100px; z-index:1"> 
<form name="sendthesslate" action="SendThesisLate.jsp">
  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#3399FF" bgcolor="#FFFFCC">
    <tr> 
      <td bgcolor="#FFCC66"> 
          <div align="center"><font size="4"><b><font color="#0000FF" size="5">บว.วป.14 
            คำร้องขอส่งวิทยานิพนธ์ล่าช้า</font></b></font></div>
      </td>
    </tr>
    <tr>
      <td height="27">
          <table width="100%" border="0" cellspacing="0" cellpadding="4">
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td> 
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr> 
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="13%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">รหัสนักศึกษา</font></td>
                    <td width="19%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <%=stdid%> </font></td>
                    <td width="5%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อ</font></td>
                    <td width="21%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <%=stdname%> </font></td>
                    <td width="11%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">นามสกุล</font></td>
                    <td width="24%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <%=stdsur%> </font></td>
                    <td width="7%">&nbsp;</td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="32%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อหัวข้อวิทยานิพนธ์</font></td>
                    <td width="68%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=topicT%> 
                      </font></td>
                    <input type="hidden" name="thid" value="<%=thid%>" >
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="21%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">วันกำหนดส่งเดิม</font></td>
                    <td width="79%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=date%></font></td>
                  </tr>
                  <tr> 
                    <td width="21%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">วันกำหนดส่งใหม่</font></td>
                    <td width="79%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="eday" size="2" maxlength="2">
                      / 
                      <input type="text" name="emon" size="2" maxlength="2">
                      / 
                      <input type="text" name="eyear" size="4" maxlength="4">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%">&nbsp; </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <div align="center"><font face="Cordia New, CordiaUPC" size="4"> 
                  <input type="submit" name="ok22" value="ตกลง">
                  <input type="submit" name="cancel22" value="ยกเลิก">
                  </font></div>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%">&nbsp;</td>
            </tr>
          </table>
      </td>
    </tr>
  </table>
  </form>
</div>
</body>
</html>
