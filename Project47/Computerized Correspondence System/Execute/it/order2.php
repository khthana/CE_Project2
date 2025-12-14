<body>
<?
require("config.php");
$tbname = "externalbook";
mysql_connect($hostname,$user,$password) or die ("can't connect data base server");//ติดต่อ data base
mysql_select_db($dbname)or die("can't conected database");//เลือกฐานข้อมูล

if($order2=='pass')
{
				$sql = "UPDATE `externalbook` SET `STATUS` = 'pass' WHERE `ID_BOOK` = '$idbook' LIMIT 1 ";
				$db_query=mysql_db_query($dbname,$sql);
}
if($order2=='repair')
{
				$sql = "UPDATE `externalbook` SET `STATUS` = 'ร้องขอ' WHERE `ID_BOOK` = '$idbook' LIMIT 1 ";
				$db_query=mysql_db_query($dbname,$sql);
}
echo "สั่งการเสร็จเรียบร้อยแล้ว ";
mysql_close();		
?>
</body>