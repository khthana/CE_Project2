<body>
<?
require("config.php");
$tbname = "externalbook";
mysql_connect($hostname,$user,$password) or die ("can't connect data base server");//ติดต่อ data base
mysql_select_db($dbname)or die("can't conected database");//เลือกฐานข้อมูล

$sql = "UPDATE `externalbook` SET `E_TOPIC` = '$data4',
`E_TO` = '$data5',
`E_AND` = '$data6',
`E_DATA1` = '$data7',
`E_DATA2` = '$data11',
`E_DATA3` = '$data8',
`E_END` = '$menu1' WHERE `ID_BOOK` = '$idbook' LIMIT 1 ;
";
$db_query=mysql_db_query($dbname,$sql);
echo "แก้ใขข้อมูล เสร็จเรียบร้อยแล้ว ";
mysql_close();		
?>
</body>