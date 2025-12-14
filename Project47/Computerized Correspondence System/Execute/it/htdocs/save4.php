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
$d1 = addslashes($d1);
$d2= addslashes($d2);
$d3 = addslashes($d3);
$d4 = addslashes($d4);
$d5= addslashes($d5);
$d6 = addslashes($d6);
$sql = "INSERT INTO `book_sent` ( `S_SECTION` , `S_AT` , `S_TOPIC` , `S_DATE` , `S_TO` , `S_SENDER` , `S_FILE` , `S_KEYS` ) 
VALUES (
'$d1', '$d2', '$d3', '$d4', '$d5', '$d6', '$data', '$d7'
);
";
$db_query=mysql_db_query($dbname,$sql);
//$sql1 = "INSERT INTO use_book(ID_BOOKS,USER_NAME) 
//values( '$id_books','$order')";
//$db_query=mysql_db_query($dbname,$sql1);
echo "ข้อมูลลง Table เสร็จเรียบร้อยแล้ว ";
mysql_close();		
?>
<body>

</body>



