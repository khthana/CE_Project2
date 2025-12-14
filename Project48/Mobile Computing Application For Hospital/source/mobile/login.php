<?php
	include("function.php");
	head_html("ล็อกอิน");
?>
	<br><br>
	<table width="45%" border="0" cellspacing="10" cellpadding="0" align="center">
              <tr>
                        <td>
                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
                                        <tr>
                                                <td>
                                                        <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FFAE88" bordercolor="#EC4D00">
                                                                <tr>
                                                                        <td><p  align="center"><font face = "MS Sans Serif" color="#000000" size="2"><b>ล๊อกอินเข้าสู่ระบบ</b></font></p></td>
                                                                </tr>
                                                        </table>
                                                </td>
                                        </tr>
                                        <tr>
                                                <td>
                                                        <form method="post" action="process_login.php" name="form">
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="0" >
																		<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">&nbsp;&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3" width="70%">&nbsp;&nbsp;</td>
                                                                        </tr>
                                                                		<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">ชื่อผู้ใช้ : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><input type="text" name="user_name"></td>
                                                                        </tr> 
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">รหัสผ่าน : </td>
                                                                                <td bgcolor="#F3F3F3"><input type="password" name="pass"></td>
                                                                        </tr>                                                                         
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3"></td>
                                                                                <td bgcolor="#F3F3F3"><input type="submit" value="Submit"><input type="reset"></td>
                                                                        </tr>
                                                                </table>
                                                        </form>
                                                </td>
                                        </tr>
										<tr>
												<td bgcolor="#CCFF99"><p  align="center">
												<font face = "MS Sans Serif" color="#000000" size="2"><b>สมาชิกทั่วไป<b></p></td></font>
										</tr>
										<tr>
												<td colspan="2" align="left" bgcolor="#F3F3F3"><font face = "MS Sans Serif" color="#000000" size="2">
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="image/ic_plus.gif" border="0">&nbsp;<a class ="lmenu" href = "forgetpassword_form.php"> <b>ลืมรหัสผ่าน</b></a></font>
												</td>
										</tr>
										<tr>
												<td colspan="2" align="left" bgcolor="#F3F3F3"><font face = "MS Sans Serif" color="#000000" size="2">
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="image/ic_plus.gif" border="0">&nbsp;<a  class ="lmenu" href ="register_form.php">
														<b>ลงทะเบียน</b></a></font>
												</td>
										</tr>                                                          
                                </table>
                        </td>
                </tr>
		</table>
		<br><br>
<?php
	require_once("footer.php");
?>