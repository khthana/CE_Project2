<?php
session_start();
$host="localhost";
$user="magazine";
$pass="magazine";
$db="magazine";
$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");

$sql="select mem_id,mem_username,mem_password	 from member where mem_id='"
	.$user_id."'";

$result=mysql_db_query($db,$sql);
$data=mysql_fetch_array($result);
$row=mysql_num_rows($result);
$cpassword=crypt($data[2],"mg");
$username=$data[1];

if($row==0 || $cpassword<>$crp_password){
header("Location:http://document.ce.kmitl.ac.th/index.php"); 
}
mysql_close($link);

?>