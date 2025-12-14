<body>
<?
require("config.php");
$tbname = "externalbook";
mysql_connect($hostname,$user,$password) or die ("can't connect data base server");//ติดต่อ data base
mysql_select_db($dbname)or die("can't conected database");//เลือกฐานข้อมูล
$filename =$HTTP_POST_FILES['files']['name'];
$filetempname =$HTTP_POST_FILES['files']['tmp_name'];
$filesize =$HTTP_POST_FILES['files']['size'];

$fp = fopen($filetempname,"r");
$data = fread($fp,filesize($filetempname));
fclose($fp);
$data = addslashes($data);
$id_books= addslashes($id_books);
$date_book= addslashes($date_book);
$ttopic= addslashes($ttopic);
$too= addslashes($too);
$att= addslashes($att);
$sender= addslashes($sender);
$date_receive= addslashes($date_receive);
$time_receive= addslashes($time_receive);
$sql = "UPDATE `externalbook` SET `E_DATE` = '$date_book',
`E_MONTH` = '$month',
`E_YEAR` = '$year',
`E_TOPIC` = '$ttopic',
`E_TO` = '$too',
E_FILE ='$data',
`USER_NAME` = '$sender',
`KEYS` = 'dd' WHERE `ID_BOOK` = '$idbook' LIMIT 1 ";
$db_query=mysql_db_query($dbname,$sql);
echo "ข้อมูลลง Table เสร็จเรียบร้อยแล้ว ";
mysql_close();		
?>
</body>