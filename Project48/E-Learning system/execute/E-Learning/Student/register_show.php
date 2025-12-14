<?php session_start(); ?> 
<?php require_once('../Connections/conn.php'); 
			  mysql_select_db($database_conn, $conn);
?>
<?php
$query_config = "SELECT * FROM config";
$config = mysql_query($query_config, $conn) or die(mysql_error());
$row_config = mysql_fetch_assoc($config);
$totalRows_config = mysql_num_rows($config);
?>
<?php  //php function
function check_same_subject($stack){
	$hostname_conn = "localhost";
	$database_conn = "poadb";
	$username_conn = "root";
	$password_conn = "poa";
	$conn = mysql_pconnect($hostname_conn, $username_conn, $password_conn) or trigger_error(mysql_error(),E_USER_ERROR); 
	mysql_select_db($database_conn, $conn);
	$index=0;				
	while ($stack[$index]!="") {
					$queryx="select subject_ID from course where course_ID =$stack[$index]";	
					$x =mysql_query($queryx, $conn) or die(mysql_error());
					$row_x=mysql_fetch_assoc($x);														
					$stack[$index]=$row_x['subject_ID'];
					$index++;
	}
	$same=false;
	$x=0;
	$max=count($stack);
	while($x<$max){
		for ($y=$x+1; $y<= $max; $y++){
			if($stack[$x]==$stack[$y]){$same=true;}
		}
		$x++;
	}
return $same;
}

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
<script language = "javascript">
function del(varUrl)
{ 		
	window.open(varUrl,"_self")
}
</script>
<?php
//delete 1 selected from stack
if (isset($HTTP_GET_VARS['cancel']))
{
	array_splice($_SESSION[stack],$cancel,1);
	echo"<meta http-equiv = 'refresh' content = '0; URL =register_show.php'>";

}

?>

<?php
//create stack
if ($course_ID!="" ){$_SESSION[stack][] =$course_ID;}
$_SESSION[stack]=array_unique($_SESSION[stack]);
?> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Register Confirm</title>
<style type="text/css">
<!--
.style1 {color: #FF0000; }
.style2 {color: #000000; }
.style3 {
	color: #FF3399;
	font-weight: bold;
}
.style6 {font-size: 18px}
.style10 {font-size: large; color: #FF3399;}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
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
.style13 {color: #FF3399}
-->
</style>
</head>

<body>
<table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="30" rowspan="4">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="10"></p>
        <div align="center"><span class="style10">
        <?php if(count($_SESSION[stack])!=0) {?>
        SELECTED SUBJECTS LIST
        </p>
        </span> </div>
        <div align="center"></div>
      <table  border="1" cellpadding="0" cellspacing="0" bordercolor="#FF66CC">
        <tr bgcolor="#FF9999">
          <td height="20"><div align="center">No</div></td>
          <td><div align="center" class="style2">Subject name </div></td>
          <td height="20"><div align="center">Start to End Day </div></td>
          <td height="20"><div align="center" class="style2">Learn day</div></td>
          <td height="20"><div align="center">Learn time(live) </div></td>
          <td height="20"><div align="center" class="style2">Value(Baht)</div></td>
          <td height="20"><div align="center">Cancel</div></td>
        </tr>
        <?php $money="0"; $subject_point=0; $No=1;?>
        <?php while ($course_ID = each($_SESSION[stack])) {	
																				$query_subject ="SELECT subject_name,learn_start,last_day,learn_time,subject_point from course left join subject on course.subject_ID = subject.subject_ID where course_ID=$course_ID[value]";
																				$subject =mysql_query($query_subject, $conn) or die(mysql_error());
																				$row_subject = mysql_fetch_assoc($subject);
																				
	
	?>
        <tr>
          <td height="20"><div align="center"><?php echo $No++; ?></div></td>
          <td height="20"><div align="center"><?php echo $row_subject['subject_name']; ?>(<?php echo $row_subject['subject_point'];?>)</div></td>
          <td height="20"><div align="center"><?php printStart_End_Day($row_subject['learn_start'],$row_subject['last_day']); ?></div></td>
          <td height="20"><div align="center"><?php print_learn_time($row_subject['learn_time']); ?></div></td>
          <td height="20"><div align="center"><?php echo substr($row_subject['learn_time'],8,11); ?></div></td>
          <td height="20"><div align="center"><?php echo $row_subject['subject_point']*$row_config['register_value']; $subject_point+=$row_subject['subject_point'];?></div></td>
          <td height="20"><div align="center"><strong><a href=#  onClick="del('register_show.php?cancel= <?php echo $course_ID["key"];?>')">cancel</a></strong></div></td>
        </tr>
        <?php } ?>
       <tr>
	   <td colspan="7">
          <table border="1" cellpadding="0" cellspacing="0">
		  <tr>
		  <td width="100" height="20" bgcolor="#FF9999"><div align="center">รวมหน่วยกิต </div></td>
          <td height="20"><div align="center">&nbsp;&nbsp;&nbsp;<?php echo $subject_point;?>&nbsp;หน่วย&nbsp;&nbsp;&nbsp;</div></td>
          <td width="100" height="20" bgcolor="#FF9999"><div align="center">หน่วยกิตละ</div></td>
          <td height="20"><div align="center">&nbsp;&nbsp;&nbsp;<?php echo $row_config['register_value'];?>&nbsp;บาท&nbsp;&nbsp;&nbsp;</div></td>
          <td width="300" height="20" bgcolor="#FF9999"><div align="center">รวมเป็นจำนวนเงินค่าลงทะเบียนวิชาทั้งหมด</div></td>
          <td height="20">&nbsp;&nbsp;&nbsp; <span class="style3"><?php echo $subject_point*$row_config['register_value'];?></span> บาท&nbsp;&nbsp;&nbsp;</td>
        </tr>
		</table>
		</td>
	</tr>
	  </table>
     <div align="center">
	  <form name="form1" method="post" action="register_confirm.php">
        <input type="submit" name="Submit" value="ลงทะเบียนเรียน">
        <input name="counter" type="hidden" id="counter" value="<?php $counter=$No-1; echo $counter;?>">
        <input name="subject_point" type="hidden" id="subject_point" value="<?php echo $subject_point;?>">
        <input name="register_value" type="hidden" id="register_value" value="<?php echo $row_config['register_value'];?>">
        <input name="same" type="hidden" id="same" value="<?php echo $same;?>">
      </form>
	  </div>
      <?php } else { ?>
      <div align="center"><span class="style10">ไม่มีวิชาที่ได้เลือกไว้ค่ะ</span>
        <?php }?>
      </div>
      <p align="center">&nbsp;</p></td>
    </tr>
    <tr>
      <td height="10"><div align="center"><span class="style1"><?php if(check_same_subject($_SESSION[stack])){echo"*คำเตือน มีวิชาที่เลือกไว้ซ้ำกัน"; $same=true;}else {$same=false;}?></span></div></td>
    </tr>
    <tr>
      <td height="10"><div align="center"><a href="../subject_show.php">เพิ่มคอร์สวิชา คลิกที่นี่</a></div></td>
    </tr>
  </table>
</body>
</html>
<?php
mysql_free_result($config);
?>

