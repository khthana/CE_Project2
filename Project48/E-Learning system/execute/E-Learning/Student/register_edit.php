<?php session_start(); ?>
<?php require_once('../Connections/conn.php'); 
			 mysql_select_db($database_conn, $conn);?>
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
<?php if(isset($id)){
									$sql="delete from register where register_ID='$id'";
									mysql_query($sql,$conn);
									}
?>
<?php
$query_subject = "SELECT * FROM subject";
$subject = mysql_query($query_subject, $conn) or die(mysql_error());
$row_subject = mysql_fetch_assoc($subject);
$totalRows_subject = mysql_num_rows($subject);

$maxRows_register = 10;
$pageNum_register = 0;
if (isset($_GET['pageNum_register'])) {
  $pageNum_register = $_GET['pageNum_register'];
}
$startRow_register = $pageNum_register * $maxRows_register;

$query_register = "SELECT register_ID,register.course_ID,course.subject_ID,subject_name,subject_point,learn_start,learn_time,status FROM register left join course on register.course_ID=course.course_ID left join subject on course.subject_ID=subject.subject_ID where student_ID=$_SESSION[student_ID]";
$query_limit_register = sprintf("%s LIMIT %d, %d", $query_register, $startRow_register, $maxRows_register);
$register = mysql_query($query_limit_register, $conn) or die(mysql_error());
$row_register = mysql_fetch_assoc($register);

if (isset($_GET['totalRows_register'])) {
  $totalRows_register = $_GET['totalRows_register'];
} else {
  $all_register = mysql_query($query_register);
  $totalRows_register = mysql_num_rows($all_register);
}
$totalPages_register = ceil($totalRows_register/$maxRows_register)-1;


$query_config = "SELECT * FROM config";
$config = mysql_query($query_config, $conn) or die(mysql_error());
$row_config = mysql_fetch_assoc($config);
$totalRows_config = mysql_num_rows($config);
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Register Edit</title>
<style type="text/css">
<!--
.style2 {color: #CC3300; font-size: 24px;}
a:link {
	color: #0000FF;
}
a:visited {
	color: #0000FF;
}
body {
	margin-left: 0px;
	margin-top: 20px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style13 {color: #FF0000}
-->
</style>
<?php include ("../javascript/register_edit_check.htm"); ?>
</head>
<body>
<?php if($totalRows_register<>0){?>
 <div align="center" class="style2">
   <p>แสดงวิชาที่ได้ลงทะเบียน</p>
 </div>
<div align="center">
  <form name="form1" method="post" action="register_edit_confirm.php" onSubmit="return Check();">
    <table border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
        <td width="740"><table border="1" cellpadding="0" cellspacing="0">
            <tr bgcolor="#CC9966">
              <td><div align="center">รหัสวิชา</div></td>
              <td><div align="center">รหัสคอร์ส</div></td>
              <td><div align="center">ชื่อวิชา</div></td>
              <td><div align="center">วันที่เริ่มเรียน</div></td>
              <td><div align="center">วันเรียน</div></td>
              <td><div align="center">เวลาเรียน</div></td>
              <td><div align="center">ค่าลงทะเบียน</div></td>
              <td><div align="center">สถานะ</div></td>
            </tr>
            <?php do { ?>
            <tr>
              <td><div align="center"><?php echo $row_register['subject_ID']; ?></div></td>
              <td><div align="center"><?php echo $row_register['course_ID']; ?></div></td>
              <td><div align="center"><?php echo $row_register['subject_name']; ?></div></td>
              <td><div align="center">
                  <?php  decodeDay_month_Year($row_register['learn_start']);?>
              </div></td>
              <td><div align="center"><?php print_learn_time($row_register['learn_time']);?></div></td>
              <td><div align="center"><?php echo substr($row_register['learn_time'],8,11); ?></div></td>
              <td><div align="center"><?php echo $row_register['subject_point']*$row_config['register_value'];?></div></td>
              <td><div align="center">
                  <?php if($row_register['status']=="wait"){echo "<font color=#FF0000>ยังไม่ชำระเงิน</font> <a href=# onClick=del('register_edit.php?id=$row_register[register_ID]')>ยกเลิก</a>";}else if($row_register['status']=="cashed"){echo "<font color=#00FF99>จ่ายเงินแล้ว</font>";}else{echo "<a href='subject_change_show.php?register_ID=$row_register[register_ID]'><font color=#FF6600>รอการชำระเงินเพิ่มจากการเปลี่ยนวิชา</font></a>";}?>
              </div></td>
            </tr>
            <?php } while ($row_register = mysql_fetch_assoc($register)); ?>
        </table></td>
      </tr>
      <tr>
        <td colspan="2"><p>&nbsp;</p>
            <hr color="#0000FF">
            <p align="left" class="style2">เปลี่ยนวิชา</p><br>
        </td>
      </tr>
      <tr>
        <td colspan="2">
            <table border="1" cellpadding="2" cellspacing="0">
            <tr bgcolor="#CC9966">
              <td rowspan="2"><div align="center">วิชาเก่า</div></td>
              <td colspan="6"><div align="center">วิชาใหม่</div></td>
            </tr>
            <tr bgcolor="#CC9966">
              <td><div align="center">ชื่อวิชา</div></td>
              <td><div align="center">รหัสคอร์ส</div></td>
              <td><div align="center">วันที่เริ่มเรียน</div></td>
              <td><div align="center">วันเรียน</div></td>
              <td><div align="center">เวลาเรียน</div></td>
              <td><div align="center">ค่าลงทะเบียน</div></td>
            </tr>
            <tr>
              <td><select name="selectL1" id="selectL1">
                  <option value="">-กรุณาเลือก-</option>
                  <?php
				//select all register to show
				$query_register = "SELECT register_ID,register.course_ID,course.subject_ID,subject_name,learn_start,learn_time FROM register left join course on register.course_ID=course.course_ID left join subject on course.subject_ID=subject.subject_ID where student_ID=$_SESSION[student_ID] and status='cashed'";
				$register = mysql_query($query_register, $conn) or die(mysql_error());?>
                  <?php while ($row_register = mysql_fetch_assoc($register)){ ?>
                  <option value="<?php echo $row_register['course_ID'];?>"><?php echo "$row_register[subject_name] รหัสคอร์ส $row_register[course_ID]";?></option>
                  <?php }
  $rows = mysql_num_rows($register);
  if($rows > 0) {mysql_data_seek($register, 0);}
?>
              </select></td>
              <td><select name="selectR1" id="selectR1" onChange="MM_openBrWindow('course_show.php','','',this)">
                  <option value="">-กรุณาเลือก-</option>
                  <?php
do {  
?>
                  <option value="<?php echo $row_subject['subject_ID']?>"><?php echo $row_subject['subject_name']?></option>
                  <?php
} while ($row_subject = mysql_fetch_assoc($subject));
  $rows = mysql_num_rows($subject);
  if($rows > 0) {mysql_data_seek($subject, 0);  $row_subject = mysql_fetch_assoc($subject);}
?>
              </select></td>
              <td><input name="course_ID1" type="text" id="course_ID1" size="4" readonly=""></td>
              <td><input name="learn_start1" type="text" id="learn_start1" size="8" readonly=""></td>
              <td><input name="learn_day1" type="text" id="learn_day1" size="10" readonly=""></td>
              <td><input name="learn_time1" type="text" id="learn_time1" size="8" readonly=""></td>
              <td><input name="register_value1" type="text" id="register_value1" size="4" readonly="">
              </td>
            </tr>
            <tr>
              <td><select name="selectL2" id="selectL2">
                  <option value="">-กรุณาเลือก-</option>
                  <?php while ($row_register = mysql_fetch_assoc($register)){ ?>
                  <option value="<?php echo $row_register['course_ID'];?>"><?php echo "$row_register[subject_name] รหัสคอร์ส $row_register[course_ID]";?></option>
                  <?php }
  $rows = mysql_num_rows($register);
  if($rows > 0) {mysql_data_seek($register, 0);}
?>
              </select></td>
              <td><select name="selectR2" id="selectR2" onChange="MM_openBrWindow('course_show.php','','',this)">
                  <option value="">-กรุณาเลือก-</option>
                  <?php
			do{  
?>
                  <option value="<?php echo $row_subject['subject_ID']?>"><?php echo $row_subject['subject_name']?></option>
                  <?php 	 } while ($row_subject = mysql_fetch_assoc($subject)); 
  $rows = mysql_num_rows($subject);
  if($rows > 0) {
      mysql_data_seek($subject, 0);
	  $row_subject = mysql_fetch_assoc($subject);
  }
?>
              </select></td>
              <td><input name="course_ID2" type="text" id="course_ID2" size="4" readonly=""></td>
              <td><input name="learn_start2" type="text" id="learn_start2" size="8" readonly=""></td>
              <td><input name="learn_day2" type="text" id="learn_day2" size="10" readonly=""></td>
              <td><input name="learn_time2" type="text" id="learn_time2" size="8" readonly=""></td>
              <td><input name="register_value2" type="text" id="register_value2" size="4" readonly="">
              </td>
            </tr>
            <tr>
              <td><select name="selectL3" id="selectL3">
                  <option value="" >-กรุณาเลือก-</option>
                  <?php while ($row_register = mysql_fetch_assoc($register)){ ?>
                  <option value="<?php echo $row_register['course_ID'];?>"><?php echo "$row_register[subject_name] รหัสคอร์ส $row_register[course_ID]";?></option>
                  <?php }
  $rows = mysql_num_rows($register);
  if($rows > 0) {mysql_data_seek($register, 0);}
?>
              </select></td>
              <td><select name="selectR3" id="selectR3" onChange="MM_openBrWindow('course_show.php','','',this)">
                  <option value="">-กรุณาเลือก-</option>
                  <?php
do {  
?>
                  <option value="<?php echo $row_subject['subject_ID']?>"><?php echo $row_subject['subject_name']?></option>
                  <?php
} while ($row_subject = mysql_fetch_assoc($subject));
  $rows = mysql_num_rows($subject);
  if($rows > 0) {
      mysql_data_seek($subject, 0);
	  $row_subject = mysql_fetch_assoc($subject);
  }
?>
              </select></td>
              <td><input name="course_ID3" type="text" id="course_ID3" size="4" readonly=""></td>
              <td><input name="learn_start3" type="text" id="learn_start3" size="8" readonly=""></td>
              <td><input name="learn_day3" type="text" id="learn_day3" size="10" readonly=""></td>
              <td><input name="learn_time3" type="text" id="learn_time3" size="8" readonly=""></td>
              <td><input name="register_value3" type="text" id="register_value3" size="4" readonly="">
              </td>
            </tr>
            <tr>
              <td><select name="selectL4" id="selectL4">
                  <option value="">-กรุณาเลือก-</option>
                  <?php while ($row_register = mysql_fetch_assoc($register)){ ?>
                  <option value="<?php echo $row_register['course_ID'];?>"><?php echo "$row_register[subject_name] รหัสคอร์ส $row_register[course_ID]";?></option>
                  <?php }
  $rows = mysql_num_rows($register);
  if($rows > 0) {mysql_data_seek($register, 0);}
?>
              </select></td>
              <td><select name="selectR4" id="selectR4" onChange="MM_openBrWindow('course_show.php','','',this)">
                  <option value="">-กรุณาเลือก-</option>
                  <?php
do {  
?>
                  <option value="<?php echo $row_subject['subject_ID']?>"><?php echo $row_subject['subject_name']?></option>
                  <?php
} while ($row_subject = mysql_fetch_assoc($subject));
  $rows = mysql_num_rows($subject);
  if($rows > 0) {
      mysql_data_seek($subject, 0);
	  $row_subject = mysql_fetch_assoc($subject);
  }
?>
              </select></td>
              <td><input name="course_ID4" type="text" id="course_ID4" size="4" readonly=""></td>
              <td><input name="learn_start4" type="text" id="learn_start4" size="8" readonly=""></td>
              <td><input name="learn_day4" type="text" id="learn_day4" size="10" readonly=""></td>
              <td><input name="learn_time4" type="text" id="learn_time4" size="8" readonly=""></td>
              <td><input name="register_value4" type="text" id="register_value4" size="4" readonly="">
              </td>
            </tr>
            <tr>
              <td><select name="selectL5" id="selectL5">
                  <option value="">-กรุณาเลือก-</option>
                  <?php while ($row_register = mysql_fetch_assoc($register)){ ?>
                  <option value="<?php echo $row_register['course_ID'];?>"><?php echo "$row_register[subject_name] รหัสคอร์ส $row_register[course_ID]";?></option>
                  <?php }
  $rows = mysql_num_rows($register);
  if($rows > 0) {mysql_data_seek($register, 0);}
?>
              </select></td>
              <td><select name="selectR5" id="selectR5" onChange="MM_openBrWindow('course_show.php','','',this)">
                  <option value="">-กรุณาเลือก-</option>
                  <?php
do {  
?>
                  <option value="<?php echo $row_subject['subject_ID']?>"><?php echo $row_subject['subject_name']?></option>
                  <?php
} while ($row_subject = mysql_fetch_assoc($subject));
  $rows = mysql_num_rows($subject);
  if($rows > 0) {
      mysql_data_seek($subject, 0);
	  $row_subject = mysql_fetch_assoc($subject);
  }
?>
                </select>
              </td>
              <td><input name="course_ID5" type="text" id="course_ID5" size="4" readonly=""></td>
              <td><input name="learn_start5" type="text" id="learn_start5" size="8" readonly=""></td>
              <td><input name="learn_day5" type="text" id="learn_day5" size="10" readonly=""></td>
              <td><input name="learn_time5" type="text" id="learn_time5" size="8" readonly=""></td>
              <td><input name="register_value5" type="text" id="register_value5" size="4" readonly="">
              </td>
            </tr>
            <tr>
              <td><select name="selectL6" id="selectL6">
                  <option value="">-กรุณาเลือก-</option>
                  <?php while ($row_register = mysql_fetch_assoc($register)){ ?>
                  <option value="<?php echo $row_register['course_ID'];?>"><?php echo "$row_register[subject_name] รหัสคอร์ส $row_register[course_ID]";?></option>
                  <?php }
  $rows = mysql_num_rows($register);
  if($rows > 0) {mysql_data_seek($register, 0);}
?>
              </select></td>
              <td><select name="selectR6" id="selectR6" onChange="MM_openBrWindow('course_show.php','','',this)">
                  <option value="">-กรุณาเลือก-</option>
                  <?php
do {  
?>
                  <option value="<?php echo $row_subject['subject_ID']?>"><?php echo $row_subject['subject_name']?></option>
                  <?php
} while ($row_subject = mysql_fetch_assoc($subject));
  $rows = mysql_num_rows($subject);
  if($rows > 0) {
      mysql_data_seek($subject, 0);
	  $row_subject = mysql_fetch_assoc($subject);
  }
?>
                </select>
              </td>
              <td><input name="course_ID6" type="text" id="course_ID6" size="4" readonly=""></td>
              <td><input name="learn_start6" type="text" id="learn_start6" size="8" readonly=""></td>
              <td><input name="learn_day6" type="text" id="learn_day6" size="10" readonly=""></td>
              <td><input name="learn_time6" type="text" id="learn_time6" size="8" readonly=""></td>
              <td><input name="register_value6" type="text" id="register_value6" size="4" readonly="">
              </td>
            </tr>
            <tr>
              <td><select name="selectL7" id="selectL7">
                  <option value="">-กรุณาเลือก-</option>
                  <?php while ($row_register = mysql_fetch_assoc($register)){ ?>
                  <option value="<?php echo $row_register['course_ID'];?>"><?php echo "$row_register[subject_name] รหัสคอร์ส $row_register[course_ID]";?></option>
                  <?php }
  $rows = mysql_num_rows($register);
  if($rows > 0) {mysql_data_seek($register, 0);}
?>
              </select></td>
              <td><select name="selectR7" id="selectR7" onChange="MM_openBrWindow('course_show.php','','',this)">
                  <option value="">-กรุณาเลือก-</option>
                  <?php
do {  
?>
                  <option value="<?php echo $row_subject['subject_ID']?>"><?php echo $row_subject['subject_name']?></option>
                  <?php
} while ($row_subject = mysql_fetch_assoc($subject));
  $rows = mysql_num_rows($subject);
  if($rows > 0) {
      mysql_data_seek($subject, 0);
	  $row_subject = mysql_fetch_assoc($subject);
  }
?>
              </select></td>
              <td><input name="course_ID7" type="text" id="course_ID7" size="4" readonly=""></td>
              <td><input name="learn_start7" type="text" id="learn_start7" size="8" readonly=""></td>
              <td><input name="learn_day7" type="text" id="learn_day7" size="10" readonly=""></td>
              <td><input name="learn_time7" type="text" id="learn_time7" size="8" readonly=""></td>
              <td><input name="register_value7" type="text" id="register_value7" size="4" readonly="">
              </td>
            </tr>
          </table>            <p align="center">
              <input type="submit" name="Submit" value="เปลี่ยนวิชา">
              <input type="reset" name="Reset" value="เคลียร์">
                      </p></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><span class="style13">* หมายเหตุวิชาที่สามารถเปลี่ยนได้นั้น ต้องชำระเงินแล้วเท่านั้น</span></td>
      </tr>
    </table>
  </form>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div><?php } else {echo"<script>alert('ไม่มีวิชาที่ลงทะเบียนไว้ค่ะ กรุณาลงทะเบียนก่อน');</script>";
echo"<meta http-equiv='refresh' content='0; URL=student_index.php'>";}?>
</body>
</html>
<?php
mysql_free_result($subject);

mysql_free_result($register);

mysql_free_result($config);
?>
