<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?
$username=$_POST[user_name];
$password=$_POST[password];
if($username=="" or $password=="")
{
	print("ท่านกรอกข้อมูลไม่ถูกต้อง");
exit();
}else{
include "connect.php";
$sql="select * from user where id_user='$username' and password='$password'";
$result=mysql_db_query($dbname,$sql);

if($result){
	session_start();
	$array=mysql_fetch_array($result);
	$name=$array[name];
	$lname=$array[sername];
	$sess_userid=$username;
	$_SESSION[sess_name]=$name;
	$_SESSION[sess_lname]=$lname;
	$_SESSION[session_id]=$session_id;
	print"<meta http-equiv=\"refresh\" content=\"0;url=about.php\">";       exit();
	
	}
	else{
	print("ไม่อนุญาติให้ใช้งานในส่วนนี้เนื่องจาก<br>");
	print("ท่านกรอกข้อมูลไม่ถูกต้อง");
}
}

?>
</body>
</html>
