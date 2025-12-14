<?php require_once('../Connections/conn.php'); ?>
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
function PrintStart_End_Day($Start,$End){
	//decode Start day
	$monthStart =substr($Start,3,2);
	if($monthStart=="01"){$replace="มกราคม";}
	else if($monthStart=="02"){$replace="กุมภาพันธ์";}
	else if($monthStart=="03"){$replace="มีนาคม";}
	else if($monthStart=="04"){$replace="เมษายน";}
	else if($monthStart=="05"){$replace="พฤษภาคม";}
	else if($monthStart=="06"){$replace="มิถุนายน";}
	else if($monthStart=="07"){$replace="กรกฎาคม";}
	else if($monthStart=="08"){$replace="สิงหาคม";}
	else if($monthStart=="09"){$replace="กันยายน";}
	else if($monthStart=="10"){$replace="ตุลาคม";}
	else if($monthStart=="11"){$replace="พฤษจิกายน";}
	else if($monthStart=="12"){$replace="ธันวาคม";}
	 $Start=substr($Start,0,5);
	 $Start=substr_replace($Start,$replace,3,2);
	 $Start=str_replace("/","&nbsp",$Start);
	 //decode End day
	 $monthEnd =substr($End,3,2);
	if($monthEnd=="01"){$replace="มกราคม";}
	else if($monthEnd=="02"){$replace="กุมภาพันธ์";}
	else if($monthEnd=="03"){$replace="มีนาคม";}
	else if($monthEnd=="04"){$replace="เมษายน";}
	else if($monthEnd=="05"){$replace="พฤษภาคม";}
	else if($monthEnd=="06"){$replace="มิถุนายน";}
	else if($monthEnd=="07"){$replace="กรกฎาคม";}
	else if($monthEnd=="08"){$replace="สิงหาคม";}
	else if($monthEnd=="09"){$replace="กันยายน";}
	else if($monthEnd=="10"){$replace="ตุลาคม";}
	else if($monthEnd=="11"){$replace="พฤษจิกายน";}
	else if($monthEnd=="12"){$replace="ธันวาคม";}
	 $End=substr_replace($End,$replace,3,2);
	 $End=str_replace("/","&nbsp",$End);
	 echo "$Start - $End";
}
?>
<?php
$maxRows_course = 10;
$pageNum_course = 0;
if (isset($_GET['pageNum_course'])) {
  $pageNum_course = $_GET['pageNum_course'];
}
$startRow_course = $pageNum_course * $maxRows_course;

mysql_select_db($database_conn, $conn);
$query_course = "SELECT * FROM course left join teacher on course.teacher_ID=teacher.teacher_ID WHERE subject_ID = '$subject_ID'";
$query_limit_course = sprintf("%s LIMIT %d, %d", $query_course, $startRow_course, $maxRows_course);
$course = mysql_query($query_limit_course, $conn) or die(mysql_error());
$row_course = mysql_fetch_assoc($course);

if (isset($_GET['totalRows_course'])) {
  $totalRows_course = $_GET['totalRows_course'];
} else {
  $all_course = mysql_query($query_course);
  $totalRows_course = mysql_num_rows($all_course);
}
$totalPages_course = ceil($totalRows_course/$maxRows_course)-1;

mysql_select_db($database_conn, $conn);
$query_subject = "SELECT * FROM subject where subject_ID ='$subject_ID'";
$subject = mysql_query($query_subject, $conn) or die(mysql_error());
$row_subject = mysql_fetch_assoc($subject);
$totalRows_subject = mysql_num_rows($subject);
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Course Show</title>
<style type="text/css">
<!--
.style1 {color: #FF3399}
.style2 {color: #3333FF}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style5 {font-size: 20px}
.style7 {color: #FF3399; font-size: 18px; }
a:link {
	color: #0000FF;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #0000FF;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
-->
</style>
</head>

<body>
<?php  include("student_header.htm"); ?>
<table width="860" height="182" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="89" height="34">&nbsp;</td>
    <td width="422" class="style5">หลักสูตรวิชา&nbsp;<?php echo $row_subject['subject_name']; ?></td>
    <td width="24">&nbsp;</td>
  </tr>
  <tr>
    <td height="34">&nbsp;</td>
    <td class="style5">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><form name="form1" method="post" action="pattern_choose.php">
      <?php if ($totalRows_course > 0) { // Show if recordset not empty ?>
      <table border="0" cellpadding="0" cellspacing="0">
          <?php do { ?>
          <tr>
            <td width="35"><div align="center">
                <input name="course_ID" type="radio" value="<?php echo $row_course['course_ID'];?>">
            </div></td>
            <td width="181"><strong>คอร์สที่&nbsp;<?php echo $row_course['course_NO']; ?></strong>&nbsp;</td>
            <td width="4">&nbsp;</td>
            <td colspan="2"><strong>&nbsp;</strong>สอนสด <span class="style2">&nbsp;<?php print_learn_time($row_course['learn_time']); ?></span></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td height="35">เวลา <span class="style2"><?php echo substr($row_course['learn_time'],8,11); ?> น. </span></td>
            <td height="35" colspan="3">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><span class="style1">เริ่มวันที่&nbsp;<?php PrintStart_End_Day($row_course['learn_start'],$row_course['last_day']);?></span></td>
            <td>&nbsp;</td>
            <td width="300">&nbsp;</td>
            <td width="58"><input type="submit" name="Submit" value="ลงทะเบียนเรียน"></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>อาจารย์ผู้สอน <a href="<?php echo"../teacher_show.php?id=$row_course[teacher_ID]";?>"><?php echo"$row_course[title] $row_course[name] $row_course[surname]";?></a></td>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5"><hr color=1E90FF></td>
          </tr>
          <?php } while ($row_course = mysql_fetch_assoc($course)); ?>
      </table>
      <?php } else{?>
      <span class="style7">ไม่มีคอร์สการเรียนของวิชานี้ค่ะ</span>
        <?php }?>
      <p>
        <input name="edit" type="hidden" id="edit" value="<?php echo $edit;?>">
        <input name="pos" type="hidden" id="pos" value="<?php echo $pos;?>">
      </p>
    </form></td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
<?php
mysql_free_result($course);

mysql_free_result($subject);
?>
