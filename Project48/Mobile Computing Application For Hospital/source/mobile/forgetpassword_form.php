<?php
	include("function.php");
	require_once("header.php");		
	header_html("ลืมรหัสผ่าน");
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
                                                        <form method="post" action="forget_password.php" name="form">
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
																		<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">&nbsp;&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3" width="70%">&nbsp;&nbsp;</td>
                                                                        </tr>
                                                                		<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">
																				<font face = "MS Sans Serif" color="#000000" size="2">กรุณาป้อนชื่อผู้ใช้ : </font></td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><input type="text" name="user_name"></font></td>
                                                                        </tr> 
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">
																				<font face = "MS Sans Serif" color="#000000" size="2">คำถาม : </font></td>
                                                                                <td bgcolor="#F3F3F3">
																				<font face = "MS Sans Serif" color="#000000" size="2">อาหารอะไรที่คุณชอบที่สุด?</font></td>
                                                                        </tr>                                                                         
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">
																				<font face = "MS Sans Serif" color="#000000" size="2">คำตอบ :</font></td>
                                                                                <td bgcolor="#F3F3F3"><input type="password" name="answer"></td>
                                                                        </tr>
																		<tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                        </tr>
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
		<br><br>
<?php
	require_once("footer.php");
?>

