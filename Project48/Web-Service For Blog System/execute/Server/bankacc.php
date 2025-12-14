
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
.style1 {
	font-family: Tahoma;
	font-size: 12px;
}
-->
</style>
<?
include "config.inc.php";

$link = mysql_connect("$host","$db_username","$db_password");
mysql_select_db(regisblog);
$strSQL = "SELECT * FROM bank_acc";
$result = mysql_query($strSQL);
echo "<span class=\"style1\"> \n";
while($row = mysql_fetch_array($result)){
echo "<img src=\"images/donations.png\" width=\"16\" height=\"16\" border=\"0\"> บัญชีธนาคาร".$row["bank_name"]." สาขา ".$row["location"]." <br>\n";
echo "ชื่อบัญชี ".$row["acc_name"]." หมายเลขบัญชี ".$row["bank_acc_id"]." <br><br> \n";
}
echo "</span> \n";
mysql_close($link);
?>


