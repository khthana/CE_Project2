<html>
<head>
<title>form17</title>
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
		String stdname="",stdsur="";
		String namet="",namee="";

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
	String q2 = " SELECT TOPIC_TH,TOPIC_EN FROM THESIS_INFO "+
						" WHERE STD_ID =  '"+stdid+"'";

	ResultSet  rs2 = statement.executeQuery(q2);
	while (rs2.next()) {
				namet	= rs2.getString(1);
				namee = rs2.getString(2);
	}


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
<form name="studentfinish" action="AddStdToAlumni.jsp">
  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#3399FF" bgcolor="#FFFFCC">
    <tr> 
      <td bgcolor="#FFCC66"> 
        <div align="center"><font size="4"><b><font color="#0000FF" size="5">บว.วป.17 
          ประวัตินักศึกษาที่สำเร็จการศึกษา</font></b></font></div>
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
                    <td width="21%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=stdname%></font></td>
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
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="6%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">คณะ</font></td>
                    <td width="31%"><font face="Cordia New, CordiaUPC" size="4" color="#000000">-</font></td>
                    <td width="9%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">หลักสูตร</font></td>
                    <td width="54%"><font face="Cordia New, CordiaUPC" size="4" color="#000000">-</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="6%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">สาขา</font></td>
                    <td width="31%"><font face="Cordia New, CordiaUPC" size="4" color="#000000">-</font></td>
                    <td width="9%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">แขนง</font></td>
                    <td width="54%"><font face="Cordia New, CordiaUPC" size="4" color="#000000">-</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="6%" height="27"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">แผน</font></td>
                    <td width="94%" height="27"><font face="Cordia New, CordiaUPC" size="4" color="#000000">-</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อหัวข้อวิทยานิพนธ์ 
                      </font></td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ภาษาไทย 
                      </font></td>
                    <td width="67%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=namet%></font></td>
                  </tr>
                  <tr> 
                    <td width="19%">&nbsp;</td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ภาษาอังกฤษ</font></td>
                    <td width="67%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"><%=namee%></font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="18%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปีที่สำเร็่จการศึกษา</font></td>
                    <td width="82%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="year" size="4" maxlength="4">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="15%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">อาชีพ</font></td>
                    <td width="85%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="job" size="70">
                      <input type="hidden" name="stdid" value="<%=stdid%>">
                      </font></td>
                  </tr>
                  <tr> 
                    <td width="15%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ที่อยู่</font></td>
                    <td width="85%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="add" size="70">
                      </font></td>
                  </tr>
                  <tr> 
                    <td width="15%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ประเทศ</font></td>
                    <td width="85%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="country">
                      </font></td>
                  </tr>
                  <tr> 
                    <td width="15%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">เบอร์โทร</font></td>
                    <td width="85%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="tel">
                      </font></td>
                  </tr>
                </table>
              </td>
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
              <td width="96%">&nbsp; </td>
            </tr>
          </table>
      </td>
    </tr>
  </table>
  </form>
</div>
</body>
</html>
