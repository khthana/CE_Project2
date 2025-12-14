<?php session_start(); ?>
<?php if($id!=""){$_SESSION["subject_ID"]=$id;}?>
<script language="javascript" type="text/JavaScript">
function del(varUrl)
{ 		
	if (window.confirm("ยืนยันการลบข้อมูล")==true){window.open(varUrl,"_self")}
}
</script>
<?php require_once('../Connections/conn.php'); ?>
<?php
$maxRows_subject = 10;
$pageNum_subject = 0;
if (isset($_GET['pageNum_subject'])) {
  $pageNum_subject = $_GET['pageNum_subject'];
}
$startRow_subject = $pageNum_subject * $maxRows_subject;

mysql_select_db($database_conn, $conn);
$query_subject = "SELECT * FROM subject where subject_ID='$_SESSION[subject_ID]' ";
$query_limit_subject = sprintf("%s LIMIT %d, %d", $query_subject, $startRow_subject, $maxRows_subject);
$subject = mysql_query($query_limit_subject, $conn) or die(mysql_error());
$row_subject = mysql_fetch_assoc($subject);

if (isset($_GET['totalRows_subject'])) {
  $totalRows_subject = $_GET['totalRows_subject'];
} else {
  $all_subject = mysql_query($query_subject);
  $totalRows_subject = mysql_num_rows($all_subject);
}
$totalPages_subject = ceil($totalRows_subject/$maxRows_subject)-1;

mysql_select_db($database_conn, $conn);
$query_course = "SELECT * FROM course where subject_ID='$_SESSION[subject_ID]' ";
$course = mysql_query($query_course, $conn) or die(mysql_error());
$row_course = mysql_fetch_assoc($course);
$totalRows_course = mysql_num_rows($course);
?>
<?php  //php function
function print_day($pos){
if($pos==0){echo"จันทร์";}
else if($pos==1){echo"อังคาร";}
else if($pos==2){echo"พุธ";}
else if($pos==3){echo"พฤหัส";}
else if($pos==4){echo"ศุกร์";}
else if($pos==5){echo"เสาร์";}
else if($pos==6){echo"อาทิตย์";}
}
function print_learn_time($learn_time){
$pos=0;
$FindTailMode =false;
$first=true;
while ($pos<7){
if(!$FindTailMode){
										if(substr($learn_time,$pos,1)==1){
											if(!$first){echo",";}
											print_day($pos); 
											$first=false;
											if(substr($learn_time,$pos+1,1)==1)
											{echo "-"; $FindTailMode=true;}
										}
									}
else if (substr($learn_time,$pos+1,1)==0 ||  $pos==6){print_day($pos);  $FindTailMode=false;}
$pos++;
}//while
}//function
function decodeDay_month_Year($x){
	$month =substr($x,3,2);
	if($month=="01"){$replace="ม.ค.";}
	else if($month=="02"){$replace="ก.พ.";}
	else if($month=="03"){$replace="มี.ค.";}
	else if($month=="04"){$replace="เม.ษ.";}
	else if($month=="05"){$replace="พ.ค.";}
	else if($month=="06"){$replace="มิ.ย.";}
	else if($month=="07"){$replace="ก.ค.";}
	else if($month=="08"){$replace="ส.ค.";}
	else if($month=="09"){$replace="ก.ย.";}
	else if($month=="10"){$replace="ต.ค.";}
	else if($month=="11"){$replace="พ.ย.";}
	else if($month=="12"){$replace="ธ.ค.";}
	 $x=substr_replace($x,$replace,3,2);
	 $x=str_replace("/"," ",$x);
	 echo $x;
}
?>
<?php //delete all course
if (isset($HTTP_GET_VARS['DelAll']))
{
	$query  ="DELETE FROM course where subject_ID='$_SESSION[subject_ID]' ";
	$result = mysql_query($query);
	echo"<meta http-equiv = 'refresh' content = '0; URL =courselists.php'>";
}
?>
<?php //delete 1 course
if (isset($HTTP_GET_VARS['c_id']))
{	//delete from course;
	$query ="DELETE FROM course where course_ID = '$c_id' ";
	$result = mysql_query($query);
	echo"<meta http-equiv = 'refresh' content = '0; URL =courselists.php?id=$_SESSION[subject_ID]'>";
}
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>วิชาทั้งหมด</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style1 {
	font-size: 24px;
	font-weight: bold;
}
a:link {
	color: #0000FF;
}
a:visited {
	color: #0000FF;
}
a:active {
	color: #0000FF;
}
-->
</style></head>

<body>
<p align="center">&nbsp;</p>
<p align="center">แสดงคอร์สทั้งหมดของวิชา</p>
<p align="center" class="style1"><?php echo $row_subject['subject_name'];?></p>
<p align="center"><a href="subjectlists.php">กลับไปหน้าแสดงวิชา</a> &nbsp;&nbsp;&nbsp;&nbsp;<a href="admin_index.php">กลับไปหน้าเมนูผู้ดูแลระบบ</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="../index.php">กลับไปหน้า home page </a> &nbsp;&nbsp;&nbsp;&nbsp;</p>
<p align="center"> <a href="course_add.php" target="_blank">เพิ่มคอร์ส</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=# onClick="del('courselists.php?DelAll=1')">ลบคอร์สทั้งหมด</a></p>
<p>&nbsp;</p>
<div align="center">
  <?php if ($totalRows_course > 0) { // Show if recordset not empty ?>  
  <table border="1" cellpadding="2" cellspacing="0" bordercolor="#6699FF">
    <tr bgcolor="#66CCFF">
      <td width="50"><div align="center">คอร์สที่</div></td>
      <td width="172"><div align="center">อาจารย์</div></td>
    <td width="100"><div align="center">วันที่เริ่มเรียน</div></td>
      <td width="128"><div align="center">วันเรียน</div></td>
    <td width="90"><div align="center">เวลาเรียน</div></td>
      <td width="100"><div align="center">วันสุดท้ายที่เรียน</div></td>
      <td width="50"><div align="center">EDIT</div></td>
    <td width="50"><div align="center">DEL</div></td>
    </tr>
    <?php do {?>
    <tr>
      <td><div align="center"><?php echo $row_course['course_NO'];?></div></td>
      <td><div align="center">
          <?php  
		mysql_select_db($database_conn, $conn);
		$query_teacher = "SELECT title,name,surname FROM teacher where teacher_ID='$row_course[teacher_ID]' ";
		$teacher = mysql_query($query_teacher, $conn) or die(mysql_error());
		$row_teacher = mysql_fetch_assoc($teacher);
		echo "$row_teacher[title] $row_teacher[name] $row_teacher[surname]";
		?>
      </div></td>
      <td><div align="center">
          <?php  decodeDay_month_Year($row_course['learn_start']);?>
      </div></td>
      <td><div align="center"><?php print_learn_time($row_course['learn_time']);?>
        </div></td>
      <td><div align="center"><?php echo substr($row_course['learn_time'],8,11); ?></div></td>
      <td><div align="center"><?php decodeDay_month_Year($row_course['last_day']); ?></div></td>
      <td><div align="center"><a href="course_edit.php?id=<?php echo "$row_course[course_ID]";?>">EDIT</a></div></td>
      <td><div align="center"><a href=#  onClick="del('courselists.php?c_id=<?php echo $row_course['course_ID']; ?>')">DEL</a></div></td>
    </tr>
    <?php } while ($row_course = mysql_fetch_assoc($course)); ?>
  </table>
  <?php } else echo"ยังไม่มีคอร์สการเรียนของวิชานี้ค่ะ"// Show if recordset not empty ?>
</div>
</body>
</html>
<?php
mysql_free_result($subject);

mysql_free_result($course);
?>
