<?
/////////////////////////////////////////// บันทึกการโพสตอบข้อความ ////////////////////////////////////////////////
$detail_ans=$_POST[detail_ans];
$name_ans=$_POST[name_ans];
$email_ans=$_POST[email_ans];
$ref_id=$_POST[ref_id];
$date_ans=date("Y-m-d");

include "function.php";
if($detail_ans=="" or $name_ans==""){
	echo"<center>
	<h3><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\">-->><a href=answer_view.php?id_ques=$ref_id>Error : กรุณากรอกข้อมูลให้ครบ</a><<--</font></h3></center>";
	exit();
	}
	include "connect.php";
	$sql="insert into wb_answer values ('','$detail_ans','$name_ans','$email_ans','$date_ans','$ref_id')";
	$result=mysql_db_query($dbname,$sql);
	if($result){
		print"<meta http-equiv=\"refresh\" content=\"0;url=answer_view.php?id_ques=$ref_id\">";       
		exit();
	}else{
	echo"
	<center><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><a href='answer_view.php?id_ques=$ref_id'>-->>ไม่สามารถตั้งคำถามในกระทู้ได้<<--</a></font></center>";
	
	}
?>

