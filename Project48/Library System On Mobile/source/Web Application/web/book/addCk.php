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
		 <br> [ <A  href="login.htm" >กลับไปหน้า login ใหม่</A> ]</center>
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

if($name==!""){	
$value = $_POST['name'];   //จะรับค่าเฉพาะที่มีข้อมูลเท่านั้น
//if($value==!"")
//{
	for($i=0;$i< count($name);$i++){
	@$sql="update book set status2 =1 where id='$value[$i]'";
	
	$result = mysql_db_query($dbname, $sql);
	}
	if (!$result)
		{ 
			echo("เอ็กซิคิวต์คำสั่ง SQL ไม่ได้ " . mysql_error() ); 
			exit;
		}
	else
		{
			
			print "<meta http-equiv=\"refresh\" content=\"0;URL=editTopic.php\">\n";
		}
}
else{

//echo"ต้องทำการเลือกตัว Checkbox ระบบถึงจะสามารถทำงานต่อได้ครับ  [ <A  href= list_addmin.php >ย้อนกลับไปค้นหาใหม่</A>] ";
?>
	<br><br><br><br><br><br><br><br><TABLE borderColor=#999999 width="50%" align=center bgColor=#999999>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
      color=#ffffff size=4><B>สวัดดีครับ :</B></FONT></DIV></TD></TR>
  <TR><td><center><IMG  src="picture/images.jpg"> - </center></td>
    <TD bgColor=#ffffff><br>
<center><b>ต้องทำการเลือกตัว Checkbox ระบบถึงจะสามารถทำงานต่อได้ครับ</b> 
		   <br>[ <A  href= list_addmin.php >ย้อนกลับไปค้นหาใหม่</A>]</center>
<BR><br>
      </TD></TR></td><TR>
          <TD><center> [ <A  href="index.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>

<?
}						
?>

	<?
			}
	?>