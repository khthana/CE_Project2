<?php session_start(); ?>
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
$query_subject = "SELECT * FROM subject";
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
?>
<?php //delete all subject
if (isset($HTTP_GET_VARS['DelAll']))
{
	// clear subject table
	$query  ="DELETE FROM subject";
	$result = mysql_query($query);
	// clear course table
	$query  ="DELETE FROM course";
	$result = mysql_query($query);
	echo"<meta http-equiv = 'refresh' content = '0; URL =subjectlists.php'>";
}
?>
<?php //delete 1 subject
if (isset($HTTP_GET_VARS['id']))
{	//delete from subject;
	$query ="DELETE FROM subject where subject_ID = '$id' ";
	$result = mysql_query($query);
	$query ="DELETE FROM course where subject_ID = '$id' ";
	$result = mysql_query($query);
	echo"<meta http-equiv = 'refresh' content = '0; URL =subjectlists.php'>";
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
	font-size: 20px;
	font-weight: bold;
	color: #6699FF;
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
<p align="center" class="style1">แสดงรายชื่อวิชาทั้งหมด</p>
<p align="center">&nbsp;</p>
<p align="center"> <a href="subject_add.php">เพิ่มวิชา</a> &nbsp;&nbsp;&nbsp;&nbsp;<a href=# onClick="del('subjectlists.php?DelAll=1')">ลบวิชาทั้งหมด</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin_index.php">กลับไปหน้่าเมนูผู้ดูแลระบบ</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="../index.php">กลับไปหน้า home page</a></p>
<p>&nbsp;</p>
<div align="center">
  <?php if ($totalRows_subject > 0) { // Show if recordset not empty ?>
  <table border="1" cellpadding="2" cellspacing="0" bordercolor="#6699FF">
    <tr bgcolor="#66CCFF">
      <td width="133"><div align="center">Subject ID</div></td>
      <td width="172"><div align="center">Subject name </div></td>
    <td width="128"><div align="center">Subject point </div></td>
    <td width="69"><div align="center">EDIT</div></td>
    <td width="69"><div align="center">DEL</div></td>
    <td width="69"> <div align="center">Course</div></td>
    </tr>
    <?php do {
	  //decode learn_time
	$day1=substr($row_subject[learn_time],0,1); 
	if($day1==1){$day1="จ.";}
	else if($day1==2){$day1="อ.";}
	else if($day1==3){$day1="พ.";}
	else if($day1==4){$day1="พฤ.";}
	else if($day1==5){$day1="ศ.";}
	else if($day1==6){$day1="ส.";}
	else if($day1==7){$day1="อา.";}
	$time=substr($row_subject[learn_time],2,11); 
 	?>
    <tr>
      <td><div align="center"><?php echo $row_subject['subject_ID']; ?></div></td>
      <td><div align="center"><?php echo $row_subject['subject_name']; ?></div></td>
      <td><div align="center"><?php echo $row_subject['subject_point']; ?></div></td>
      <td><div align="center"><a href="subject_edit.php?id=<?php echo "$row_subject[subject_ID]";?>">EDIT</a></div></td>
      <td><div align="center"><a href=#  onClick="del('subjectlists.php?id= <?php echo "$row_subject[subject_ID]"; ?>')">DEL</a></div></td>
      <td><div align="center"><a href="courselists.php?id=<?php echo $row_subject['subject_ID'];?>">VIEW</a></div></td>
    </tr>
    <?php } while ($row_subject = mysql_fetch_assoc($subject)); ?>
  </table>
  <?php } else echo "ยังไม่มีวิชาที่เปิดสอนค่ะ";// Show if recordset not empty ?>
</div>
</body>
</html>
<?php
mysql_free_result($subject);
?>
