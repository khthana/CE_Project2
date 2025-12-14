<?php session_start(); ?>
<?php include("../javascript/course_check.htm"); ?> 
<?php require_once('../Connections/conn.php'); ?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>เพิ่มคอร์ส</title>
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
		//add to table course
		$query ="INSERT INTO course (subject_ID,course_NO,learn_start,learn_time,last_day,teacher_ID) 
		VALUES ('$_SESSION[subject_ID]','$course_NO','$learn_start','$learn_time','$last_day','$teacher_ID')";
		$result = mysql_query($query,$conn) or die(mysql_error());
		echo"<meta http-equiv='refresh' content='0;URL=courselists.php'>";
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
$query_course = "SELECT * FROM course where subject_ID='$_SESSION[subject_ID]' order by course_NO DESC ";
$course = mysql_query($query_course, $conn) or die(mysql_error());
$row_course = mysql_fetch_assoc($course);
$totalRows_course = mysql_num_rows($course);
if($row_course['course_NO']==""){$course_NO=1;} else {$course_NO=$row_course['course_NO']+1;}

		
?>
<p class="style1"><img src="../Images/course_add_form.gif" width="510" height="72"></p>
<form name="form1" method="post" action="course_add.php">
  <table border="1" cellpadding="0" cellspacing="0" bordercolor="#0099FF">
    <tr>
      <td width="118" bgcolor="#66CCFF">คอร์สที่</td>
      <td width="205"><input name="course_NO" type="text" id="course_NO" value="<?php echo $course_NO;?>"></td>
    </tr>
    <tr>
      <td bgcolor="#66CCFF">ชื่อวิชา</td>
      <td><textarea name="subject_name" cols="30" rows="2" id="subject_name"><?php echo $row_subject['subject_name']; ?></textarea></td>
    </tr>
    <tr>
      <td bgcolor="#66CCFF">วันที่เริ่มเรียน</td>
      <td><select name="dayStart" id="dayStart">
        <option selected value="">วันที่</option>
        <option value="01">1</option>
        <option value="02">2</option>
        <option value="03">3</option>
        <option value="04">4</option>
        <option value="05">5</option>
        <option value="06">6</option>
        <option value="07">7</option>
        <option value="08">8</option>
        <option value="09">9</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
        <option value="13">13</option>
        <option value="14">14</option>
        <option value="15">15</option>
        <option value="16">16</option>
        <option value="17">17</option>
        <option value="18">18</option>
        <option value="19">19</option>
        <option value="20">20</option>
        <option value="21">21</option>
        <option value="22">22</option>
        <option value="23">23</option>
        <option value="24">24</option>
        <option value="25">25</option>
        <option value="26">26</option>
        <option value="27">27</option>
        <option value="28">28</option>
        <option value="29">29</option>
        <option value="30">30</option>
        <option value="31">31</option>
        </select>
        <select name="monthStart" id="monthStart" style="width:85px;">
          <option value="" selected>เดือน</option>
          <option value="01">มกราคม</option>
          <option value="02">กุมภาพันธ์</option>
          <option value="03">มีนาคม</option>
          <option value="04">เมษายน</option>
          <option value="05">พฤษภาคม</option>
          <option value="06">มิถุนายน</option>
          <option value="07">กรกฎาคม</option>
          <option value="08">สิงหาคม</option>
          <option value="09">กันยายน</option>
          <option value="10">ตุลาคม</option>
          <option value="11">พฤศจิกายน</option>
          <option value="12">ธันวาคม</option>
        </select>          
        <select name="yearStart" id="yearStart" style="width:55px;">
            <option value="0" selected>ปี</option>
            <option value="2005">2548</option>
            <option value="2006">2549</option>
        </select></td>
    </tr>
    <tr>
      <td rowspan="2" bgcolor="#66CCFF">เวลาเรียน</td>
      <td><p>
      <input name="mon" type="checkbox" id="mon" value="1">
      จันทร์
      <input name="tue" type="checkbox" id="tue" value="1">
     อังคาร
      <input name="wed" type="checkbox" id="wed" value="1">
          พุธ
          <input name="thu" type="checkbox" id="thu" value="1">
          พฤหัส
          </p>
        <p>
    <input name="fri" type="checkbox" id="fri" value="1">
    ศุกร์
    <input name="sat" type="checkbox" id="sat" value="1">
    เสาร์
    <input name="sun" type="checkbox" id="sun" value="1">
    อาทิตย์</p></td>
    </tr>
    <tr>
      <td>เวลา&nbsp;
        <input name="time" type="text" id="time" value="00.00-00.00" size="7">
  น.</td></tr>
    <tr>
      <td bgcolor="#66CCFF">ัวันสุดท้ายที่เรียน</td>
      <td><select name="dayLast" id="dayLast">
        <option selected value="">วันที่</option>
        <option value="01">1</option>
        <option value="02">2</option>
        <option value="03">3</option>
        <option value="04">4</option>
        <option value="05">5</option>
        <option value="06">6</option>
        <option value="07">7</option>
        <option value="08">8</option>
        <option value="09">9</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
        <option value="13">13</option>
        <option value="14">14</option>
        <option value="15">15</option>
        <option value="16">16</option>
        <option value="17">17</option>
        <option value="18">18</option>
        <option value="19">19</option>
        <option value="20">20</option>
        <option value="21">21</option>
        <option value="22">22</option>
        <option value="23">23</option>
        <option value="24">24</option>
        <option value="25">25</option>
        <option value="26">26</option>
        <option value="27">27</option>
        <option value="28">28</option>
        <option value="29">29</option>
        <option value="30">30</option>
        <option value="31">31</option>
                  </select>
        <select name="monthLast" id="monthLast" style="width:85px;">
          <option value="" selected>เดือน</option>
          <option value="01">มกราคม</option>
          <option value="02">กุมภาพันธ์</option>
          <option value="03">มีนาคม</option>
          <option value="04">เมษายน</option>
          <option value="05">พฤษภาคม</option>
          <option value="06">มิถุนายน</option>
          <option value="07">กรกฎาคม</option>
          <option value="08">สิงหาคม</option>
          <option value="09">กันยายน</option>
          <option value="10">ตุลาคม</option>
          <option value="11">พฤศจิกายน</option>
          <option value="12">ธันวาคม</option>
        </select>        
        <select name="yearLast" id="yearLast" style="width:55px;">
          <option value="0" selected>ปี</option>
          <option value="2005">2548</option>
          <option value="2006">2549</option>
        </select></td>
    </tr>
    <tr>
      <td bgcolor="#66CCFF">อาจารย์ผู้สอน</td>
      <td><select name="teacher_ID" id="teacher_ID">
        <option selected>-- กรุณาเลือก --</option>
        <?php
		do {  ?>
	    <option value="<?php echo $row_teacher['teacher_ID'];  ?>"><?php echo "$row_teacher[title] $row_teacher[name] $row_teacher[surname]"; ?></option>
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
      <td colspan="2" bgcolor="#66CCFF">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <input type="submit" name="Submit" onClick="return Check()" value="Submit" >
&nbsp;
      <input type="reset" name="Reset" value="Reset">
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
