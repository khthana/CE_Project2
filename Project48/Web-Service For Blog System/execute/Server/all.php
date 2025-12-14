<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title>Untitled Document</title>
<style type="text/css">
<!--
.style1 {
	font-family: Tahoma;
	font-size: 12px;
	font-weight: bold;
}
.style2 {
	color: #0000FF;
	font-family: Tahoma;
	font-size: 11px;
}
-->
</style>
</head>

<body>
<p><span class="style1"><img src="images/about.gif" width="16" height="16" align="absmiddle"> รายชื่อ website ทั้งหมดในเครือ Regisblog Service </span><br><br>

<?
include "config.inc.php";

$link = mysql_connect("$host","$db_username","$db_password");
mysql_select_db(regisblog);
$strSQL = "SELECT * FROM domain ORDER BY domain_id";
$result = mysql_query($strSQL);
while($row = mysql_fetch_array($result)){
  echo "<img src=\"images/icon_yellow.gif\" align=\"absmiddle\"><span class=\"style2\"> <a href=\"http://".$row["domain_name"]."\">http://".$row["domain_name"]."</a><br>";
}
mysql_close($link); 
?>

</p>
</body>
</html>
