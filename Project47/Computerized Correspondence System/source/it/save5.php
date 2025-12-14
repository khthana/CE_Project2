<?
require("config.php");
require("datethai.php");
//echo "$mmonth $mday $myear $data_date";
$tbname = "internalbook";
mysql_connect($hostname,$user,$password) or die ("can't connect data base server");//ติดต่อ data base
mysql_select_db($dbname)or die("can't conected database");//เลือกฐานข้อมูล
$filename =$HTTP_POST_FILES['files']['name'];
$filetempname =$HTTP_POST_FILES['files']['tmp_name'];
$filesize =$HTTP_POST_FILES['files']['size'];

$fp = fopen($filetempname,"r");
$data = fread($fp,filesize($filetempname));
fclose($fp);
if($k8=='yes')
{
	$k8=$d4;
}
$keys=$k1.$k2.$k3.$k4.$k5.$k6.$k7.$k8;
$data = addslashes($data);
$type_sent = addslashes($type_sent);
$keys = addslashes($keys);
$sql = "INSERT INTO `externalbook` ( `ID_BOOK` , `E_DATE` , `E_MONTH` , `E_YEAR` , `E_TOPIC` , `E_TO` , `E_AND` , `E_DATA1` , `E_DATA2` , `E_DATA3` , `E_FILE` , `E_END` , `USER_NAME` , `TYPE_SENT` , `STATUS` , `KEYS` , `CATEGORY` ) 
			VALUES ('d', '$mday', '$mmonth', '$myear', '$i_topic', '$i_to', '$i_and', '$i_data1', '$i_data2', '$i_data3', '$data', 'ไม่มี','$yourname', '$type_sent','ร้องขอ', '$keys', '$type_book')";
$db_query=mysql_db_query($dbname,$sql);

echo "เก็บข้อมูลเสร็จเรียบร้อยแล้ว ";
mysql_close();

?>



<?php 
$file_name="$d4";
$output="เรื่อง $d4  วันที่ $mday $mmonth $myear ถึง $i_to สิ่งที่ส่งมาด้วย$i_and  ข้อมูล $i_data1 $i_data2   $i_data3 ผู้ส่ง $username  ส่งโดยวิธี $type_sent  คำสำคัญ $keys ";
$filename="..\file\$d4.txt";
$fp = fopen($filename, "w");
fwrite($fp, $output);
fclose($fp);
?> 
