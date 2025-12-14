<?php require_once('../Connections/conn.php'); ?>
<?php
mysql_select_db($database_conn, $conn);
$query_config = "SELECT * FROM config";
$config = mysql_query($query_config, $conn) or die(mysql_error());
$row_config = mysql_fetch_assoc($config);
$totalRows_config = mysql_num_rows($config);

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
<?php if(isset($HTTP_POST_VARS['Submit'])&&($HTTP_POST_VARS['Submit']=="ยกเลิกการเปลี่ยนวิชา"))
			{
				$sql="update register set status='cashed',course_ID='$old_course_ID' where register_ID='$register_ID'";
				mysql_query($sql,$conn);
				if(isset($s_id)){echo "<meta http-equiv='refresh' content='0 URL=../Admin/register_show.php?student_ID=$s_id'>";}
				else{echo "<meta http-equiv='refresh' content='0 URL=register_edit.php'>";}
			}
?>
<?php
$query_register = "SELECT * FROM register WHERE register_ID = '$register_ID'";
$register = mysql_query($query_register, $conn) or die(mysql_error());
$row_register = mysql_fetch_assoc($register);
$totalRows_register = mysql_num_rows($register);
$old_course_ID=substr($row_register['status'],7);
$new_course_ID=$row_register['course_ID'];
//find detail old course
$sql="SELECT course.subject_ID,subject_name,learn_start,learn_time,subject_point from course left join subject on course.subject_ID=subject.subject_ID where course_ID='$old_course_ID'";
$old_course=mysql_query($sql,$conn);
$row_old_course=mysql_fetch_assoc($old_course);
//find detail new course
$sql="SELECT course.subject_ID,subject_name,learn_start,learn_time,subject_point from course left join subject on course.subject_ID=subject.subject_ID where course_ID='$new_course_ID'";
$new_course=mysql_query($sql,$conn);
$row_new_course=mysql_fetch_assoc($new_course);
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title>Subject_change_show</title>
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
	color: #FF6600;
	font-weight: bold;
}
.style2 {
	color: #6699FF;
	font-weight: bold;
	font-size: 24px;
}
-->
</style></head>

<body>
<?php if($row_register['status']!='cashed'){?>
<table width="860" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><div align="center" class="style1">วิชาเดิม</div></td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">
      <table border="1" cellpadding="0" cellspacing="0">
        <tr bgcolor="#CC9966">
          <td><div align="center">รหัสวิชา</div></td>
          <td><div align="center">รหัสคอร์ส</div></td>
          <td><div align="center">ชื่อวิชา</div></td>
          <td><div align="center">วันที่เริ่มเรียน</div></td>
          <td><div align="center">วันเรียน</div></td>
          <td><div align="center">เวลาเรียน</div></td>
          <td><div align="center">ค่าลงทะเบียน</div></td>
          </tr>
        <tr>
          <td><div align="center"><?php echo $row_old_course['subject_ID']; ?></div></td>
          <td><div align="center"><?php echo $old_course_ID;?></div></td>
          <td><div align="center"><?php echo $row_old_course['subject_name']; ?></div></td>
          <td><div align="center">
              <?php  decodeDay_month_Year($row_old_course['learn_start']);?>
          </div></td>
          <td><div align="center"><?php print_learn_time($row_old_course['learn_time']);?></div></td>
          <td><div align="center"><?php echo substr($row_old_course['learn_time'],8,11); ?></div></td>
          <td><div align="center"><?php echo $row_old_course['subject_point']*$row_config['register_value'];?></div></td>
          </tr>
        </table>
    </div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><div align="center" class="style2">วิชาใหม่</div></td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">
      <table border="1" cellpadding="0" cellspacing="0" bordercolor="#6699FF">
      <tr bgcolor="#66CCFF">
        <td><div align="center">รหัสวิชา</div></td>
        <td><div align="center">รหัสคอร์ส</div></td>
        <td><div align="center">ชื่อวิชา</div></td>
        <td><div align="center">วันที่เริ่มเรียน</div></td>
        <td><div align="center">วันเรียน</div></td>
        <td><div align="center">เวลาเรียน</div></td>
        <td><div align="center">ค่าลงทะเบียน</div></td>
      </tr>
      <tr>
        <td><div align="center"><?php echo $row_new_course['subject_ID']; ?></div></td>
        <td><div align="center"><?php echo $new_course_ID;?></div></td>
        <td><div align="center"><?php echo $row_new_course['subject_name']; ?></div></td>
        <td><div align="center">
            <?php  decodeDay_month_Year($row_new_course['learn_start']);?>
        </div></td>
        <td><div align="center"><?php print_learn_time($row_new_course['learn_time']);?></div></td>
        <td><div align="center"><?php echo substr($row_new_course['learn_time'],8,11); ?></div></td>
        <td><div align="center"><?php echo $row_new_course['subject_point']*$row_config['register_value'];?></div></td>
      </tr>
    </table></div></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><form name="form1" method="post" action="">
      <div align="center">
        <input type="submit" name="Submit" value="ยกเลิกการเปลี่ยนวิชา">
        <input name="register_ID" type="hidden" id="register_ID" value="<?php echo $register_ID;?>"> 
        <input name="old_course_ID" type="hidden" id="old_course_ID" value="<?php echo $old_course_ID;?>"> 
        </div>
    </form></td>
  </tr>
</table><?php }?>
</body>
</html>
<?php
mysql_free_result($config);

mysql_free_result($register);
?>
