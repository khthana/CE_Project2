<?php  session_start(); ?>
<?php require_once('../Connections/conn.php'); ?>
<?php
mysql_select_db($database_conn, $conn);
$query_config = "SELECT * FROM config";
$config = mysql_query($query_config, $conn) or die(mysql_error());
$row_config = mysql_fetch_assoc($config);
$totalRows_config = mysql_num_rows($config);
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Register Edit Confirm</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style3 {	color: #FF3399;
	font-weight: bold;
}
-->
</style></head>

<body>
<?php 
//calculate cash
$money=0;  $counter=0;
if ($selectL1!=""){$sql="select subject_point from course left join register on course.course_ID = register.course_ID left join subject on course.subject_ID = subject.subject_ID where register.course_ID='$selectL1'";
							$result =mysql_query($sql,$conn);
							$row_result=mysql_fetch_assoc($result);
							if ($register_value1>$row_result['subject_point']*$row_config['register_value']){$money+=$register_value1-$row_result['subject_point']*$row_config['register_value'];}
							$counter++;
							}
if ($selectL2!=""){$sql="select subject_point from course left join register on course.course_ID = register.course_ID left join subject on course.subject_ID = subject.subject_ID where register.course_ID='$selectL2' ";
							$result =mysql_query($sql,$conn);
							$row_result=mysql_fetch_assoc($result);
							if ($register_value2>$row_result['subject_point']*$row_config['register_value']){$money+=$register_value2-$row_result['subject_point']*$row_config['register_value'];}
							$counter++;
							}
if ($selectL3!=""){$sql="select subject_point from course left join register on course.course_ID = register.course_ID left join subject on course.subject_ID = subject.subject_ID where register.course_ID='$selectL3' ";
							$result =mysql_query($sql,$conn);
							$row_result=mysql_fetch_assoc($result);
							if ($register_value3>$row_result['subject_point']*$row_config['register_value']){$money+=$register_value3-$row_result['subject_point']*$row_config['register_value'];}
							$counter++;
							}
if ($selectL4!=""){$sql="select subject_point from course left join register on course.course_ID = register.course_ID left join subject on course.subject_ID = subject.subject_ID where register.course_ID='$selectL4' ";
							$result =mysql_query($sql,$conn);
							$row_result=mysql_fetch_assoc($result);
							if ($register_value4>$row_result['subject_point']*$row_config['register_value']){$money+=$register_value4-$row_result['subject_point']*$row_config['register_value'];}
							$counter++;
							}
if ($selectL5!=""){$sql="select subject_point from course left join register on course.course_ID = register.course_ID left join subject on course.subject_ID = subject.subject_ID where register.course_ID='$selectL5' ";
							$result =mysql_query($sql,$conn);
							$row_result=mysql_fetch_assoc($result);
							if ($register_value5>$row_result['subject_point']*$row_config['register_value']){$money+=$register_value5-$row_result['subject_point']*$row_config['register_value'];}
							$counter++;
							}
if ($selectL6!=""){$sql="select subject_point from course left join register on course.course_ID = register.course_ID left join subject on course.subject_ID = subject.subject_ID where register.course_ID='$selectL6' ";
							$result =mysql_query($sql,$conn);
							$row_result=mysql_fetch_assoc($result);
							if ($register_value6>$row_result['subject_point']*$row_config['register_value']){$money+=$register_value6-$row_result['subject_point']*$row_config['register_value'];}
							$counter++;
							}
if ($selectL7!=""){$sql="select subject_point from course left join register on course.course_ID = register.course_ID left join subject on course.subject_ID = subject.subject_ID where register.course_ID='$selectL7' ";
							$result =mysql_query($sql,$conn);
							$row_result=mysql_fetch_assoc($result);
							if ($register_value7>$row_result['subject_point']*$row_config['register_value']){$money+=$register_value7-$row_result['subject_point']*$row_config['register_value'];}
							$counter++;
							}
		if(isset($HTTP_POST_VARS['Submit'])&&($HTTP_POST_VARS['Submit']=="ยืนยันการเปลี่ยนวิชา")){
		//update to register table
		if($selectL1!="")
		{	$sql ="UPDATE register SET course_ID='$course_ID1',status='change/$selectL1' where course_ID ='$selectL1' and student_ID='$_SESSION[student_ID]' ";
			$result = mysql_query($sql,$conn) or die(mysql_error());
		 }	
		if($selectL2!="")
		{	$sql ="UPDATE register SET course_ID='$course_ID2',status='change/$selectL2' where course_ID ='$selectL2' and student_ID='$_SESSION[student_ID]' ";
			$result = mysql_query($sql,$conn) or die(mysql_error());
		 }
		 if($selectL3!="")
		{	$sql ="UPDATE register SET course_ID='$course_ID3',status='change/$selectL3' where course_ID ='$selectL3' and student_ID='$_SESSION[student_ID]' ";
			$result = mysql_query($sql,$conn) or die(mysql_error());
		 }
		 if($selectL4!="")
		{	$sql ="UPDATE register SET course_ID='$course_ID4',status='change/$selectL4' where course_ID ='$selectL4' and student_ID='$_SESSION[student_ID]' ";
			$result = mysql_query($sql,$conn) or die(mysql_error());
		 }
		 if($selectL5!="")
		{	$sql ="UPDATE register SET course_ID='$course_ID5',status='change/$selectL5' where course_ID ='$selectL5' and student_ID='$_SESSION[student_ID]' ";
			$result = mysql_query($sql,$conn) or die(mysql_error());
		 }
		 if($selectL6!="")
		{	$sql ="UPDATE register SET course_ID='$course_ID6',status='change/$selectL6' where course_ID ='$selectL6' and student_ID='$_SESSION[student_ID]' ";
			$result = mysql_query($sql,$conn) or die(mysql_error());
		 }
		 if($selectL7!="")
		{	$sql ="UPDATE register SET course_ID='$course_ID7',status='change/$selectL7' where course_ID ='$selectL7' and student_ID='$_SESSION[student_ID]' ";
			$result = mysql_query($sql,$conn) or die(mysql_error());
		 }
		echo"<script>alert('การเปลี่ยนวิชาเรียบร้อยแล้วค่ะ');</script>";
		echo"<meta http-equiv='refresh' content='0;URL=register_edit.php'>";
}
?>
<table width="860" border="0">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="222">&nbsp;</td>
    <td width="628"><table border="1" cellspacing="0" bordercolor="#FF0099">
      <tr>
        <td colspan="3" bgcolor="ff9999"><div align="center"><strong>สรุปค่าใช้จ่าย</strong></div></td>
      </tr>
      <tr>
        <td bgcolor="#FF9999">เงินที่ต้องจ่ายเพิ่มจากการเปลี่ยนวิชา</td>
        <td width="163"><div align="center"><?php echo $money; ?></div></td>
        <td width="77" bgcolor="#FF9999">บาท</td>
      </tr>
      <tr>
        <td bgcolor="#FF9999">ค่าธรรมเนียมวิชาละ</td>
        <td><div align="center"><?php echo $row_config['fee'];?></div></td>
        <td bgcolor="#FF9999">บาท</td>
      </tr>
      <tr>
        <td bgcolor="#FF9999">จำนวนวิชา</td>
        <td><div align="center"><?php echo $counter;?></div></td>
        <td bgcolor="#FF9999">วิชา</td>
      </tr>
      <tr>
        <td bgcolor="#FF9999">รวมเป็นเงินทั้งสิ้น</td>
        <td><div align="center"><font color="ff3399"><?php echo $money+$counter*$row_config['fee'];?></font></div></td>
        <td bgcolor="#FF9999">บาท</td>
      </tr>
      <tr>
        <td colspan="3" bgcolor="#FF9999"><form name="form1" method="post" action="register_edit_confirm.php">
            <div align="center">
              <input type="submit" name="Submit" value="ยืนยันการเปลี่ยนวิชา">
            </div>
            <input name="selectL1" type="hidden" id="selectL1" value="<?php echo $selectL1; ?>">
            <input name="selectL2" type="hidden" id="selectL2" value="<?php echo $selectL2; ?>">
            <input name="selectL3" type="hidden" id="selectL3" value="<?php echo $selectL3; ?>">
            <input name="selectL4" type="hidden" id="selectL4" value="<?php echo $selectL4; ?>">
            <input name="selectL5" type="hidden" id="selectL5" value="<?php echo $selectL5; ?>">
            <input name="selectL6" type="hidden" id="selectL6" value="<?php echo $selectL6; ?>">
            <input name="selectL7" type="hidden" id="selectL7" value="<?php echo $selectL7; ?>">
            <input name="course_ID1" type="hidden" id="course_ID1" value="<?php echo $course_ID1; ?>">
            <input name="course_ID2" type="hidden" id="course_ID2" value="<?php echo $course_ID2; ?>">
            <input name="course_ID3" type="hidden" id="course_ID3" value="<?php echo $course_ID3; ?>">
            <input name="course_ID4" type="hidden" id="course_ID4" value="<?php echo $course_ID4; ?>">
            <input name="course_ID5" type="hidden" id="course_ID5" value="<?php echo $course_ID5; ?>">
            <input name="course_ID6" type="hidden" id="course_ID6" value="<?php echo $course_ID6; ?>">
            <input name="course_ID7" type="hidden" id="course_ID7" value="<?php echo $course_ID7; ?>">
        </form></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><strong>การชำระเงิน :</strong> <br>
1. ชำระเงินด้วยตนเองที่สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง <br>
โดยชำระเงินที่สำนักทะเบียนภาควิชาวิศวกรรมคอมพิวเตอร์ <br>
2. โอนเงินเข้าบัญชีของสถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง <br>
ธนาคาร กสิกรไทย จำกัด &nbsp;สาขาใดก็ได้ <br>
ประเภท บัญชีออมทรัพย์<br>
เลขที่บัญชี xxx-x-xxxxx-x </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><a href="../Download/dap71.exe">Download ใบชำระเงินค่าเปลี่ยนวิชาธนาคารกรุงไทย</a></td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
<?php
mysql_free_result($config);
?>
