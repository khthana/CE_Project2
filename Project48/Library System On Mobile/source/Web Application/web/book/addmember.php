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
		<br>  [ <A  href="login.htm" >กลับไปหน้า login ใหม่</A> ]</center>
<BR><br>
      </TD></TR></td><TR>
          <TD><center> [ <A  href="index.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>

<?
}else{
?>

<?php
If (($name=="") or ($surname=="") or ($id=="") or ($email==""))
	{
		echo "โปรดกรอกข้อมูลให้ครบ (โดยเฉพาะฟิลด์ที่มี *)";
		echo "<br><br><a href =formmember.htm>กรอกข้อมูลใหม่</a>";
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
					<br> [ <a href ="formmember.htm">กรอกข้อมูลใหม่</a> ]</center>
			<BR><br>
				  </TD></TR></td><TR>
					  <TD><center> [ <A  href="index.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
			 </TBODY></TABLE>

		<?

	}

ElseIf ($login_password<>$login_password2)
	{
//		echo "ยืนยันรหัสผ่านไม่ถูกต้อง";
//		echo "<br><br><a href =formmember.htm>กรอกข้อมูลใหม่</a>";

		?>
				<br><br><br><br><br><br><br><br><TABLE borderColor=#999999 width="50%" align=center bgColor=#999999>
			  <TBODY>
			  <TR>
				<TD>
				  <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
				  color=#ffffff size=4><B>สวัดดีครับ :</B></FONT></DIV></TD></TR>
			  <TR><td><center><IMG  src="picture/images.jpg"> - </center></td>
				<TD bgColor=#ffffff><br>
			<center><b>ยืนยันรหัสผ่านไม่ถูกต้อง</b>
					 [ <a href =formmember.htm>กรอกข้อมูลใหม่</a> ]</center>
			<BR><br>
				  </TD></TR></td><TR>
					  <TD><center> [ <A  href="index.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
			 </TBODY></TABLE>

		<?
	}

Else
	{
		//กำหนดตัวแปรเพื่อนำไปใช้งาน
		/*เรียกแฟ้มข้อมูล phpConfig.php*/
		include("phpConfig.php");
		$tblname = "member";	//ชื่อตาราง

		// เริ่มติดต่อฐานข้อมูล
		mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

			mysql_query("SET NAMES 'tis620'");

		// เลือกฐานข้อมูล
		mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");
$write_new="0";// Comment 0
@include("upload_pic.inc");
		// คำสั่ง SQL เพื่อเพิ่มข้อมูลที่รับจากฟอร์ม
		$sql = "insert into $tblname (name, surname, sex, age, address, tell, login_name, login_password, email,pic,status,status1,status2,status3,filetype,filesize,filename,id,status_user)  
		values ('$name', '$surname', '$sex', '$age', '$address', '$tell', '$login_name', '$login_password', '$email','$picture','0','0','0','0','$picture_type','$picture_size','$picture_name','$id','$status_user')";	
		$dbquery = mysql_db_query($dbname, $sql);

		// ปิดการติดต่อฐานข้อมูล
		mysql_close();

//		echo "<B>ลงทะเบียนเรียบร้อยแล้ว</B>";
//		echo "<Br><Br>Name = <font color=red>".$name."</font>";	
//		echo "<Br><Br>Surname = <font color=red>".$surname."</font>";	
//		echo "<Br><Br>ID = <font color=red>".$id."</font>";
//		echo "<Br><Br>Email = <font color=red>".$email."</font>";
		//echo "<Br><Br>Login_name = <font color=red>".$login_name."</font>";	
		//echo "<Br><Br>Login_password = <font color=red>".$login_password."</font>";	
		//echo "<Br><Br>กรุณาจำ Login_name และ Login_password เพื่อใช้งานต่อไป";	
//		echo"<br><br><a href =login.htm>Login</a>";
?> 
<br><br><br><br><br><br><br><br><TABLE borderColor=#999999 width="50%" align=center bgColor=#999999>
<TBODY>
  <TR>
    <TD>
      <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
      color=#ffffff size=4><B>สวัดดีครับ :</B></FONT></DIV></TD></TR>
  <TR><td><center><IMG  src="picture/images.jpg"> - </center></td>
    <TD bgColor=#ffffff><br>
<center><b>ลงทะเบียนเรียบร้อยแล้ว..</b></center>
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Name = <font color=red><?echo"$name";?></font></b>
<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Surname = <font color=red><?echo"$surname";?></font></b>
<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>ID = <font color=red><?echo"$id";?></font></b>
<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Email = <font color=red><?echo"$email";?></font></b></TD></TR></td>
<TR>
          <TD><center> [ <A  href="list_addmin.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>

<?
	}
?>

<?
	}
?>