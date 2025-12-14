<html>
<head>
<title>form5</title>
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

</head>
<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
		String stdid = request.getParameter("stdid");

		String msgout = "";
		String stdname="",stdsur="",thid="";
		String topicT="",topicE="";

	try
      {        

	String userid = "dong";
    String passwd = "DONG";
//	String facid=null,facn=null;
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String q1 = " SELECT NAME_TH,SURNAME_TH  FROM STUDENT_INFO "+
						" WHERE STD_ID =  '"+stdid+"'";

	ResultSet  rs = statement.executeQuery(q1);

	while (rs.next()) {
		stdname = rs.getString(1);
		stdsur = rs.getString(2);
	}
	rs.close();
	
	String q2 = " SELECT THESIS_ID FROM THESIS_INFO "+
						" WHERE STD_ID =  '"+stdid+"'";

	ResultSet  rs2 = statement.executeQuery(q2);
	while (rs2.next()) {
			thid	= rs2.getString(1);
	}
	if( (!stdname. equals("") ) && (!thid.equals("")) ) { 
	
			String q3 = " SELECT  TOPIC_TH,TOPIC_EN FROM  THESIS_INFO WHERE THESIS_ID = "+thid;
			ResultSet  rs3 = statement.executeQuery(q3);
			while (rs3.next()) {
				topicT	= rs3.getString(1);
				topicE= rs3.getString(2);
				
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

<body bgcolor="#FFFFef">
<div id="Layer1" style="position:absolute; left:50px; top:100px; width:680px; height:100px; z-index:1"> 
<form name="chageThesisName" action="EditThesisName.jsp">
  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#3399FF" bgcolor="#FFFFCC">
    <tr> 
      <td bgcolor="#FFCC66"> 
        <div align="center"><font size="4"><b><font color="#0000FF" size="5">บว.วป.5 
          คำร้องขอเปลี่ยนแปลงหัวข้อวิทยานิพนธ์</font></b></font></div>
      </td>
    </tr>
    <tr>
      <td height="27">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="21%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td width="12%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td width="2%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td width="18%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td width="9%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td width="35%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="21%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="57%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">รหัสนักศึกษา</font></td>
                    <td width="43%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <%=stdid%> </font></td>
                  </tr>
                </table>
              </td>
              <td width="12%"> 
                <div align="right"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อ</font></div>
              </td>
              <td width="2%"> 
                <div align="center"><font face="Cordia New, CordiaUPC" size="4"><font face="Cordia New, CordiaUPC"><font face="Cordia New, CordiaUPC"><font size="4"><font size="4"><font color="#0000FF"></font></font></font></font></font> 
                  </font></div>
              </td>
              <td width="18%"> 
                <div align="left"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                  <%=stdname%> </font></div>
              </td>
              <td width="9%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">นามสกุล</font></td>
              <td width="35%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                <%=stdsur%> </font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="21%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อหัวข้อวิทยานิพนธ์เดิม</font></td>
              <td width="12%"> 
                <div align="left"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ภาษาไทย</font></div>
              </td>
              <td width="2%"> 
                <div align="center"><font face="Cordia New, CordiaUPC" size="4"><font face="Cordia New, CordiaUPC"><font face="Cordia New, CordiaUPC"><font size="4"><font size="4"><font color="#0000FF"></font></font></font></font></font> 
                  </font></div>
              </td>
              <td colspan="3"> 
                <div align="left"></div>
                <font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=topicT%> 
                </font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="21%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td width="12%"> 
                <div align="left"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ภาษาอังกฤษ</font></div>
              </td>
              <td width="2%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td colspan="3"> 
                <div align="left"></div>
                <font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=topicE%> 
                </font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="21%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อหัวข้อวิทยานิพนธ์ใหม่</font></td>
              <td width="12%"> 
                <div align="left"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ภาษาไทย</font></div>
              </td>
              <td width="2%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td colspan="3"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                <input type="text" name="NewTopTh" size="50">
                <input type="hidden" name="ThesisId" value="<%=thid%>">
                </font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="21%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td width="12%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ภาษาอังกฤษ</font></td>
              <td width="2%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td colspan="3"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                <input type="text" name="NewTopEn" size="50">
                </font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="21%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td width="12%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td width="2%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td width="18%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td width="9%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
              <td width="35%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="21%">&nbsp;</td>
              <td width="12%">&nbsp;</td>
              <td width="2%">&nbsp;</td>
              <td width="18%"> 
                <input type="submit" name="ok2" value="ตกลง">
                <input type="submit" name="cancel2" value="ยกเลิก">
              </td>
              <td width="9%">&nbsp; </td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="21%">&nbsp;</td>
              <td width="12%">&nbsp;</td>
              <td width="2%">&nbsp;</td>
              <td width="18%">&nbsp;</td>
              <td width="9%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
          </table>
      </td>
    </tr>
  </table>
  </form>
</div>
</body>
</html>
