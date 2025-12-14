<?php
		include("function.php");
		require_once("connect_db.php");
		require_once("headeradmin.php");
		require_once("connect_db.php");
		require_once("check_data.php");
		check_permit();
		header_admin("เพิ่มข้อมูลผู้ใช้งาน");	

?>
	<br>
	<table width="50%" border="0" cellspacing="10" cellpadding="0" align="center">
              <tr>
                        <td>
                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
                                        <tr>
                                                <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#A6A6FF" bordercolor="#EC4D00">
                                                                <tr>
                                                                        <td align="center"><font face = "MS Sans Serif" color="#000000" size="2">เพิ่มข้อมูลผู้ใช้งาน</font></td>
                                                                </tr>																
                                                        </table>
                                                </td>
                                        </tr>
                                        <tr>
                                                <td>
                                                        <form method="post" action="process_user_profile.php?mode=add" name="form">
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
																		<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3" width="70%">&nbsp;</td>
                                                                        </tr> 
                                                                			<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">ชื่อจริง : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><input type="text" name="first_name"></td>
                                                                        </tr> 
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">นามสกุล : </td>
                                                                                <td bgcolor="#F3F3F3"><input type="text" name="last_name"></td>
                                                                        </tr>  
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                        </tr>    
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">ชื่อผู้ใช้ : </td>
                                                                                <td bgcolor="#F3F3F3"><input type="text" name="user_name"></td>
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
                                                                                <td bgcolor="#F3F3F3" align="right">สถานะ : </td>
                                                                                <td bgcolor="#F3F3F3">
                                                                                		<select name="status" size="1">
																													<option value="0">ผุ้ดูแล</option>
																													<option value="1">พนักงาน</option>
																													<option value="2">สมาชิก</option>
																												</select>
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3"></td>
                                                                                <td bgcolor="#F3F3F3"><input type="submit" value="ยอมรับ"><input type="reset" value="ยกเลิก"></td>
                                                                        </tr>
                                                                </table>
                                                        </form>
                                                </td>
                                        </tr>                                                                                                                                                                                                                                                                                 
                                </table>
                        </td>
                </tr>
	</table>

<?php
	require_once("footer.php");
?>