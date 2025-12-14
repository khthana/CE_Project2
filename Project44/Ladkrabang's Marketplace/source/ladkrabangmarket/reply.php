<?

	include("config.inc.php");
	include("censor.php");
	include("smtpmail.php");
	$IP = getenv("REMOTE_ADDR");
//$IP =$REMOTE_ADDR;
	// ป้องกันการแทรก html กับ ละเครื่องหมาย ' "
	$name = htmlspecialchars($username);
	$email = htmlspecialchars($email);
	$detail = htmlspecialchars($detail);
	// ป้องกันคำหยาบ
		$name = censor($username);
		$email = censor($email);
		$detail = censor($detail);
	// ตรวจสอบการแทรกรูปภาพ
	$txt = array(":smile:", ":sad:",":red:", ":big:", ":ent:", ":shy:", ":sleepy:", ":sun:", ":sg:", ":embarass:", ":dead:", ":cool:", ":clown:", ":pukey:", ":eek:", ":roll:", ":smoke:", ":angry:", ":confused:", ":cry:", ":lol:", ":yawn:", ":devil:", ":tongue:", ":alien:", ":tasty:", ":crazy:");
	$pic = array("smile.gif","frown.gif","redface.gif","biggrin.gif","blue.gif","shy.gif","sleepy.gif","sunglasses.gif","supergrin.gif","embarass.gif","dead.gif","cool.gif","clown.gif","pukey.gif","eek.gif","sarcblink.gif","smokin.gif","reallymad.gif","confused.gif","crying.gif","lol.gif","yawn.gif","devil.gif","tongue.gif","aysmile.gif","tasty.gif","grazy.gif");
	for ($a=0 ; $a<sizeof($txt) ; $a++) {
		$detail = eregi_replace($txt[$a],"<img src=\"pics/$pic[$a]\">",$detail);
	}
    // ตรวจสอบว่า มีการป้อน url หรือ email มาหรือไม่ ถ้ามีให้ทำ link
	$detail = eregi_replace("([[:alnum:]]+)://([^[:space:]]*)([[:alnum:]#?/&=])","<a href=\"\\1://\\2\\3\" target=\"\\2\\3\">\\1://\\2\\3</a>",$detail);
	$detail = eregi_replace("([[:alnum:]]+)@([^[:space:]]*)([[:alnum:]])","<a href=mailto:\\1@\\2\\3>\\1@\\2\\3</a>",$detail); 
	// ให้ขึ้นบันทัดใหม่ กรณีที่มีการเคาะ Enter
	$detail = eregi_replace(chr(13),"<br>",$detail);
//ส่งคำตอบไปทางเมล์
if($member==1){ 
										mysql_connect($host,$user,$passwd);
										$sql1="select * from poster where code='$ocode' ";
										$result1 = mysql_db_query($dbname,$sql1);
								        $row1= mysql_fetch_array($result1);
   										if($row1["sendmail"]==1){
																							$mailto=$row1["email"];
																     $subject="Answer of $ocode from Ladkrabang MarketPlace";
																 $msg1 = "Subject : $subject \n\n $detail \n\n จาก : "."$username"."[$email]";
															//	if(!mail($mailto , $subject , $msg1 , "From : ". "Ladkrabang Market //Place")){echo"Error sendmail<br>";}
																$from="webmaster@ce.kmitl.ac.th";
																smail($from,$mailto,$subject,$msg1);							
																							}							
										mysql_close();
									}
	//เลือก table
	switch($Table){
	case "B" :	$Table='book_ans';
							break;
    case "E"  : $Table='equipment_ans';
							break;
	case "V" :$Table='vehicle_ans';
						break;
	case "H" :$Table='address_ans';
						break;
	case "F" :$Table='friends_ans';
						break;
	case "N" :$Table='news_ans';
						break;
	case "A" :$Table='etc_ans';
						break;
	case "L" :$Table='lost_ans';
						break;
							}
//ส่งการเปลี่ยนแปลงไปทางเมล์
										mysql_connect($host,$user,$passwd);
										$sql1="select email from  $Table where sendmail='1' ";
										$result1 = mysql_db_query($dbname,$sql1);
								        $row1= mysql_fetch_array($result1);
   										if($row1[0]){
											                   	$mailto=$row1["email"];
																  $subject="Topic $Code is change";
																 $msg1 = " \n\n $detail \n\n จาก : "."$username"."[$email]";
																$from="webmaster@ce.kmitl.ac.th";
																smail($from,$mailto,$subject,$msg1);							
																							}							
										mysql_close();


if($boxmail==1){ $boxmail=1; }else { $boxmail=0;}
	//กำหนดรูปแบบแสดงวันที่
	$date=date("d/m/y");					
	// บันทึกข้อมูลลง database
	mysql_connect($host,$user,$passwd);
	$sql1 = "INSERT INTO $Table (no, code, username, email, ip,date, detail,sendmail) VALUES ('$no', '$Code','$username', '$email', '$IP', '$date', '$detail','$boxmail')";
	$sql2 = "UPDATE post SET reply=reply+1  WHERE code='$Code' ";
	$result1 = mysql_db_query($dbname,$sql1);
	$result2 = mysql_db_query($dbname,$sql2);
	if(!$result1) { echo "Error : Can not save to database"; exit(); } 
	if(!$result2) { echo "Error : Can not update to database"; exit(); } 
	mysql_close();
?>
	<html>
	<head>
	<title>ตอบประกาศ</title>
	<meta name="Generator" content="EditPlus">
	<META HTTP-EQUIV="Content-Type" content="text/html; charset=windows-874">
	<META HTTP-EQUIV="REFRESH" CONTENT="2; URL=<?echo $dfile?>?Code=<?echo $Code?>&Flag=1 ">
	</head>
<link rel="stylesheet" type="text/css" href="style.css">	
	<body>
	<center>
  <table width=60% border=1 bordercolor=#9999FF bgcolor=#f0ffff cellpadding=2 cellspacing=0>
    <tr><td align=center>
	<font size=2 face='MS Sans Serif'>
	<font size=3 color=red><b>ได้รับข้อมูลแล้วครับ</b></font><br><br>
	หากคำตอบของคุณไม่ขึ้นให้กดปุ่ม Refresh/Reload ครับ
	</font></td></tr></table>
	<br><hr width=500 color=blue><font size=2 face='MS Sans Serif'>
	เราจะพาคุณกลับไปสู่ <font color=red><b>ประกาศ</b></font> ที่ 
	<font color=blue><b><? echo $Code; ?></b></font> โดยไม่ต้องกดปุ่มใดๆ 
	</font>
	</center>
	</body>
	</html>