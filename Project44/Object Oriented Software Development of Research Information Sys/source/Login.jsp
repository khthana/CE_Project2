<html>
<head>
<title>Teacher and Student Information 1.1</title>
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

<body bgcolor="#FFFFCC" text="#0066FF">
<p align="center">&nbsp;</p>
<p align="center">ระบบสารสนเทศอาจารย์บัณฑิตวิทยาลัยและข้อมูลนักศึกษา<br>
  สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง <br>
  กรุณาใส่ Login และ Password </p><br>
<FORM name ="what"  ACTION="/demo/log.jsp" METHOD = "POST" >

<table width="50%" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr> 
    <td> 
      <div align="right">Login :</div>
    </td>
    <td> 
      <input type="text" name="id">@
	  <select id="a_d" name="domain" > 
<option value="t" selected>อาจารย์</option>
<option value="o">เจ้าหน้าที่</option>
<option value="a">Admin</option>
</select>
    </td>
  </tr>
  <tr> 
    <td> 
      <div align="right">Password :</div>
    </td>
    <td> 
      <INPUT TYPE="password" name="password">
    </td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td> 
      <input type="submit" name="Submit" value="Submit" >
	  &nbsp;&nbsp;&nbsp;&nbsp;
    </td>
  </tr>
</table>
<br><br><br><br>
<%@ include file = "footer.inc" %>
</body>
</html>