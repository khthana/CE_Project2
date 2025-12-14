<?
	session_start( );
	include('dbconnect.inc');

	$flag = true;
	if ($Submit)
	{
		$status ="A";
		$flag = false;
		$sql = "select Password  from MEMBER where LoginName = '$Loginname' and MemberStatus = '$status'";
		$result1 = mysql_db_query($dbname,$sql);
		$numreal = mysql_num_rows($result1);
		if ($numreal != 0)
		{
			$realpass = mysql_fetch_array($result1);
			$sql = "select password('$password')  from MEMBER where LoginName = '$Loginname' ";		
			$result2 = mysql_db_query($dbname,$sql);
			$enterpass = mysql_fetch_array($result2);
			$enterpass[0] = substr($enterpass[0],0,10);
			if ($realpass[0] == $enterpass[0])
			{
				$admin=$Loginname;
				if (session_is_registered("admin"))
				{
					session_unregister("admin");
				}
				session_register("admin");
				$admin = $Loginname;
				header ("Location: db_detail.php");  
				exit;
			} 
		}
	}
?>

<html>

<head>

<title>Welcome My Admin Login Now !!</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-874">

<style type="text/css">

<!--

body {  margin: 0px  0px; padding: 0px  0px}

-->

</style>

</head>



<body bgcolor="#9999CC">

<div align="center">

  <p>&nbsp;</p>

	<?

		if ($flag == false)

		{

  		echo '<p><font color="#FFFFCC" face="MS Sans Serif, Microsoft Sans Serif" size="5"><b>รหัสผ่านไม่ถูกต้อง</b></font></p> ';		

			echo '<p><font color="#FFFFCC" face="MS Sans Serif, Microsoft Sans Serif" size="5"><b>ไม่อณุญาตให้เข้าใช้</b></font></p> ';

		}else 

		{

  		echo '<p><font color="#FFFFCC" face="MS Sans Serif, Microsoft Sans Serif" size="5"><b>ยินดีต้อนรับสู่ระบบจัดการฐานข้อมูลของ Helpdesk Online</b></font></p> ';

		}

	?>

  <table width="250" border="0" cellspacing="0" cellpadding="0" height="100">

    <tr bgcolor="#CC3300"> 

      <td colspan="3"><img src="../image/transparent.gif" width="1" height="1"></td>

    </tr>

    <tr> 

      <td bgcolor="#CC3300" height="100" width="1"><img src="../image/transparent.gif" width="1" height="1"></td>

      <td bgcolor="#FFFFCC" height="120" valign="middle" align="center" width="226"> 

        <form method="post" action="index.php" name="login">

          <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">

            <tr valign="middle" align="center"> 

              <td height="42" width="50%"> 

                <div align="center"><font size="2" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#CC3300">ล๊อกอิน:</font></b></font></div>

              </td>

              <td height="42" width="50%"> 

                <div align="center"> <?

										echo '<input type="text" name="Loginname" maxlength="10" size="15" value="'.$Loginname.'">';

								?> </div>

              </td>

            </tr>

            <tr valign="middle" align="center"> 

              <td height="35" width="50%"> 

                <div align="center"><b><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#CC3333">รหัสผ่าน: 
                  </font></b></div>

              </td>

              <td height="35" width="50%"> 

                <div align="center"> <?

										echo '<input type="password" name="password" size="15" maxlength="10" value="'.$password.'">';

								?> </div>

              </td>

            </tr>

            <tr valign="middle" align="center"> 

              <td width="50%">
                <input type="submit" name="Submit" value="Login">
              </td>

              <td width="50%"> 
                <input type="reset" name="Reset" value="Clear">
              </td>

            </tr>

          </table>

        </form>

      </td>

      <td bgcolor="#CC3300" height="100" width="1"><img src="../image/transparent.gif" width="1" height="1"></td>

    </tr>

    <tr> 

      <td bgcolor="#CC3300" colspan="3"><img src="../image/transparent.gif" width="1" height="1"></td>

    </tr>

  </table>

</div>

</body>

</html>

