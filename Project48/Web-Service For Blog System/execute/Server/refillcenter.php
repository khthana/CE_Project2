<?
include "config.inc.php";
session_start();

###### if action = delreport ######

if($_GET["action"] == "delreport"){
	
	$_GET["tid"] = addslashes($_GET["tid"]);

	if($_GET["confirm"] == "yes"){

		echo "<script language=\"javascript\" type=\"text/javascript\"> \n";
		echo "function redirect_to(where, closewin) \n";
		echo "{ \n";
 		echo "opener.location= 'refillcenter.php' + where; \n";
 		echo "if (closewin == 1) \n";
 		echo "{ \n";
 		echo "self.close(); \n";
 		echo "} \n";
		echo "}</script> \n";

		$link = mysql_connect("$host","$db_username","$db_password");
		mysql_select_db(regisblog);

		$strSQL = "UPDATE money_transfer SET status='incomplete' , comment='ผู้แจ้งขอยกเลิก' WHERE transfer_id = '$_GET[tid]'";
		$result = mysql_query($strSQL);
		mysql_close($link);

		if($result){
			echo "<p align=\"center\">ยกเลิกการแจ้งการชำระเงินเรียบร้อย</p> \n";
		} else {
			echo "<p align=\"center\">ยกเลิกการแจ้งการชำระเงินล้มเหลว กรุณาแจ้งใหม่ภายหลัง</p> \n";
		}
		echo "<p align=\"center\"><a href=\"javascript:redirect_to(' ', 1)\">คลิ๊กที่นี่เพื่อกลับไปยังหน้าประวัติการชำระเงิน</a></p> \n";
	} else {
		echo "<p align=\"center\">คุณต้องการยกเลิกการแจ้งการชำระเงินนี้หรือไม่</p> \n";
		echo "<p align=\"center\"><a href=\"refillcenter.php?action=delreport&tid=$_GET[tid]&confirm=yes\">ใช่</a> | <a href=\"javascript:window.close()\">ไม่ใช่</a> </p> \n";
	}
	exit();
}

###### if action = logout ######

if($_GET["action"] == "logout"){
	session_destroy();
	echo "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=refillcenter.php\"> \n";
	exit();
} // end if action = logout

###### if there is posted username (that's mean there is login) ######

if ($_POST["username"]){

	$link = mysql_connect("$host","$db_username","$db_password");
	mysql_select_db(regisblog);

	if($_POST["acc_type"] == "domain"){ // check for account type , so system can fetch right table
		$strSQL = "SELECT * FROM domain WHERE admin_username = '$_POST[username]' AND admin_password = MD5('$_POST[password]')";
	} else if($_POST["acc_type"] == "user"){
		$strSQL = "SELECT * FROM user WHERE username = '$_POST[username]' AND password = MD5('$_POST[password]')";
	} // end if acctype = domain

	$result = mysql_query($strSQL);
	$num = mysql_num_rows($result);

	if($num > 0){ // if username,password correct
		$row = mysql_fetch_array($result);
		$_SESSION["username"] = $_POST["username"];
		$_SESSION["hash_password"] = md5($_POST["password"]);
		$_SESSION["acc_type"] = $_POST["acc_type"];
		$_SESSION["type"] = $_POST["type"];
	} else {
		$error_message = "username / password ผิดพลาด กรุณาตรวจสอบประเภทบัญชีของคุณ และตัวสะกดของ username/password";
	} // end if username,password correct

	mysql_close($link);

} // end if there is login

#################################################

?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title>Regisblog Service :: Refill Center</title>
<style type="text/css">
<!--
.style1 {
	font-family: Verdana;
	font-size: 10px;
}
.style2 {font-family: Tahoma; font-size: 12px; }
.style3 {
	color: #00CC33;
	font-weight: bold;
}
.style4 {
	color: #FF0000;
	font-weight: bold;
}
.style5 {
font-family: Tahoma;
color:#FF0000;
font-size:10px;
}
.style6 {
font-family: Tahoma;
color:#FF0000;
font-size:14px;
font-weight:bold;
}
-->
</style>

<script  language="javascript">
function displayWindow(url, width, height) {
        var Win = window.open(url,"displayWindow",'width=' + width + ',height=' + height + ',resizable=0,scrollbars=no,menubar=no,status=no' );
}
</script>
</head>

<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">

<table width="780" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3"><img src="images/images2_top.jpg" width="780" height="90"></td>
  </tr>
  <tr>
    <td width="50" rowspan="4"><img src="images/images2_main_1.jpg" width="50" height="490"></td>
    <td width="725" height="40" bgcolor="#FFBE52"><img src="images/refillcenter.jpg" width="127" height="40"></td>
    <td width="25" rowspan="4"><img src="images/images2_main_3.jpg" width="25" height="490"></td>
  </tr>
  <tr>
    <td height="421" valign="top" class="style1"><div align="center"><br>
<?

###### if the page is report payment page ######
if($_SESSION["type"] == "payment"){

	###### if there is submit transfer money report ######
	if($_POST["payment_type"] == "account"){

		$link = mysql_connect("$host","$db_username","$db_password");
		mysql_select_db(regisblog);
	
		if($_SESSION["acc_type"] == "user"){ // check for account type
			$strSQL = "SELECT * FROM user WHERE username = '$_SESSION[username]' AND password = '$_SESSION[hash_password]'";
		}else if($_SESSION["acc_type"] == "domain"){
			$strSQL = "SELECT * FROM domain WHERE admin_username = '$_SESSION[username]' AND admin_password = '$_SESSION[hash_password]'";
		} // end check for account type

		$result = mysql_query($strSQL);
		$row = mysql_fetch_array($result);
		$num = mysql_num_rows($result);

		if($num > 0){ // if username,password is correct

			if($_SESSION["acc_type"] == "user"){ // check for account type
				$id = $row["user_id"];
			} else if($_SESSION["acc_type"] == "domain"){
				$id = $row["domain_id"];
			} // end check for account type

			$xNow = $_POST['year']."-".$_POST['month']."-".$_POST['day']." ".$_POST['hour'].":".$_POST['minute'].":00";
			$strSQL = "INSERT INTO money_transfer (bank_acc_id,amount,transfer_datetime,status,acc_type,acc_id) VALUES ('$_POST[acc_id]','$_POST[amount]','$xNow','wait','$_SESSION[acc_type]','$id')";
			$result = mysql_query($strSQL);

			if($result){ // if the data can insert into database
				echo "<p><span class=\"style6\">รับแจ้งการโอนเงินเรียบร้อย</span> <br> \n";
				echo "</p> \n";
			}else{
				echo "<p><span class=\"style6\">ระบบไม่สามารถรับแจ้งการโอนเงินได้ในขณะนี้ กรุณาแจ้งใหม่ภายหลัง </span> <br> \n";
				echo "</p> \n";
			} // end if the data can insert into database

		}else{
				echo "<p><span class=\"style6\">username , password ผิดพลาด กรุณา login อีกครั้ง </span> <br> \n";
				echo "</p> \n";
		} // end if username,password is correct

		echo "<br><span class=\"style2\"> <a href=\"refillcenter.php?action=logout\">click ที่นี่เพื่อกลับไปหน้าแรก</a> </span> \n";
		mysql_close($link);

	###### if there is submit code input report ######
	} else if($_POST["payment_type"] == "code"){

		$link = mysql_connect("$host","$db_username","$db_password");
		mysql_select_db(regisblog);

		if($_SESSION["acc_type"] == "user"){ // check for account type
			$strSQL = "SELECT * FROM user WHERE username = '$_SESSION[username]' AND password = '$_SESSION[hash_password]'";
		}else if($_SESSION["acc_type"] == "domain"){
			$strSQL = "SELECT * FROM domain WHERE admin_username = '$_SESSION[username]' AND admin_password = '$_SESSION[hash_password]'";
		} // end check for account type

		$result = mysql_query($strSQL);
		$row = mysql_fetch_array($result);
		$num = mysql_num_rows($result);

		if($num > 0){ // if username , password is correct

			if($_SESSION["acc_type"] == "user"){ // check for account type
				$id = $row["user_id"];
			} else if($_SESSION["acc_type"] == "domain"){
				$id = $row["domain_id"];
			} // end check for account type

			$credit = $row["credit_left"];
			$strSQL = "SELECT * FROM refill_list WHERE refill_serial = '$_POST[serial]' AND refill_password = '$_POST[password]'";
			$result = mysql_query($strSQL);
			$row = mysql_fetch_array($result);
			$num = mysql_num_rows($result);

			if($num < 1){ // if refill serial is not in list
				echo "<p><span class=\"style6\">Serial Code หรือ Password ผิดพลาด กรุณาตรวจสอบอีกครั้ง</span> <br> \n";
				echo "</p><br><span class=\"style2\"><a href=\"javascript:history.back()\">click ที่นี่เพื่อกลับไปตรวจสอบ</a></span><br>\n";
			} else {

				if($row["status"] == "invalid"){ // if refill serial is invalid
					echo "<p><span class=\"style6\">Serial Code นี้ไม่สามารถใช้งานได้</span> <br> \n";
					echo "</p><br><span class=\"style2\"><a href=\"javascript:history.back()\">click ที่นี่เพื่อกลับไปตรวจสอบ</a></span><br>\n";
				} else if($row["status"] == "used"){
					echo "<p><span class=\"style6\">Serial Code นี้ถูกใช้งานไปแล้ว</span> <br> \n";
					echo "</p><br><span class=\"style2\"><a href=\"javascript:history.back()\">click ที่นี่เพื่อกลับไปตรวจสอบ</a></span><br>\n";
				} else {

					$credit = $credit + $row["amount"];
					$serial = $_POST["serial"];
					$mNow = getdate();
					$xNow = $mNow['year']."-".$mNow['mon']."-".$mNow['mday']." ".$mNow['hours'].":".$mNow['minutes'].":".$mNow['seconds'];

					if($_SESSION["acc_type"] == "user"){ // check for account type
						$strSQL = "INSERT INTO user_refill (user_id,refill_serial,refill_datetime) VALUES ('$id','$serial','$xNow')";
						$strSQL2 = "UPDATE user SET credit_left = '$credit' WHERE username = '$_SESSION[username]'";
					}else if($_SESSION["acc_type"] == "domain"){
						$strSQL = "INSERT INTO domain_refill (domain_id,refill_serial,refill_datetime) VALUES ('$id','$serial','$xNow')";
						$strSQL2 = "UPDATE domain SET credit_left = '$credit' WHERE admin_username = '$_SESSION[username]'";
					} // end check for account type
				
					$strSQL3 = "UPDATE refill_list SET status = 'used' WHERE refill_serial = '$serial'";

					$result = mysql_query($strSQL);
					$result2 = mysql_query($strSQL2);
					$result3 = mysql_query($strSQL3);

					if((!$result)||(!$result2)||(!$result3)){ // if data can't insert into database
						echo "<p><span class=\"style6\">ระบบไม่สามารถเติมเงินได้ในขณะนี้ กรุณาเติมเงินใหม่ภายหลัง </span> <br> \n";
						echo "</p> \n";
					}else{
						echo "<p><span class=\"style6\">เติมเงินจำนวน $row[amount] เข้าบัญชี $_SESSION[username] เรียบร้อย</span> <br> \n";
						echo "</p> \n";
					} // end if data can't insert into database

				} // end if refill serial is invalid

			} // end if refill serial is not in list

		} else {

			echo "<p><span class=\"style6\">username , password ผิดพลาด กรุณา login อีกครั้ง </span> <br> \n";
			echo "</p> \n";

		} // end if username,password is correct

		echo "<br><span class=\"style2\"> <a href=\"refillcenter.php?action=logout\">click ที่นี่เพื่อกลับไปหน้าแรก</a> </span> \n";
		mysql_close($link);

	} else {
echo<<<HTML
<table width="99%" height="390"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="66%" valign="top"><table width="97%"  border="0" align="center" cellpadding="1" cellspacing="1">
            <tr>
              <td height="387" bgcolor="#CCCCCC"><table width="100%" height="100%"  border="0" cellpadding="1" cellspacing="0" bgcolor="#FFFFFF">
                <tr>
                  <td height="267" valign="top" class="style2"><img src="images/dollar.gif" width="16" height="16" align="absmiddle"> <span class="style3">คุณสามารถเติมเงินเข้าสู่บัญชีของคุณใน Regisblog ได้สองทาง
                    </span>
                    <p>&nbsp;&nbsp;&nbsp;<img src="images/bullet_red.gif" width="12" height="12"> โอนเงินผ่านธนาคาร โดยโอนเงินเข้าบัญชีใดบัญชีหนึ่งดังนี้<br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- <a href="javascript:displayWindow('bankacc.php',350,150)">คลิ๊กที่นี่เพื่อรับหมายเลขบัญชี</a><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- จากนั้นแจ้งรายละเอียดการโอนเงินของคุณในหัวข้อ &quot;กรอกรายละเอียดการโอนเงิน&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- เมื่อระบบตรวจสอบแล้ว ระบบจะทำการเติมเงินเข้าบัญชีของคุณเท่ากับจำนวนที่โอน<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;คุณสามารถตรวจสอบสถานะการโอนเงินของคุณได้ในหัวข้อ &quot;ประวัติการเติมเงิน&quot; </p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="images/bullet_red.gif" width="12" height="12"> กรอกรหัสชำระเงิน ซึ่งประกอบด้วย serial code และ password<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- หากรหัสถูกต้อง ระบบจะทำการเติมเงินเข้าบัญชีของคุณ<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- คุณสามารถตรวจสอบประวัติการชำระเงินของคุณในหัวข้อ &quot;ประวัติการเติมเงิน&quot;</p>
                    </td>
                </tr>
              </table></td>
            </tr>
          </table></td>
          <td width="34%" valign="top"><span class="style2">
            &nbsp;&nbsp;<img src="images/aim.gif" width="12" height="13"> login :  $_SESSION[username]  ($_SESSION[acc_type]) <a href="refillcenter.php?action=logout">Logout</a><br>
            <br>
          </form>
          </span>
            <table width="95%"  border="0" align="center" cellpadding="0" cellspacing="1">
              <tr>
                <td bgcolor="#CCCCCC"><table width="100%"  border="0" cellspacing="1" cellpadding="0">
                  <tr>
                    <form name="form1" method="post">
                      <td height="113" valign="top" bgcolor="#FFFFFF" class="style2"><img src="images/redo_16.gif" width="16" height="16" align="absmiddle"> <span class="style4">กรอกรายละเอียดการโอนเงิน</span>
                        <table width="98%"  border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                              <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                            </tr>
                            <tr>
                              <td width="32%" height="22"><div align="right">บัญชีที่โอน: 
							</div></td>
                              <td width="68%"><select name="acc_id" id="acc_id">
HTML;

$link = mysql_connect("$host","$db_username","$db_password");
mysql_select_db(regisblog);
$strSQL = "SELECT * FROM bank_acc";
$result = mysql_query($strSQL);
while($row = mysql_fetch_array($result)){
	echo "<option value=\"$row[bank_acc_id]\">ธ.$row[bank_name]</option> \n";
}
mysql_close($link);

echo<<<HTML
								</select></td>
                            </tr>
                            <tr >
                              <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                              <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                            </tr>
                            <tr>
                              <td><div align="right">จำนวนเงิน : </div></td>
                              <td><input name="amount" type="text" id="amount"></td>
                            </tr>
                            <tr >
                              <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                              <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                            </tr>
                            <tr>
                              <td><div align="right">วันที่โอน : </div></td>
                              <td><select name="day" id="day"
HTML;

$mNow = getdate();

for($i=1;$i<=31;$i++){
	echo "<option value=\"$i\"";
if($i == $mNow['mday']){
	echo " selected";
}
	echo ">$i</option> \n";
}

echo<<<HTML
							</select></td>
                            </tr>
                            <tr >
                              <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                              <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                            </tr>
                            <tr>
                              <td><div align="right">เดือนที่โอน : </div></td>
                              <td><select name="month" id="month">
HTML;

$monthname = array("0","มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฎาคม","สิงหาคม","กันยายน","ตุลาคม","พฤศจิกายน","ธันวาคม");

for($i=1;$i<=12;$i++){
	echo "<option value=\"$i\"";
if($i == $mNow['mon']){
	echo " selected";
}
	echo ">$monthname[$i]</option> \n";
}

echo "</select></td> \n";
echo "</tr> \n";
echo "<tr > \n";
echo "<td height=\"5\"><img src=\"images/blanker.gif\" width=\"1\" height=\"1\"></td> \n";
echo "<td height=\"5\"><img src=\"images/blanker.gif\" width=\"1\" height=\"1\"></td> \n";
echo "</tr> \n";
echo "<tr> \n";
echo "<td><div align=\"right\">ปีที่โอน : </div></td> \n";
echo "<td><select name=\"year\" id=\"year\"> \n";

$mNow['year']+=543;
for($i=2548;$i<=2552;$i++){
	echo "<option value=\"$i\"";
if($i == $mNow['year']){
	echo " selected";
}	echo ">$i</option> \n";
}

echo "</select></td> \n";
echo "</tr> \n";
echo "<tr> \n";
echo "<td height=\"5\"><img src=\"images/blanker.gif\" width=\"1\" height=\"1\"></td> \n";
echo "<td height=\"5\"><img src=\"images/blanker.gif\" width=\"1\" height=\"1\"></td> \n";
echo "</tr> \n";
echo "<tr> \n";
echo "<td><div align=\"right\">เวลาที่โอน : </div></td> \n";
echo "<td> <select name=\"hour\" id=\"hour\"> ";
for($i=0;$i<=23;$i++){
	echo "<option value=\"$i\">$i</option> \n";
}
echo "</select> : <select name=\"minute\" id=\"minute\"> ";
for($i=0;$i<=59;$i++){
	echo "<option value=\"$i\">$i</option> \n";
}
echo "</selct></td> \n";

echo<<<HTML
							</tr>
                            <tr>
                              <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                              <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td><input name="payment_type" type="hidden" id="payment_type" value="account">
                              <input type="submit" name="Submit" value="Submit"></td>
                            </tr>
                        </table></td>
                    </form>
                  </tr>
                </table></td>
              </tr>
            </table>
              <br>
              <table width="95%"  border="0" align="center" cellpadding="0" cellspacing="1">
                <tr>
                  <td bgcolor="#CCCCCC"><table width="100%"  border="0" cellspacing="1" cellpadding="0">
                      <tr>
                        <form name="form2" method="post">
                          <td height="113" valign="top" bgcolor="#FFFFFF" class="style2"><img src="images/history.gif" width="16" height="16" align="absmiddle"> <span class="style4">กรอกรหัสชำระเงิน</span>
                            <table width="98%"  border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="34%" height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                                  <td width="66%" height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                                </tr>
                                <tr>
                                  <td><div align="right">Serial Code  : </div></td>
                                  <td><input name="serial" type="text" id="serial"></td>
                                </tr>
                                <tr >
                                  <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                                  <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                                </tr>
                                <tr>
                                  <td><div align="right">Password : </div></td>
                                  <td><input type="password" name="password"></td>
                                </tr>
                                <tr>
                                  <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                                  <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                                </tr>
                                <tr>
                                  <td>&nbsp;</td>
                                  <td><input name="payment_type" type="hidden" id="payment_type" value="code"><input type="submit" name="Submit" value="Submit"></td>
                                </tr>
                          </table></td>
                        </form>
                      </tr>
                  </table></td>
                </tr>
          </table></td>
        </tr>
      </table>
HTML;

}

} else if($_SESSION["type"] == "history"){

	$link = mysql_connect("$host","$db_username","$db_password");
	mysql_select_db(regisblog);

	if($_SESSION["acc_type"] == "user"){ // check for account type
		$strSQL = "SELECT * FROM user WHERE username = '$_SESSION[username]' AND password = '$_SESSION[hash_password]'";
	} else if($_SESSION["acc_type"] == "domain"){
		$strSQL = "SELECT * FROM domain WHERE admin_username = '$_SESSION[username]' AND admin_password = '$_SESSION[hash_password]'";
	} // end check for account type
	$result = mysql_query($strSQL);
	$row = mysql_fetch_array($result);

	if($_SESSION["acc_type"] == "user"){ // check for account type
		$id = $row["user_id"];
	} else if($_SESSION["acc_type"] == "domain"){
		$id = $row["domain_id"];
	} // end check for account type

	$strSQL = "SELECT * FROM money_transfer,bank_acc WHERE money_transfer.bank_acc_id = bank_acc.bank_acc_id AND acc_type = '$_SESSION[acc_type]' AND acc_id = '$id' AND status = 'wait' ORDER BY transfer_datetime ASC ";
	$result = mysql_query($strSQL);
	$num = mysql_num_rows($result);
	if($num > 0){			// if there is waiting transaction

		echo "<table width=\"90%\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> \n";
		echo "<tr> \n";
		echo "<td bgcolor=\"#CCCCCC\"><table width=\"100%\"  border=\"0\" cellspacing=\"1\" cellpadding=\"0\"> \n";
		echo "<tr bgcolor=\"#FFFFFF\"> \n";
		echo "<td colspan=\"3\"><div align=\"center\"><span class=\"style4\">ประวัติการชำระเงินที่ยังรอการตรวจสอบ</span></div></td> \n";
		echo "</tr> \n";
		while($row = mysql_fetch_array($result)){

			list($date,$time) = explode(" ",$row[transfer_datetime]);
			list($year,$month,$day) = explode("-",$date);
			list($hour,$min)	 = explode(":",$time);

            echo "<tr bgcolor=\"#FFFFFF\"> \n";
            echo "<td align=\"center\" width=\"19\"><span class=\"style7\"><img src=images/light_yellow.gif></span></td> \n";
            echo "<td align=\"center\" width=\"400\"><span class=\"style2\">ชำระเงิน $row[amount] บาท ผ่านธนาคาร".$row["bank_name"]." เมื่อวันที่ $day/$month/$year เวลา $hour:$min</span></td> \n";
            echo "<td align=\"center\"><span class=\"style7\"><a href=\"javascript:displayWindow('refillcenter.php?tid=$row[transfer_id]&action=delreport',400,150)\">ยกเลิกการแจ้งการชำระเงินนี้</a></span></td> \n";
            echo "</tr> \n";
		}
		echo "</table></td> \n";
		echo "</tr> \n";
		echo "</table> \n";

		echo "<br> \n";

	} // end if there is waiting transaction

	$strSQL = "SELECT * FROM money_transfer,bank_acc WHERE money_transfer.bank_acc_id = bank_acc.bank_acc_id AND acc_type = '$_SESSION[acc_type]' AND acc_id = '$id' AND status = 'incomplete' ORDER BY transfer_datetime ASC ";
	$result = mysql_query($strSQL);
	$num = mysql_num_rows($result);
	if($num > 0){			// if there is incomplete transaction

		echo "<table width=\"90%\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> \n";
		echo "<tr> \n";
		echo "<td bgcolor=\"#CCCCCC\"><table width=\"100%\"  border=\"0\" cellspacing=\"1\" cellpadding=\"0\"> \n";
		echo "<tr bgcolor=\"#FFFFFF\"> \n";
		echo "<td colspan=\"3\"><div align=\"center\"><span class=\"style4\">ประวัติการชำระเงินที่ไม่ผ่านการตรวจสอบ</span></div></td> \n";
		echo "</tr> \n";
		while($row = mysql_fetch_array($result)){

			list($date,$time) = explode(" ",$row[transfer_datetime]);
			list($year,$month,$day) = explode("-",$date);
			list($hour,$min)	 = explode(":",$time);

            echo "<tr bgcolor=\"#FFFFFF\"> \n";
            echo "<td align=\"center\" width=\"19\"><span class=\"style7\"><img src=images/light_red.gif></span></td> \n";
            echo "<td align=\"center\" width=\"400\"><span class=\"style2\">ชำระเงิน $row[amount] บาท ผ่านธนาคาร".$row["bank_name"]." เมื่อวันที่ $day/$month/$year เวลา $hour:$min</span></td> \n";
            echo "<td align=\"center\"><span class=\"style7\">$row[comment]</span></td> \n";
            echo "</tr> \n";
		}
		echo "</table></td> \n";
		echo "</tr> \n";
		echo "</table> \n";

		echo "<br> \n";

	} // end if there is incomplete transaction

	if($_SESSION["acc_type"] == "user"){ // check for account type
		$strSQL = "SELECT * FROM user_refill WHERE user_id = '$id' ORDER BY refill_datetime ASC";
	} else if($_SESSION["acc_type"] == "domain"){
		$strSQL = "SELECT * FROM domain_refill WHERE domain_id = '$id' ORDER BY refill_datetime ASC";
	} // end check for account type

	$result = mysql_query($strSQL);
	$num = mysql_num_rows($result);
	if($num > 0){			// if there is complete transaction

		echo "<table width=\"90%\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> \n";
		echo "<tr> \n";
		echo "<td bgcolor=\"#CCCCCC\"><table width=\"100%\"  border=\"0\" cellspacing=\"1\" cellpadding=\"0\"> \n";
		echo "<tr bgcolor=\"#FFFFFF\"> \n";
		echo "<td colspan=\"3\"><div align=\"center\"><span class=\"style4\">ประวัติการชำระเงินผ่านการตรวจสอบแล้ว</span></div></td> \n";
		echo "</tr> \n";
		while($row = mysql_fetch_array($result)){

			list($date,$time) = explode(" ",$row[refill_datetime]);
			list($year,$month,$day) = explode("-",$date);
			list($hour,$min)	 = explode(":",$time);

            echo "<tr bgcolor=\"#FFFFFF\"> \n";
            echo "<td align=\"center\" width=\"19\"><span class=\"style7\"><img src=images/light_green.gif></span></td> \n";
            echo "<td  align=\"center\"><span class=\"style2\">";

			$strSQL2 = "SELECT * FROM money_transfer,bank_acc WHERE money_transfer.bank_acc_id = bank_acc.bank_acc_id AND refill_serial = '$row[refill_serial]'";
			$result2 = mysql_query($strSQL2);
			$num2 = mysql_num_rows($result2);
			$row2 = mysql_fetch_array($result2);
			if($num2 > 0){

				list($date,$time) = explode(" ",$row2[transfer_datetime]);
				list($year,$month,$day) = explode("-",$date);
				list($hour,$min)	 = explode(":",$time);

				echo "ชำระเงินผ่านการโอนเงินผ่านธนาคาร $row2[bank_name] จำนวนเงิน $row2[amount] บาท เมื่อวันที่ $day/$month/$year เวลา $hour:$min";
			} else {

				$strSQL3 = "SELECT * FROM refill_list WHERE refill_serial = '$row[refill_serial]'";
				$result3 = mysql_query($strSQL3);
				$row3 = mysql_fetch_array($result3);
				echo "ชำระเงินผ่านบัตรเติมเงินหมายเลข $row[refill_serial] จำนวนเงิน $row3[amount] บาท เมื่อวันที่ $day/$month/$year เวลา $hour:$min";
			}
			echo "</span></td> \n";
            echo "</tr> \n";
		}
		echo "</table></td> \n";
		echo "</tr> \n";
		echo "</table> \n";

		echo "<br> \n";

	} // end if there is complete transaction

	mysql_close($link);

	echo "<div align=\"right\" class=\"style2\"><img src=\"images/home.gif\" align=\"absmiddle\"> <a href=\"refillcenter.php?action=logout\">กลับไปหน้าแรก</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>";

} else {
if($error_message){
	echo "<span class=\"style5\">*** ไม่สามารถ login ได้เนื่องจาก $error_message ***</span> \n";
}
echo<<<HTML
<table width="99%" height="390"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="66%" valign="top"><table width="97%"  border="0" align="center" cellpadding="1" cellspacing="1">
            <tr>
              <td height="387" bgcolor="#CCCCCC"><table width="100%" height="100%"  border="0" cellpadding="1" cellspacing="0" bgcolor="#FFFFFF">
                <tr>
                  <td height="267" valign="top" class="style2"><img src="images/dollar.gif" width="16" height="16" align="absmiddle"> <span class="style3">การเติมเงินเข้าสู่ระบบ Regisblog </span>
                    <p>&nbsp;&nbsp;&nbsp;<img src="images/bullet_red.gif" width="12" height="12"> คุณสามารถเติมเงินเข้าสู่บัญชีของคุณใน Regisblog ด้วยการ login เข้าสู่หัวข้อ<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;เติมเงิน&quot; เพื่อรับหมายเลขบัญชีธนาคารสำหรับโอนเงิน หรือกรอกรหัสชำระเงิน<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ที่คุณมีอยู่เพื่อเติมเงินเข้าสู่บัญชีได้ทันที</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="images/bullet_red.gif" width="12" height="12"> หากคุณเป็นสมาชิกของ website ใช้บริการ Regisblog Service คุณจะต้องเลือก<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;ประเภทบัญชี&quot; เป็น user แต่หากคุณเป็นเจ้าของ website ที่ใช้บริการ คุณจะ<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ต้องเลือก &quot;ประเภทบัญชี&quot; เป็น domain</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="images/bullet_red.gif" width="12" height="12"> คุณสามารถตรวจสอบรายละเอียดการเติมเงินที่ผ่านมาของคุณได้ด้วยการ login<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;เข้าสู่หัวข้อ &quot;ประวัติการเติมเงิน&quot;</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="images/bullet_red.gif" width="12" height="12"> กรุณาระมัดระวังการเติมเงินของคุณด้วย เนื่องจากระบบไม่สามารถคืนเงินให้คุณ<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ได้เมื่อมีการโอนเงินเข้าสู่บัญชีแล้ว</p>
                    </td>
                </tr>
              </table></td>
            </tr>
          </table></td>
          <td width="34%" valign="top"><table width="95%"  border="0" align="center" cellpadding="0" cellspacing="1">
            <tr>
              <td bgcolor="#CCCCCC"><table width="100%"  border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <form name="form1" method="post">
                    <td height="113" valign="top" bgcolor="#FFFFFF" class="style2"><img src="images/redo_16.gif" width="16" height="16" align="absmiddle"> <span class="style4">เติมเงิน</span>
                        <table width="98%"  border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                            <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                          </tr>
                          <tr>
                            <td width="34%" height="22"><div align="right">ประเภทบัญชี : </div></td>
                            <td width="66%"><select name="acc_type">
                              <option value="domain">Domain</option>
                              <option value="user" selected>User</option>
                                                                                    </select></td>
                          </tr>
                          <tr >
                            <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                            <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                          </tr>
                          <tr>
                            <td><div align="right">Username : </div></td>
                            <td><input type="text" name="username"></td>
                          </tr>
                          <tr >
                            <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                            <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                          </tr>
                          <tr>
                            <td><div align="right">Password : </div></td>
                            <td><input type="password" name="password"></td>
                          </tr>
                          <tr>
                            <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                            <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td><input type="hidden" name="type" value="payment"><input type="submit" name="Submit" value="Submit"></td>
                          </tr>
                      </table></td>
                  </form>
                </tr>
              </table></td>
            </tr>
          </table>
            <br>
            <table width="95%"  border="0" align="center" cellpadding="0" cellspacing="1">
              <tr>
                <td bgcolor="#CCCCCC"><table width="100%"  border="0" cellspacing="1" cellpadding="0">
                    <tr>
                      <form name="form2" method="post">
                        <td height="113" valign="top" bgcolor="#FFFFFF" class="style2"><img src="images/history.gif" width="16" height="16" align="absmiddle"> <span class="style4">ประวัติการเติมเงิน</span>
                          <table width="98%"  border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                                <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                              </tr>
                              <tr>
                                <td width="34%" height="22"><div align="right">ประเภทบัญชี : </div></td>
                                <td width="66%"><select name="acc_type">
                                  <option value="domain">Domain</option>
                                  <option value="user" selected>User</option>
                                </select></td>
                              </tr>
                              <tr >
                                <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                                <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                              </tr>
                              <tr>
                                <td><div align="right">Username : </div></td>
                                <td><input type="text" name="username"></td>
                              </tr>
                              <tr >
                                <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                                <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                              </tr>
                              <tr>
                                <td><div align="right">Password : </div></td>
                                <td><input type="password" name="password"></td>
                              </tr>
                              <tr>
                                <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                                <td height="5"><img src="images/blanker.gif" width="1" height="1"></td>
                              </tr>
                              <tr>
                                <td>&nbsp;</td>
                                <td><input type="hidden" name="type" value="history"><input type="submit" name="Submit" value="Submit"></td>
                              </tr>
                        </table></td>
                      </form>
                    </tr>
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
HTML;
}
?>
  
  </div></td>
  </tr>
  <tr>
    <td height="19" bgcolor="#FFA210"><div align="right" class="style1">copyright &copy; 2004-2006 Regisblog.com all right reserved. </div></td>
  </tr>
  <tr>
    <td height="10" bgcolor="#DEEBFF"><img src="images/blanker.gif" width="1" height="1"></td>
  </tr>
</table>
</body>
</html>
