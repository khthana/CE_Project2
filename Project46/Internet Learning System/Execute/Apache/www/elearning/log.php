<?php
//session_start();
//if (isset($suser))
//if($_SESSION['user'])
if(isset($_SESSION['user']))
//if(isset($HTTP_SESSION_VARS['user']))
//if(session_is_registered("user"))
{
?>
	<font class="defaultfont">Welcome <?php print $user; ?></font><br>
	<a href="passwd.php">เปลี่ยนรหัสผ่าน</a><br>
		<a href="logout.php">logout</a>
<?php
}
else
{
?>
	<form name="form1" method="post" action="login.php">
        <table width="150" border="0" align="center" cellpadding="1" cellspacing="1">
          <tr> 
            
      <td width="26%" class="headfont">UserID</td>
            
      <td width="74%" colspan="2"> <div align="left">
          <input name="user" type="text" size="10" maxlength="10">
        </div></td>
          </tr>
          <tr> 
            
      <td class="headfont">Password</td>
            
      <td colspan="2"> <div align="left">
          <input name="pass" type="password" size="10" maxlength="40">
        </div></td>
          </tr>
          <tr> 
            <td class="normal">&nbsp;</td>
            <td><input name="login" type="submit" id="login" value="login">
            </td>
            <td><input name="reset" type="reset" id="reset" value="reset"></td>
          </tr>
          <tr>             
      <td colspan="3" class="normal"><div align="center"><a href="forget.php">ลืมรหัสผ่าน?</a></div></td>
          </tr>
        </table>
      </form>
<?php
}
?>