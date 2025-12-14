<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?
if(!$totals){
	print"<meta http-equiv=\"refresh\" content=\"0;url=confirm.php\">";
	}else{
session_start();
include "connect.php";
$sql="select  * from temp  where id_session='$session_id' ";
$result=mysql_db_query($dbname,$sql);
if($result){
while($array=mysql_fetch_array($result)){
$trans_id=$array[id_temp];
$cusid=$array[cusid];
$nameres=$array[nameres];
$rsername=$array[surres];
$ratt=$array[ratt];
$rmoo=$array[rmoo];
$rdistrict=$array[rdistrict];
$ramphur=$array[ramphur];
$rprovince=$array[rprovince];
$rzipcode=$array[rzipcode];
$total=$array[total];
$price=$array[price];
$packid=$array[packid];
$place_id=$array[place_id];
$sdate=$array[sdate];
$id_session=$array[id_session];
	$sql="insert into transition values('$trans_id','$cusid','$nameres','$rsername','$ratt','$rmoo','$rdistrict','$ramphur','$rprovince','$rzipcode','$packid','$place_id','$total','$price','$sdate','null','1');";
	$result_t=mysql_db_query($dbname,$sql);
	}
	 $sql="delete from temp where id_session= '$id_session' ";
	 $result=mysql_db_query($dbname,$sql);
	 mysql_close(); 
print"<meta http-equiv=\"refresh\" content=\"0; url=viewcart.php\">";
	}
	}
?>
</body>
</html>
