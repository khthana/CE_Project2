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

	


	// ป้องกันการกรอกแท็ก HTML จากผู้ใช้
		
		@$name_book = htmlspecialchars($name_book);
		@$writer = htmlspecialchars($writer);
		@$company = htmlspecialchars($company);
		
		

	//# EMOTION ICON
		
		

	// เปลี่ยน \n ให้เป็น <br> เมื่อผู้ใช้ กด enter
		$detail = nl2br($detail);

	// ป้อนกันการเกิด error ของ sql เมื่อ user ป้อน เครื่องหมาย "-" และ '-'
		$detail = addslashes($detail);
		$name_book= addslashes($name_book);
		$writer = addslashes($writer);
		$company = addslashes($company);

@setlocale("LC_TIME","th");	//ใช้เวลาแบบไทย (ดูตัวอย่างในบทที่ 7)
	$a = date("j");	 // วันที่
	$b = strftime("%B");	 // เดือนเต็ม
	$c = strftime("%Y")+543;	 // ปี พ.ศ.
	$d = date("H:i:s");	 // เวลา

	

	$datetime= "$a $b $c เมื่อเวลา: $d";

@$ip=getenv ("REMOTE_ADDR"); 

	# Include upload_pic
	
$write_new="0";// Comment 0
include("upload_pic.inc");
	
if((name_borrow==""))
{

echo "ยังไม่มีการยืมหนังสือ";

}
	@$sql = "update book  set name_borrow = ' ',return_book='',id_student ='' where code='$unitOne$unitTwo$unitThree$code'&& catalog='$catalog'";

	$result = mysql_db_query($dbname, $sql);

	if (!$result)
		{ 
			echo("เอ็กซิคิวต์คำสั่ง SQL ไม่ได้ " . mysql_error() ); 
			exit;
		}
	else
		{
print <<< EOT
<TABLE borderColor=#999999 width="50%" align=center bgColor=#999999>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
      color=#ffffff size=4><B>สวัดดีครับ :</B></FONT></DIV></TD></TR>
  <TR><td><center><IMG  src="picture/images.jpg"> - </center></td>
    <TD bgColor=#ffffff><br>
<center><b>ขณะนี้คุณได้คืนหนังสือเรียบร้อยแล้ว .............</b> </center>
<BR><br>
      </TD></TR></td><TR>
          <TD><center> [ <A  href="list_addmin.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>

EOT;
		}
						
?>

<?
	}
?>