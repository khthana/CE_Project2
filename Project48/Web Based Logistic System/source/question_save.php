<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>

<?
//////////////////////////////////////// บันทึกคำถาม ////////////////////////////////////////////////
include "function.php";
$title_ques=$_POST[title_ques];
$detail_ques=$_POST[detail_ques];
$name_ques=$_POST[name_ques];
$email_ques=$_POST[email_ques];

if($title_ques=="" or $detail_ques=="" or $name_ques==""){
echo"กรุณากรอกข้อมูลให้ครบ";
exit();
}
$date_ques=date("Y-m-d");

include "connect.php";
$sql="insert into wb_question values('','$title_ques','$detail_ques','$name_ques','$email_ques','$date_ques')";
$result=mysql_db_query($dbname,$sql);
if($result){
echo"<meta http-equiv=\"refresh\" content=\"0;url=question_view.php\">";       exit();
}else{
echo"ไม่สามรถตั้งกระทุ้ได้";
}

?>
</body>
</html>
