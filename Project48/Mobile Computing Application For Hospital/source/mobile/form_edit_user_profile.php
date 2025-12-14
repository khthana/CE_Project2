<?php
		include("function.php");
		include("database.php");
		require_once("connect_db.php");
		require_once("headeradmin.php");
		require_once("connect_db.php");
		require_once("check_data.php");
		check_permit();
		header_admin("แก้ไขข้อมูลผู้ใช้งาน");
		database_connect();
	
	$row = mysql_fetch_array(database_query("select * from user_profile where id = ".$id.""));
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
                                                                        <td align="center"><font face = "MS Sans Serif" color="#000000" size="2">เเก้ไขข้อมูลผู้ใช้งาน</font></td>
                                                                </tr>																
                                                        </table>
                                                </td>
                                        </tr>
                                        <tr>
                                                <td>
                                                        <? 	print "<form method='post' action='process_user_profile.php?mode=edit&id=".$id."' name='form'>"; ?>
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
																		<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3" width="70%">&nbsp;</td>
                                                                        </tr> 
                                                                			<tr>
                                                                                <td bgcolor="#f3f3f3"  align="right" width="30%">ชื่อจริง : </td>
                                                                                <td bgcolor="#f3f3f3" width="70%">
                                                                                		<input type="text" name="first_name" <? print "value='".$row["FIRST_NAME"]."'"; ?>>
                                                                                </td>
                                                                        </tr> 
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3" align="right">นามสกุล : </td>
                                                                                <td bgcolor="#f3f3f3">
                                                                                		<input type="text" name="last_name" <? print "value='".$row["LAST_NAME"]."'"; ?>>
                                                                                	</td>
                                                                        </tr>  
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#f3f3f3">&nbsp;</td>
                                                                        </tr>    
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3" align="right">ชื่อผู้ใช้ : </td>
                                                                                <td bgcolor="#f3f3f3">
                                                                                		<input type="text" name="user_name" <? print "value='".$row["USER_NAME"]."'"; ?>>
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3" align="right">รหัสผ่านเก่า : </td>
                                                                                <td bgcolor="#f3f3f3">
                                                                                		<input type="password" name="old_pass">
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3" align="right">รหัสผ่านใหม่ : </td>
                                                                                <td bgcolor="#f3f3f3">
                                                                                		<input type="password" name="new_pass">
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#f3f3f3">&nbsp;</td>
                                                                        </tr>                                                                                                                                                                                                                                                                                       
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3" align="right">สถานะ : </td>
                                                                                <td bgcolor="#f3f3f3">
                                                                                		<select name="status" size="1">
																													<?
																														if($row["STATUS"] == '0') {
																															print "<option value='0' selected>ผุ้ดูแล</option>";
																															print "<option value='1'>พนักงาน</option>";
																															print "<option value='2'>สมาชิก</option>";
																														}
																														elseif($row["STATUS"] == '1'){
																															print "<option value='0'>ผุ้ดูแล</option>";
																															print "<option value='1' selected>พนักงาน</option>";
																															print "<option value='2'>สมาชิก</option>";
																														}
																														else
																														{
																														print "<option value='0'>ผุ้ดูแล</option>";
																														print "<option value='1' >พนักงาน</option>";
																														print "<option value='2' selected>สมาชิก</option>";
																														}
																													?>
																												</select>
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#f3f3f3">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3"></td>
                                                                                <td bgcolor="#f3f3f3"><input type="submit" value="submit"><input type="reset"></td>
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