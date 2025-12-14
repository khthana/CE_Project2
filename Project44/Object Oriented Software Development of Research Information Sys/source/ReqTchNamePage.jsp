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
</head>
<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>
<%
	String formNo = request.getParameter("FormNo");
%>
<body bgcolor="#FFFFef">
<div id="Layer1" style="position:absolute; left:150px; top:175px; width:480px; height: 0"> 
  <form name="reqstdid"  action = "SearchT.jsp" >
    <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0066FF" height="100%">
      <tr> 
        <td height="27"> 
          <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="100%" bgcolor="#FFFFCC">
            <tr> 
              <td width="8%" height="27">&nbsp;</td>
              <td width="36%" height="27"> 
                <div align="center"></div>
              </td>
              <td width="10%" height="27">&nbsp;</td>
              <td width="46%" height="27">&nbsp;</td>
            </tr>
            <tr> 
              <td colspan="4"> 
                <div align="center"><font size="5" face="Cordia New, CordiaUPC"><b><font color="#0000FF">โปรดชื่อ-สกุลของอาจารย์</font></b></font></div>
              </td>
            </tr>
            <tr> 
              <td width="8%"><font size="5" face="Cordia New, CordiaUPC"></font></td>
              <td width="36%"><font size="5" face="Cordia New, CordiaUPC"></font></td>
              <td width="10%"><font size="5" face="Cordia New, CordiaUPC"></font></td>
              <td width="46%"><font size="5" face="Cordia New, CordiaUPC"></font></td>
            </tr>
            <tr> 
              <td width="8%" height="27"> 
                <div align="right"><font color="#0000FF" size="5" face="Cordia New, CordiaUPC"><b>ชื่อ</b></font></div>
              </td>
              <td width="36%" height="27"> 
                <div align="center"><font color="#000000" size="5" face="Cordia New, CordiaUPC"> 
                  <input type="text" name="tname">
                  </font></div>
              </td>
              <td width="10%" height="27"> 
                <div align="center"><font color="#0000FF" size="5" face="Cordia New, CordiaUPC"><b>สกุล</b></font></div>
              </td>
              <td width="46%" height="27"><font color="#000000" size="5" face="Cordia New, CordiaUPC"> 
                <input type="text" name="tsur">
                </font></td>
            </tr>
            <tr> 
              <td width="8%"><font size="5" face="Cordia New, CordiaUPC"></font></td>
              <td width="36%"><font size="5" face="Cordia New, CordiaUPC"></font> 
              </td>
              <td width="10%"><font size="5" face="Cordia New, CordiaUPC"></font></td>
              <td width="46%"><font size="5" face="Cordia New, CordiaUPC"></font></td>
            </tr>
            <tr> 
              <td colspan="4"> 
                <div align="center"> 
                  <input type="submit" name="Submit" value="ตกลง">
                </div>
              </td>
            </tr>
            <tr> 
              <td colspan="4">&nbsp;</td>
            </tr>
          </table>
    </table>
  </form>
</div>
</body>
</html>
