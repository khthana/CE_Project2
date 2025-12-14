<?

include "config.inc.php";

if($_POST["new_password"]){
	if($_POST["new_password"] == $_POST["confirm_new_password"]){
		if(strlen($_POST["new_password"]) >= 4){
			$link = mysql_connect("$host","$db_username","$db_password");
			mysql_select_db(regisblog);
			$strSQL = "UPDATE domain SET admin_password = MD5('$_POST[new_password]') WHERE admin_username = '$_COOKIE[admin_username]'";
			$result = mysql_query($strSQL);
			mysql_close($link);
			$hash_admin_password = md5($_POST["new_password"]);
			setcookie("admin_username",$_COOKIE[admin_username],time()+(60*60*24*30*12));
			setcookie("hash_admin_password",$hash_admin_password,time()+(60*60*24*30*12));
			echo "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=cpanel.php?action=personal\"> \n";
			exit();
		}else{
			$password_error_message = "password ต้องมีความยาวมากกว่า 4 ตัวอักษร";
		}
	} else {
			$password_error_message = "password และ confirm password ไม่ตรงกัน";
		}
	}


if($_GET["action"] == "logout"){
	setcookie("admin_username",0,time()-3600);
	setcookie("hash_admin_password",0,time()-3600);
	echo "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=index.php\"> \n";
}

if((!$_COOKIE["admin_username"])||(!$_COOKIE["hash_admin_password"])){
	echo "Forbidden";
	exit();

} else {

$link = mysql_connect("$host","$db_username","$db_password");
mysql_select_db(regisblog);

$_COOKIE["admin_username"] = addslashes($_COOKIE["admin_username"]);
$_COOKIE["hash_admin_password"] = addslashes($_COOKIE["hash_admin_password"]);

$strSQL = "SELECT * FROM domain WHERE admin_username='$_COOKIE[admin_username]' AND admin_password = '$_COOKIE[hash_admin_password]'";

$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);
$num = mysql_num_rows($result);

if($num < 1){
	echo "Forbidden";
	exit();
}

}

if(!$_GET["action"]){
	$_GET["action"] = "home";
}

mysql_close($link);
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title>Regisblog Service ::: Control Panel</title>
<style type="text/css">
<!--
.style1 {
	font-family: Verdana;
	font-size: 10px;
}
.style2 {
	font-size: 11px;
	color: #000000;
	font-weight: bold;
}
.style3 {
	font-family: Tahoma;
	font-size: 12px;
}
-->
</style>
</head>

<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">

<table width="780" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3"><img src="images/images2_top.jpg" width="780" height="90"></td>
  </tr>
  <tr>
    <td width="50" rowspan="4"><img src="images/images2_main_1.jpg" width="50" height="490"></td>
    <td width="725" height="40" bgcolor="#FFBE52"><img src="images/controlpanel.jpg" width="135" height="40"></td>
    <td width="25" rowspan="4"><img src="images/images2_main_3.jpg" width="25" height="490"></td>
  </tr>
  <tr>
    <td height="421" valign="top"><br>
      <table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="16"><div align="center" class="style2">
		|<img src="images/bullet-home.gif" width="15" height="14" align="absmiddle"> 
		<?
		if($_GET["action"] == "home"){
		echo "หน้าหลัก";
		}else{
		echo "<a href=\"cpanel.php?action=home\">หน้าหลัก</a>";
		}
		?>
	 	| <img src="images/bullet-personal.gif" width="17" height="14" align="texttop"> 
		<?
		if($_GET["action"] == "personal"){
		echo "แก้ไขข้อมูลส่วนตัว";
		}else{
		echo "<a href=\"cpanel.php?action=personal\">แก้ไขข้อมูลส่วนตัว</a>";
		}
		?> 
		| <img src="images/bullet-system.gif" width="15" height="15" align="absmiddle"> 
		<?
		if($_GET["action"] == "setting"){
		echo "แก้ไขข้อมูลการใช้งาน";
		}else{
		echo "<a href=\"cpanel.php?action=setting\">แก้ไขข้อมูลการใช้งาน</a>";
		}
		?>  
		| <img src="images/bullet_help.gif" align="absmiddle">
		<?
		if($_GET["action"] == "help"){
		echo "Help";
		}else{
		echo "<a href=\"cpanel.php?action=help\">Help</a>";
		}
		?> 
		| <img src="images/bullet_logout.gif" width="16" height="16" align="absmiddle"> <a href="cpanel.php?action=logout">Logout</a> | 
		</div></td>
      </tr>
    </table>
	  <p>
        <?
if($_GET["action"] == "home"){

$link = mysql_connect("$host","$db_username","$db_password");
mysql_select_db(regisblog);

$strSQL = "SELECT * FROM domain WHERE admin_username = '$_COOKIE[admin_username]'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);

    echo "<p align=\"center\" class=\"style3\">======= <span class=\"style2\"><img src=\"images/bullet-personal.gif\" width=\"17\" height=\"14\" align=\"texttop\"></span> ข้อมูลส่วนตัว  ======= </p>\n";
    echo "<p align=\"center\" class=\"style3\">Domain Name : http://".$row[domain_name]."</p>\n";
    echo "<p align=\"center\" class=\"style3\">Admin username : $row[admin_username]</p>\n";
    echo "<p align=\"center\" class=\"style3\">======== <span class=\"style2\"><img src=\"images/bullet-system.gif\" width=\"15\" height=\"15\" align=\"absmiddle\"></span> ข้อมูลการใช้งาน  ======= </p>\n";
    echo "<p align=\"center\" class=\"style3\">ข้อกำหนดด้าน Privacy : $row[privacy]</p>\n";
    echo "<p align=\"center\" class=\"style3\">รูปแบบการใช้บริการปัจจุบัน : ";
	if($row["service_type"] == "unlimited"){
		echo "Unlimited";
	}else{
		echo "Limited โดยมีจำนวน blog ได้สูงสุด $row[no_user]";
	}
	echo "</p>\n";
    echo "<p align=\"center\" class=\"style3\">รูปแบบการใช้บริการในรอบบิลถัดไป : ";

	$strSQL2 = "SELECT * FROM cron_service WHERE domain_id ='$row[domain_id]'";
	$result2 = mysql_query($strSQL2);
	$row2 = mysql_fetch_array($result2);
	$num2 = mysql_num_rows($result2);

	if($num2 < 1){
		if($row["service_type"] == "unlimited"){
			echo "Unlimited";
		} else {
			echo "Limited โดยมีจำนวน User ได้ไม่เกิน $row[no_user] users";
		}
	} else {
		if($row2["service_type"] == "unlimited"){
			echo "Unlimited";
		} else {
			echo "Limited โดยมีจำนวน User ได้ไม่เกิน $row2[no_user] users";
		}
	}

	echo "</p>\n";
    echo "<p align=\"center\" class=\"style3\">======= <span class=\"style2\"><img src=\"images/bullet-payment.gif\" width=\"16\" height=\"16\" align=\"absmiddle\"></span> ข้อมูลการชำระเงิน  ======= </p>\n";
	list($year,$month,$date) = explode("-",$row[valid_date]);
    echo "<p align=\"center\" class=\"style3\">รอบบิลถัดไปของคุณคือวันที่ ".$date."/".$month."/".$year."</p>\n";
    echo "<p align=\"center\" class=\"style3\">คุณมีจำนวน credit คงเหลือในบัญชีจำนวน $row[credit_left] credits </p>\n";
    echo "<p align=\"center\" class=\"style3\">จำนวน credits ที่ต้องใช้ในรอบบิลถัดไป : ";

	if($num2 < 1){
		if($row["service_type"] == "unlimited"){
			$strSQL3 = "SELECT * FROM payment_cost WHERE payment_type = 'unlimited'";
			$result3 = mysql_query($strSQL3);
			$row3 = mysql_fetch_array($result3);
			$total = $row3["payment_cost"];
		} else {
			$strSQL3 = "SELECT * FROM payment_cost WHERE payment_type = 'limited_base'";
			$result3 = mysql_query($strSQL3);
			$row3 = mysql_fetch_array($result3);
			$total = $row3["payment_cost"];
			$strSQL3 = "SELECT * FROM payment_cost WHERE payment_type = 'limited_per_user'";
			$result3 = mysql_query($strSQL3);
			$row3 = mysql_fetch_array($result3);
			$total = $total + ($row3["payment_cost"] * $row["no_user"]);
		}
	} else {
		if($row2["service_type"] == "unlimited"){
			$strSQL3 = "SELECT * FROM payment_cost WHERE payment_type = 'unlimited'";
			$result3 = mysql_query($strSQL3);
			$row3 = mysql_fetch_array($result3);
			$total = $row3["payment_cost"];
		} else {
			$strSQL3 = "SELECT * FROM payment_cost WHERE payment_type = 'limited_base'";
			$result3 = mysql_query($strSQL3);
			$row3 = mysql_fetch_array($result3);
			$total = $row3["payment_cost"];
			$strSQL3 = "SELECT * FROM payment_cost WHERE payment_type = 'limited_per_user'";
			$result3 = mysql_query($strSQL3);
			$row3 = mysql_fetch_array($result3);
			$total = $total + ($row3["payment_cost"] * $row2["no_user"]);
		}
	}

	echo $total;
	echo " credits </p>\n";

mysql_close($link);

} else if($_GET["action"] == "personal"){

$link = mysql_connect("$host","$db_username","$db_password");
mysql_select_db(regisblog);

	if($_POST["domain_name"]){
		$_POST["domain_name"] = addslashes($_POST["domain_name"]);
		$pattern = "^([a-z][a-z0-9\_\-]*)(\.[a-z][a-z0-9\_\-]*)+";
		if(!ereg($pattern,$_POST["domain_name"],$regs)){
			echo "<div align=\"center\"><span class=\"style2\"><font color=\"red\">รูปแบบของ Domain Name ผิดพลาด</font></span></div> \n";
		}else{
			$strSQL = "UPDATE domain SET domain_name = '$_POST[domain_name]' WHERE admin_username = '$_COOKIE[admin_username]'";
			$result = mysql_query($strSQL);
		}
	}

	if($password_error_message){
			echo "<div align=\"center\"><span class=\"style2\"><font color=\"red\">$password_error_message</font></span></div> \n";
	}

	if($_POST["change_passkey"] == "yes"){

		settype($template, "string");
		$template = "1234567890abcdefghijklmnopqrstuvwxyz";
		for ($i = 0; $i <= 12; $i++) {
               $n = rand(0, strlen($template) - 1);
               $newpasskey .= $template[$n];
       }

			$strSQL = "UPDATE domain SET domain_passkey = '$newpasskey' WHERE admin_username = '$_COOKIE[admin_username]'";
			$result = mysql_query($strSQL);
	}

$strSQL = "SELECT * FROM domain WHERE admin_username = '$_COOKIE[admin_username]'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);

echo<<<HTML
<form name="form1" method="post" action="">
        <div align="center">
          <p><span class="style2"><img src="images/bullet-personal.gif" width="17" height="14" align="texttop"></span> <span class="style2">แก้ไขข้อมูลส่วนตัว</span></p>
          <table width="453" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="151" bgcolor="#000000"><table width="479" border="0" cellspacing="1" cellpadding="5">
                <tr bgcolor="#FFFFFF">
                  <td width="125" class="style3"><div align="right">Domain Name </div></td>
                  <td width="331" class="style3">http://<input name="domain_name" type="text" id="domain_name" value="$row[domain_name]"size="40"></td>
                </tr>
                <tr bgcolor="#FFFFFF">
                  <td class="style3"><div align="right">Change passkey </div></td>
                  <td><input name="change_passkey" type="checkbox" class="style1" id="change_passkey" value="yes">                    </td>
                </tr>
                <tr bgcolor="#FFFFFF">
                  <td class="style3"><div align="right">Change Password </div></td>
                  <td><input name="new_password" type="password" id="new_password" size="20" maxlength="20"></td>
                </tr>
                <tr bgcolor="#FFFFFF">
                  <td class="style3"><div align="right">Type password again </div></td>
                  <td><input name="confirm_new_password" type="password" id="confirm_new_password" size="20" maxlength="20"></td>
                </tr>
                <tr bgcolor="#FFFFFF">
                  <td height="29" class="style3"><div align="right"></div></td>
                  <td><input type="submit" name="Submit" value="Submit Change"></td>
                </tr>
              </table></td>
            </tr>
          </table>
          <p class="style3">&nbsp;</p>
        </div>
    </form>
HTML;

mysql_close($link);
} else if($_GET["action"] == "setting"){

$link = mysql_connect("$host","$db_username","$db_password");
mysql_select_db(regisblog);

if($_POST["privacy"]){
	$strSQL = "UPDATE domain SET privacy='$_POST[privacy]' WHERE admin_username = '$_COOKIE[admin_username]'";
	$result = mysql_query($strSQL);
}

if($_POST["service_type"]){

		if($_POST[service_type] == "unlimited"){

			$strSQL = "SELECT * FROM payment_cost WHERE payment_type = 'unlimited'";
			$result = mysql_query($strSQL);
			$row_temp = mysql_fetch_array($result);
			$total = $row_temp["payment_cost"];

		} else if($_POST[service_type] == "limited"){

			$strSQL = "SELECT * FROM payment_cost WHERE payment_type = 'limited_base'";
			$result = mysql_query($strSQL);
			$row_temp = mysql_fetch_array($result);
			$total = $row_temp["payment_cost"];

			$strSQL = "SELECT * FROM payment_cost WHERE payment_type = 'limited_per_user'";
			$result = mysql_query($strSQL);
			$row_temp = mysql_fetch_array($result);
			$total = ($total + ($_POST[no_user]*$row_temp["payment_cost"]));

		}

		$strSQL = "SELECT * FROM domain WHERE admin_username = '$_COOKIE[admin_username]'";
		$result = mysql_query($strSQL);
		$row_temp = mysql_fetch_array($result);

		if($row_temp["credit_left"] < $total){
			echo "<div align=\"center\"><span class=\"style2\"><font color=\"red\">คุณมี credit เหลือไม่พอจะเปลี่ยนไปใช้บริการที่เลือก (ต้องมี credit อย่างน้อย $total credits)</font></span></div> \n";
		}else{
			$strSQL = "SELECT * FROM cron_service WHERE domain_id = '$row_temp[domain_id]'";
			$result = mysql_query($strSQL);
			$num = mysql_num_rows($result);
			if($num > 0){
				if($_POST["service_type"] == "unlimited"){
					$strSQL = "UPDATE cron_service SET service_type = 'unlimited'  , no_user = NULL WHERE domain_id = '$row_temp[domain_id]' ";
					$result = mysql_query($strSQL);
				}else if($_POST["service_type"] == "limited"){
					$strSQL = "UPDATE cron_service SET service_type = 'limited' , no_user = '$_POST[no_user]' WHERE domain_id = '$row_temp[domain_id]' ";
					$result = mysql_query($strSQL);
				}
			}else{
				if($_POST["service_type"] == "unlimited"){
					$strSQL = "INSERT INTO cron_service (domain_id,service_type,no_user) VALUES ($row_temp[domain_id],'unlimited',NULL)";
					$result = mysql_query($strSQL);
				}else if($_POST["service_type"] == "limited"){
					$strSQL = "INSERT INTO cron_service (domain_id,service_type,no_user) VALUES ($row_temp[domain_id],'limited',$_POST[no_user])";
					$result = mysql_query($strSQL);
				}
			}

		}

}

$strSQL = "SELECT * FROM domain WHERE admin_username = '$_COOKIE[admin_username]'";
$result = mysql_query($strSQL);
$row = mysql_fetch_array($result);

$strSQL = "SELECT * FROM cron_service WHERE domain_id = '$row[domain_id]'";
$result = mysql_query($strSQL);
$num = mysql_num_rows($result);
if($num > 0){
	$row_temp = mysql_fetch_array($result);
	$row["service_type"] = $row_temp["service_type"];
	$row["no_user"] = $row_temp["no_user"];
}

echo <<<HTML
	  <form name="form1" method="post" action="">
	    <p align="center"><span class="style2"><img src="images/bullet-system.gif" width="15" height="15" align="absmiddle"></span> <span class="style2">แก้ไขข้อมูลการใช้งาน </span>  </p>
	    <table width="468" height="50" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="468" height="50" bgcolor="#000000"><table width="112%" border="0" cellspacing="1" cellpadding="3">
              <tr bgcolor="#FFFFFF">
                <td width="112" class="style3"><div align="right">ข้อกำหนดด้าน Privacy </div></td>
                <td width="337"><select name="privacy" id="privacy">
HTML;
                    echo "<option value=\"public\" ";
					if($row[privacy] == "public"){
						echo "selected";
					}
					echo ">Public</option> \n";
                    echo "<option value=\"private\" ";
					if($row[privacy] == "private"){
						echo "selected";
					}					
					echo ">Private</option> \n";
echo<<<HTML
                </select></td>
              </tr>
              <tr bgcolor="#FFFFFF">
                <td valign="top" class="style3"><div align="right">รูปแบบการใช้บริการ </div></td>
                <td><select name="service_type" id="service_type">
HTML;
                  	echo "<option value=\"unlimited\" ";
					if($row[service_type] == "unlimited"){
						echo "selected";
					}					
					echo ">Unlimited</option> ";
                  	echo "<option value=\"limited\" ";
					if($row[service_type] == "limited"){
						echo "selected";
					}					
					echo ">Limited</option> ";
echo<<<HTML
                </select> 
                  <span class="style3"><br>
                  โดยมีจำนวน user 
                  <input name="no_user" type="text" id="no_user" size="4" value="$row[no_user]">
คน (เฉพาะบริการแบบ limited) </span><br>
					<span class="style1"><font color="red">* ไม่สามารถตั้งค่าจำนวน user ให้น้อยกว่าจำนวน user ที่มีอยู่ณ.เวลาที่เปลี่ยนรอบบิลได้ *</font></span>
				</td>
              </tr>
              <tr bgcolor="#FFFFFF">
                <td class="style3"><div align="right"></div></td>
                <td><input type="submit" name="Submit" value="Submit"> <span class="style1"><font color="red">* การเปลี่ยนแปลงรูปแบบการใช้บริการจะมีผลในรอบบิลถัดไป *</font></span></td>
              </tr>
            </table></td>
          </tr>
        </table>
	  </form>
HTML;

mysql_close($link);
}
?>
</p>
	  </td>
  </tr>
  <tr>
    <td height="19" bgcolor="#FFA210"><div align="right" class="style1">copyright &copy; 2004-2006 Regisblog.com all right reserved. </div></td>
  </tr>
  <tr>
    <td height="10" bgcolor="#DEEBFF"><img src="images/blanker_blue.jpg" width="1" height="1"></td>
  </tr>
</table>
</body>
</html>
