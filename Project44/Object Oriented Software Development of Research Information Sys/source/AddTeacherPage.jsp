<html>
<head>
<title>Add New Teacher</title>
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
<body bgcolor="#FFFFCC" text="#0066FF">
<div id="Layer1" style="position:absolute; left:50px; top:100px; width:680px; height:100px; z-index:1"> 
  <form name="addteacher" method="post" action="/servlet/pro_gdl.AddTeacher">
 <%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
		String msgout = "";
		String data="			<option value=\"\" > Select </option>\n";
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
    <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#3399FF" bgcolor="#FFFFCC">
    <tr> 
      <td bgcolor="#FFCC66"> 
        <div align="center">
          <p><font size="4"><b><font color="#0000FF" size="5">บว.วป.15 แบบฟอร์มแต่งตั้งอาจารย์ 
            และ</font></b></font></p>
            <p><b><font size="5" color="#0000FF">บว.วป.16 แบบฟอร์มประวัติอาจารย์(ได้รับการอนุมัติแล้ว)</font></b></p>
        </div>
      </td>
    </tr>
    <tr>
      <td height="27"> 
	 
          <table width="100%" border="0" cellspacing="3" cellpadding="0">
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="15%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">รหัสอาจารย์</font></td>
                    <td width="85%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="T_CODE">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="16%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อ(ไทย)</font></td>
                    <td width="12%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="FR_T">
                        <option value="นาย">นาย</option>
                        <option value="นาง">นาง</option>
                        <option value="นางสาว">นางสาว</option>
                      </select>
                      </font></td>
                    <td width="29%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="text" name="NAME_T" size="30">
                      </font></td>
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">สกุล</font></td>
                    <td width="33%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" size="30" name="SUR_T">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="16%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อ(ENG)</font></td>
                    <td width="12%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="FR_E">
                        <option value="Mr.">Mr.</option>
                        <option value="Miss">Miss</option>
                        <option value="Mrs.">Mrs.</option>
                      </select>
                      </font></td>
                    <td width="29%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="NAME_E" size="30">
                      </font></td>
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">สกุล</font></td>
                    <td width="33%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="SUR_E" size="30">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="31%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ตำแหน่งทางวิชาการไทย</font></td>
                    <td width="11%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="ACAD_T">
                        <option value="อาจารย์">อาจารย์</option>
                        <option value="ผศ.">ผศ.</option>
                        <option value="ผศ.ดร.">ผศ.ดร.</option>
                        <option value="รศ.">รศ.</option>
                        <option value="รศ.ดร.">รศ.ดร</option>
                        <option value="ศ.">ศ.</option>
                        <option value="ศ.ดร.">ศ.ดร.</option>
                        <option value="ดร.">ดร.</option>
                      </select>
                      </font></td>
                    <td width="5%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ENG</font></td>
                    <td width="16%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="ACAD_E">
                        <option value="Lecturer">Lecturer</option>
                        <option value="Asst.Prof.">Asst.Prof.</option>
                        <option value="Asst.Prof.Dr.">Asst.Prof.Dr.</option>
                        <option value="Assoc.Prof.">Assoc.Prof.</option>
                        <option value="Assoc.Prof.Dr.">Assoc.Prof.Dr.</option>
                        <option value="Prof.">Prof.</option>
                        <option value="Prof.Dr.">Prof.Dr.</option>
                        <option value="Dr.">Dr.</option>
                      </select>
                      </font></td>
                    <td width="9%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">วันเกิด</font></td>
                    <td width="28%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="DATE" size="2">
                      / 
                      <input type="text" name="MON" size="2">
                      / 
                      <input type="text" name="YEAR" size="4">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                1). สถานภาพเป็นอาจารย์บัณทิต</font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT1" value="F" checked>
                      </font></td>
                    <td width="34%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ประจำ 
                      (FULL TIME)</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT1" value="P">
                      </font></td>
                    <td width="58%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">พิเศษ 
                      (PART TIME)</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">2). 
                สถานภาพการสอนวิชาในหลักสูตร</font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT2" value="M" checked>
                      </font></td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปริญญาโท</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT2" value="D">
                      </font></td>
                    <td width="16%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปริญญาเอก</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT2" value="A">
                      </font></td>
                    <td width="58%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปริญญาโท-เอก</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">3). 
                สถานภาพในการสอบวิทยานิพนธ์</font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT3" value="M" checked>
                      </font></td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปริญญาโท</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT3" value="D">
                      </font></td>
                    <td width="16%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปริญญาเอก</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT3" value="A">
                      </font></td>
                    <td width="58%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปริญญาโท-เอก</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">4). 
                สถานภาพในควบคุมวิทยานิพนธ์</font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT4" value="M" checked>
                      </font></td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปริญญาโท</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT4" value="D">
                      </font></td>
                    <td width="16%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปริญญาเอก</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT4" value="A">
                      </font></td>
                    <td width="58%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปริญญาโท-เอก</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><b><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ประวัติการศึกษา</font></b></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="1" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="5%">&nbsp;</td>
                    <td width="19%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ระดับการศึกษา</font></td>
                    <td width="12%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปีสำเร็จ</font></td>
                    <td width="21%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">วิชาเอก</font></td>
                    <td width="23%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อปริญญา</font></td>
                    <td width="20%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">สถานศึกษา</font></td>
                  </tr>
                  <tr> 
                    <td width="5%" height="29"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">1. 
                      </font></td>
                    <td width="19%" height="29"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="LVL1">
                        <option value="B">ปริญญาตรี</option>
                        <option value="M">ปริญญาโท</option>
                        <option value="D">ปริญญาเอก</option>
                      </select>
                      </font></td>
                    <td width="12%" height="29"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="YEAR1" size="5">
                      </font></td>
                    <td width="21%" height="29"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="MAJOR1">
                      </font></td>
                    <td width="23%" height="29"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="DGT1">
                      </font></td>
                    <td width="20%" height="29"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="PLACE1">
                      </font></td>
                  </tr>
                  <tr> 
                    <td width="5%" height="29"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">2.</font></td>
                    <td width="19%" height="29"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="LVL2">
                        <option value="B">ปริญญาตรี</option>
                        <option value="M">ปริญญาโท</option>
                        <option value="D">ปริญญาเอก</option>
                      </select>
                      </font></td>
                    <td width="12%" height="29"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="YEAR2" size="5">
                      </font></td>
                    <td width="21%" height="29"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="MAJOR2">
                      </font></td>
                    <td width="23%" height="29"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="DGT2">
                      </font></td>
                    <td width="20%" height="29"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="PLACE2">
                      </font></td>
                  </tr>
                  <tr> 
                    <td width="5%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">3.</font></td>
                    <td width="19%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="LVL3">
                        <option value="B">ปริญญาตรี</option>
                        <option value="M">ปริญญาโท</option>
                        <option value="D">ปริญญาเอก</option>
                      </select>
                      </font></td>
                    <td width="12%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="YEAR3" size="5">
                      </font></td>
                    <td width="21%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="MAJOR3">
                      </font></td>
                    <td width="23%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="DGT3">
                      </font></td>
                    <td width="20%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="PLACE3">
                      </font></td>
                  </tr>
                  <tr> 
                    <td width="5%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">4.</font></td>
                    <td width="19%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="LVL4">
                        <option value="B">ปริญญาตรี</option>
                        <option value="M">ปริญญาโท</option>
                        <option value="D">ปริญญาเอก</option>
                      </select>
                      </font></td>
                    <td width="12%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="YEAR4" size="5">
                      </font></td>
                    <td width="21%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="MAJOR4">
                      </font></td>
                    <td width="23%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="DGT4">
                      </font></td>
                    <td width="20%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="PLACE4">
                      </font></td>
                  </tr>
                  <tr> 
                    <td width="5%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">5.</font></td>
                    <td width="19%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="LVL5">
                        <option value="B">ปริญญาตรี</option>
                        <option value="M">ปริญญาโท</option>
                        <option value="D">ปริญญาเอก</option>
                      </select>
                      </font></td>
                    <td width="12%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="YEAR5" size="5">
                      </font></td>
                    <td width="21%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="MAJOR5">
                      </font></td>
                    <td width="23%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="DGT5">
                      </font></td>
                    <td width="20%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="PLACE5">
                      </font></td>
                  </tr>
                  <tr> 
                    <td width="5%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">6.</font></td>
                    <td width="19%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="LVL6">
                        <option value="B">ปริญญาตรี</option>
                        <option value="M">ปริญญาโท</option>
                        <option value="D">ปริญญาเอก</option>
                      </select>
                      </font></td>
                    <td width="12%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="YEAR6" size="5">
                      </font></td>
                    <td width="21%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="MAJOR6">
                      </font></td>
                    <td width="23%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="DGT6">
                      </font></td>
                    <td width="20%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="PLACE6">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font> 
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="12%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ที่อยู่</font></td>
                    <td width="88%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="ADDRESS" size="90">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="12%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">จังหวัด</font></td>
                    <td width="23%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="STATE">
                      </font></td>
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ประเทศ</font></td>
                    <td width="22%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="COUNTRY">
                      </font></td>
                    <td width="18%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">รหัสไปรษณีย์</font></td>
                    <td width="15%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="CODE" size="11">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="12%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">เบอร์โทร</font></td>
                    <td width="26%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="TEL">
                      </font></td>
                    <td width="7%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">FAX</font></td>
                    <td width="55%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="FAX">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="12%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">อีเมล์</font></td>
                    <td width="26%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="EMAIL">
                      </font></td>
                    <td width="7%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">URL</font></td>
                    <td width="55%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="URL" size="47">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><b><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ความเชี่ยวชาญเฉพาะ</font></b></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="3" cellpadding="0">
                  <tr> 
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">1).</font></td>
                    <td width="90%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="SPEC1" size="80">
                      </font></td>
                  </tr>
                  <tr> 
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">2).</font></td>
                    <td width="90%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="SPEC2" size="80">
                      </font></td>
                  </tr>
                  <tr> 
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">3).</font></td>
                    <td width="90%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="SPEC3" size="80">
                      </font></td>
                  </tr>
                  <tr> 
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">4).</font></td>
                    <td width="90%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="SPEC4" size="80">
                      </font></td>
                  </tr>
                  <tr> 
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">5).</font></td>
                    <td width="90%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="SPEC5" size="80">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="52%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ประสบการณ์ในการทำงาน/สอน/วิจัย 
                      รวม </font></td>
                    <td width="8%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="S_YEAR" size="2">
                      </font></td>
                    <td width="40%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปี</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><b><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">รายชื่อวิชาที่คาดว่าจะสอน(รหัสวิชา)</font></b></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="3" cellpadding="0">
                  <tr> 
                    <td width="10%" height="27"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">1).</font></td>
                    <td width="90%" height="27"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="SUB1" size="15">
                      </font></td>
                  </tr>
                  <tr> 
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">2).</font></td>
                    <td width="90%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="SUB2" size="15">
                      </font></td>
                  </tr>
                  <tr> 
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">3).</font></td>
                    <td width="90%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="SUB3" size="15">
                      </font></td>
                  </tr>
                  <tr> 
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">4).</font></td>
                    <td width="90%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="SUB4" size="15">
                      </font></td>
                  </tr>
                  <tr> 
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">5).</font></td>
                    <td width="90%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="SUB5" size="15">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="25%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">คณะที่สังกัด</font></td>
                    <td width="75%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="DEPARTMENT">
                        <%=data%> 
                      </select>
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="25%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ตำแหน่งบริหาร</font></td>
                    <td width="75%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="ADMIN" size="60">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <div align="center"> 
                  <input type="submit" name="ok" value="ตกลง">
                  <input type="reset" name="cancel" value="ยกเลิก">
                </div>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%">&nbsp;</td>
            </tr>
          </table>
      </td>
    </tr>
  </table>
  </form>
</div>
</body>
</html>
