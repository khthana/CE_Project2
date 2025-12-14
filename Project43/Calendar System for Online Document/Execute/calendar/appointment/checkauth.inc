<?php
function checkaddress($name)
{$name=trim($name);
while(strpos($name,',')==0):
$name=substr($name,1);
endwhile;

while(strpos($name,' ')):
$i=strpos($name,' ');
$name=substr_replace($name,'',$i,1);
endwhile;

while(strpos($name,',,')):
$i=strpos($name,',,');
$name=substr_replace($name,',',$i,2);
endwhile;

while(strrpos($name,',')==(strlen($name)-1)):
$i=strrpos($name,',');
$name=substr_replace($name,'',$i,1);
endwhile;


return $name;
}

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
header("Location: ../index.html"); 
}
mysql_close($link);

?>