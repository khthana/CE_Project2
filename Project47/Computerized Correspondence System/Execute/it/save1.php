<?
include "datethai.php";
require("config.php");
$tbname = "book";
mysql_connect($hostname,$user,$password) or die ("can't connect data base server");//ติดต่อ data base
mysql_select_db($dbname)or die("can't conected database");//เลือกฐานข้อมูล
$filename =$HTTP_POST_FILES['files']['name'];
$filetempname =$HTTP_POST_FILES['files']['tmp_name'];
$filesize =$HTTP_POST_FILES['files']['size'];

$fp = fopen($filetempname,"r");
$data = fread($fp,filesize($filetempname));
fclose($fp);

if($keys8=='yes')
{
	$keys8=$d4;
}
$keys=$k1.$k2.$k3.$k4.$k5.$k6.$k7.$k8;
$data = addslashes($data);
$id_books= addslashes($id_books);
$date_book= addslashes($date_book);
$ttopic= addslashes($ttopic);
$too= addslashes($too);
$sender= addslashes($sender);
$date_receive= addslashes($date_receive);
$time_receive= addslashes($time_receive);
$keys= addslashes($keys);
$sql = "INSERT INTO $tbname(R_DATE,R_MONTH,R_YEAR,R_TOPIC,R_TO,R_FILES,R_SENDER,DATE_RECEIVE,TIME_RECEIVE,R_KEYS,TYPE_BOOK,STATUS,TYPE_SENT) 
values( '$d1', '$d2', '$d3', '$ttopic','$too','$data','$sender','$data_date','$data_time','$keys','หนังสือเข้า','NEWBOOK','$type_sent')";
$db_query=mysql_db_query($dbname,$sql);
echo "ข้อมูลลง Table เสร็จเรียบร้อยแล้ว ";
mysql_close();		
?>
<body>

</body>



