<script language="javascript" type="text/JavaScript">
function del(varUrl)
{ 		
	if (window.confirm("ยืนยันการลบข้อมูล")==true){window.open(varUrl,"_self")}
}
</script>
<?php 
//php function
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
<?php require_once('../Connections/conn.php'); ?>
<?php
mysql_select_db($database_conn, $conn);
$query_register = "SELECT register_ID,register.course_ID,course.subject_ID,subject_name,subject_point,learn_start,learn_time,status FROM register left join course on register.course_ID=course.course_ID left join subject on course.subject_ID=subject.subject_ID where student_ID='$student_ID' ";
$register = mysql_query($query_register, $conn) or die(mysql_error());
$row_register = mysql_fetch_assoc($register);
$totalRows_register = mysql_num_rows($register);

mysql_select_db($database_conn, $conn);
$query_student = "SELECT * FROM `student`";
$student = mysql_query($query_student, $conn) or die(mysql_error());
$row_student = mysql_fetch_assoc($student);
$totalRows_student = mysql_num_rows($student);
?>
<?php if($do=="cancel"){$sql="delete from register where register_ID='$register_ID'"; 
									mysql_query($sql,$conn);
								   echo "<meta http-equiv='refresh' content='0;URL=register_show.php?student_ID=$student_ID'>";
								   }
			if($do=="permit"){$sql="update register set status='cashed' where register_ID='$register_ID'";
									mysql_query($sql,$conn);
									echo "<meta http-equiv='refresh' content='0;URL=register_show.php?student_ID=$student_ID'>";
									}
			if($do=="not_permit"){$sql="update register set status='wait' where register_ID='$register_ID'";
									mysql_query($sql,$conn);
									echo "<meta http-equiv='refresh' content='0;URL=register_show.php?student_ID=$student_ID'>";
									}
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title>Register Show</title>
<style type="text/css">
<!--
body {
	margin-left: 20px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style1 {
	font-size: 24px;
	color: #6699FF;
	font-weight: bold;
}
.style2 {
	font-size: 20px;
	color: #FF6633;
}
.style5 {color: #66CC00}
-->
</style></head>

<body>
<table border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="center" class="style1">แสดงวิชาที่ได้ลงทะเบียนแล้ว</div></td>
  </tr>
  <tr>
    <td><div align="center" class="style2"><?php echo"$row_student[name] $row_student[surname]";?> รหัส <?php echo $student_ID;?> </div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="center">
      <?php if ($totalRows_register > 0) { // Show if recordset not empty ?>
      <table border="1" cellpadding="0" cellspacing="0" bordercolor="#6699FF">
        <tr bgcolor="#66CCFF">
            <td><div align="center">รหัสวิชา</div></td>
            <td><div align="center">รหัสคอร์ส</div></td>
            <td><div align="center">ชื่อวิชา</div></td>
            <td><div align="center">วันที่เริ่มเรียน</div></td>
            <td><div align="center">ค่าลงทะเบียน</div></td>
            <td><div align="center">สถานะ</div></td>
            <td><div align="center">ยกเลิกการลงทะเบียน</div></td>
            <td><div align="center">อนุมัติการชำระเงิน</div></td>
        </tr>
        <?php do { ?>
        <tr>
            <td><div align="center"><?php echo $row_register['subject_ID']; ?></div></td>
            <td><div align="center"><?php echo $row_register['course_ID']; ?></div></td>
            <td><div align="center"><?php echo $row_register['subject_name']; ?></div></td>
            <td><div align="center">
                <?php  decodeDay_month_Year($row_register['learn_start']);?>
                    </div></td>
            <td><div align="center"><?php echo $row_register['subject_point']*150;?></div></td>
            <td><div align="center">
                <?php if($row_register['status']=="wait"){echo "<font color=#FF0000>ยังไม่ชำระเงิน</font>";}else if($row_register['status']=="cashed"){echo "<font color=#66cc00>ชำระเงินแล้ว</font>";}else{echo "<a href ='../student/subject_change_show.php?register_ID=$row_register[register_ID]&&s_id=$student_ID'><font color=#FF6600>รอการชำระเงินเพิ่มจากการเปลี่ยนวิชา</font></a>";}?>
            </div></td>
            <td> <div align="center"><a href =# onClick="del('register_show.php?student_ID=<?php echo $student_ID;?>&&do=cancel&&register_ID=<?php echo $row_register['register_ID'];?>')">ยกเลิก</a></div></td>
            <td><div align="center"><?php if($row_register['status']=="cashed"){echo "<a href='register_show.php?student_ID=$student_ID&&do=not_permit&&register_ID=$row_register[register_ID]'><font color=#66cc00>อนุมัติแล้ว</font></a>";}else{echo "<a href='register_show.php?student_ID=$student_ID&&do=permit&&register_ID=$row_register[register_ID]'><font color=#FF0000>ยังไม่อนุมัติ</font></a>";}?>
            </div></td>
        </tr>
        <?php } while ($row_register = mysql_fetch_assoc($register)); ?>
        </table>
      <?php } else echo "<br><br><font color ='ff33cc' size ='+3'>ยังไม่มีการลงทะเบียนค่ะ</font>" ?>
    </div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
<?php
mysql_free_result($register);

mysql_free_result($student);
?>
