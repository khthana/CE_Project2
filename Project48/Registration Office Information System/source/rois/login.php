<?php
	include("function.php");

	head_html("ล็อกอิน");
	
	//if(!check_session())
	//	header("Location: main_report_menu.php");
?>

	<link rel="stylesheet" href="css/style.css" type="text/css" />

	<table width="45%" border="0" cellspacing="10" cellpadding="0" align="center">
                <tr>
                        <td>
                                <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FF5C0F" bordercolor="#000000">
                                        <tr>
                                                <td><p  align="center" class="headTable">ล๊อกอินเข้าสู่ระบบ</p></td>
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
                                                        <form method="post" action="process_login.php" name="form">
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="0" class="normalFont">
                                                                			<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">User Name : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><input type="text" name="user_name"></td>
                                                                        </tr> 
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">Password : </td>
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
                                </table>
                        </td>
                </tr>
	</table>

<?php
	end_head_html();
?>