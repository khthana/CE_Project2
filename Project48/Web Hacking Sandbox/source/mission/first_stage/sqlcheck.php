<?php
$DBName="allmission";
$link=@mysql_pconnect("localhost","player","player");
@mysql_select_db($DBName,$link);
$lenname=strlen($user);
$lenpwd=strlen($Pwd);
 if(($user=='')||($Pwd=='')){
	print" <div align='center'>กรุณาใส่ Username หรือ Password ";
	print"   <br><br>";
	print"    <a href='home.php'>ทดลองใหม่</a> </div>";
 }
else if(($lenname<=20)&&($lenpwd<=20)){
	$UserName=$_POST['user'];
	$Pwd1=$_POST['Pwd'];
	$temp= stripslashes($Pwd1); 
	$user=mysql_query("SELECT * FROM profile WHERE UserName='$UserName' AND Password ='$temp' ");
	$count=mysql_num_rows($user);

	if($count !=0 ){
		if($UserName=='sandbox'){
			$string='sandbox@sandbox.com';
		
			$len=strlen($string);

			//encyption
			$ciper1=encypt($string,$len);
			for($i=0;$i<=($len*2);$i++){
			 $tostr [$i]= $ciper1{$i};
			} 
			$str1 = implode("", $tostr);
			$session=trim($str1);
			
			setcookie("passkey",$session,time()+3600);
			header("Location:_2ndstage_.php"); 
		}
		else{
		print"<div align='center'> <font color='#FF3333'>ต้องใช้ Username เป็น sandbox เท่านั้นในการทำภาระกิจ</font><br>";
		print"    <a href='home.php'>ทดลองใหม่</a> ";
		}
	 } 
	else{
			header("Location:../invalid.html"); 
		}
}
else{
print" <div align='center'>Username หรือ Password ไม่เกิน 20 ตัวอักษร";
	print"   <br><br>";
	print"    <a href='home.php'>ทดลองใหม่</a> </div>";
}


	//----------------------------------------------------------------------------------------

//encyption
function encypt($string,$len){
for($i=0;$i<$len;$i++){
 $buffer=$string{$i};
 $ascii=ord($buffer);
 $tohex1=dechex($ascii);
$todec= hexdec($tohex1{0});

$first_ascii=$todec;
 $encypt= $first_ascii ^ 10;

$todec2= hexdec($tohex1{1});
 $second_ascii=$todec2;
 $encypt2= $second_ascii ^ 10;

$tohex{$i+$i}=dechex($encypt);
 $tohex{($i+$i)+1}=dechex($encypt2);
}
return $tohex;
}

?>
