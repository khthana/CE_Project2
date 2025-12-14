<?php 
	require('./libraries/grab_globals.lib.php'); 
	session_start(); 
?>
<html>
<head><title>Change Password</title>
<meta http-equiv="Content-Type" content="Text/Html;charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">

</head>
<body>
<?php
	include("./config.inc.php");
	
	$sql = "SELECT PASSWORD FROM member WHERE USERNAME='$user' AND PASSWORD = '$old_password' ";
	$query1 = mysql_query($sql,$con);
	
	$num = mysql_num_rows($query1);
	if($num != 0) {
		$sql = "UPDATE member SET PASSWORD = '$new_password' WHERE  USERNAME='$user' AND PASSWORD = '$old_password' ";
		$query = mysql_query($sql,$con);
		if($query) {
	?>
        <table border="0" cellspacing="0" cellpadding="0" class = "text" width="352">
          <tr> 
            <td align="left" valign="top" bgcolor="#869DB9" width="15"><img src="Picture/cn_drk_lt.gif" width="11" height="19"></td>
            
    <td bgcolor="#869DB9" style="color:white;" width="326">&nbsp;</td>
            <td align="right" valign="top" bgcolor="#869DB9" width="11"><img src="Picture/cn_drk_rt.gif" width="11" height="19"></td>
          </tr>
        </table>
        <table width="350" border="0" cellspacing="0" cellpadding="0" class = "text" >
          <tr bgcolor="#869DB9"> 
            <td > 
              <table width="350" border="0" cellspacing="0" cellpadding="1" class = "text">
                <tr bgcolor="#869DB9"> 
                  <td bgcolor="#869DB9"> 
                    <table width="350" border="0" cellspacing="1" cellpadding="4" class = "text" bgcolor="#E9E9E9">
                      <tr> 
                        
                <td valign="top" align="center"  class="normal"> <font color="#3366FF">รหัสผ่านของคุณได้ถูกเปลี่ยนเรียบร้อยแล้ว&nbsp;</font>&nbsp;&nbsp; 
                  <input name="close" type="button" value=" ปิด" onClick="window.close()"> </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table> 
	<?php 	 } 
		mysql_free_result($query1);
		session_unregister("user");
	}
	else {
		$error = "password เก่าของคุณไม่ถูกต้อง" ;
		//echo "$user";
		//echo "$old_password";
	echo "<meta http-equiv=\"REFRESH\" content=\"0;URL= FrmChange_pwd.php?user=$username&errmessage=$error\">";
	}

?>

</body>
</html>