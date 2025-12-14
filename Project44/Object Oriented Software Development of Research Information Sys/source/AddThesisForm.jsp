<html>
<head>
<title>AddThesis</title>
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
<form name = "addThesisform" action="AddThesis.jsp">
  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#3399FF" bgcolor="#FFFFCC">
    <tr> 
      <td bgcolor="#FFCC66">
        <div align="center"><font size="5" color="#0000FF"><b>วิทยานิพนธ์</b></font></div>
      </td>
    </tr>
    <tr>
      <td height="27">
          <table width="100%" border="0" cellspacing="0" cellpadding="4">
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="13%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">รหัสนักศึกษา</font></td>
                    <td><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="stdid">
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
                    <td width="19%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">หัวข้อวิทยานิพนธ์</font></td>
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ภาษาไทย</font></td>
                    <td width="71%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="Ttopic" size="60">
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
                    <td width="15%">&nbsp;</td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ภาษาอังกฤษ</font></td>
                    <td width="71%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="Etopic" size="60">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%" height="31">&nbsp;</td>
              <td width="96%" height="31"> 
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="17%"> 
                      <div align="left"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปีการศึกษา</font></div>
                    </td>
                    <td width="3%">&nbsp;</td>
                    <td width="80%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="acadyear">
                        <option value="2535">2535</option>
                        <option value="2536">2536</option>
                        <option value="2537">2537</option>
                        <option value="2537">2538</option>
                        <option value="2538">2539</option>
                        <option value="2539">2540</option>
                        <option value="2540">2540</option>
                        <option value="2542">2542</option>
                        <option value="2543">2543</option>
                        <option value="2544">2544</option>
                      </select>
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
                    <td width="23%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">อาจารย์ควบคุมวิทยานิพนธ์</font></td>
                    <td width="5%"> 
                      <div align="right"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">อาจารย์</font></div>
                    </td>
                    <td width="1%">&nbsp;</td>
                    <td width="19%"> 
                      <div align="left"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                        <input type="text" name="TName">
                        </font></div>
                    </td>
                    <td width="10%"> 
                      <div align="center"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">นามสกุล</font></div>
                    </td>
                    <td width="42%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="TSur">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <div align="center"><font face="Cordia New, CordiaUPC" size="4"> 
                  <input type="submit" name="ok222" value="ตกลง">
                  <input type="submit" name="cancel22" value="ยกเลิก">
                  </font></div>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
            </tr>
          </table>
      </td>
    </tr>
  </table>
  </form>
</div>
</body>
</html>
