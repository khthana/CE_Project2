<?php session_start(); ?>
<?php include("../javascript/course_check.htm"); ?>
<?php require_once('../Connections/conn.php'); ?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<title>แก้ไขคอร์ส</title>
<style type="text/css">
<!--
.style1 {
	font-size: 36px;
	color: #0099FF;
}
-->
</style>
</head>
<body>
<?php //เก็บข้อมูลคอร์สลงฐานข้อมูล 
	if(isset($HTTP_POST_VARS['Submit'])&&($HTTP_POST_VARS['Submit']=="Submit"))
	{	
		 require_once('../Connections/conn.php'); 
		//collect learn_time
		if($mon==""){$mon=0;}
		if($tue==""){$tue=0;}
		if($wed==""){$wed=0;}
		if($thu==""){$thu=0;}
		if($fri==""){$fri=0;}
		if($sat==""){$sat=0;}
		if($sun==""){$sun=0;}
		$day="$mon$tue$wed$thu$fri$sat$sun";
		$learn_time="$day/$time";
		$learn_start="$dayStart/$monthStart/$yearStart";
		$last_day="$dayLast/$monthLast/$yearLast";
		mysql_select_db($database_conn,$conn);
		//update to table course
		$query ="UPDATE course SET subject_ID='$_SESSION[subject_ID]',learn_start='$learn_start',learn_time='$learn_time',last_day='$last_day',teacher_ID='$teacher_ID' where course_ID= '$id' ";
		$result = mysql_query($query,$conn) or die(mysql_error());
		echo"<meta http-equiv='refresh' content='0;URL=courselists.php?id=$_SESSION[subject_ID]'>";
	 }
		?>
		<?php //find subject detail
		mysql_select_db($database_conn, $conn);
		$query_subject = "SELECT * FROM subject where subject_ID='$_SESSION[subject_ID]' ";
		$subject = mysql_query($query_subject, $conn) or die(mysql_error());
		$row_subject = mysql_fetch_assoc($subject);
		$totalRows_subject = mysql_num_rows($subject);

mysql_select_db($database_conn, $conn);
$query_teacher = "SELECT * FROM teacher";
$teacher = mysql_query($query_teacher, $conn) or die(mysql_error());
$row_teacher = mysql_fetch_assoc($teacher);
$totalRows_teacher = mysql_num_rows($teacher);

mysql_select_db($database_conn, $conn);
$query_course = "SELECT * FROM course where course_ID='$id' ";
$course = mysql_query($query_course, $conn) or die(mysql_error());
$row_course = mysql_fetch_assoc($course);
$totalRows_course = mysql_num_rows($course);
//decode วันเปิดคอร์ส
$daystart=substr($row_course['learn_start'],0,2);
$monthstart=substr($row_course['learn_start'],3,2);
$yearstart=substr($row_course['learn_start'],6,4);
//decode วันเรียน
$mon   =substr($row_course['learn_time'],0,1);
$tue     =substr($row_course['learn_time'],1,1);
$wed   =substr($row_course['learn_time'],2,1);
$thu    =substr($row_course['learn_time'],3,1);
$fri      =substr($row_course['learn_time'],4,1);
$sat     =substr($row_course['learn_time'],5,1);
$sun    =substr($row_course['learn_time'],6,1);
$time   =substr($row_course['learn_time'],8,11);
//decode วันสุดท้ายที่เรียน
$day=substr($row_course['last_day'],0,2);
$month=substr($row_course['last_day'],3,2);
$year=substr($row_course['last_day'],6,4);
//นำข้อมูลของอาจารย์ที่สอนในคอร์สมาแสดง
$query_teacher = "SELECT * FROM teacher where teacher_ID='$row_course[teacher_ID]' ";
$the_teacher = mysql_query($query_teacher, $conn) or die(mysql_error());
$row_the_teacher = mysql_fetch_assoc($the_teacher);
?>
<p class="style1"><img src="../Images/course_edit_form.gif" width="510" height="72"></p>
<form name="form1" method="post" action="course_edit.php">
  <table border="1" cellpadding="0" cellspacing="0" bordercolor="#0099FF">
    <tr>
      <td width="118" bgcolor="#66CCFF">คอร์สที่</td>
      <td width="205"><input name="course_NO" type="text" id="course_NO" value="<?php echo $row_course['course_NO']; ?>"></td>
    </tr>
    <tr>
      <td bgcolor="#66CCFF">ชื่อวิชา</td>
      <td><textarea name="subject_name" cols="30" rows="2" id="subject_name"><?php echo $row_subject['subject_name']; ?></textarea></td>
    </tr>
    <tr>
      <td bgcolor="#66CCFF">วันที่เริ่มเรียน</td>
      <td><select name="dayStart" id="dayStart">
          <option selected value="" <?php if (!(strcmp("", $daystart))) {echo "SELECTED";} ?>>วันที่</option>
          <option value="01" <?php if (!(strcmp("01", $daystart))) {echo "SELECTED";} ?>>1</option>
          <option value="02" <?php if (!(strcmp("02", $daystart))) {echo "SELECTED";} ?>>2</option>
          <option value="03" <?php if (!(strcmp("03", $daystart))) {echo "SELECTED";} ?>>3</option>
          <option value="04" <?php if (!(strcmp("04", $daystart))) {echo "SELECTED";} ?>>4</option>
          <option value="05" <?php if (!(strcmp("05", $daystart))) {echo "SELECTED";} ?>>5</option>
          <option value="06" <?php if (!(strcmp("06", $daystart))) {echo "SELECTED";} ?>>6</option>
          <option value="07" <?php if (!(strcmp("07", $daystart))) {echo "SELECTED";} ?>>7</option>
          <option value="08" <?php if (!(strcmp("08", $daystart))) {echo "SELECTED";} ?>>8</option>
          <option value="09" <?php if (!(strcmp("09", $daystart))) {echo "SELECTED";} ?>>9</option>
          <option value="10" <?php if (!(strcmp(10, $daystart))) {echo "SELECTED";} ?>>10</option>
          <option value="11" <?php if (!(strcmp(11, $daystart))) {echo "SELECTED";} ?>>11</option>
          <option value="12" <?php if (!(strcmp(12, $daystart))) {echo "SELECTED";} ?>>12</option>
          <option value="13" <?php if (!(strcmp(13, $daystart))) {echo "SELECTED";} ?>>13</option>
          <option value="14" <?php if (!(strcmp(14, $daystart))) {echo "SELECTED";} ?>>14</option>
          <option value="15" <?php if (!(strcmp(15, $daystart))) {echo "SELECTED";} ?>>15</option>
          <option value="16" <?php if (!(strcmp(16, $daystart))) {echo "SELECTED";} ?>>16</option>
          <option value="17" <?php if (!(strcmp(17, $daystart))) {echo "SELECTED";} ?>>17</option>
          <option value="18" <?php if (!(strcmp(18, $daystart))) {echo "SELECTED";} ?>>18</option>
          <option value="19" <?php if (!(strcmp(19, $daystart))) {echo "SELECTED";} ?>>19</option>
          <option value="20" <?php if (!(strcmp(20, $daystart))) {echo "SELECTED";} ?>>20</option>
          <option value="21" <?php if (!(strcmp(21, $daystart))) {echo "SELECTED";} ?>>21</option>
          <option value="22" <?php if (!(strcmp(22, $daystart))) {echo "SELECTED";} ?>>22</option>
          <option value="23" <?php if (!(strcmp(23, $daystart))) {echo "SELECTED";} ?>>23</option>
          <option value="24" <?php if (!(strcmp(24, $daystart))) {echo "SELECTED";} ?>>24</option>
          <option value="25" <?php if (!(strcmp(25, $daystart))) {echo "SELECTED";} ?>>25</option>
          <option value="26" <?php if (!(strcmp(26, $daystart))) {echo "SELECTED";} ?>>26</option>
          <option value="27" <?php if (!(strcmp(27, $daystart))) {echo "SELECTED";} ?>>27</option>
          <option value="28" <?php if (!(strcmp(28, $daystart))) {echo "SELECTED";} ?>>28</option>
          <option value="29" <?php if (!(strcmp(29, $daystart))) {echo "SELECTED";} ?>>29</option>
          <option value="30" <?php if (!(strcmp(30, $daystart))) {echo "SELECTED";} ?>>30</option>
          <option value="31" <?php if (!(strcmp(31, $daystart))) {echo "SELECTED";} ?>>31</option>
        </select>
          <select name="monthStart" id="monthStart" style="width:85 px;">
            <option value="" selected <?php if (!(strcmp("", $monthstart))) {echo "SELECTED";} ?>>เดือน</option>
            <option value="01" <?php if (!(strcmp("01", $monthstart))) {echo "SELECTED";} ?>>มกราคม</option>
            <option value="02" <?php if (!(strcmp("02", $monthstart))) {echo "SELECTED";} ?>>กุมภาพันธ์</option>
            <option value="03" <?php if (!(strcmp("03", $monthstart))) {echo "SELECTED";} ?>>มีนาคม</option>
            <option value="04" <?php if (!(strcmp("04", $monthstart))) {echo "SELECTED";} ?>>เมษายน</option>
            <option value="05" <?php if (!(strcmp("05", $monthstart))) {echo "SELECTED";} ?>>พฤษภาคม</option>
            <option value="06" <?php if (!(strcmp("06", $monthstart))) {echo "SELECTED";} ?>>มิถุนายน</option>
            <option value="07" <?php if (!(strcmp("07", $monthstart))) {echo "SELECTED";} ?>>กรกฎาคม</option>
            <option value="08" <?php if (!(strcmp("08", $monthstart))) {echo "SELECTED";} ?>>สิงหาคม</option>
            <option value="09" <?php if (!(strcmp("09", $monthstart))) {echo "SELECTED";} ?>>กันยายน</option>
            <option value="10" <?php if (!(strcmp(10, $monthstart))) {echo "SELECTED";} ?>>ตุลาคม</option>
            <option value="11" <?php if (!(strcmp(11, $monthstart))) {echo "SELECTED";} ?>>พฤศจิกายน</option>
            <option value="12" <?php if (!(strcmp(12, $monthstart))) {echo "SELECTED";} ?>>ธันวาคม</option>
        </select>
          <select name="yearStart" id="yearStart" style="width:55px;">
            <option value="0" selected <?php if (!(strcmp("0", $yearstart))) {echo "SELECTED";} ?>>ปี</option>
            <option value="2005" <?php if (!(strcmp(2005, $yearstart))) {echo "SELECTED";} ?>>2548</option>
            <option value="2006" <?php if (!(strcmp(2006, $yearstart))) {echo "SELECTED";} ?>>2549</option>
        </select></td>
    </tr>
    <tr>
      <td rowspan="2" bgcolor="#66CCFF">เวลาเรียน</td>
      <td>&nbsp;        <input <?php if (!(strcmp($mon,1))) {echo "checked";} ?> name="mon" type="checkbox" id="mon" value="1">
  จันทร์
  <input <?php if (!(strcmp($tue,1))) {echo "checked";} ?> name="tue" type="checkbox" id="tue" value="1">
  อังคาร
  <input <?php if (!(strcmp($wed,1))) {echo "checked";} ?> name="wed" type="checkbox" id="wed" value="1">
  พุธ
  <input <?php if (!(strcmp($thu,1))) {echo "checked";} ?> name="thu" type="checkbox" id="thu" value="1">
  พฤหัส 
  <p>
          <input <?php if (!(strcmp($fri,1))) {echo "checked";} ?> name="fri" type="checkbox" id="fri" value="1">
  ศุกร์
  <input <?php if (!(strcmp($sat,1))) {echo "checked";} ?> name="sat" type="checkbox" id="sat" value="1">
  เสาร์
  <input <?php if (!(strcmp($sun,1))) {echo "checked";} ?> name="sun" type="checkbox" id="sun" value="1">
  อาทิตย์</p></td>
    </tr>
    <tr>
      <td>เวลา&nbsp;
        <input name="time" type="text" id="time" value="<?php echo $time; ?>" size="7">
น.</td>
    </tr>
    <tr>
      <td bgcolor="#66CCFF">ัวันสุดท้ายที่เรียน</td>
      <td><select name="dayLast" id="dayLast">
        <option selected value="" <?php if (!(strcmp("", $day))) {echo "SELECTED";} ?>>วันที่</option>
        <option value="01" <?php if (!(strcmp("01", $day))) {echo "SELECTED";} ?>>1</option>
        <option value="02" <?php if (!(strcmp("02", $day))) {echo "SELECTED";} ?>>2</option>
        <option value="03" <?php if (!(strcmp("03", $day))) {echo "SELECTED";} ?>>3</option>
        <option value="04" <?php if (!(strcmp("04", $day))) {echo "SELECTED";} ?>>4</option>
        <option value="05" <?php if (!(strcmp("05", $day))) {echo "SELECTED";} ?>>5</option>
        <option value="06" <?php if (!(strcmp("06", $day))) {echo "SELECTED";} ?>>6</option>
        <option value="07" <?php if (!(strcmp("07", $day))) {echo "SELECTED";} ?>>7</option>
        <option value="08" <?php if (!(strcmp("08", $day))) {echo "SELECTED";} ?>>8</option>
        <option value="09" <?php if (!(strcmp("09", $day))) {echo "SELECTED";} ?>>9</option>
        <option value="10" <?php if (!(strcmp(10, $day))) {echo "SELECTED";} ?>>10</option>
        <option value="11" <?php if (!(strcmp(11, $day))) {echo "SELECTED";} ?>>11</option>
        <option value="12" <?php if (!(strcmp(12, $day))) {echo "SELECTED";} ?>>12</option>
        <option value="13" <?php if (!(strcmp(13, $day))) {echo "SELECTED";} ?>>13</option>
        <option value="14" <?php if (!(strcmp(14, $day))) {echo "SELECTED";} ?>>14</option>
        <option value="15" <?php if (!(strcmp(15, $day))) {echo "SELECTED";} ?>>15</option>
        <option value="16" <?php if (!(strcmp(16, $day))) {echo "SELECTED";} ?>>16</option>
        <option value="17" <?php if (!(strcmp(17, $day))) {echo "SELECTED";} ?>>17</option>
        <option value="18" <?php if (!(strcmp(18, $day))) {echo "SELECTED";} ?>>18</option>
        <option value="19" <?php if (!(strcmp(19, $day))) {echo "SELECTED";} ?>>19</option>
        <option value="20" <?php if (!(strcmp(20, $day))) {echo "SELECTED";} ?>>20</option>
        <option value="21" <?php if (!(strcmp(21, $day))) {echo "SELECTED";} ?>>21</option>
        <option value="22" <?php if (!(strcmp(22, $day))) {echo "SELECTED";} ?>>22</option>
        <option value="23" <?php if (!(strcmp(23, $day))) {echo "SELECTED";} ?>>23</option>
        <option value="24" <?php if (!(strcmp(24, $day))) {echo "SELECTED";} ?>>24</option>
        <option value="25" <?php if (!(strcmp(25, $day))) {echo "SELECTED";} ?>>25</option>
        <option value="26" <?php if (!(strcmp(26, $day))) {echo "SELECTED";} ?>>26</option>
        <option value="27" <?php if (!(strcmp(27, $day))) {echo "SELECTED";} ?>>27</option>
        <option value="28" <?php if (!(strcmp(28, $day))) {echo "SELECTED";} ?>>28</option>
        <option value="29" <?php if (!(strcmp(29, $day))) {echo "SELECTED";} ?>>29</option>
        <option value="30" <?php if (!(strcmp(30, $day))) {echo "SELECTED";} ?>>30</option>
        <option value="31" <?php if (!(strcmp(31, $day))) {echo "SELECTED";} ?>>31</option>
                  </select>
        <select name="monthLast" id="monthLast" style="width:85px;">
          <option value="" selected <?php if (!(strcmp("", $month))) {echo "SELECTED";} ?>>เดือน</option>
          <option value="01" <?php if (!(strcmp("01", $month))) {echo "SELECTED";} ?>>มกราคม</option>
          <option value="02" <?php if (!(strcmp("02", $month))) {echo "SELECTED";} ?>>กุมภาพันธ์</option>
          <option value="03" <?php if (!(strcmp("03", $month))) {echo "SELECTED";} ?>>มีนาคม</option>
          <option value="04" <?php if (!(strcmp("04", $month))) {echo "SELECTED";} ?>>เมษายน</option>
          <option value="05" <?php if (!(strcmp("05", $month))) {echo "SELECTED";} ?>>พฤษภาคม</option>
          <option value="06" <?php if (!(strcmp("06", $month))) {echo "SELECTED";} ?>>มิถุนายน</option>
          <option value="07" <?php if (!(strcmp("07", $month))) {echo "SELECTED";} ?>>กรกฎาคม</option>
          <option value="08" <?php if (!(strcmp("08", $month))) {echo "SELECTED";} ?>>สิงหาคม</option>
          <option value="09" <?php if (!(strcmp("09", $month))) {echo "SELECTED";} ?>>กันยายน</option>
          <option value="10" <?php if (!(strcmp(10, $month))) {echo "SELECTED";} ?>>ตุลาคม</option>
          <option value="11" <?php if (!(strcmp(11, $month))) {echo "SELECTED";} ?>>พฤศจิกายน</option>
          <option value="12" <?php if (!(strcmp(12, $month))) {echo "SELECTED";} ?>>ธันวาคม</option>
        </select>
        <select name="yearLast" id="yearLast" style="width:55px;">
          <option value="0" selected <?php if (!(strcmp("0", $year))) {echo "SELECTED";} ?>>ปี</option>
          <option value="2005" <?php if (!(strcmp(2005, $year))) {echo "SELECTED";} ?>>2548</option>
          <option value="2006" <?php if (!(strcmp(2006, $year))) {echo "SELECTED";} ?>>2549</option>
        </select></td>
    </tr>
    <tr>
      <td bgcolor="#66CCFF">อาจารย์ผู้สอน</td>
      <td><select name="teacher_ID" id="teacher_ID"><?Php echo $row_the_teacher['teacher_ID'];?>
         <option value="" <?php if (!(strcmp("", $row_the_teacher['teacher_ID']))) {echo "SELECTED";} ?>>กรุณาเลือก</option>
		<?php
		do {  ?>
	    <option value="<?php echo $row_teacher['teacher_ID'];  ?>" <?php if (!(strcmp($row_teacher['teacher_ID'], $row_the_teacher['teacher_ID']))) {echo "SELECTED";} ?>><?php echo "$row_teacher[title] $row_teacher[name] $row_teacher[surname]"; ?></option>
 		  <?php
				} while ($row_teacher = mysql_fetch_assoc($teacher));
  $rows = mysql_num_rows($teacher);
  if($rows > 0) {
      mysql_data_seek($teacher, 0);
	  $row_teacher = mysql_fetch_assoc($teacher);
  }
?>
      </select></td>
    </tr>
    <tr>
      <td colspan="2" bgcolor="#66CCFF">       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input name="id" type="hidden" id="id" value="<?php echo $row_course['course_ID']; ?>">        
        &nbsp;&nbsp;
        <input type="submit" name="Submit" onClick="return Check()" value="Submit" >
&nbsp;        <input type="reset" name="Reset" value="Reset">
     </td>
    </tr>
  </table>
</form>
</body>
</html>
<?php
mysql_free_result($subject);

mysql_free_result($teacher);

mysql_free_result($course);
?>
