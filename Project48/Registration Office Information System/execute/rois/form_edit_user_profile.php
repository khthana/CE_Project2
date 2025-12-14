<?php
	include("function.php");
	include("database.php");
	
	head_html("แก้ไขข้อมูลผู้ใช้งาน");
	database_connect();
	
	$row = mysql_fetch_array(database_query("select * from user_profile where id = ".$id.""));
?>

	<link rel="stylesheet" href="css/style.css" type="text/css" />

	<table width="50%" border="0" cellspacing="10" cellpadding="0" align="center">
                <tr>
                        <td>
                                <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#ff5c0f" bordercolor="#000000">
                                        <tr>
                                                <td><p  align="center" class="headTable">แก้ไขรายชื่อผู้ใช้งาน</p></td>
                                        </tr>
                                </table>
                        </td>
                </tr>
                <tr>
                        <td>
                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
                                        <tr>
                                                <td>
                                                        <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#ffae88" bordercolor="#ec4d00">
                                                                <tr>
                                                                        <td>&nbsp;</td>
                                                                </tr>
                                                        </table>
                                                </td>
                                        </tr>
                                        <tr>
                                                <td>
                                                        <? 	print "<form method='post' action='process_user_profile.php?mode=edit&id=".$id."' name='form'>"; ?>
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
                                                                			<tr>
                                                                                <td bgcolor="#f3f3f3"  align="right" width="30%" class="normalFont">First Name : </td>
                                                                                <td bgcolor="#f3f3f3" width="70%">
                                                                                		<input type="text" name="first_name" <? print "value='".$row["FIRST_NAME"]."'"; ?>>
                                                                                </td>
                                                                        </tr> 
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3" align="right" class="normalFont">Last Name : </td>
                                                                                <td bgcolor="#f3f3f3">
                                                                                		<input type="text" name="last_name" <? print "value='".$row["LAST_NAME"]."'"; ?>>
                                                                                	</td>
                                                                        </tr>  
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#f3f3f3">&nbsp;</td>
                                                                        </tr>    
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3" align="right" class="normalFont">User Name : </td>
                                                                                <td bgcolor="#f3f3f3">
                                                                                		<input type="text" name="user_name" <? print "value='".$row["USER_NAME"]."'"; ?>>
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3" align="right" class="normalFont">Old Password : </td>
                                                                                <td bgcolor="#f3f3f3">
                                                                                		<input type="password" name="old_pass">
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3" align="right" class="normalFont">New Password : </td>
                                                                                <td bgcolor="#f3f3f3">
                                                                                		<input type="password" name="new_pass">
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#f3f3f3">&nbsp;</td>
                                                                        </tr>                                                                                                                                                                                                                                                                                       
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3" align="right" class="normalFont">Status : </td>
                                                                                <td bgcolor="#f3f3f3">
                                                                                		<select name="status" size="1">
																													<?
																														if($row["STATUS"] == '0') {
																															print "<option value='0' selected>ผุ้ดูแล</option>";
																															print "<option value='1'>ฝ่ายแผนงาน</option>";
																															print "<option value='2'>ฝ่ายการเงิน</option>";
																														}
																														else if($row["STATUS"] == 1){
																															print "<option value='0'>ผุ้ดูแล</option>";
																															print "<option value='1' selected>ฝ่ายแผนงาน</option>";
																															print "<option value='2'>ฝ่านการเงิน</option>";
																														}
																														else if($row["STATUS"] == 2){
																															print "<option value='0'>ผุ้ดูแล</option>";
																															print "<option value='1'>ฝ่ายแผนงาน</option>";
																															print "<option value='2' selected>ฝ่ายการเงิน</option>";
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
	end_head_html();
?>