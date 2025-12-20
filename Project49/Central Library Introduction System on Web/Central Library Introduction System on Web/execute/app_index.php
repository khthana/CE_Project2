<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php
session_start();
?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
<title>:::ระบบจัดการเอกสารสำหรับระบบแนะนำหอสมุดกลางบนเว็บ:::</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<body bgcolor="#FFFFFF">
<div align="center">
<table width="790" border="0" cellspacing="5" cellpadding="0">
  <tr>
    <td><img src="AppImages/AppHead.jpg" width="780" height="100" /></td>
  </tr>
  <tr>
    <td bgcolor="#DE8911"><table width="780" border="0" cellspacing="1" cellpadding="10">
      <tr>
        <td align="center" bgcolor="#FFFFFF"><p>&nbsp;</p>
          <p>&nbsp;</p>
          <form id="form1" name="form1" method="post" action="app_checkuser.php" onSubmit="check()">
          <table width="350" border="0" cellspacing="10" cellpadding="0">
             <tr>
              <td colspan="2" align="left" valign="top" class="health">กรุณา Login ก่อนใช้งาน  <br /> &nbsp;</td>
              </tr>
			<tr>
              <td width="100" align="left" valign="baseline" class="login">User Name </td>
              <td align="center" valign="baseline">
                <label>
                  <input name="username" type="text" class="loginbox" id="username" size="35" />
                  </label></td>
            </tr>
            <tr>
              <td align="left" valign="baseline" class="login">Password</td>
              <td align="center" valign="baseline"><label>
                <input name="password" type="password" class="loginbox" id="password" size="35" />
              </label></td>
            </tr>
            <tr>
              <td align="left" valign="baseline" class="login">&nbsp;</td>
              <td align="center" valign="baseline"><label>
                <input name="Login" type="submit" class="button" id="Login" value="Login" />
              </label></td>
            </tr>
          </table>
		  </form>
          <p class="health">&nbsp;</p>
          <p>&nbsp;</p></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="50" align="center" valign="bottom" bgcolor="#FFFFFF">
	<p>Manachanok Khumsiri, Central Library Information System Project @2006.<br />
	King Mongkut's Institute of Technology Ladkrabang.
	</p>
      </td>
  </tr>
</table>
</div>
<script type="text/javascript">
/////////////ตรวจสอบว่ากรอก หัวข้อภาษาไทยแล้วจึงให้ผ่านไปยังหน้าต่อไปได้ ////////////////
function check()
{
	var user = document.form.username.value;
	var pass = document.form.password.value;
 	if ( user == '' || pass =='' )
    {
		   alert("กรุณากรอก User Name และ Password ของท่านให้ครบถ้วน ");
		   return false;
    }
	else { return true; }
}

</script>
</body>
</html>
