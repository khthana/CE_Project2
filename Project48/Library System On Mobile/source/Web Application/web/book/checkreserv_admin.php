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
		 <BR> [ <A  href="login.htm" >กลับไปหน้า login ใหม่</A> ]</center>
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
	





If (($unitOne == "") or  ($catalog=="") or ($unitTwo=="") or ($unitThree == ""))
	{
		echo "โปรดกรอกข้อมูลให้ครบ (โดยเฉพาะฟิลด์ที่มี *)";
		echo "<br><br><a href =borrow.htm>กรอกข้อมูลใหม่</a>";
	}

else
{
$code = "$unitOne$unitTwo$unitThree";
//echo $code;

if (isset($_COOKIE[$catalog])&&($_COOKIE[$code]) )

{

$catalog = $_COOKIE[$catalog];
$code = $_COOKIE[$code];

$sql_getname  =  "select * from book where  code='$code'&&catalog='$catalog'";
$db_query_getname = mysql_db_query ($dbname, $sql_getname);
$result_getname = mysql_fetch_array($db_query_getname);


$name_reserv = $result_getname[name_reserv];
//echo $id_student;


//echo" หนังสือยังได้ถูกจองไปแล้ว โดย  ";
?>
<br><br><br><br><br><br><br><br><TABLE borderColor=#999999 width="50%" align=center bgColor=#999999>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
      color=#ffffff size=4><B>สวัดดีครับ :</B></FONT></DIV></TD></TR>
  <TR><td><center><IMG  src="picture/images.jpg"> - </center></td>
    <TD bgColor=#ffffff><br>
<center><b>หนังสือได้ถูกจองไปแล้ว.....ไม่สามารถจองได้   </b><br>หนังสือได้ถูกจอง โดย : <? echo  $name_reserv ;?>      
		 <BR> [ <A  href="book_borrow_admin.htm" >กลับไปตรวจสอบอีกครั้ง</A> ]</center>
<BR><br>
      </TD></TR></td><TR>
          <TD><center> [ <A  href="list_addmin.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>
<?

$code = $_COOKIE[$code]; 
$catalog = $_COOKIE[$catalog]; 


//echo $_COOKIE[$code];
//echo $_COOKIE[$catalog];

$sql = "select * from book where code = '$code'";
$db_query = mysql_db_query ($dbname, $sql);
$result = mysql_fetch_array($db_query);


$id_student = $result[id_student];
//echo $id_student;


}

else{



//echo "หนังสือยังไม่ได้ถูกจอง";



print <<<EOT
  
<br><br><br><br><br><br><br><br><TABLE borderColor=#999999 width="50%" align=center bgColor=#999999>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
      color=#ffffff size=4><B>สวัดดีครับ :</B></FONT></DIV></TD></TR>
  <TR><td><center><IMG  src="picture/images.jpg"> - </center></td>
    <TD bgColor=#ffffff><br>
<center><b>สามารถทำการยืมหนังสือได้ </b> 
		<BR>  [ <A  href=" borrow.htm" >กลับไปหน้ายืมหนังสือ</A> ]</center>
<BR><br>
      </TD></TR></td><TR>
          <TD><center> [ <A  href="list_addmin.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>


EOT;



	}	
}	

?>

<?
	}
?>

