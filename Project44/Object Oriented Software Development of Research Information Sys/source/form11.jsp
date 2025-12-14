<html>
<head>
<title>form11</title>
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
		String year="",sem="",result="",all="";

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
	if ( !stdname.equals("")) { 
	
			String q2 = " SELECT   YEAR , SEM , RESULT  FROM  TEST_SCHEDULE  WHERE STD_ID = '"+stdid+"' AND TEST_TYPE = 'K'";
			ResultSet  rs1 = statement.executeQuery(q2);
			int cnt=1;
			while (rs1.next()) {
				year	= rs1.getString(1);
				sem = rs1.getString(2);
				result = rs1.getString(3);
				all = all +"\n                 <tr>  <td width=\"15%\"> <div align=\"center\"><font face=\"Cordia New, CordiaUPC\" size=\"4\">"+cnt+"</font></div></td><td width=\"18%\"><div align=\"center\"><font face=\"Cordia New, CordiaUPC\" size=\"4\">"+year+"</font></div>      </td> <td width=\"24%\"><div align=\"center\"><font face=\"Cordia New, CordiaUPC\" size=\"4\">"+sem+"</font></div> </td><td width=\"43%\"> <div align=\"center\"><font face=\"Cordia New, CordiaUPC\" size=\"4\">"+result+"</font></div></td></tr>";
				cnt++;
	 	} // while 
			if (all.equals("") ) {all = "<table width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\"> <tr><td> No Information Available </td></tr>"; }
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
<form name="TestKnowledge" action="AddTestSch.jsp">
  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#3399FF" bgcolor="#FFFFCC">
    <tr> 
      <td bgcolor="#FFCC66"> 
        <div align="center"><font size="4"><b><font color="#0000FF" size="5">บว.วป.11 
          ขอสอบประมวณความรู้ </font></b></font></div>
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
                    <td>&nbsp;</td>
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
                    <td width="7%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="hidden" name="stdid" value="<%=stdid%>">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="3" cellpadding="0">
                  <tr> 
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปีการศึกษา</font></td>
                    <td width="28%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <select name="acadyear" >
                        <option value="2544">2544</option>
                        <option value="2545" selected>2545</option>
                        <option value="2546">2546</option>
                        <option value="2547">2547</option>
                        <option value="2548">2548</option>
                        <option value="2549">2549</option>
                        <option value="2550">2550</option>
                      </select>
                      </font></td>
                    <td width="25%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ภาคการศึกษา</font></td>
                    <td width="33%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="sem" >
                        <option value="1" selected>1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                      </select>
                      </font></td>
                  </tr>
                  <tr> 
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">วันกำหนดสอบ</font></td>
                    <td width="28%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="day" size="2" maxlength="2">
                      / 
                      <input type="text" name="mon" size="2" maxlength="2">
                      / 
                      <input type="text" name="year" size="4" maxlength="4">
                      </font></td>
                    <td width="25%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ห้องสอบ</font></td>
                    <td width="33%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="room" size="10">
                      </font></td>
                  </tr>
                  <tr> 
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">เวลาเริ่มสอบ</font></td>
                    <td width="28%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="shour" size="2" maxlength="2">
                      : 
                      <input type="text" name="smin" size="2" maxlength="2">
                      น.</font></td>
                    <td width="25%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">เวลาสิ้นสุดการสอบ</font></td>
                    <td width="33%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="ehour" size="2" maxlength="2">
                      : 
                      <input type="text" name="emin" size="2" maxlength="2">
                      น.</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <div align="left"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"><b>ผลการสอบครั้งที่ผ่านมา 
                  </b> </font></div>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <div align="center"> 
                  <table width="100%" border="1" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="15%"> 
                        <div align="center"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">สอบครังที่</font></div>
                      </td>
                      <td width="18%"> 
                        <div align="center"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ภาคการศึกษา</font></div>
                      </td>
                      <td width="24%"> 
                        <div align="center"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปีการศึกษา</font></div>
                      </td>
                      <td width="43%"> 
                        <div align="center"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ผลการศึกษา</font></div>
                      </td>
                    </tr>
                    <font face="Cordia New, CordiaUPC" size="4" color="#000000"> <%=all%> </font>
                  </table>
                </div>
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
