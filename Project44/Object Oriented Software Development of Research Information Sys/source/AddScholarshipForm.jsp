<html>
<head>
<title>Add Scholarship</title>
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
<body bgcolor="#FFFFef">
<div id="Layer1" style="position:absolute; left:50px; top:100px; width:680px; z-index:1"> 
<form name ="AddSchInfo" action="AddSchInfo.jsp">
  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#3399FF" bgcolor="#FFFFCC">
    <tr> 
      <td bgcolor="#FFCC66">
        <div align="center"><font size="5" color="#0000FF"><b>รายละเอียดทุน</b></font></div>
      </td>
    </tr>
    <tr>
      <td height="27">
          <table width="100%" border="0" cellspacing="0" cellpadding="4">
            <tr> 
              <td width="4%" height="31"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%" height="31"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="13%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อทุน</font></td>
                    <td><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="schname" size="40">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="3%"> <font size="4" face="Cordia New, CordiaUPC" color="#0000FF"> 
                      <input type="radio" name="kind" value="Thesis">
                      </font></td>
                    <td width="16%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">วิทยานิพนธ์</font></td>
                    <td width="1%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="kind" value="Paper">
                      </font></td>
                    <td width="26%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ผลงานวิจัยทางวิชาการ</font></td>
                    <td width="3%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="kind" value="Normal">
                      </font></td>
                    <td width="51%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ทั่วไป</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="4%"> <font size="4" face="Cordia New, CordiaUPC" color="#0000FF"> 
                      <input type="radio" name="type" value="C">
                      </font></td>
                    <td width="15%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ผูกพัน</font></td>
                    <td width="4%"> <font size="4" face="Cordia New, CordiaUPC" color="#0000FF"> 
                      <input type="radio" name="type" value="N">
                      </font></td>
                    <td width="77%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ไม่ผูกพัน</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="16%"><font size="4" face="Cordia New, CordiaUPC" color="#0000FF">วันหมดเขต</font></td>
                    <td width="84%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="day" size="2" maxlength="2">
                      / 
                      <input type="text" name="mon" size="2" maxlength="2">
                      / 
                      <input type="text" name="year" size="4" maxlength="4">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="16%"><font size="4" face="Cordia New, CordiaUPC" color="#0000FF">จำนวนเงิน</font></td>
                    <td width="84%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="money" size="5" maxlength="5">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <div align="center"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="16%"><font size="4" face="Cordia New, CordiaUPC" color="#0000FF">จำนวนทุน</font></td>
                      <td width="84%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                        <input type="text" name="howmany" size="3" maxlength="3">
                        </font></td>
                    </tr>
                  </table>
                </div>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <div align="center"><font face="Cordia New, CordiaUPC" size="4"> 
                  <input type="submit" name="ok" value="ตกลง">
                  <input type="submit" name="ok" value="cancel">
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
