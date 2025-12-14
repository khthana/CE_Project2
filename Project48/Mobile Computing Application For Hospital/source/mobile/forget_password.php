<?
		include("function.php");
		include("database.php");
		session_start();
		require_once("header.php");
		require_once("change_password.php");
		require_once("check_data.php");
		require_once("connect_db.php");
		check_valid_user();

		if(!filled_out($HTTP_POST_VARS))
		{
			message_box("เเจ้งข้อผิดพลาด","ไม่สามารถเปลี่ยนแปลงรหัสผ่านได้ กรุณาพยายามอีกครั้ง","forgetpassword_form.php");
		}
		else
		{
		$con=connect_db("hospital");
		if(!$con)
			{
				return "ไม่สามารถติดต่อกับฐานข้อมูลได้ กรุณาพยายามอีกครั้ง";
				exit;
			}

		$sql = "select * from user_profile where USER_NAME='$user_name' and ANSWER='$answer' and not STATUS='0' ";
		$result = mysql_query($sql);

		if(!$result)
			return "กรุณาตรวจคิวรี อีกครั้ง <br>";
		if(mysql_num_rows($result)>0)
			{
			header_html("เปลี่ยนรหัสผ่าน");
?>

<table width="35%" border="0" cellspacing="10" cellpadding="0" align="center">
              <tr>
                        <td>
                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
                                        <tr>
                                                <td>	<br><br>

                                                        <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FFAE88" bordercolor="#EC4D00">
                                                                <tr>
                                                                        <td><p  align="center"><font face = "MS Sans Serif" color="#000000" size="2"><b>เปลี่ยนรหัสผ่าน</b></font></p></td>
                                                                </tr>
                                                        </table>
                                                </td>
                                        </tr>
                                        <tr>
                                                <td>
                                                        <form method="post" action="reset_password.php" name="form">
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
																		<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">&nbsp;&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3" width="70%">&nbsp;&nbsp;</td>
                                                                        </tr>
                                                                		<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">
																				<font face = "MS Sans Serif" color="#000000" size="2">กรุณาป้อนรหัสผ่าน : </font></td>
                                                                                <td bgcolor="#F3F3F3"><input type="password" name="Password1"></font></td>
                                                                        </tr> 
                                                                                                                                        
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">
																				<font face = "MS Sans Serif" color="#000000" size="2">ยืนยันรหัสผ่าน :</font></td>
                                                                                <td bgcolor="#F3F3F3"><input type="password" name="Password2"></td>
                                                                        </tr>

																		<tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                        </tr>
																				<input type="hidden" name="databasename" value="hospital">
																				<input type="hidden" name="tablename" value="user_profile">
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3"></td>
                                                                                <td bgcolor="#F3F3F3"><input type="submit" value="เปลี่ยนรหัสผ่าน"></td>
                                                                        </tr>
																		 <tr>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                        </tr>
                                                                </table>
                                                        </form>
                                                </td>
                                        </tr>
										                                                        
                                </table>
                        </td>
                </tr>
		</table>
		<? require_once("footer.php");?>
<?
	}
else
	message_box("เเจ้งข้อผิดพลาด","ไม่สามารถเปลี่ยนแปลงรหัสผ่านได้ กรุณาตรวจสอบอีกครั้ง","forgetpassword_form.php");
}
?>