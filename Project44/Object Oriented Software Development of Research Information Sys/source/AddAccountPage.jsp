<html>
<head>
<title>Add Account</title>
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
<%@  include file ="checksessionA.inc" %>
</head>

<body bgcolor="#FFFFCC">
<div id="Layer1" style="position:absolute; left:50px; top:32px; width:675px; z-index:1; height: 482px"> 
  <p align="center"><font color="#0000FF"><b><font face="Cordia New, CordiaUPC" size="6"><font size="5">เพิ่ม 
    ACCOUNT </font></font></b></font></p>
  <p align="center"><img src="line.jpg" width="503" height="2"></p>
  <form name="AddAcount" Action="AddAccount.jsp" >
    <div align="center">
      <table width="64%" border="0" cellspacing="0" cellpadding="0" height="323">
        <tr> 
          <td colspan="3" height="37"> 
            <table width="90%" border="0" cellspacing="0" cellpadding="0" align="left" height="47">
              <tr> 
                <td width="40%" height="27"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">เป็น 
                  Account ของ</font></td>
                <td width="2%" height="27"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                  <input type="radio" name="kind" value="t">
                  </font></td>
                <td width="25%" height="27"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">อาจารย์</font></td>
                <td width="6%" height="27"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                  <input type="radio" name="kind" value="o">
                  </font></td>
                <td width="27%" height="27"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">เจ้าหน้าที่</font></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr> 
          <td colspan="3" height="39"> 
            <div align="center"> 
              <table width="100%" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="7%"> 
                    <div align="center"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อ</font></div>
                  </td>
                  <td width="35%"> 
                    <div align="center"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="name" size="20">
                      </font></div>
                  </td>
                  <td width="10%"> 
                    <div align="center"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">สกุล</font></div>
                  </td>
                  <td width="48%"> 
                    <div align="center"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="sur" size="20">
                      </font></div>
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
        <tr> 
          <td width="18%" height="18"> 
            <p align="left"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"><b>Login 
              </b></font></p>
          </td>
          <td width="9%" height="18"> 
            <p align="left"><font color="#0000FF"><b><font face="Cordia New, CordiaUPC" size="6"><a href="allform.jsp"><font face="Cordia New, CordiaUPC"><font face="Cordia New, CordiaUPC"><font size="4"><font size="4"><font color="#0000FF"></font></font></font></font></font></a></font></b></font></p>
          </td>
          <td width="73%" height="18"> 
            <div align="left"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
              <input type="text" name="loginname" size="15" maxlength="15">
              </font></div>
          </td>
        </tr>
        <tr> 
          <td width="18%" height="28"> 
            <div align="left"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"><b>Password</b></font></div>
          </td>
          <td width="9%" height="28"> 
            <div align="left"><font color="#0000FF" size="5"><b><font face="Cordia New, CordiaUPC"><font face="Cordia New, CordiaUPC"><font size="4"><font size="4"><font color="#0000FF"></font></font></font></font></font></b></font></div>
          </td>
          <td width="73%" height="28"> 
            <div align="left"><font color="#000000" size="4" face="Cordia New, CordiaUPC"><b> 
              <input type="password" name="pass" size="15" maxlength="15">
              </b></font></div>
          </td>
        </tr>
        <tr> 
          <td width="18%" height="12"> 
            <div align="left"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"><b>Verify</b></font></div>
          </td>
          <td width="9%" height="12"> 
            <div align="left"><font face="Cordia New, CordiaUPC"><font face="Cordia New, CordiaUPC"><font size="4"><font size="4"><font color="#0000FF"></font></font></font></font></font></div>
          </td>
          <td width="73%" height="12"> 
            <div align="left"><font color="#000000" size="4" face="Cordia New, CordiaUPC"><b> 
              <input type="password" name="verpass" size="15" maxlength="15">
              </b></font></div>
          </td>
        </tr>
        <tr> 
          <td width="18%" height="14"> </td>
          <td width="9%" height="14"> </td>
          <td width="73%" height="14"> 
            <div align="center"></div>
          </td>
        </tr>
        <tr> 
          <td colspan="3" height="6"> 
            <div align="center"> 
              <input type="submit" name="ok" value="confirm">
            </div>
          </td>
        </tr>
      </table>
    </div>
  </form>
  <p align="center"><img src="line.jpg" width="503" height="2"></p>
</div>
</body>
</html>
