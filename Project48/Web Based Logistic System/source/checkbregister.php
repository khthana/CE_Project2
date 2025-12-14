<?
if ($name_reg=="" || $lname_reg==""|| $att_reg==""||busname_reg==""||$moo_reg=="" || $district_reg=="" || $amphur_reg=="" || $province_reg=="" || $zipcode_reg=="" )
{
	?>
	<font color=red size=3>
	<?
	print("<br><center><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><strong>ผิดพลาด!!</strong></font> ");
	?>
	</font>
	<?
	print("<center><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><strong>กรุณากรอกข้อมูลให้ครบ</strong></font><br><br>");
	print("<input type=button onclick='history.back()' value=แก้ไขข้อมูลใหม่></center>");
}else{
include "connect.php";
include "function.php";
$id_reg=genid();
$password_reg=genpassword();

$sql="insert into customers values('$id_reg','$password_reg','$status_reg','$name_reg','$lname_reg', '$email_reg','$telephone_reg','$mobile_reg ','$busname_reg','$att_reg','$moo_reg','$district_reg','$amphur_reg','$province_reg','$zipcode_reg')";

$result=mysql_db_query($dbname,$sql);
if ($result){
	print("<center><br><H3>ข้อมูลของท่านถูกบันทึกเรียบร้อยแล้ว</H3>");
	print("<font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><B>รหัสสมาชิกของท่านคือ:<font color='red'>$id_reg </font></B></font><br>");
	print("<font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><B>รหัสผ่านของท่านคือ:<font color='red'>$password_reg </font></B></font><br><br>");
	print("<font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><font color='red'>**กรุณาบันทึกข้อมูลสมาชิกของท่านเพื่อใช้ในการส่งสินค้าและตรวจสอบสินค้าของท่าน</font></font><br>");
	print(" <font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><a href=index.php onclick=\"return confirm('ท่านได้บันทึกข้อมูลแล้วใช้หรือไม่')\">->คลิกที่นี่เพื่อกลับหน้าหลัก<-</a></font></center>");
	}
else{print("ไม่สามารถสมัครเป็นสมาชิกได้");
}
mysql_close();
}
?>
