<body>
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
$data = addslashes($data);
$id_books= addslashes($id_books);
$date_book= addslashes($date_book);
$ttopic= addslashes($ttopic);
$too= addslashes($too);
$att= addslashes($att);
$sender= addslashes($sender);
$date_receive= addslashes($date_receive);
$time_receive= addslashes($time_receive);
$sql = "UPDATE `book` SET
`R_DATE` = '$date_book',
`R_TOPIC` = '$ttopic',
`R_TO` = '$too',
`R_FILES` = '$data',
`R_KEYS` = '$keys',
`R_SENDER` = '$sender',
`DATE_RECEIVE` = '$date_receive',
`TIME_RECEIVE` = '$time_receive' WHERE `ID_BOOKS` = '$idbook' LIMIT 1 ";
$db_query=mysql_db_query($dbname,$sql);
echo "ข้อมูลลง Table เสร็จเรียบร้อยแล้ว ";
mysql_close();		
?>
</body>