<?
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
if($k8=='yes')
{
	$k8=$d4;
}
$keys=$k1.$k2.$k3.$k4.$k5.$k6.$k7.$k8;
$data = addslashes($data);
$d1 = addslashes($d1);
$d2= addslashes($d2);
$d3 = addslashes($d3);
$d4 = addslashes($d4);
$d5= addslashes($d5);
$type_sent = addslashes($type_sent);
$d6 = addslashes($d6);
$keys = addslashes($keys);
$sql = "INSERT INTO `externalbook` ( `ID_BOOK` , `ID` , `E_DATE` , `E_MONTH` , `E_YEAR` , `E_TOPIC` , `E_TO` , `E_AND` , `E_DATA1` , `E_DATA2` , `E_DATA3` , `E_FILE` , `E_END` , `USER_NAME` , `TYPE_SENT` , `STATUS` , `KEYS` , `CATEGORY` ) 
				VALUES ('d', 'xxxx', '$d1', '$d2', '$d3', '$ttopic', '$too', '', '', '', '', '$data', '', '$sender', '$type_sent', 'OLD_BOOK', '$keys', 'หนังสือภายใน')";
$db_query=mysql_db_query($dbname,$sql);
echo "ข้อมูลลง Table เสร็จเรียบร้อยแล้ว ";
mysql_close();		
?>
<body>

</body>



