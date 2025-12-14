<style type="text/css">
<!--
body,td,th {
	color: #FF9933;
}
body {
	background-color: #FFFFFF;
}
-->
</style>
<div align="center">
  <input name="imageField" type="image" src="../../images/scr_01.gif" width="750" height="112" border="0">
</div>
<?php
 
$DBName="session";
$link=@mysql_pconnect("localhost","player","player");
@mysql_select_db($DBName,$link);

$lenuser=strlen($username);
$lenpwd=strlen($password);
if(($username=='')&&($password=='')){
print"<div align='center'>";
print" <br><br><br>กรุณาใส่ username หรือ password <br>";
print"<a href='index.php'>back</a>";
}
else if(($lenuser<=20)&&($lenpwd<=20)){
$pass=md5($_POST['password']);

$result=@mysql_query("SELECT * FROM profile WHERE user='$username' AND Password='$pass' ");
$count=@mysql_num_rows($result);
if($count ==1){
	$email=mysql_result($result,0,"email");
		//echo $ciper=$HTTP_COOKIE_VARS["passkey"];
		/*---------------------------------------------------------------------------------------------------------------------*/
		$rownum=@mysql_num_rows($result);
		
		if($rownum !=0){
			//$user=$row['emai'];
				$string=$email;
				$len=strlen($string);

				//encyption
				$ciper1=encypt($string,$len);
				for($i=0;$i<=($len*2);$i++){
					$tostr [$i]= $ciper1{$i};
					} 
				$str1 = implode("", $tostr);
				$session=trim($str1);
				//echo$str1;
				setcookie('passkey', $session, time()+3600);
				header("Location:sessprivate.php"); 
						}
		}
		else{
		print"<div align='center'>";
		print"<br><br><br>username or password incorrect <br>";
		print"<a href='index.php'>back</a>";
		}
}
else{
		print"<div align='center'>";
		print"<br><br><br>username or password incorrect <br>";
		print"<a href='index.php'>back</a>";
}
print"</div>";
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

//decyption function
function decypt($ciper,$len_ciper){
for($i=0;$i<$len_ciper;$i++){
 $buffer1=$ciper{$i+$i};
$buffer2=$ciper{$i+$i+1};
$todec= hexdec($buffer1);

$first_ascii=$todec;
 $encypt= $first_ascii ^ 10;
$hex1=dechex($encypt);
$todec2= hexdec($buffer2);
 $second_ascii=$todec2;
 $encypt2= $second_ascii ^ 10;
$hex2=dechex($encypt2);

$concat="$hex1"."$hex2";
$plantext{$i}=hexdec($concat);
}
return $plantext;
}

?>
