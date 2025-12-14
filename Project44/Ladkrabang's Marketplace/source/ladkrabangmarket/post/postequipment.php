<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> ลงประกาศ </TITLE>
<link rel="stylesheet" type="text/css" href="../style.css">	
</HEAD>

<BODY BGCOLOR="#FFFFFF">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="50">
  <tr> 
    <td height="51" width="20%">&nbsp;</td>
    <td height="51" width="30%"><img src="../images/logo_big.gif" width="467" height="54"></td>
    <td height="51" width="15%" align="center" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href="../../index.html">หน้าแรก</a></b></font></td>
    <td height="51" width="12%"  align ="left" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href='javascript:window.close()'>ปิดหน้านี้ </a></b></font></td>
  </tr>
</table>
<hr color=FF1493 width=600><br>  -->
<?
	include("../config.inc.php");
	include("../censor.php");
	$ip = getenv("REMOTE_ADDR");
   
   if($action!="edit"){$member=0;}else{$member=1;}   

	//กำหนดค่า
$duration=date("d/m/y",mktime(0,0,0,date("m")+$duration) );

if ($select1==1){
					$condition="ของมือสอง";

								}
	else{
				$condition="ของใหม่";
				}
if($how==1){
									$howsend="นัดเจอเพื่อมารับสินค้า";
								}
elseif($how==2){ $howsend="ส่งสินค้าผ่านไปรษณีย์(พ.ก.ง.)";
									}
elseif($how==3){ $howsend=$other;
									}
									else{ $howsend="ไม่ระบุ";}
if(!$price) { $price=0; }

if(strlen($brand)==0){$brand="ไม่ระบุ";}
if(strlen($model)==0){$model="ไม่ระบุ";}

if($action!="edit"){
if($password){
//ตรวจสอบว่าเป็นสมาชิกหรือไม่
mysql_connect($host,$user,$passwd);

	$sql = "select username,password,email from member where username='$username'";
	$result = mysql_db_query($dbname,$sql);
//	$NRow = mysql_num_rows($result);
	$row = mysql_fetch_array($result);

	// ตรวจสอบว่า Password ถูกหรือไม่	
	if($username==$row["username"] && $password==$row["password"]) { 
		$member = 1;
		if(!$email) {
			$email = $row["email"];
		}
	}else{

		echo"<br><br>";
		echo "<center>";
		echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
		echo "<tr><td align=center>";
		echo "<font size=2 face='MS Sans Serif'>";
        echo "<font size=3 color=red><b>ไม่สามารถลงประกาศได้</b></font><br><br>";
		echo "กรุณาตรวจสอบ Password ให้ถูกต้องด้วยครับ";
		echo "</font></td></tr></table>";
		echo "<br><hr width=500 color=blue>";
		echo "<font size=2 face='MS Sans Serif'>";
		echo "[<a href='javascript:history.back(1)'>Back</a>]";
		echo "</center>";
		exit();
	}
	mysql_close();
}
	}//if action

if($member){
				$sendmail=$qsendmail;
					}


	// ป้องกันการแทรก html กับ ละเครื่องหมาย ' "
	$topic = htmlspecialchars($topic);
	$username = htmlspecialchars($username);
	$brand = htmlspecialchars($brand);
	$price = htmlspecialchars($price);
	$model = htmlspecialchars($model);
	$email = htmlspecialchars($email);
	$howsend = htmlspecialchars($howsend);
	$detail = htmlspecialchars($detail);

	// ป้องกันคำหยาบ

		$topic =censor($topic);
		$username = censor($username);
		$brand = censor($brand);
		$detail = censor($detail);
		$howsend = censor($howsend);
		$model = censor($model);
		$email = censor($email);
		$price = censor($price);
	
	// ตรวจสอบว่า มีการป้อน url หรือ email มาหรือไม่ ถ้ามีให้ทำ link
	$detail = eregi_replace("([[:alnum:]]+)://([^[:space:]]*)([[:alnum:]#?/&=])","<a href=\"\\1://\\2\\3\" target=\"\\2\\3\">\\1://\\2\\3</a>",$detail);
	$detail = eregi_replace("([[:alnum:]]+)@([^[:space:]]*)([[:alnum:]])","<a href=mailto:\\1@\\2\\3>\\1@\\2\\3</a>",$detail); 

	// ให้ขึ้นบันทัดใหม่ กรณีที่มีการเคาะ Enter
	$detail = eregi_replace(chr(13),"<br>",$detail);


mysql_connect($host,$user,$passwd);
		if($action!="edit"){

	//กำหนดรูปแบบแสดงวันท	ี่

$date=date("ymd");
	//กำหนด code
	
	$sql="select * from equipment_data";
	$result=mysql_db_query($dbname,$sql);
	$num_row=mysql_num_rows($result);
 	if($num_row==0)
	{  $code="E00000";
	}
	else{
	$max_code=mysql_db_query($dbname,"select  MAX(code) from equipment_data");
	$row_maxc=mysql_fetch_array($max_code);
    $vcode=$row_maxc["MAX(code)"];
	$code=substr("$vcode",1);
	$code=1+"$code";
    $len=strlen($code);
     $pad=5-$len;
	 $bcode=str_repeat("0",$pad );
	 $code="E".$bcode.$code; 
	
	  }
}//if2


// บันทึกรูปภาพ

if($action=="edit")	{

		if($cpic=='0'){$picture=$pic1;}
		if($cpic=='1'){$picture="";}
		if($cpic=='2'){

	$path='../pic/';
		if($qpic!="none") {
			if(($qpic_type!="image/gif") && ($qpic_type!="image/pjpeg")){ 
				echo "<font size=2 face='MS Sans Serif'>ไม่ใช่ไฟล์รูปภาพ .gif หรือ .jpeg</FONT><br>";
				exit();
							}
			if($qpic_size>$Image_size) {
				echo "<font size=2 face='MS Sans Serif'>ขนาดของภาพเกิน $Image_size bytes</FONT><br>";
				exit();
								}
					
		if($qpic_type=="image/gif"){
			if(!copy($qpic,$path.$code.".gif"))
			{ echo"<font size=2 face='MS Sans Serif'>Error ......can't upload image</FONT><br>";}
			$picture="pic/".$code.".gif";
							 }
		if($qpic_type=="image/pjpeg"){
			if(!copy($qpic,$path.$code.".jpg"))
			{ echo"<font size=2 face='MS Sans Serif'>Error ......can't upload image</FONT><br>";}
			$picture="pic/".$code.".jpg";
						 }	
				}


		}




}else{
	if($member) {
		$path='../pic/';
		if($qpic!="none") {
			if(($qpic_type!="image/gif") && ($qpic_type!="image/pjpeg")){ 
				echo "<font size=2 face='MS Sans Serif'>ไม่ใช่ไฟล์รูปภาพ .gif หรือ .jpeg</FONT><br>";
				exit();
							}
			if($qpic_size>$Image_size) {
				echo "<font size=2 face='MS Sans Serif'>ขนาดของภาพเกิน $Image_size bytes</FONT><br>";
				exit();
								}
					
		if($qpic_type=="image/gif"){
			if(!copy($qpic,$path.$code.".gif"))
			{ echo"<font size=2 face='MS Sans Serif'>Error ......can't upload image</FONT><br>";}
			$picture="pic/".$code.".gif";
							 }
		if($qpic_type=="image/pjpeg"){
			if(!copy($qpic,$path.$code.".jpg"))
			{ echo"<font size=2 face='MS Sans Serif'>Error ......can't upload image</FONT><br>";}
			$picture="pic/".$code.".jpg";
						 }	
				}
			}

}//else

// เขียนข้อมูลลง database
if($action=="edit"){
$sql1="update post set topic='$topic' , status='$status' ,price='$price' where code='$code' ";
$sql2="update equipment_data set brand='$brand',model='$model',condition='$condition',detail='$detail',howsend='$howsend',duration='$duration',usedyear='$usedyear',usedmonth='$usedmonth',percent='$percent' where code='$code' ";
$sql3="update poster set  email='$email',picture='$picture',sendmail='$sendmail',ip='$ip'  where code='$code'";
$sql4="update date_delete set date='$duration'  where code='$code' ";
}else{
//ตาราง post
$sql1="insert into post(code,topic,status,price,date,reply,visit)values ('$code','$topic','$status','$price','$date','$reply','$visit')";
//ตาราง  equipment_data
	$sql2= "insert into equipment_data (code,brand,model,condition,detail,howsend,usedmonth,usedyear,duration,percent)		values('$code','$brand','$model','$condition','$detail','$howsend','$usedmonth','$usedyear','$duration','$percent')";
//ตารางผู้ลงประกาศ
$sql3="insert into poster(code,username,email,ip,member,picture,sendmail)values('$code','$username','$email','$ip','$member','$picture','$sendmail')";
//ตาราง date_delete
 $sql4="insert into date_delete(date,code) values('$duration','$code')";
}
$result1=mysql_db_query($dbname,$sql1);
$result2=mysql_db_query($dbname,$sql2);
$result3=mysql_db_query($dbname,$sql3);
$result4=	mysql_db_query($dbname,$sql4);



//ทำการ check การเขียนลงdatabase
	if(($result1==1)&&($result2==1)&&($result3==1)&&($result4==1) ){

				if($member && $qpic_name) {
			unlink($qpic);
	           	}

?><html>
	<head>
	<title>ตอบประกาศ</title>
	<meta name="Generator" content="EditPlus">
	<META HTTP-EQUIV="Content-Type" content="text/html; charset=windows-874">
	<META HTTP-EQUIV="REFRESH" CONTENT="3; URL=../showequ.php?Code=<?echo $code?> ">
	</head>


	<body>
	<center>
	<br>
  <table width=60% border=1 bordercolor=#9999FF bgcolor=#f0ffff cellpadding=2 cellspacing=0>
    <tr><td align=center>
	<font size=2 face='MS Sans Serif'>
	<font size=3 color=red><b>ได้รับข้อมูลแล้วครับ</b></font><br><br>
	หากคำตอบของคุณไม่ขึ้นให้กดปุ่ม Refresh/Reload ครับ
	</font></td></tr></table>
	<br><hr width=500 color=blue><font size=2 face='MS Sans Serif'>
	เราจะพาคุณไปสู่ <font color=red><b>ประกาศ</b></font> ที่ 
	<font color=blue><b><? echo $code; ?></b></font> โดยไม่ต้องกดปุ่มใดๆ 
	</font>
	</center>
	</body>
	</html>

	<?
		/*
		echo "<center>";
		echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
		echo "<tr><td align=center>";
		echo "<font size=2 face='MS Sans Serif'>";
		echo "<font size=3 color=red><b>ได้รับข้อมูลแล้วครับ</b></font><br><br>";
		echo "หากประกาศของคุณไม่ขึ้นให้กดปุ่ม Refresh/Reload ครับ";
		echo "</font></td></tr></table>";
		echo "<br><hr color=FF1493 width=600>";
		echo "<font size=2 face='MS Sans Serif'>";
		echo "[ <a href='postequipment.html'>ลงประกาศใหม่</a> | ";
//echo" <a href='javascript:window.close()'>ปิดหน้านี้</a> ]";
 echo" <a href='../showequ.php?Code=$code'>แสดงประกาศ</a> ]";
		echo "<font>";
		echo "</center>";
		*/
	}
	else {
		echo"<br><br>";
		echo "<center>";
		echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
		echo "<tr><td align=center>";
		echo "<font size=2 face='MS Sans Serif'>";
        echo "<font size=3 color=red><b>มีข้อผิดพลาดที่ระบบ</b></font><br><br>";
		echo "กรุณาแจ้ง admin ให้ตรวจสอบด้วยครับ";
		echo "</font></td></tr></table>";
		echo "<br><hr width=500 color=blue>";
		echo "<font size=2 face='MS Sans Serif'>";
		echo "[<a href='javascript:history.back(1)'>Back</a>]";
		echo "</center>";
		exit();
	}
mysql_close();

?>
</BODY>
</HTML>
