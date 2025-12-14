<?
include "connect.php";
$sql="select * from customers where cusid='$username' ";
$result=mysql_db_query($dbname,$sql);
if($result){
	$num=mysql_num_rows($result);
	if($num>0){
	session_start();
$_SESSION[sess_username]=$username;
//print"<meta http-equiv=\"refresh\" content=\"0;URL=?file=usertool.php&file2=senddetail.php&file4=formsend2.php\">";
?>
<script>
location = "index.php?file=usertool.php&file2=senddetail.php&file4=formsend2.php"
</script>
<?
}else{
?>
<script language="JavaScript" type="text/JavaScript">
{alert("ไม่มีรหัสที่กรอกกรุณาตรวจสอบอีกครั้ง!");}
{location = "index.php?file=usertool.php&file2=senddetail.php"}

</script>
<?
}
}
mysql_close();
?>

