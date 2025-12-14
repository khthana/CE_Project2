<?php require_once('../Connections/conn.php'); ?>
<?php
mysql_select_db($database_conn, $conn);
$news_ID=$HTTP_GET_VARS['news_ID'];
$do=$HTTP_GET_VARS['do'];

if($do=="del"){
$sql="delete from news where news_ID='$news_ID' ";
$result=mysql_query($sql,$conn);
echo"<meta http-equiv='refresh' content='0;URL=newslists.php'>";
}

if($do=="publish")
{
	$published=date('Y-m-d h:i:s');
	$sql="update news set published='$published' where news_ID ='$news_ID'";
	$result=mysql_query($sql,$conn)or die(mysql_error());
    echo"<meta http-equiv='refresh' content='0;URL=newslists.php'>";
  }
if($do=="not_show")
{
    $sql="update news set published=NULL where news_ID ='$news_ID'";
	$result=mysql_query($sql,$conn)or die(mysql_error());
    echo"<meta http-equiv='refresh' content='0;URL=newslists.php'>";
  }
?>