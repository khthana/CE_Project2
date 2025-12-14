<?
session_register("SessionMember");


if($SessionMember == ""){
?>
	<br><br><br><br><br><br><br><br><TABLE borderColor=#999999 width="50%" align=center bgColor=#999999>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
      color=#ffffff size=4><B>สวัดดีครับ :</B></FONT></DIV></TD></TR>
  <TR><td><center><IMG  src="picture/images.jpg"> - </center></td>
    <TD bgColor=#ffffff><br>
<center><b>ขณะนี้คุณยังไม่ได้ Login เข้าสู้ระบบ.............</b> 
		  [ <A  href="login.htm" >กลับไปหน้า login ใหม่</A> ]</center>
<BR><br>
      </TD></TR></td><TR>
          <TD><center> [ <A  href="index.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>

<?
}else{
?>

<?php


/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");


	// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

		mysql_query("SET NAMES 'tis620'");

	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

// ตรวจสอบตัวแปรคุกกี้ numCounter ว่ามีการกำหนดค่าไว้หรือไม่
//if ( isset($_COOKIE[$catalog]) ) {
	





If (($name_reserv == ""))
	{
//		echo "โปรดกรอกข้อมูลให้ครบ (โดยเฉพาะฟิลด์ที่มี *)";
//		echo "<br><br><a href =borrow.htm>กรอกข้อมูลใหม่</a>";
		?>
					<br><br><br><br><br><br><br><br><TABLE borderColor=#999999 width="50%" align=center bgColor=#999999>
				  <TBODY>
				  <TR>
					<TD>
					  <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
					  color=#ffffff size=4><B>สวัดดีครับ :</B></FONT></DIV></TD></TR>
				  <TR><td><center><IMG  src="picture/images.jpg"> - </center></td>
					<TD bgColor=#ffffff><br>
				<center><b>โปรดกรอกข้อมูลให้ครบ (โดยเฉพาะฟิลด์ที่มี *)</b> 
						  [ <A  href="borrow.htm" >กรอกช้อมูลใหม่</A> ]</center>
				<BR><br>
					  </TD></TR></td><TR>
						  <TD><center> [ <A  href="index.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
				 </TBODY></TABLE>

		<?
	}

else
{




setcookie($catalog,$catalog, time()+86400);
setcookie($code,$code, time()+86400);


//echo $_COOKIE[$code];
//echo $_COOKIE[$catalog];




	$sql = "update book  set name_reserv = '$name_reserv',status3 = 1 where code='$code'&&catalog='$catalog'";

	$result = mysql_db_query($dbname, $sql);

	
	if (!$result)
		{ 
			echo("เอ็กซิคิวต์คำสั่ง SQL ไม่ได้ " . mysql_error() ); 
			exit;
		}
	
else{
//echo "ได้ทำการจองเรียบร้อยแล้ว";
//print "<meta http-equiv=\"refresh\" content=\"0;URL=list_addmin.php\">\n";

?>
<br><br><br><br><br><br><br><br><TABLE borderColor=#999999 width="50%" align=center bgColor=#999999>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
      color=#ffffff size=4><B>สวัดดีครับ :</B></FONT></DIV></TD></TR>
  <TR><td><center><IMG  src="picture/images.jpg"> - </center></td>
    <TD bgColor=#ffffff><br>
<center><b>ขณะนี้ได้ทำการจองเรียบร้อยแล้ว.............</b> </center>
<BR><br>
      </TD></TR></td><TR>
          <TD><center> [ <A  href="list_addmin.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>
<?		
	}	
}	

?>

<?
	}
?>