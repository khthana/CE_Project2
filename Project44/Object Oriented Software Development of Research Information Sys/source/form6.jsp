<html>
<head>
<title>form6</title>
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
		String stdid = request.getParameter("stdid");

		String msgout = "";
		String stdname="",stdsur="",thid="";
		String topicT="",topicE="";

	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
//	String facid=null,facn=null;
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

	
String q3 = " SELECT THESIS_ID FROM THESIS_INFO "+
						" WHERE STD_ID =  '"+stdid+"'";

	ResultSet  rs2 = statement.executeQuery(q3);
	while (rs2.next()) {
				thid	= rs2.getString(1);
	}

	if ( (!thid. equals("") ) && (!stdname.equals("")) ) { 
	
			String q2 = " SELECT  TOPIC_TH,TOPIC_EN FROM  THESIS_INFO WHERE THESIS_ID = "+thid;
			ResultSet  rs1 = statement.executeQuery(q2);
			while (rs1.next()) {
				topicT	= rs1.getString(1);
				topicE= rs1.getString(2);
				
	 	} // while 
			
		} else response.sendRedirect("error.jsp");

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

</head>

<body bgcolor="#FFFFef">
<div id="Layer1" style="position:absolute; left:50px; top:100px; width:680px; height:100px; z-index:1"> 
<form name="reportThesisProgress" action="ReportTheProgress.jsp">
  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#3399FF" bgcolor="#FFFFCC">
    <tr> 
      <td bgcolor="#FFCC66"> 
        <div align="center"><font size="4"><b><font color="#0000FF" size="5">บว.วป.6 
          รายงานความก้าวหน้าวิทยานิพนธ์ </font></b></font></div>
      </td>
    </tr>
    <tr>
      <td height="27">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td width="0%" height="28">&nbsp;</td>
              <td width="18%" height="28"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td width="8%" height="28"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td width="0%" height="28"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td width="8%" height="28"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td width="9%" height="28"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td width="57%" height="28"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="0%">&nbsp;</td>
              <td width="18%"> 
                <table width="111%" border="0" cellspacing="0" cellpadding="0" height="8">
                  <tr> 
                    <td width="63%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">รหัสนักศึกษา</font></td>
                    <td width="37%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <%=stdid%> </font></td>
                  </tr>
                </table>
              </td>
              <td width="8%"> 
                <div align="right"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อ</font></div>
              </td>
              <td width="0%"> 
                <div align="center"><font face="Cordia New, CordiaUPC" size="4"><font face="Cordia New, CordiaUPC"><font face="Cordia New, CordiaUPC"><font size="4"><font size="4"><font color="#0000FF"></font></font></font></font></font> 
                  </font></div>
              </td>
              <td width="8%"> 
                <div align="left"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                  <%=stdname%> </font></div>
              </td>
              <td width="9%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">นามสกุล</font></td>
              <td width="57%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                <%=stdsur%> </font></td>
            </tr>
            <tr> 
              <td width="0%">&nbsp;</td>
              <td width="18%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อหัวข้อวิทยานิพนธ์</font></td>
              <td width="8%"> 
                <div align="left"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ไทย</font></div>
              </td>
              <td width="0%"> 
                <div align="center"><font face="Cordia New, CordiaUPC" size="4"><font face="Cordia New, CordiaUPC"><font face="Cordia New, CordiaUPC"><font size="4"><font size="4"><font color="#0000FF"></font></font></font></font></font> 
                  </font></div>
              </td>
              <td colspan="3"> 
                <div align="left"></div>
                <font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=topicT%> 
                </font></td>
            </tr>
            <tr> 
              <td width="0%">&nbsp;</td>
              <td width="18%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td width="8%"> 
                <div align="left"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">อังกฤษ</font></div>
              </td>
              <td width="0%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td colspan="3"> 
                <div align="left"></div>
                <font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=topicE%> 
                </font></td>
            </tr>
            <tr> 
              <td width="0%">&nbsp;</td>
              <td width="18%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"><b>ความก้าวหน้า</b></font></td>
              <td width="8%"> 
                <div align="left"><font face="Cordia New, CordiaUPC"><font face="Cordia New, CordiaUPC"><font size="4"><font size="4"><font color="#0000FF"></font></font></font></font></font></div>
              </td>
              <td width="0%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td colspan="3"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                <input type="hidden" name="ThesisId" value="<%=thid%>">
                </font></td>
            </tr>
            <tr> 
              <td width="0%" height="28">&nbsp;</td>
              <td colspan="6" height="28" rowspan="9"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                <textarea name="progress" cols="100" rows="15"></textarea>
                </font> </td>
            </tr>
            <tr> 
              <td width="0%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="0%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="0%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="0%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="0%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="0%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="0%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="0%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="0%" height="50">&nbsp;</td>
              <td width="18%" height="50">&nbsp;</td>
              <td width="8%" height="50">&nbsp;</td>
              <td width="0%" height="50">&nbsp;</td>
              <td width="8%" height="50">&nbsp;</td>
              <td width="9%" height="50">&nbsp;</td>
              <td width="57%" height="50">&nbsp;</td>
            </tr>
            <tr> 
              <td width="0%">&nbsp;</td>
              <td width="18%">&nbsp;</td>
              <td width="8%">&nbsp;</td>
              <td width="0%">&nbsp;</td>
              <td width="8%"> 
                <input type="submit" name="ok2" value="ตกลง">
              </td>
              <td width="9%"> 
                <input type="submit" name="cancel2" value="ยกเลิก">
              </td>
              <td width="57%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="0%">&nbsp;</td>
              <td width="18%">&nbsp;</td>
              <td width="8%">&nbsp;</td>
              <td width="0%">&nbsp;</td>
              <td width="8%">&nbsp;</td>
              <td width="9%">&nbsp;</td>
              <td width="57%">&nbsp;</td>
            </tr>
          </table>
      </td>
    </tr>
  </table>
  </form>
</div>
</body>
</html>
