<?

session_start();

include "../config.inc.php";

if(($_POST["username"] == "$admin_username")&&($_POST["password"] == "$admin_password")){
	$_SESSION["login"] = "yes";
} else if(($_POST["username"])||($_POST["password"])){
	$error_message = "Username / Password ผิดพลาด";
}

?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title>Regisblog Service :: Payment Info</title>
<style type="text/css">
<!--
.style1 {
	font-family: Verdana;
	font-size: 10px;
}
.style2 {font-family: Tahoma; font-size: 12px; }
.style3 {font-family: Verdana; font-size: 10px; font-weight: bold; }
-->
</style>
</head>

<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">

<table width="780" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3"><img src="../images/images2_top.jpg" width="780" height="90"></td>
  </tr>
  <tr>
    <td width="50" rowspan="4" bgcolor="#B3D6FF">&nbsp;</td>
    <td width="725" height="40" bgcolor="#FFBE52"><img src="../images/payment.gif" width="180" height="40"></td>
    <td width="25" rowspan="4" bgcolor="#B3D6FF">&nbsp;</td>
  </tr>
  <tr>
    <td height="421" valign="top">

<? 
	if($_SESSION["login"] == "yes"){

		$link = mysql_connect("$host","$db_username","$db_password");
		mysql_select_db(regisblog);

		if($_GET["action"] == "approve"){
			$strSQL = "SELECT MAX(refill_serial) FROM money_transfer";
			$result = mysql_query($strSQL);
			$row = mysql_fetch_array($result);
			settype($row[0], "integer");
			$refill_serial = $row[0] + 1;

			$strSQL = "SELECT * FROM money_transfer WHERE transfer_id = '$_GET[tid]'";
			$result = mysql_query($strSQL);
			$row = mysql_fetch_array($result);

			$mNow = getdate();
			$xNow = $mNow['year']."-".$mNow['mon']."-".$mNow['mday']." ".$mNow['hours'].":".$mNow['minutes'].":".$mNow['seconds'];

			if($row["acc_type"] == "domain"){
				$strSQL = "INSERT INTO domain_refill(domain_id,refill_serial,refill_datetime) VALUES('$row[acc_id]','$refill_serial','$xNow')";
				$result = mysql_query($strSQL);

				$strSQL = "UPDATE domain SET credit_left = credit_left + $row[amount] WHERE domain_id = '$row[acc_id]'";
				$result = mysql_query($strSQL);

			} else if($row["acc_type"] == "user"){
				$strSQL = "INSERT INTO user_refill(user_id,refill_serial,refill_datetime) VALUES('$row[acc_id]','$refill_serial','$xNow')";
				$result = mysql_query($strSQL);

				$strSQL = "UPDATE user SET credit_left = credit_left + $row[amount] WHERE user_id = '$row[acc_id]'";
				$result = mysql_query($strSQL);

			}


			$strSQL = "UPDATE money_transfer SET status = 'complete' , refill_serial = '$refill_serial' WHERE transfer_id = $_GET[tid]";
			$result = mysql_query($strSQL);

		} else if($_GET["action"] == "deny"){
			$strSQL ="UPDATE money_transfer SET status = 'incomplete' , comment ='ไม่พบยอดเงินนี้' WHERE transfer_id = '$_GET[tid]'";
			$result = mysql_query($strSQL);
		} else if($_GET["action"] == "delete"){
			$strSQL = "UPDATE money_transfer SET status = 'wait' , refill_serial = NULL , comment = NULL WHERE transfer_id = $_GET[tid]";
			$result = mysql_query($strSQL);
		}

		if($_GET["page"] < 1){
			$_GET["page"] = 1;
		}

		$per_page = 20;
		$start = ($_GET["page"] - 1) * $per_page;

		echo "<p align=\"center\" class=\"style2\"><a href=\"payment.php?mode=wait\">รายการที่รอ Approve</a> | <a href=\"payment.php?mode=complete\">รายการที่ Approve ผ่านแล้ว</a> | <a href=\"payment.php?mode=incomplete\">รายการที่ Approve ไม่ผ่าน </a></p> \n";

		$strSQL = "SELECT * FROM money_transfer WHERE status = '$_GET[mode]'";
		$result = mysql_query($strSQL);
		$num = mysql_num_rows($result);

		$total_page = ceil($num/$per_page);

		$strSQL = "SELECT * FROM money_transfer,bank_acc WHERE money_transfer.bank_acc_id = bank_acc.bank_acc_id AND status = '$_GET[mode]' ORDER BY transfer_id LIMIT $start,$per_page";
		$result = mysql_query($strSQL);

		echo "<table width=\"96%\"  border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"> \n";
		echo "<tr> \n";
        echo "<td bgcolor=\"#000000\"><table width=\"100%\"  border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"1\"> \n";
        echo "<tr bgcolor=\"#FFFFFF\" class=\"style2\"> \n";
        echo "<td width=\"11%\"><div align=\"center\">Transfer ID </div></td> \n";
        echo "<td width=\"21%\"><div align=\"center\">Bank ACC </div></td> \n";
        echo "<td width=\"11%\"><div align=\"center\">Amount</div></td> \n";
        echo "<td width=\"16%\"><div align=\"center\">Date Time </div></td> \n";
        echo "<td width=\"16%\"><div align=\"center\">Transfer By </div></td> \n";
		if($_GET["mode"] == "wait"){
			echo "<td width=\"25%\">&nbsp;</td> \n";
		} else if($_GET["mode"] == "complete"){
			echo "<td width=\"25%\"><div align=\"center\">Refill Serial</td></div> \n";
		} else if($_GET["mode"] == "incomplete"){
			echo "<td width=\"25%\"><div align=\"center\"> Reason </td></div> \n";
		}
        echo "</tr> \n";

		while($row = mysql_fetch_array($result)){

			list($date,$time) = explode(" ",$row["transfer_datetime"]);
			list($year,$month,$day) = explode("-",$date);
			list($hour,$minute,$second) = explode(":",$time);

			echo "<tr bgcolor=\"#FFFFFF\" class=\"style2\"> \n";
			echo "<td><div align=\"center\">$row[transfer_id]</div></td> \n";
			echo "<td><div align=\"center\">$row[bank_name]</div></td> \n";
			echo "<td><div align=\"center\">$row[amount]</div></td> \n";
			echo "<td><div align=\"center\">$day/$month/$year $hour:$minute</div></td> \n";
			echo "<td><div align=\"center\">$row[acc_type] / ID: $row[acc_id] </div></td> \n";

			if($_GET["mode"] == "wait"){
				echo "<td><div align=\"center\"> <a href=\"payment.php?mode=$_GET[mode]&page=$_GET[page]&action=approve&tid=$row[transfer_id]\">Approve</a> | <a href=\"payment.php?mode=$_GET[mode]&page=$_GET[page]&action=deny&tid=$row[transfer_id]\">Deny</a> </div></td> \n";
			} else if($_GET["mode"] == "complete"){
				echo "<td><div align=\"center\">$row[refill_serial] </div></td> \n";
			} else if($_GET["mode"] == "incomplete"){
				echo "<td><div align=\"center\">$row[comment] &nbsp;&nbsp;&nbsp; <a href=\"payment.php?mode=$_GET[mode]&page=$_GET[page]&action=delete&tid=$row[transfer_id]\">X</a></div></td> \n";
			}
			echo "</tr> \n";

		}
            
		echo "</table></td> \n";
		echo "</tr> \n";
		echo "</table> \n";
		echo "<p align=\"right\" class=\"style3\"> ";
		echo "Page <a href=\"payment.php?mode=$_GET[mode]&page=1\">1</a>";

		for($i=2;$i<=$total_page;$i++){
			echo " | <a href=\"payment.php?mode=$_GET[mode]&page=$i\">$i</a> ";
		}

		echo "</p> \n";

	mysql_close($link);

	} else {

		if($error_message){

			echo "<p align=\"center\"><font color=red>$error_message</font></p> \n";

		} else {

			echo "<p><br></p> \n";

		}

echo<<<HTML
    <form name="form1" method="post" action="">
      <p align="center"><strong>Please Login</strong></p>
      <p align="center">Username :
        <input name="username" type="text" id="username">
      </p>
      <p align="center">Password :
        <input name="password" type="password" id="password">
</p>
      <p align="center">
        <input type="submit" name="Submit" value="Submit">
</p>
    </form>
HTML;

	}

?>

    <p align="center" class="style2">&nbsp;   </p>
    </td>
  </tr>
  <tr>
    <td height="19" bgcolor="#FFA210"><div align="right" class="style1">copyright &copy; 2004-2006 Regisblog.com all right reserved. </div></td>
  </tr>
  <tr>
    <td height="10" bgcolor="#B3D6FF"><img src="../images/blanker_blue.jpg" width="1" height="1"></td>
  </tr>
</table>
</body>
</html>
