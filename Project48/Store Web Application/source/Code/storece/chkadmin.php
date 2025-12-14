<?php
include "chksession.php";
include "connect.php";

mysql_query("SET NAMES tis620"); //ให้เป็นภาษาไทย
$sql="select * from userprofile where Username='$sess_username' ";
$result = mysql_db_query($dbname,$sql);
$record = mysql_fetch_array ($result);
$Level=$record[Level];
mysql_close();

if ($Level<>"administrator") { 
header ("location:index.html"); exit();
}
?> 

</html>