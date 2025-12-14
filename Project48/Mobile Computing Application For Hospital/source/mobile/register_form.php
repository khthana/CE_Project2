<?php
		include("function.php");
		require_once("connect_db.php");
		require_once("connect_db.php");
		require_once("check_data.php");

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
                                                                        <td><p  align="center"><font face = "MS Sans Serif" color="#000000" size="2"><b>ลงทะเบียน</b></font></p></td>
                                                                </tr>
                                                        </table>
                                                </td>
                                        </tr>
                                        <tr>
                                                <td>
                                                        <form method="post" action="register_new2.php" name="form">
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
																		<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">&nbsp;&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3" width="70%">&nbsp;&nbsp;</td>
                                                                        </tr>
                                                                		<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">
																				<font face = "MS Sans Serif" color="#000000" size="2">อีเมล์ : </font></td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><input type="text" name="EMAIL"></font></td>
                                                                        </tr> 
																		<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">
																				<font face = "MS Sans Serif" color="#000000" size="2">ชื่อจริง : </font></td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><input type="text" name="FIRSTNAME"></font></td>
                                                                        </tr>
																		<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">
																				<font face = "MS Sans Serif" color="#000000" size="2">นามสกุล : </font></td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><input type="text" name="LASTNAME"></font></td>
                                                                        </tr>
                                                                    	<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">
																				<font face = "MS Sans Serif" color="#000000" size="2">ชื่อผู้ใช้ : </font></td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><input type="text" name="USERNAME"></font></td>
                                                                        </tr>
																		<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">
																				<font face = "MS Sans Serif" color="#000000" size="2">รหัสผ่าน : </font></td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><input type="password" name="PASSWORD"></font></td>
                                                                        </tr>
																		<tr>
                                                                                <td bgcolor="#F3F3F3" align="right">
																				<font face = "MS Sans Serif" color="#000000" size="2">คำถาม :</font></td>
                                                                                <td bgcolor="#F3F3F3">
																				<font face = "MS Sans Serif" color="#000000" size="2">อาหารอะไรที่คุณชอบที่สุด?</font></td>
                                                                        </tr> 																	
																		<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">
																				<font face = "MS Sans Serif" color="#000000" size="2">คำตอบ : </font></td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><input type="text" name="ANSWER"></font></td>
                                                                        </tr>							                                                                                                             
																		<tr>
                                                                                <td bgcolor="#F3F3F3" align="right">
																				<font face = "MS Sans Serif" color="#000000" size="2">สถานะ : </font>
																				</td>
                                                                                <td bgcolor="#F3F3F3">
                                                                                		<select name="STATUS" size="1">
																													<option value="2">สมาชิกทั่วไป</option>
																						</select>
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3"></td>
                                                                                <td bgcolor="#F3F3F3"><input type="submit" value="ลงทะเบียน"></td>
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



