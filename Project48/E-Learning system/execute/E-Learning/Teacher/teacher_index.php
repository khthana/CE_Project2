<?php session_start(); ?>
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
?>
<?php
mysql_select_db($database_conn, $conn);
$query_teacher = "SELECT * FROM teacher where user_ID ='$_SESSION[user_ID]'";
$teacher = mysql_query($query_teacher, $conn) or die(mysql_error());
$row_teacher = mysql_fetch_assoc($teacher);
$totalRows_teacher = mysql_num_rows($teacher);

mysql_select_db($database_conn, $conn);
$query_teach_course = "SELECT * FROM course left join subject on course.subject_ID=subject.subject_ID where teacher_ID='$_SESSION[teacher_ID]' ";
$teach_course = mysql_query($query_teach_course, $conn) or die(mysql_error());
$row_teach_course = mysql_fetch_assoc($teach_course);
$totalRows_teach_course = mysql_num_rows($teach_course);
 ?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style2 {font-size: 16px;
	color: #FF33CC;
}
.style5 {font-size: 16px}
.style1 {	font-size: 20px;
	color: #FF3366;
}
.style6 {	color: #FF00CC;
	font-weight: bold;
	font-size: 18px;
}
.style7 {color: #FF33CC}
-->
</style></head>

<body>
<?php include ("teacher_header.htm");
 ?>
<table width="860" border="1" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td width="176" height="245" valign="top"><form name="form1" method="post" action="../logout.php">
&nbsp;&nbsp;&nbsp;
        <table width="176" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="176" height="20">&nbsp;</td>
          </tr>
          <tr>
            <td><div align="center" class="style2">ยินดีต้อนรับ</div>
                <div align="center" class="style2"><strong><?php echo "$row_teacher[title] $name $surname";?></strong></div></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><div align="center">
                <input type="submit" name="Submit" value="Logout">
            </div></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><div align="center" class="style2"><span class="style5">กลับไปหน้าแรก</span> </div>
                <div align="center" class="style2"><a href="../index.php">คลิกที่นี</a></div></td>
          </tr>
        </table>
    </form></td>
    <td valign="top"><div align="center" class="style1">
        <table width="408" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="377">&nbsp;</td>
          </tr>
          <tr>
            <td><?php if($totalRows_teach_course>0){?> <div align="center"><span class="style6">รายชื่อวิชาที่สอน</span> </div>
            <?php } ?></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>
        <?php if($totalRows_teach_course>0){?>
        <table width="600" border="1">
          <tr bgcolor="#FF99CC">
            <td width="30"><div align="center">No</div></td>
            <td><div align="center">Subject name </div></td>
            <td width="70"><div align="center">Course ID</div> </td>
            <td colspan="2"><div align="center">Learn time(live)</div></td>
            <td width="45"><div align="center"></div></td>
          </tr>
          <?php $No="1"; ?>
          <?php do{ ?>
          <tr>
            <td><div align="center"><?php echo $No; $No++;?></div></td>
            <td><div align="center"><?php echo $row_teach_course['subject_name'];?></div></td>
            <td><div align="center"><?php echo $row_teach_course['course_ID'];?></div></td>
            <td width="70"><div align="center"><?php print_learn_time($row_teach_course['learn_time']);?></div></td>
            <td width="60"><div align="center"><?php echo substr($row_teach_course['learn_time'],8,11); ?></div></td>
            <td><div align="center"><a href="../Student/live_learn.php">Teach</a></div></td>
          </tr>
          <?php } while($row_teach_course = mysql_fetch_assoc($teach_course))?>
        </table>
        <?php } else{?>
        <span class="style7">ยังไม่มีวิชาที่สอนค่ะ</span>
        <?php }?>
        <p>&nbsp;</p>
    </div></td>
  </tr>
  <tr>
    <td height="384" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
  </tr>
</table>
</body>
</html>
<?php
mysql_free_result($teacher);

mysql_free_result($teach_course);
?>
