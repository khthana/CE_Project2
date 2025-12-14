<?php
	include("function.php");
	
	head_html("เพิ่มข้อมูลผู้ใช้งาน");
?>

	<link rel="stylesheet" href="css/style.css" type="text/css" />

	<table width="50%" border="0" cellspacing="10" cellpadding="0" align="center">
                <tr>
                        <td>
                                <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FF5C0F" bordercolor="#000000">
                                        <tr>
                                                <td><p  align="center" class="headTable">เพิ่มรายชื่อผู้ใช้งานใหม่</p></td>
                                        </tr>
                                </table>
                        </td>
                </tr>
                <tr>
                        <td>
                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
                                        <tr>
                                                <td>
                                                        <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FFAE88" bordercolor="#EC4D00">
                                                                <tr>
                                                                        <td>&nbsp;</td>
                                                                </tr>
                                                        </table>
                                                </td>
                                        </tr>
                                        <tr>
                                                <td>
                                                        <form method="post" action="process_user_profile.php?mode=add" name="form">
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
                                                                			<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%" class="normalFont">First Name : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><input type="text" name="first_name"></td>
                                                                        </tr> 
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" class="normalFont">Last Name : </td>
                                                                                <td bgcolor="#F3F3F3"><input type="text" name="last_name"></td>
                                                                        </tr>  
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                        </tr>    
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" class="normalFont">User Name : </td>
                                                                                <td bgcolor="#F3F3F3"><input type="text" name="user_name"></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" class="normalFont">Password : </td>
                                                                                <td bgcolor="#F3F3F3"><input type="password" name="pass"></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                        </tr>                                                                                                                                                                                                                                                                                       
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" class="normalFont">Status : </td>
                                                                                <td bgcolor="#F3F3F3">
                                                                                		<select name="status" size="1">
																													<option value="0">ผุ้ดูแล</option>
																													<option value="1">ฝ่ายแผนงาน</option>
																													<option value="2">ฝ่ายการเงิน</option>
																												</select>
                                                                                </td>
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
                                </table>
                        </td>
                </tr>
	</table>

<?php
	end_head_html();
?>