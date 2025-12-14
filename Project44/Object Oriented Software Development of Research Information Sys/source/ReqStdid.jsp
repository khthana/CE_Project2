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
<div id="Layer1" style="position:absolute; left:213px; top:128px; width:360px"> 
  <form name="reqstdid"  action = "showform.jsp" >
    <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0066FF" height="100%">
      <tr> 
        <td height="27"> 
          <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="111" bgcolor="#FFFFCC">
            <tr> 
              <td width="9%" height="27">&nbsp;</td>
              <td width="36%" height="27"> 
                <div align="center"></div>
              </td>
              <td width="48%" height="27">&nbsp;</td>
              <td width="7%" height="27">&nbsp;</td>
            </tr>
            <tr> 
              <td width="9%">&nbsp;</td>
              <td colspan="2"> 
                <div align="center"><font face="Cordia New, CordiaUPC" size="4"><b><font color="#0000FF">โปรดใส่รหัสนักศึกษา</font></b></font></div>
              </td>
              <td width="7%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="9%">&nbsp;</td>
              <td width="36%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="48%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="7%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="9%">&nbsp;</td>
              <td width="36%"> 
                <div align="center"><font color="#0000FF" face="Cordia New, CordiaUPC" size="4">รหัสนักศึกษา 
                  </font></div>
              </td>
              <td width="48%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                <input type="text" name="Stdid">
                <input type="hidden" name="FormNo" value="<%=formNo%>">
                </font></td>
              <td width="7%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="9%">&nbsp;</td>
              <td width="36%"><font face="Cordia New, CordiaUPC" size="4"></font> 
              </td>
              <td width="48%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="7%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="9%">&nbsp;</td>
              <td colspan="2"> 
                <div align="center"> <font face="Cordia New, CordiaUPC" size="4"> 
                  <input type="submit" name="Submit" value="ตกลง">
                  </font></div>
              </td>
              <td width="7%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="9%">&nbsp;</td>
              <td colspan="2"> 
                <div align="center"> </div>
              </td>
              <td width="7%">&nbsp;</td>
            </tr>
          </table>
    </table>
  </form>
</div>
</body>
</html>
